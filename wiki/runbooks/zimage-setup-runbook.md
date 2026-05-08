# Z-Image Turbo GGUF -- ComfyUI Setup Runbook

Standalone 1-page reference for getting Z-Image Turbo (GGUF quantized) running on ComfyUI, macOS.

## Install ComfyUI

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git ~/ComfyUI
cd ~/ComfyUI
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cpu
pip install -r requirements.txt
```

For Apple Silicon, PyTorch nightly CPU builds use MPS acceleration automatically. Confirm with:
```bash
python3 -c "import torch; print(torch.backends.mps.is_available())"
```

## Launch ComfyUI

```bash
cd ~/ComfyUI && source venv/bin/activate && python main.py --cpu --listen 127.0.0.1
```

Flags explained:
- `--cpu` -- prevents MPS device-not-found errors on headless / restricted macOS setups. MPS acceleration still works for inference.
- `--listen 127.0.0.1` -- binds to localhost only. Use `0.0.0.0` if accessing from another machine on LAN.

Open http://127.0.0.1:8188 in your browser once the server prints "Starting server."

## Install ComfyUI-GGUF (custom node)

```bash
cd ~/ComfyUI/custom_nodes
git clone https://github.com/city96/ComfyUI-GGUF.git
```

Restart ComfyUI after installing.

## Download Z-Image Turbo GGUF

```bash
mkdir -p ~/ComfyUI/models/unet
cd ~/ComfyUI/models/unet
# Replace URL with the latest Hugging Face link for the GGUF quant you need
# Popular quants:
#   Q4_K_S  -- ~8 GB, fits 12 GB VRAM
#   Q5_K_M  -- ~10 GB, fits 16 GB VRAM
#   Q8_0    -- ~14 GB, needs 24 GB VRAM
# Example (check HF for exact filename):
# wget https://huggingface.co/.../z-image-turbo-Q4_K_S.gguf
```

Place the `.gguf` file in `~/ComfyUI/models/unet/`. The UNET Loader (GGUF) node will discover it.

## Minimal Workflow -- Nodes Required

A working Z-Image workflow in ComfyUI needs these nodes connected in order:

1. **Load CLIP** -- `CLIPLoader` node, load `t5xxl_fp16.safetensors` or similar text encoder
2. **UNET Loader (GGUF)** -- from ComfyUI-GGUF, point to your `.gguf` file
3. **CLIP Text Encode (Prompt)** -- positive prompt
4. **CLIP Text Encode (Prompt)** -- negative prompt (can be empty string)
5. **Empty Latent Image** -- set width/height (1024x1024 is standard)
6. **KSampler** -- connects model, positive, negative, latent_image
7. **VAE Loader** -- standard SDXL VAE (`sdxl_vae.safetensors`)
8. **VAE Decode** -- latents to image
9. **Save Image** or **Preview Image** -- output node

Connections:
- CLIP Loader CLIP output -> both Prompt Encode nodes (clip input)
- UNET Loader MODEL output -> KSampler model input
- Positive/Negative Prompt Encode CONDITIONING outputs -> KSampler positive/negative
- Empty Latent Image LATENT output -> KSampler latent_image
- KSampler LATENT output -> VAE Decode samples
- VAE Loader VAE output -> VAE Decode vae
- VAE Decode IMAGE output -> Save/Preview Image

## Prompting Tips

Z-Image Turbo uses **natural language** (not Danbooru tags). Write descriptive sentences.

- **Quality prefix**: "A high-quality, detailed, 8K photograph of..."
- **Style**: "digital art, oil painting, photography, anime" -- specify at the start
- **Negative prompt** (optional): "blurry, low quality, distorted, extra fingers, watermark, text"

KSampler settings:
- **Steps**: 15-20 (Turbo models converge fast, more steps don't help much)
- **Sampler**: `dpmpp_2m_sde` -- good speed/quality balance
- **Scheduler**: `karras` or `normal`
- **CFG**: 3.5-4.5 (Z-Image Turbo prefers lower CFG than SDXL; start at 4.0)
- **Denoise**: 1.0 (for txt2img)

## Troubleshooting

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| OOM / CUDA out of memory | Resolution too high for VRAM | Reduce latent size (768x768, 896x896). Try a smaller GGUF quant (Q4_K_S). Close other GPU apps. |
| MPS not loading / device error | ComfyUI tried CUDA first | Use `--cpu` flag on launch. Verify `torch.backends.mps.is_available()` returns True. |
| Model not found in UNET Loader | GGUF node not installed or model in wrong folder | Confirm `ComfyUI-GGUF` is in `custom_nodes/`. Place `.gguf` in `models/unet/`. Restart ComfyUI. |
| Black image output | CFG too high, or VAE mismatch | Lower CFG to 3.5-4.5. Use SDXL VAE, not SD1.5 VAE. |
| ComfyUI won't start | Missing dependencies | Run `pip install -r requirements.txt` again in the venv. |
| "Cannot import GGUF" error | Custom node not loaded | Restart ComfyUI. Check terminal for import errors. Re-clone ComfyUI-GGUF if needed. |

## Quick Health Check

From the ComfyUI venv:
```bash
cd ~/ComfyUI && source venv/bin/activate
python3 -c "
import torch
print('MPS available:', torch.backends.mps.is_available())
print('PyTorch version:', torch.__version__)
"
ls models/unet/*.gguf && echo 'GGUF model found' || echo 'No GGUF model in models/unet/'
ls custom_nodes/ComfyUI-GGUF && echo 'GGUF node found' || echo 'GGUF node missing'
```

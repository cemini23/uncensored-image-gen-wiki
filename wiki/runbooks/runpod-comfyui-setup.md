---
title: RunPod ComfyUI Setup — Custom Nodes + Models Quickstart
type: runbook
tags: [runpod, comfyui, setup, custom-nodes, 4090, cloud-gpu, quickstart]
keywords: [runpod, comfyui, custom nodes, civitai, manager, 4090, setup, install]
related:
  - entities/uis/comfyui.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
maturity: validated
created: 2026-05-09
updated: 2026-05-09
---

## Relations

@entities/uis/comfyui.md
@concepts/model-selection-workflow.md
@entities/hardware/gpu-guide.md

## Raw Concept

Solves the recurring "I installed a ComfyUI custom node on RunPod but can't find it / it doesn't show up" problem. RunPod's ComfyUI template comes pre-installed but custom nodes, model downloads, and restarts work differently than a local install.

## Narrative

### The #1 gotcha: restart

On RunPod, installing custom nodes via `git clone` into `custom_nodes/` does **not** make them available until ComfyUI is restarted. The Manager's "Install via Git URL" triggers a restart automatically; manual `git clone` does not.

**To restart ComfyUI on RunPod:**
- **Easiest**: reboot the pod from the RunPod console (takes ~2 min)
- **If you have terminal access**: `pkill -f "python main.py" && python main.py --listen 0.0.0.0 &`
- **Never** just reload the browser tab — that doesn't restart the backend

### Verify your RunPod template

Most RunPod "ComfyUI" templates ship with:
- ComfyUI itself (recent release)
- ComfyUI Manager (the "Install Missing Custom Nodes" button)
- Python venv with PyTorch CUDA

**Check what you have:**
```bash
ls /workspace/ComfyUI/custom_nodes/          # list installed custom nodes
cat /workspace/ComfyUI/.git/HEAD              # which ComfyUI version
nvidia-smi                                     # confirm 4090 (24 GB VRAM)
```

### Essential custom nodes checklist

Run these from the RunPod terminal (JupyterLab → Terminal, or SSH):

```bash
cd /workspace/ComfyUI/custom_nodes

# 1. Manager (if somehow missing — most templates include it)
[ -d ComfyUI-Manager ] || git clone https://github.com/ltdrdata/ComfyUI-Manager.git

# 2. GGUF model loader (Z-Image Turbo, quantized FLUX)
[ -d ComfyUI-GGUF ] || git clone https://github.com/city96/ComfyUI-GGUF.git

# 3. Impact Pack — face/hand detection, detailer, regional sampling
[ -d ComfyUI-Impact-Pack ] || git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git

# 4. IPAdapter Plus — image-prompt conditioning (SDXL + FLUX)
[ -d ComfyUI_IPAdapter_plus ] || git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

# 5. Inspire Pack — prompt routing, batch processing
[ -d ComfyUI-Inspire-Pack ] || git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git

# 6. Video Helper Suite — frame extraction, video encode/decode
[ -d ComfyUI-VideoHelperSuite ] || git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git

# 7. PuLID for FLUX — identity adapter
[ -d ComfyUI-PuLID-Flux2 ] || git clone https://github.com/iFayens/ComfyUI-PuLID-Flux2.git
```

Then **reboot the pod** from RunPod console, or restart ComfyUI. After restart, open the ComfyUI web UI, click **Manager → Install Missing Custom Nodes** — this catches any Python dependencies the git clones don't ship.

### "Where is the CivitAI toolkit?"

There is no single node called "CivitAI toolkit." What people usually mean:

| What you want | What to install |
|---|---|
| **Browse/download CivitAI models inside ComfyUI** | Use **ComfyUI Manager** → "Model Manager" tab → search CivitAI. Or install the community node `ComfyUI-CivitAI-Browser` |
| **A node that loads CivitAI checkpoints/LoRAs** | You don't need one — ComfyUI's built-in `Load Checkpoint` / `Load LoRA` nodes work. Download the `.safetensors` file to `models/checkpoints/` or `models/loras/` |
| **Install nodes from CivitAI** | Use Manager → "Install via Git URL" → paste the node's GitHub URL (find it on the CivitAI page or ComfyUI Manager's node list) |

### Downloading models on RunPod

RunPod pods have fast internet. Download models directly:

```bash
# Checkpoints go here:
cd /workspace/ComfyUI/models/checkpoints/

# LoRAs:
cd /workspace/ComfyUI/models/loras/

# VAEs:
cd /workspace/ComfyUI/models/vae/

# Download via wget (replace URL with your model's CivitAI/HF link):
wget -O modelname.safetensors "https://civitai.com/api/download/models/XXXXXX?token=YOUR_CIVITAI_API_KEY"
```

**To get a CivitAI API key**: CivitAI → Account Settings → API Keys. Required for downloading models via their API. Add `?token=KEY` to the download URL.

**Alternative**: Use ComfyUI Manager's "Model Manager" tab → paste the CivitAI URL → it handles the download.

### Verify the stack works

After installing nodes and restarting, test with a minimal workflow:

1. In ComfyUI, click **Load Default** (or right-click canvas → Add Node → Loaders → Load Checkpoint)
2. If the checkpoint list shows your downloaded models → model loading works
3. Right-click → Add Node → **GGUF** (if you installed ComfyUI-GGUF) → confirms the node loaded
4. Right-click → Add Node → **ImpactPack** → confirms Impact Pack loaded
5. Generate a simple 512×512 image with the default workflow to confirm the GPU works

### RunPod-specific gotchas

| Gotcha | Fix |
|---|---|
| **"Node not found" after git clone** | You didn't restart. Reboot the pod. |
| **Out of disk space** | RunPod default storage is ~100 GB. Models are large (FLUX.1 Dev is 24 GB). Use a network volume or delete unused models. |
| **CUDA out of memory with 24 GB** | FLUX.1 Dev in FP16 uses ~24 GB alone. Use GGUF Q8 or Q5 quantizations. See @concepts/model-selection-workflow.md for VRAM-tier recommendations. |
| **ComfyUI Manager says "network error"** | RunPod network can be flaky to GitHub. Retry. Or git clone manually. |
| **Pod sleeps / stops** | RunPod stops idle pods. Use `--listen 0.0.0.0` (not 127.0.0.1) so the web UI is reachable. |
| **Lost everything after pod restart** | Unless you attached a network volume, `/workspace` is ephemeral. Use a RunPod network volume for persistent storage. |

### Minimal working workflow to test

```
Load Checkpoint → CLIP Text Encode (positive) → CLIP Text Encode (negative)
    → KSampler (steps=20, cfg=7, sampler=euler, scheduler=normal, denoise=1.0)
    → VAEDecode → Preview Image

Model: any downloaded checkpoint. Resolution: 512×512 for test.
```

If this produces an image, your stack is working. Then layer on IP-Adapter, PuLID, and ControlNet for persona consistency workflows.

## Snippets

### One-shot install-all script for RunPod

```bash
#!/bin/bash
# Save as /workspace/setup_nodes.sh and run: bash setup_nodes.sh
cd /workspace/ComfyUI/custom_nodes
for repo in \
    https://github.com/city96/ComfyUI-GGUF.git \
    https://github.com/ltdrdata/ComfyUI-Impact-Pack.git \
    https://github.com/cubiq/ComfyUI_IPAdapter_plus.git \
    https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git \
    https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git \
    https://github.com/iFayens/ComfyUI-PuLID-Flux2.git; do
  dir=$(basename "$repo" .git)
  [ -d "$dir" ] && echo "EXISTS: $dir" || git clone "$repo"
done
echo "Done. Now reboot the pod or restart ComfyUI."
```

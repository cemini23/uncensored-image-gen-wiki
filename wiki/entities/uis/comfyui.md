---
title: ComfyUI (Inference UI)
type: entity
tags: [ui, inference-frontend, comfyui, node-graph, open-source, extensible, stable-diffusion, flux, hunyuan, video]
keywords: [ComfyUI, node graph, inference UI, SDXL, FLUX, Hunyuan, custom nodes, extensible, open-source, workflow]
related:
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v6.md
  - entities/models/flux.md
  - entities/adapters/pulid.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/flux-kontext.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/fluxgym.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/persona-consistency-methods.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/video-identity-inheritance.md
  - concepts/seam-stitching-strategies.md
  - concepts/de-censoring-techniques.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - entities/persona-ops/n8n.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/cogvideox-1-5.md
  - entities/models/anima.md
  - entities/models/z-image-turbo.md
  - entities/models/playground-v3.md
  - entities/models/sd3-deprecated.md
  - entities/models/qwen-image-2512.md
  - entities/models/kwai-kolors.md
  - entities/models/ernie-image.md
  - entities/models/pixart-sigma.md
  - entities/models/ltx-2.md
  - entities/models/mochi-1.md
  - entities/models/seedance-2.md
  - entities/persona-ops/postiz.md
  - sources/ai-creator-operations-blueprint.md
  - sources/ai-persona-launch-strategy-analysis.md
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - concepts/model-selection-workflow.md
  - entities/uis/automatic1111.md
  - entities/uis/forge.md
  - entities/uis/invokeai.md
  - entities/uis/swarmui.md
maturity: validated
created: 2026-05-08
updated: 2026-05-08
---

## Relations

@sources/ai-creator-operations-blueprint.md
@sources/ai-persona-launch-strategy-analysis.md
@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@sources/video-generation-survey-2026.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/pony-v6.md
@entities/models/flux.md
@entities/adapters/pulid.md
@entities/adapters/ip-adapter.md
@entities/adapters/flux-kontext.md
@entities/adapters/flux-redux.md
@entities/adapters/flux2-klein-9b-faceswap.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/onetrainer.md
@entities/training-tools/fluxgym.md
@concepts/reference-plus-lora-stacking.md
@concepts/persona-consistency-methods.md
@concepts/multi-angle-dataset-prep.md
@concepts/video-identity-inheritance.md
@concepts/seam-stitching-strategies.md
@concepts/de-censoring-techniques.md
@concepts/persona-ops-stack.md
@entities/persona-ops/sillytavern.md
@entities/persona-ops/n8n.md
@entities/models/wan-2-2.md
@entities/models/hunyuanvideo-1-5.md
@entities/models/cogvideox-1-5.md
@entities/models/anima.md
@entities/models/z-image-turbo.md
@entities/models/playground-v3.md
@entities/models/sd3-deprecated.md
@entities/models/qwen-image-2512.md
@entities/models/kwai-kolors.md
@entities/models/ernie-image.md
@entities/models/pixart-sigma.md
@entities/models/ltx-2.md
@entities/models/mochi-1.md
@entities/models/seedance-2.md

## Raw Concept

ComfyUI — open-source, node-graph-based inference frontend for Stable Diffusion, FLUX, Hunyuan, Wan, CogVideoX, and other diffusion architectures. The dominant local inference UI in the uncensored image-generation ecosystem as of 2026. Repository: [comfyanonymous/ComfyUI](https://github.com/comfyanonymous/ComfyUI). Back-filled from legacy notes/frameworks-tools.md + survey coverage in @sources/uncensored-image-generation-survey.md, @sources/synthetic-character-consistency-survey.md, and @sources/video-generation-survey-2026.md.

## Narrative

### What it is

**ComfyUI** is a node-based graphical inference interface for diffusion models. Unlike frontend UIs like Automatic1111 (tab-based form inputs) or Forge (fork of A1111 with performance patches), ComfyUI represents every step of the generation pipeline as a **directed acyclic graph (DAG)** of nodes — model loading, conditioning, sampling, decoding, post-processing — connected by edges that carry tensors, latent tensors, conditions, or masks.

This architecture provides three properties that make it the modal UI for the uncensored local generation stack:

1. **Arbitrary routing** — outputs of any node can feed into any compatible input, enabling multi-pass workflows (e.g., generate → detect face → swap face → upscale → encode video) that are impossible in form-based UIs without scripting.
2. **Model-agnostic** — every architecture that follows the Diffusers convention (SD1.5, SDXL, FLUX, Hunyuan, Wan, CogVideoX, Mochi) loads through the same node interface. Custom model types like DiTs are supported via community nodes.
3. **Workflow reproducibility** — a complete workflow is a single `.json` file. Share it, version it, diff it. This is critical for persona pipelines where generation must be deterministic and auditable.

### Installation and first run

```bash
# Clone
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI

# Install dependencies (Python 3.10+ recommended)
pip install -r requirements.txt

# For NVIDIA GPUs with CUDA:
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124

# For Apple Silicon (MPS):
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
# Note: MPS support is functional but slower; use --use-pytorch-cross-attention for Apple Silicon

# Launch
python main.py
```

Default UI runs at `http://127.0.0.1:8188`. First load downloads the default Stable Diffusion 1.5 model automatically.

### Essential custom nodes for uncensored workflows

| Node Pack | Purpose | Install |
|-----------|---------|---------|
| **ComfyUI-Impact-Pack** | Face/hand detection, detailer nodes, KSampler region control | `cd custom_nodes && git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git` |
| **ComfyUI-IPAdapter-Plus** | IP-Adapter image-prompt conditioning (SDXL, FLUX) | `git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git` |
| **ComfyUI-BMAB** | Grounding DINO-based post-processing for hand/limb repair | `git clone https://github.com/port090401/comfyui_bmab.git` |
| **ComfyUI-PuLID-Flux2** | PuLID identity adapter for FLUX.1 + FLUX.2 | `git clone https://github.com/iFayens/ComfyUI-PuLID-Flux2.git` |
| **ComfyUI-Inspire-Pack** | Prompt/control routing + batch processing | `git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git` |
| **ComfyUI-VideoHelperSuite** | Video encode/decode, frame extraction, latent chaining | `git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git` |
| **ComfyUI_Wan_SVI_2_Pro_FLF** | Wan 2.2 video generation nodes | Repository linked in @entities/models/wan-2-2.md |
| **ComfyUI-HunyuanVideo-Lora-Block-Edit** | HunyuanVideo LoRA fine-tuning + inference nodes | See HunyuanVideo model page |

Install all by cloning into the `custom_nodes/` directory, then restart ComfyUI. Verify in the UI via the **Manager → Missing Custom Nodes** check.

### Key workflow patterns

#### Single-image generation
**Load Model → CLIP Encode → KSampler → VAEDecode → Save Image**

The simplest pipeline. Works with SDXL, FLUX, or any loaded model.

#### Dual-pass de-censoring pipeline
Per @concepts/reference-plus-lora-stacking.md:

```
[Base Model] → KSampler (strength 0.45, identity LoRA loaded) → [Result A]
[Reference Image] → IPAdapter/PUFLID node → [Identity Signal]
[Result A] + [Identity Signal] → Second KSampler (strength 0.85, NSFW LoRA) → VAEDecode
```

This is the modal production pattern for persona image generation. See @concepts/reference-plus-lora-stacking.md for the full recipe.

#### Multi-pass NSFW face-swap pipeline
Per @entities/adapters/flux2-klein-9b-faceswap.md:

```
[FLUX.1 Dev + NSFW LoRA] → KSampler → [Base Image]
[Base Image] → Face Detection (Impact-Pack) → [Face Crop]
[Face Crop] + [Klein 9B] → Face Swap Node → [Face-Swapped Image]
[Face-Swapped Image] → Detailer (Impact-Pack) → [Final Output]
```

#### Video generation (Wan 2.2 / HunyuanVideo)
```
[Text Prompt] → Text Encoder → [Video DiT] → KSampler (Temporal) → VAE Decode → Video Output
```

Requires VideoHelperSuite for encoding. See @concepts/seam-stitching-strategies.md for clip-chaining beyond 10s.

### Model compatibility matrix

| Model | ComfyUI native support | Custom nodes needed | Notes |
|-------|----------------------|--------------------|----| 
| SD 1.5 | ✅ Built-in | None | Legacy; still used for some LoRA targets |
| SDXL | ✅ Built-in | None | Works with Pony V6, Illustrious XL, NoobAI-XL out of box |
| FLUX.1 Dev/Schnell | ✅ Built-in | PuLID, Redux, Kontext nodes | Primary persona host |
| FLUX.2 Dev/Klein | ✅ Built-in | PuLID-Flux2 for identity | Sub-second inference on consumer GPUs |
| HunyuanVideo 1.5 | Via custom nodes | ComfyUI-HunyuanVideo-Lora-Block-Edit | 8-12 GB VRAM for 480p |
| Wan 2.2 | Via custom nodes | Wan SVI 2 Pro FLF nodes | 24+ GB VRAM recommended for 720p |
| CogVideoX 1.5/2.0 | Via custom nodes | torchao INT8 nodes for 8 GB | Cheapest local video entry |
| Anima | Community nodes | Check ComfyUI Manager | DiT with Qwen3 encoder |
| Z-Image Turbo | Via custom nodes | Check ComfyUI Manager | Sub-second 12-16 GB |

### Apple Silicon (MPS) notes

ComfyUI runs on Apple Silicon via PyTorch MPS backend. Functional but with caveats:

- **FP8 inference is not supported on MPS** — use BF16 or GGUF Q5 quantizations instead
- **LayerNorm performance** — use `PYTORCH_ENABLE_MPS_FALLBACK=1` environment variable
- **Video models** (Wan, Hunyuan) are heavily CUDA-optimized; expect significantly reduced performance on MPS
- **Recommended alternative**: [Draw Things](https://github.com/lllyasviel/draw-things) for a native macOS inference experience with CoreML acceleration (~3-5s/iter on M5 Pro)
- See @entities/models/flux-1-dev.md for the full MPS viability assessment

### Manager UI

ComfyUI includes a built-in **Manager** panel (accessible via the menu button) for:
- Installing/uninstalling custom nodes
- Checking for updates
- Previewing workflows as images
- Queue management
- Model scanning and loading

### Saving and sharing workflows

- **Save**: File → Save (exports as `.json` with all node positions and parameter values)
- **Load**: File → Load → select `.json`
- **Drag-drop**: Drag a `.json` file onto the ComfyUI browser window to load directly
- **API**: ComfyUI exposes a full REST API at `http://127.0.0.1:8188` — usable for automation via n8n or scripts. See @entities/persona-ops/n8n.md for orchestration patterns.

### Workspace TODO

- Document common workflow JSON files for the modal persona stack (Pony V6 + IPAdapter + Impact-Pack pipeline, FLUX.1 Dev + PuLID + Klein face-swap pipeline)
- Add screenshots of the node graph for the dual-pass de-censoring pipeline
- Track ComfyUI update cadence and breaking-change history — critical for production workflows
- Verify FLUX.2 video node support maturity as of mid-2026

## Snippets

### Installation quick-start

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git && cd ComfyUI
pip install -r requirements.txt
# NVIDIA:
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
# Apple Silicon:
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
python main.py
```

### Dual-pass de-censoring pipeline (conceptual)

```
[Load Model: FLUX.1 Dev] → [CLIP Text Encode] → [KSampler: steps=20, cfg=7, denoise=0.45, NSFW LoRA loaded] → [VAEDecode] → [Preview]
                                                                              ↓
[Load Image: Reference] → [IPAdapter/PuLID Node] → [Conditioning Combine] → [KSampler: steps=20, cfg=7, denoise=0.85, face-swap LoRA] → [VAEDecode] → [Save Image]
```
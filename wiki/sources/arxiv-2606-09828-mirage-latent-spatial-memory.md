---
related:
  - concepts/latent-spatial-memory-video-world-models.md
  - entities/models/mirage.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/decmem.md
  - entities/models/sana-wm.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - concepts/long-video-rag-retrieval.md
  - sweeps/2026-06-12-daily.md
  - concepts/implicit-memory-retrieval-video-world-models.md
  - sources/arxiv-2606-23105-car-implicit-memory-video-world.md
title: "Mirage — latent spatial memory for video world models (arXiv:2606.09828)"
type: source
tags: [paper, world-model, video-generation, spatial-memory, 3d-consistency, camera-control]
keywords: [Mirage, latent spatial memory, RGB point cloud alternative, depth back-projection, ControlNet memory branch, WorldScore, 10.57x speedup, revisit consistency]
maturity: draft
read_status: read
created: 2026-06-12
updated: 2026-06-24
---

## Relations

@concepts/latent-spatial-memory-video-world-models.md @entities/models/mirage.md @concepts/world-models-video-generation.md @entities/models/decmem.md @entities/models/sana-wm.md

## Raw Concept

- **Title**: Latent Spatial Memory for Video World Models (Mirage)
- **Authors**: Weijie Wang, Haoyu Zhao, Yifan Yang, Feng Chen, Zeyu Zhang, Yefei He, Zicheng Duan, Donny Y. Chen, Yuqing Yang, Bohan Zhuang (ZJU, Microsoft Research, Adelaide, Monash)
- **Type**: arXiv:2606.09828
- **Location**: `raw-sources/arxiv-2606.09828-1-geometrically-consistent-videos-generated-by-m.pdf`
- **URL**: https://arxiv.org/abs/2606.09828 · https://aka.ms/latent-spatial-memory
- **Retrieved**: 2026-06-12
- **Read status**: read (abstract + method)

## Narrative

**Mirage** — video world model with **latent spatial memory**: persistent 3D cache storing **VAE latent features** at world coordinates, not RGB point colors. Eliminates per-step rasterize→encode round trip of RGB point-cloud memories.

### Initialize → readout → update cycle

| Step | Action |
|------|--------|
| Init | Encode I₀ → depth-guided back-projection → M = {(pᵢ, fᵢ)} latent-attributed 3D points |
| Readout | Project M onto target camera at **latent resolution** (z-buffer) → ControlNet-style injection |
| Denoise | Chunk generation in native latent space |
| Update | Re-estimate depth, filter dynamics/sky, re-encode, back-project new static points |

**Efficiency [TENTATIVE]:** up to **10.57×** faster end-to-end vs RGB-cache baselines; **55×** lower GPU memory. **Quality:** SOTA on WorldScore; strong RealEstate10K NVS.

### vs DecMem / SANA-WM / RGB memories

| Memory type | Representation | Revisit consistency | Cost |
|-------------|----------------|---------------------|------|
| Implicit (AR context only) | None explicit | Poor on detours | Low |
| RGB point cloud | Colored 3D points + render + VAE re-encode | Good | High |
| **Latent spatial (Mirage)** | Latent tokens in 3D | Good | **Medium-low** |
| DecMem sparse-global | Learned memory tokens | Good (Kling) | Closed |

Persona relevance: research path for **explorable synthetic environments** with geometric revisit — not near-term Wan LoRA workflow.

## Snippets

> "Latent spatial memory stores scene information directly in the diffusion latent space, avoiding pixel-space reconstruction."

> "Mirage can faithfully return to previously observed regions even after large camera detours."

## Dead Ends

Adapts pretrained camera-controllable DiT [2, 11] — base checkpoint unspecified in skim. Open weights `[NEEDS VERIFICATION 2026-06-12]`. Dynamic-object filtering adds pipeline complexity vs clip generators.

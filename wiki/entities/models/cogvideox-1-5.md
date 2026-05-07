---
title: CogVideoX 1.5 / 2.0 (THUDM / Zhipu AI)
type: entity
tags: [model, video, dit, cogvideox, thudm, zhipu, apache-2-0, eastern-vanguard, low-vram]
keywords: [cogvideox, cogvideox-1-5, cogvideox-2-0, thudm, zhipu, qingying, 5b, 3d-vae, torchao-int8, 7gb, 8gb-vram, apache-2.0, latent-space-probing, cogsound]
related:
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - concepts/seam-stitching-strategies.md
  - concepts/de-censoring-techniques.md
  - concepts/censorship-tier-taxonomy.md
maturity: draft
created: 2026-05-07
updated: 2026-05-07
---

## Relations

@sources/video-generation-survey-2026.md @entities/models/wan-2-2.md @concepts/seam-stitching-strategies.md @concepts/de-censoring-techniques.md @concepts/censorship-tier-taxonomy.md

## Raw Concept

Page prompted by the May 2026 video survey ingest. CogVideoX 1.5 is the **cheapest local-deployment video model** in 2026 — torchao INT8 quantization compresses the 5B model from 24 GB to 7 GB, putting it within range of 8 GB consumer GPUs (RTX 3060 / 4060 class). Apache 2.0 → most flexible foundation for community uncensored fine-tuning.

Synthesized from @sources/video-generation-survey-2026.md.

## Narrative

### Architecture — CogVideoX 1.5

- **5B parameter DiT** + advanced 3D VAE
- **3D VAE integrates text, time, and space dimensions** without traditional cross-attention modules — reducing training costs significantly
- **Native output**: 768p resolution, coherent 10-second clips
- **Strong prompt adherence** [CONFIRMED]

[Source: Video Generation Models Survey 2026.docx p.2-3, citing alphaneural.io/assets/THUDM/CogVideoX1.5-5B + news.aibase.com/news/13101]

### CogVideoX 2.0 / Qingying 2.0

Early 2026 release. Adds:
- Native 1080p generation
- **CogSound audio model** integration for synchronized acoustic environments

CogVideoX 2.0 is deployed via the Qingying 2.0 platform; survey doesn't pin whether the architecture has been open-sourced or remains platform-only. [NEEDS VERIFICATION 2026-05-07]

### Licensing — Apache 2.0

The CogVideoX lineage is **fully Apache 2.0** → most flexible license for community modification and uncensored fine-tuning. [CONFIRMED] [Source: github.com/zai-org/CogVideo]

### Hardware viability — flagship low-VRAM tier

The defining feature of CogVideoX 1.5: **torchao INT8 quantization compresses 5B from 24 GB → 7 GB** of VRAM consumption. This democratizes local video generation for 8 GB consumer cards. [CONFIRMED]

| Tier | Variant | Notes |
|------|---------|-------|
| 8 GB | CogVideoX 1.5 5B torchao INT8 (~7 GB) | 480p/720p; minutes per second; needs SeedVR2 / Nvidia SuperRes upscaling |
| 12-16 GB | CogVideoX 1.5 5B FP8 | Faster iteration, cleaner output |
| 24 GB+ | CogVideoX 1.5 5B BF16 native | Workstation-grade; full 768p / 10s outputs |

[Source: Video Generation Models Survey 2026.docx p.4]

### Censorship + latent-space probing

CogVideoX is the model that academic latent-space-probing research (arxiv 2605.00874) used as a case study: the model **encodes rich, discriminative features of adult content internally before pixel decoding**. API providers attach lightweight classifiers to these probes (4-6ms overhead) for moderation; open-source developers use **inverse / reverse probing** to inject adversarial structural noise into the latent space, obfuscating explicit content from CFG safety aborts. [TENTATIVE] (single-paper mechanism, plausible)

→ @concepts/de-censoring-techniques.md

### Comparison — local-deployment economics

| Dimension | CogVideoX 1.5 | Wan 2.2 | HunyuanVideo 1.5 |
|-----------|----------------|---------|-------------------|
| Parameters | 5B | 27B MoE / 14B active | 8.3B |
| Min VRAM | 7 GB (INT8) | 16 GB (FP8 5B TI2V) | 16 GB (FP8) |
| License | Apache 2.0 | Apache 2.0 | (Tencent custom) |
| Output | 768p / 10s | 480p-720p / clip | up to 1080p |
| 8 GB viable? | yes | no | no |

[CONFIRMED]

## Snippets

> "CogVideoX 1.5-5B supports precise prompt adherence and coherent 10-second outputs at 768p resolution. The model's efficiency relies heavily on an advanced 3D VAE that integrates text, time, and space dimensions without traditional cross-attention modules, reducing training costs significantly."
[Source: Video Generation Models Survey 2026.docx p.2-3]

> "the community and developers implemented torchao INT8 quantization, compressing the 5 billion parameter model's memory footprint from 24 GB down to a remarkable 7 GB."
[Source: Video Generation Models Survey 2026.docx p.3, citing reddit.com/r/StableDiffusion/comments/1fjwtvn/cogvideox5b_image_to_video_model_weights_released/]

> "Licensed under Apache 2.0, the CogVideoX lineage remains one of the most flexible foundations for community modification and uncensored fine-tuning."
[Source: Video Generation Models Survey 2026.docx p.3, citing github.com/zai-org/CogVideo]

> "models like CogVideoX encode rich, discriminative features of adult content internally before the pixel decoding phase. While API providers use these probes to attach lightweight classifiers for real-time moderation (with an overhead of merely 4-6ms), open-source developers utilize 'reverse probing' to inject adversarial structural noise into the latent space."
[Source: Video Generation Models Survey 2026.docx p.4, citing arxiv.org/html/2605.00874v1]

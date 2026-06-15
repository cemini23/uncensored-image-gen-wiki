---
title: Video Generation Models Survey (May 2026)
type: source
tags: [survey, video-generation, t2v, i2v, deep-research, uncensored, latent-chaining, lipsync]
keywords: [video, wan, hunyuan, ltx-2, mochi, cogvideox, seedance, vidu, open-sora, pyramid-flow, sora, veo, kling, hailuo, hedra, runway, pika, luma, latent-chaining, gvs, latentsync, musetalk, unisync, abliterated-text-encoder]
related:
  - sources/synthetic-character-consistency-survey.md
  - entities/models/open-sora.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
  - entities/models/mochi-1.md
  - entities/models/cogvideox-1-5.md
  - entities/models/seedance-2.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/video-identity-inheritance.md
  - concepts/seam-stitching-strategies.md
  - concepts/persona-consistency-methods.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - entities/adapters/pulid.md
  - entities/training-tools/musubi-tuner.md
  - entities/training-tools/ai-toolkit.md
  - entities/models/qwen-image-2512.md
  - entities/models/z-image-turbo.md
  - entities/models/flux-2-klein.md
  - sources/persona-ops-stack-2026.md
  - entities/models/openrouter-video.md
  - entities/uis/comfyui.md
  - concepts/world-models-video-generation.md
  - sources/sana-wm-minute-scale-world-model.md
  - concepts/grpo-i2v-post-training.md
  - sources/arxiv-tagrpo-i2v-grpo-2601-05729.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - concepts/mllm-video-translation.md
  - sources/arxiv-2604-11283-mllm-video-translation-survey.md
  - sources/arxiv-2606-03672-foley-omni.md
  - sources/arxiv-2605-29509-kgedit-knowledge-graph-video-editing.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md
  - concepts/knowledge-graph-structured-video-control.md
  - concepts/long-video-rag-retrieval.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/activation-steering-video-generation.md
  - sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md
  - entities/models/metaworld.md
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - sources/arxiv-2603-18639-orthophys-physics-video.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/physics-aware-orthogonal-view-video.md
  - sources/arxiv-2606-04811-dream-exe-robot-executability.md
  - concepts/video-generation-physical-executability.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
  - concepts/multi-shot-audio-video-evaluation.md
  - sources/arxiv-2606-07508-streamforce-streaming-force-video.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - sources/arxiv-2606-08514-omnitryon-video-try-on.md
  - sources/arxiv-2606-09056-millivid-hierarchical-latents.md
  - concepts/hierarchical-latent-coarse-to-fine-video.md
  - concepts/streaming-force-controlled-video-generation.md
  - concepts/task-isolated-unified-video-editing.md
  - concepts/video-try-on-anything.md
  - sources/arxiv-2606-09150-ultra-flash-streaming-hr-video.md
  - sources/arxiv-2606-09250-litevsr-frozen-dit-vsr.md
  - sources/arxiv-2606-09507-prisma-world-multi-agent-video.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - concepts/frozen-dit-video-super-resolution.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - entities/models/prisma-world.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - concepts/latent-spatial-memory-video-world-models.md
  - entities/models/mirage.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - entities/models/hydra-x.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - concepts/causal-multi-turn-image-editing.md
  - entities/models/anchoredit.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
maturity: validated
read_status: deep-read
created: 2026-05-07
updated: 2026-06-15
---

## Relations

@sources/synthetic-character-consistency-survey.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @entities/models/ltx-2.md @entities/models/mochi-1.md @entities/models/cogvideox-1-5.md @entities/models/seedance-2.md @concepts/multi-angle-dataset-prep.md @concepts/video-identity-inheritance.md @concepts/seam-stitching-strategies.md @concepts/persona-consistency-methods.md @concepts/censorship-tier-taxonomy.md @concepts/de-censoring-techniques.md @entities/adapters/pulid.md @entities/training-tools/musubi-tuner.md @entities/training-tools/ai-toolkit.md @entities/models/qwen-image-2512.md @entities/models/z-image-turbo.md @entities/models/flux-2-klein.md @sources/persona-ops-stack-2026.md
@entities/models/open-sora.md
@entities/models/openrouter-video.md
@entities/uis/comfyui.md
@sources/sana-wm-minute-scale-world-model.md — adjacent ingest: NVIDIA's SANA-WM minute-scale camera-controlled video world model

## Raw Concept

- **Title**: Video Generation Models: Comprehensive Catalog and Viability Analysis (May 2026)
- **Author**: Deep-research output (claude.ai / Gemini synthesis), retained as workspace artifact
- **Type**: deep-research docx (synthesis with 90 cited URLs)
- **Location**: `raw-sources/Video Generation Models Survey 2026.docx` (post-archive); inbox path `research to be indexed/processed/Video Generation Models Survey 2026.docx`
- **Retrieved**: 2026-05-07 (workspace ingest); content current as of May 2026
- **Pages**: ~349 lines extracted plain text (~45 KB)
- **Read status**: deep-read

Companion to the existing pre-HEAVY-mode brief `briefs/video-gen-models.md` (208 lines / 53 KB) which covered the same landscape from a more decision-oriented angle. This source provides the canonical architectural + viability backbone the wiki has been missing — first video-domain ingest in HEAVY mode.

## Narrative

The survey covers six sections: (1) open-weight model catalog, (2) closed/API-only models, (3) uncensored fine-tunes and community efforts, (4) hardware reality across tiers, (5) text-to-video vs image-to-video workflows, (6) length, quality, and consistency reality check.

### 1. Open-weight catalog (foundation models)

The 2026 open-weight ecosystem is dominated by Chinese labs (Alibaba, Tencent, ByteDance, Lightricks-Israel-but-China-adjacent, THUDM/Zhipu AI). The architectural shift away from U-Net toward Diffusion Transformers (DiT) and Mixture-of-Experts (MoE) has democratized scale but introduced VRAM bottlenecks. [CONFIRMED]

**Tier 1 (priority for adult-persona track):**

- **Alibaba Wan 2.2** — MoE 27B total / 14B active per step; dual-expert SNR-routed (high-noise structural / low-noise detail); 480p/720p @ 24fps; 3D VAE; Apache 2.0; aggressively scrubbed of adult content at base (Strict tier) but completely uncensored after community LoRA injection from mq-lab / blink / TheYuriLover. Also a 5B dense TI2V (consumer GPU bridge). Wan 2.5 / 2.6 are cloud-only at $0.07/sec via Alibaba APIs. → @entities/models/wan-2-2.md [CONFIRMED]
- **Tencent HunyuanVideo 1.5** — 8.3B DiT + 3D causal VAE; Selective and Sliding Tile Attention (SSTA) prunes redundant spatiotemporal KV blocks → ~2× speedup vs FlashAttention-3 for 10s 720p; native 1080p; FP8 GEMM inference; step-distilled variants generate 480p in 8-12 steps (75% RTX 4090 speedup). Heavy alignment at base; Tencent shipped LoRA tuning scripts → community NSFW LoRAs (TheYuriLover/HunyuanVideo_nfsw_lora) with `nsfwsks` trigger. → @entities/models/hunyuanvideo-1-5.md [CONFIRMED]
- **Lightricks LTX-2** — Asymmetric joint audio-visual foundation: 14B visual + 5B audio communicating via bidirectional cross-attention; native 4K @ 50fps with synchronized lipsync + foley single-pass; modality-specific VAEs at 1:192 ratio. LTX-2 Community License: free commercial under $10M annual revenue. Audio drifts on extended dialogue. → @entities/models/ltx-2.md [CONFIRMED]
- **Genmo Mochi 1** — 10B AsymmDiT (Asymmetric Diffusion Transformer); 75% visual / 25% text resource allocation (single T5-XXL encoder for prompt); 30fps fluid motion; Apache 2.0; aggressive automatic NSFW filter that flags innocuous prompts (community bypasses the safety classifier wholesale). Native VRAM: 4× 80GB (prohibitive); FP8 ComfyUI wrappers run on 24GB. → @entities/models/mochi-1.md [CONFIRMED]
- **THUDM CogVideoX 1.5 / 2.0** — 5B DiT + 3D VAE integrating text/time/space (no traditional cross-attention); 768p / 10s outputs; torchao INT8 compresses 24GB→7GB (cheapest local entry); Apache 2.0 → most flexible foundation for community uncensored fine-tuning. CogVideoX 2.0 (Qingying 2.0 platform) adds native 1080p + CogSound. → @entities/models/cogvideox-1-5.md [CONFIRMED]
- **ByteDance Seedance 2.0** — Released February 2026; unified multimodal A/V joint generation evolving from PixelDance; accepts up to 9 images + 3 video clips + 3 audio tracks alongside prompt; industry-leading I2V identity-preservation rate; THE benchmark for multi-subject interactions and physical realism. → @entities/models/seedance-2.md [CONFIRMED]

**Tier 2 (no separate page, mentioned here):**

- **Open-Sora 2.0** — 11B; trained for ~$200,000 (cost-efficiency triumph); explicit motion-intensity score parameter; no stringent censorship blocks; structural drift past native context. [CONFIRMED]
- **Pyramid Flow** — Pyramidal flow matching (not DiT); only final stage at full resolution; autoregressive temporal pyramid; trained 20.7k A100 hrs; 768p / 10s coherent; high-frequency noise + color bleed past 10s. [CONFIRMED]
- **Vidu Q3** — 16-second native continuous clips with integrated dialogue/voiceover/SFX; long-form-consistency specialist. [CONFIRMED]

### 2. Closed APIs (benchmark only — adult-persona track skips these per project scope)

| Model | Pricing | Moderation posture | Notable |
|-------|---------|--------------------|---------|
| **Sora 2** (OpenAI) | $200/mo ChatGPT Pro; ~$0.15/sec ($1.20/8s clip) | Zero-tolerance; hard-blocks swimwear/fitted clothing | Native synced audio; "cameo" likeness feature; geo-restricted |
| **Veo 3.1** (Google DeepMind) | Vertex AI; $0.09/sec | Soft-blocks ambiguous; hard-blocks NSFW | 4K @ 48kHz stereo; joint A/V latent diffusion; foley sync |
| **Pika 2.x** | $8-$76/mo (Fancy Plan 6,000 credits) | Strict no-adult, general-audience | Dynamic scene extensions, stylized FX |
| **Runway Gen-4 / 4.5** | From $15/mo flat | Heavy moderation; cinematic-bounds OK | Gen-4 Turbo: 10s clips in ~30s |
| **Luma Dream Machine (Ray 3.14)** | $30-$300/mo (Plus → Ultra) | Strict no-NSFW | "Luma Agents" orchestration; ~$0.25/clip; no failed-gen refunds |
| **Kling 3.0 / 2.6** (Kuaishou) | From $6.99/mo | PG-13; soft-blocks "sweating" etc. | Industry-low cost; full commercial rights; top-tier I2V ELO |
| **MiniMax Hailuo 2.3** | $1,000+ enterprise | NSFW security review = no credit deduction (consumer-friendly billing) | 1080p; ~$0.10/sec effective |
| **Hedra (Character-3)** | $15-$75/mo | Safe / commercial UGC only | Talking-head specialist; high-fidelity audio→facial mapping |

[CONFIRMED]

### 3. Uncensored fine-tunes and community efforts

- **Platform migration**: CivitAI under regulatory + commercial pressure → mass migration to Hugging Face Spaces (obfuscated nomenclature: "Uncensored-Aggressive", NSFW triggers). Decentralized Civitai Archive maintains immutable records of deleted weights. [CONFIRMED]
- **LoRA on aligned base**: Wan 2.2 / HunyuanVideo 1.5 lack explicit-anatomy mathematical representations from pre-training scrubbing; community trains LoRAs from curated explicit datasets. Notable creators: **mq-lab**, **blink**, **TheYuriLover**. HunyuanVideo trigger word: `nsfwsks`. Wan 2.2 advanced workflow: bypass sanitized text encoder via "abliterated" text encoder + high-strength stack (e.g. `wan-22-doggy-by-mq-lab`). → @concepts/de-censoring-techniques.md [CONFIRMED]
- **Latent-space tricks**: ComfyUI attention masking surgically isolates the human subject from background; localized targeted noise reduction prevents global safety constraints from collapsing the frame. [TENTATIVE] (single workflow source)
- **Latent-space probing**: Academic research (arxiv 2605.00874) showed CogVideoX encodes rich discriminative adult-content features internally before pixel decoding (4-6ms classifier overhead). Inverse use — "reverse probing" — injects adversarial structural noise into latent space to obfuscate explicit nature from CFG safety aborts. [TENTATIVE] (single source; mechanism plausible)

### 4. Hardware tiers

| Tier | VRAM | Viable models | Notes |
|------|------|---------------|-------|
| **8 GB consumer** (RTX 3060/4060) | 8 GB | CogVideoX 1.5-5B torchao INT8 (~7 GB) | 480p/720p only; minutes per second; needs SeedVR2 / Nvidia SuperRes upscaling |
| **16 GB enthusiast** (RTX 4070 Ti / 4080 / 5070) | 12-16 GB | Wan 2.2 5B / HunyuanVideo 1.5 8.3B FP8 | Min viable for iterative production; 5-8s @ 720p; FP8 preferred over NF4 for iteration speed |
| **24 GB+ workstation** (RTX 3090 / 4090 / 5090) | 24 GB | CogVideoX 1.5 BF16 native; Mochi 1 FP8; LTX-2.3 19B FP8 (720p) | Wan 2.2 14B / HunyuanVideo native 1080p still out of reach single-card |
| **Multi-GPU** | clusters | Wan 2.2 14B + HunyuanVideo at 1080p uncompressed | FSDP / DeepSpeed Ulysses; PCIe bandwidth = bottleneck |
| **Apple Silicon** | 64-128 GB unified | Massive unquantized models; M5 Pro/Max claim 4× M4 decode; vllm-mlx prefix caching → 24.7× cache speedup, 21.7s→<1s multimodal latency | MLX diffusion kit + PyTorch MPS backend |
| **Cloud rental** | — | H100 SXM5 80GB ~$2.50/hr (min for native Wan 2.2 720p, 65-80 GB); A100 80GB ~$1.07/hr; L40S 48GB ~$0.69/hr; multi-GPU Tier 3 $8-$28/hr | RunPod / Vast.ai / Spheron / Modal |

[CONFIRMED]

### 5. T2V vs I2V workflows

- **T2V** thrives on broad physics ("water rushing down a stream") and environmental B-roll. Generating consistent recurring digital persona via pure text prompts is mathematically prohibitive — every seed produces slightly different facial structure due to diffusion's probabilistic nature. [CONFIRMED]
- **I2V** is the non-negotiable cornerstone of AI-influencer / narrative filmmaking. Two-step process: (1) generate high-fidelity static master image with FLUX.2 / Qwen + character LoRAs (→ @entities/models/flux-2-klein.md @entities/models/qwen-image-2512.md @entities/models/z-image-turbo.md), (2) inject master image into video model's initial latent state. → @concepts/video-identity-inheritance.md [CONFIRMED]
- **Identity-preservation leaders**: Seedance 2.0 + Kling 3.0. Seedance 2.0 specifically claims industry-leading I2V consistency rate. [CONFIRMED]
- **CLIP Vision encoder pattern**: critical ComfyUI architectural pattern — pass static image through CLIP Vision encoder (deep semantic features + 3D structural data) rather than raw pixel initialization. [CONFIRMED]
- **AIrt MAchIne workflow** (ComfyUI template): integrated LLM analyzes the master image and generates an optimized prompt sequence guiding the I2V model (Kling 3.0 / Wan 2.2). Bridges static reference and temporal diffusion. [CONFIRMED]

### 6. Length, quality, consistency

- **Practical clip-length cap**: 5-10s for structural realism (commercial APIs Veo 3.1 / Hailuo 2.3 enforce this). DiT models past native length: subject scale distortion (persona shrinks/grows vs background), severe background warping during high-velocity pans. Pyramid Flow past 10s: high-frequency noise accumulation + color bleeding at tail. [CONFIRMED]
- **Seam stitching**: Naive last-pixel-frame-as-init-of-next-clip → "mis-motion glitches" (subject freezes or reverses inertia, loss of velocity vectors). Robust solution: **Latent Chaining + Overlap Deduplication** via WanV2V Video Stitcher (Kishor900/comfyui-wanv2v-video-stitcher) — encode final 4 latent frames (containing velocity/motion-trajectory vectors) as injection into next chunk's latent space; drop overlapping frames during compilation. **Generative View Stitching (GVS)** (arxiv 2510.24718) parallel-samples whole sequences with Omni Guidance conditioning on past + future frames. → @concepts/seam-stitching-strategies.md [CONFIRMED]
- **Loop generation** (cyclic latent conditioning): force final-frame latent to approximate first-frame latent → temporal upscaler diffuses seamless loop. Use case: ambient backgrounds, endless social-media content. [CONFIRMED]
- **Audio-synced generation**: LTX-2 / Veo 3.1 / Seedance 2.0 process A/V latents simultaneously through joint architectures → flawless foley alignment. Extended dialogue drifts → unreliable for long-form persona monologues. [CONFIRMED]
- **Post-hoc lipsync** (when separating audio track from visual generation):
  - **LatentSync** (bytedance/LatentSync) — audio-conditioned latent diffusion + TREPA temporal alignment; eliminates GAN-era blurriness. [CONFIRMED]
  - **MuseTalk** (TMElyralab/MuseTalk) — real-time >30fps; modifies unseen face region only; spatio-temporal sampling. [CONFIRMED]
  - **UniSync** (arxiv 2603.03882) — 2026 SOTA; mask-free approach; resolves color mismatches + lighting artifacts that degrade LatentSync; unprecedented Generation Success Rate on real-world benchmarks. [CONFIRMED]

## Snippets

> "While the model boasts a massive total capacity of 27 billion parameters, its inference engine only activates 14 billion parameters per processing step. This efficiency is achieved through a dual-expert design that routes generation tasks based on the Signal-to-Noise Ratio (SNR); a high-noise expert manages the early diffusion stages to establish gross structural layout, while a low-noise expert refines localized pixel details during the final denoising steps."
[Source: Video Generation Models Survey 2026.docx p.1 — citing https://github.com/Wan-Video/Wan2.2 (retrieved 2026-05-06)]

> "The defining transformation from the 1.0 version is the introduction of the Selective and Sliding Tile Attention (SSTA) mechanism. This novel attention algorithm dynamically prunes redundant spatiotemporal Key-Value (KV) blocks during generation, resolving the quadratic scaling problem of sequence lengths."
[Source: Video Generation Models Survey 2026.docx p.2 — citing arxiv.org/html/2511.18870v1 (retrieved 2026-05-06)]

> "LTX-2 is an asymmetric joint audio-visual foundation model. The architecture distributes 19 billion parameters asymmetrically: 14 billion parameters are dedicated to visual spatial detail and temporal coherence, while 5 billion parameters independently manage audio generation, dialogue timing, and environmental sound."
[Source: Video Generation Models Survey 2026.docx p.2 — citing huggingface.co/Lightricks/LTX-2 + introl.com/blog/ltx-2-audiovisual-diffusion (retrieved 2026-05-06)]

> "Mochi dedicates approximately 75% of its computational parameters to visual stream processing and limits text processing to 25%, utilizing a single T5-XXL language model for prompt encoding."
[Source: Video Generation Models Survey 2026.docx p.2 — citing https://medium.com/@cognidownunder/mochi-1-open-source-text-to-video-generation-to-run-locally-beb0f137a00c (retrieved 2026-05-06)]

> "torchao INT8 quantization, compressing the 5 billion parameter model's memory footprint from 24 GB down to a remarkable 7 GB."
[Source: Video Generation Models Survey 2026.docx p.3 — citing https://www.reddit.com/r/StableDiffusion/comments/1fjwtvn/cogvideox5b_image_to_video_model_weights_released/ (retrieved 2026-05-06)]

> "Seedance 2.0 allows users to simultaneously input up to 9 images, 3 video clips, and 3 audio tracks alongside natural language prompts."
[Source: Video Generation Models Survey 2026.docx p.3 — citing https://seed.bytedance.com/en/blog/official-launch-of-seedance-2-0 (retrieved 2026-05-06)]

> "Open-Sora 2.0 represents a triumph of cost-efficiency in foundation model training. The 11 billion parameter model was trained for approximately $200,000."
[Source: Video Generation Models Survey 2026.docx p.3 — citing arxiv.org/html/2503.09642v3 (retrieved 2026-05-06)]

> "Wan 2.2 advanced workflows bypass the model's sanitized text comprehension by utilizing an 'abliterated' text encoder, passing the raw semantic intent directly to a stack of high-strength LoRAs (e.g., wan-22-doggy-by-mq-lab) to force structural coherence."
[Source: Video Generation Models Survey 2026.docx p.4 — citing huggingface.co/lkzd7/WAN2.2_LoraSet_NSFW + Reddit r/comfyui/comments/1qstgg8 (retrieved 2026-05-06)]

> "Robust 2026 workflows employ Latent Chaining and Overlap Deduplication. … specialized toolpacks like the WanV2V Video Stitcher mathematically split the desired long-form sequence into overlapping chunks. Rather than passing pixel data, the sampler encodes the final 4 frames of latents from the first sequence (which contain the critical velocity and motion trajectory vectors) and injects them directly into the latent space of the next chunk. During final compilation, the overlapping frames are dropped, resulting in a perfectly smooth, artifact-free transition."
[Source: Video Generation Models Survey 2026.docx p.6 — citing github.com/Kishor900/comfyui-wanv2v-video-stitcher + Reddit r/comfyui/comments/1pmc1zg (retrieved 2026-05-06)]

> "UniSync utilizes a revolutionary mask-free approach. By eliminating the hard boundaries of traditional facial masks, UniSync resolves the color mismatches and lighting artifacts that often degrade LatentSync outputs."
[Source: Video Generation Models Survey 2026.docx p.6 — citing arxiv.org/html/2603.03882v1 (retrieved 2026-05-06)]

## Dead Ends

- **Wan 2.5 / 2.6 open-weights**: Alibaba teased late-2025/early-2026 release with native audio integration; instead pivoted to enterprise cloud dominance ($0.07/sec API). As of May 2026 not open-sourced — community awaiting weights drop. [CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.1]
- **Naive pixel-frame seam stitching**: invariably produces mis-motion glitches; superseded by Latent Chaining (this is the canonical "wrong-way" approach to flag in any seam-stitching guidance).
- **Native long-form dialogue from joint A/V models** (LTX-2 / Veo 3.1 / Seedance 2.0): drifts out of sync past short clips. Use post-hoc lipsync (LatentSync / MuseTalk / UniSync) over native generation for persona monologues.

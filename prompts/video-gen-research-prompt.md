# Deep Research Prompt — Video Generation Models for AI Personas

Run in deep research mode (Exa `deep_researcher_start` or equivalent). Supplement with Brave Search for news, Context7 for inference-engine docs, and Playwright for CivitAI/HF model pages.

---

Comprehensive survey of **video generation models** as of May 2026, with emphasis on uncensored / adult-content viability for AI persona content. Hardware-agnostic — cover 8 GB consumer GPUs through 24 GB+ workstations to cloud rentals.

## 1. Open-weight model catalog

For each: full name, organization, release date, architecture (DiT, U-Net, flow matching), parameter count, license, native resolution and clip length, VRAM at FP16 and at popular quantizations, censorship status (uncensored, aligned, scrubbed), notable strengths and weaknesses.

Must cover:
- **Wan 2.2** (Alibaba) — current state, any 2.5 / 3.0 news?
- **HunyuanVideo** and **HunyuanVideo 1.5** (Tencent) — what changed in 1.5?
- **LTX-Video** and **LTX-2** (Lightricks) — fast / real-time positioning
- **Mochi** (Genmo)
- **CogVideoX** family (THUDM)
- **Open-Sora** — latest version
- **Pyramid Flow**
- Any 2026 entrants since January (especially Chinese labs — Alibaba, Tencent, ByteDance, Kuaishou, MiniMax)

## 2. Closed / API-only models

For each: provider, pricing per second of output, NSFW policy (allows / soft-blocks / hard-blocks), max clip length, image-to-video support.

Must cover: **Sora 2** (OpenAI), **Veo 3** (Google), **Pika 2.x**, **Runway Gen-4**, **Luma Dream Machine**, **Kling** (Kuaishou), **MiniMax Hailuo**, **Hedra** (talking head niche).

## 3. Uncensored fine-tunes and community efforts

- Known de-censored video model variants and where they live (Hugging Face orgs, CivitAI)
- Reliability and ongoing maintenance status
- LoRAs that unlock NSFW on aligned bases (HunyuanVideo NSFW LoRAs, Wan NSFW LoRAs)
- Community workflows that route around alignment (latent-space tricks, attention masking)

## 4. Hardware reality across tiers

What is actually possible at:
- 8 GB VRAM consumer GPU (4060 / 3060 class)
- 12-16 GB (4070 Ti / 4080 / 5070)
- 24 GB+ (3090 / 4090 / 5090)
- Multi-GPU setups
- Apple Silicon (M-series unified memory) — what works, what doesn't
- Cloud (RunPod, Vast.ai, Replicate, Modal) — typical hourly costs and clip throughput

For each tier, give realistic clip length, resolution, and time per clip. Quantization landscape — GGUF, NF4, FP8, SVDQ — and which video models support which.

## 5. Text-to-video vs image-to-video workflows

- When each is appropriate, especially for animating stills produced via persona-consistency LoRAs (see Brief B)
- Image-to-video models that preserve character identity well
- Common ComfyUI and Forge workflow patterns for I2V

## 6. Length, quality, consistency reality check

- Practical clip length per model (5 s vs 10 s vs longer)
- Motion artifacts and how they manifest per model family
- Seam strategies for stitching short clips into longer scenes
- Loop generation for endless / ambient content
- State of audio-synced video generation in 2026 (Veo 3, Sora 2 with audio, open alternatives)
- Lipsync workflows (Sonic, LatentSync, MuseTalk) when paired with I2V

---

## Output format

- Single markdown file written to `briefs/video-gen-models.md`
- Target length: ~3,500 words
- Structure: 6 numbered sections matching the TOC above
- Every named model, tool, person, or repo cites a source — URL preferred
- Tabular comparisons where useful (VRAM × model × quantization grid; pricing comparison for closed models)
- Cross-reference `briefs/persona-consistency.md` (Brief B) where character consistency in video is discussed
- Style match: depth and citation density of `notes/models-catalog.md`

## Tools to use

1. **Exa** — primary deep research
2. **Brave Search** — recent news (2026 model releases)
3. **Context7** — Diffusers / ComfyUI / video inference-engine docs
4. **Playwright** — Hugging Face model pages, CivitAI for community fine-tunes

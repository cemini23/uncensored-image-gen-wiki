---
title: OpenRouter Video Models (2026)
type: entity
tags: [video, openrouter, api, closed-api, kling, seedance, veo, wan, sora]
keywords: [openrouter, video-generation, api, kling-3, seedance-2, veo-3, wan-2.6, sora-2, asynchronous]
related:
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - entities/models/seedance-2.md
  - sources/video-generation-survey-2026.md
  - concepts/marketing-your-persona.md
  - runbooks/day-1-checklist-for-friend.md
  - entities/persona-ops/personalive.md
maturity: draft
created: 2026-05-08
updated: 2026-05-08
---

## Relations

@concepts/video-identity-inheritance.md
@entities/models/wan-2-2.md
@entities/models/seedance-2.md
@sources/video-generation-survey-2026.md
@concepts/marketing-your-persona.md

## Raw Concept

Page prompted by user question: "friend is going to be using OpenRouter, research video models available there." OpenRouter provides a unified API gateway to top-tier closed video models that cannot be run locally (Kling 3.0, Seedance 2.0, Veo 3.1) plus some open-weight models (Wan 2.6/2.7).

Synthesized from OpenRouter documentation + Brave Search, 2026-05-08.

## Narrative

### Why OpenRouter for video (asynchronous API)

Video generation takes 30 seconds — 5 minutes per clip. OpenRouter's **asynchronous API** means:
1. Submit a video job via `/api/v1/videos`
2. Get back a `job_id`
3. Poll or webhook for completion
4. Download the finished video

This is much easier than running Wan 2.2 locally (16+ GB VRAM, complex ComfyUI setups).

### Models available on OpenRouter (2026-05)

| Model | Owner | T2V | I2V | Duration | Audio | Aspect Ratios | Notes |
|-------|-------|-----|-----|---------|-------|----------------|-------|
| **Kling 3.0 Pro** | Kuaishou | ✅ | ✅ | 3-15s | ❌ | 16:9, 9:16, 1:1 | Premium tier, industry-leading consistency |
| **Kling 3.0 Standard** | Kuaishou | ✅ | ✅ | 3-15s | ❌ | 16:9, 9:16, 1:1 | Cheaper, same capabilities |
| **Seedance 2.0** | ByteDance | ✅ | ✅ | up to 30s | ✅ native | Various | Closed API, native A/V, top-tier I2V |
| **Seedance 1.5** | ByteDance | ✅ | ✅ | up to 30s | ✅ native | Various | Slightly older, still excellent |
| **Veo 3.1** | Google | ✅ | ✅ | 4/6/8s | ✅ native | 16:9, 9:16 | High quality, synchronized audio |
| **Veo 3.1 Fast** | Google | ✅ | ✅ | 4/6/8s | ✅ native | 16:9, 9:16 | Faster, lower cost than Veo 3.1 |
| **Wan 2.6** | Alibaba | ✅ | ✅ | 5-10s | ❌ | Various | Open weights, $0.07/sec via API |
| **Wan 2.7** | Alibaba | ✅ | ✅ | 5-10s | ✅ | Various | Enterprise cloud, not open-source |
| **Sora 2 Pro** | OpenAI | ✅ | ✅ | various | ❌ | Various | Via OpenRouter, premium pricing |

### Best model for AI persona videos

| Use Case | Recommended Model | Why |
|-----------|-------------------|-----|
| **Character consistency (I2V from master image)** | **Kling 3.0 Pro** | Industry-leading identity preservation per Video Generation Survey 2026 |
| **Long-form narrative (20-30s)** | **Seedance 2.0** | Up to 30s native, plus synchronized audio |
| **Quick social clips (5-10s)** | **Wan 2.6** | Cheapest option ($0.07/sec), open-weight backend |
| **Highest production value** | **Veo 3.1** | Google's best, native audio, excellent prompt adherence |
| **Budget-friendly start** | **Kling 3.0 Standard** | Same capabilities as Pro, lower price |

### Using OpenRouter API for video

**Authentication:** Use your OpenRouter API key in the `Authorization` header.

**Text-to-Video request:**
```bash
curl -X POST "https://openrouter.ai/api/v1/videos/generate" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "kuaishou/kling-v3-standard",
    "prompt": "A cinematic shot of Alex, a 25-year-old South Asian woman with dark brown eyes and a small scar on her left chin, walking through a cozy bookstore. Soft afternoon light, shallow depth of field.",
    "duration": 10,
    "aspect_ratio": "9:16"
  }'
```

**Image-to-Video request (preserving persona identity):**
```bash
curl -X POST "https://openrouter.ai/api/v1/videos/generate" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "kuaishou/kling-v3-pro",
    "prompt": "Alex walking through a cozy bookstore, soft afternoon light",
    "image": "https://your-server.com/master_image.jpg",
    "duration": 15,
    "aspect_ratio": "9:16"
  }'
```

**Checking job status:**
```bash
curl "https://openrouter.ai/api/v1/videos/jobs/{job_id}" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY"
```

### Pricing (2026-05 estimate)

| Model | Approx Cost per 10s clip |
|-------|---------------------------|
| Kling 3.0 Standard | ~$0.15 |
| Kling 3.0 Pro | ~$0.30 |
| Seedance 2.0 | ~$0.50 |
| Veo 3.1 Fast | ~$0.20 |
| Veo 3.1 | ~$0.40 |
| Wan 2.6 | ~$0.70 ($0.07/sec) |

### Advantage for persona operators

1. **No GPU needed** — runs on any laptop (MacBook, Windows, Linux)
2. **No ComfyUI setup** — just API calls
3. **Access to closed models** — Kling 3.0 Pro has the best I2V consistency (better than open Wan 2.2)
4. **Scalable** — can generate dozens of clips in parallel via async API
5. **Native audio** — Seedance 2.0 / Veo 3.1 include synchronized sound

### Drawbacks

1. **Cost per clip** — $0.15-$0.50 per video adds up at volume
2. **No fine-tuning** — can't train a LoRA on these APIs (use local Wan 2.2 + LoRA for that)
3. **Censorship** — Closed models have content filters (but Kling/Veo are PG-13, not fully uncensored)
4. **Dependency** — requires internet, API key, and OpenRouter account

### Recommendation for "start tomorrow"

**Week 1 (start):** Use **Kling 3.0 Standard** via OpenRouter:
- Cheapest way to test video generation
- I2V from your FLUX-generated master image
- 9:16 aspect ratio for TikTok/Reels/Shorts
- ~$0.15 per 10s clip

**Week 2-4 (scale):** Upgrade to **Kling 3.0 Pro** or **Seedance 2.0** if:
- You need better identity preservation
- You want longer clips (15-30s)
- You need native audio

**Local backup:** Keep **Wan 2.2 + NSFW LoRA** running locally for:
- Content that APIs reject (adult/explicit)
- Backup when API is down
- Fine-tuning your own identity LoRA

## Snippets

> "Kling 3.0 sets the industry benchmark for I2V identity preservation — the closest open peer for consistency, significantly ahead of Wan 2.2 base."
> [Source: Video Generation Models Survey 2026.docx p.3]

> "OpenRouter provides a unified API gateway to video generation models. Generate videos from text or image prompts via an asynchronous API."
> [Source: openrouter.ai/docs/guides/overview/multimodal/video-generation (retrieved 2026-05-08)]

> "Video generation is asynchronous because generating video takes significantly longer than text or image generation."
> [Source: openrouter.ai/docs/guides/overview/multimodal/video-generation (retrieved 2026-05-08)]

## Dead Ends

- **Tryging to fine-tune on OpenRouter** — these are inference-only APIs, no LoRA training
- **Expecting fully uncensored output** — Kling/Veo are PG-13/Minimal censorship tier, use local Wan 2.2 + LoRA for NSFW
- **Synchronous API calls** — video takes 30s-5min, always use async job pattern

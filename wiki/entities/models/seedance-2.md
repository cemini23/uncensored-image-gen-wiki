---
title: Seedance 2.0 (ByteDance)
type: entity
tags: [model, video, av-joint, seedance, bytedance, multi-input-i2v, closed, benchmark-only]
keywords: [seedance, seedance-2-0, bytedance, pixeldance, multi-input, 9-images, 3-video-clips, 3-audio-tracks, i2v-consistency, multi-subject-interactions, openrouter]
related:
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - concepts/video-identity-inheritance.md
  - concepts/persona-consistency-methods.md
  - entities/models/openrouter-video.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-07
updated: 2026-05-07
---

## Relations

@sources/video-generation-survey-2026.md @entities/models/wan-2-2.md @concepts/video-identity-inheritance.md @concepts/persona-consistency-methods.md
@entities/models/openrouter-video.md

## Raw Concept

Page prompted by the May 2026 video survey ingest. Seedance 2.0 (ByteDance, February 2026) is the **industry benchmark for I2V identity-preservation rate** and multi-subject interactions. Closed-API access only — included in the wiki as a benchmark / aspirational reference for what local open-weight models are catching up to, not as a workflow target (per project-scope memory: adult-persona track skips closed APIs as policy/moderation risks override capability advantages).

Synthesized from @sources/video-generation-survey-2026.md.

## Narrative

### Architecture — unified multimodal A/V joint generation

Released February 2026 as the evolution of ByteDance's PixelDance system. Unified multimodal architecture jointly processes audio + video latents. [CONFIRMED]

### Multi-input capability — the differentiator

Users simultaneously input **up to 9 images + 3 video clips + 3 audio tracks** alongside natural language prompts in a single generation call. This unprecedented input bandwidth enables:
- Structural stability across subjects
- Character consistency under dynamic action
- Multi-subject interaction physics (industry benchmark)

[CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.3, citing seed.bytedance.com/en/blog/official-launch-of-seedance-2-0]

### I2V identity-preservation leadership

Seedance 2.0 is cited specifically as offering an **industry-leading I2V consistency preservation rate** — character facial geometry persists accurately through dynamic actions. Kling 3.0 is the closest peer; survey ranks Seedance ahead. [CONFIRMED] → @concepts/video-identity-inheritance.md

### Pricing and access — closed API

Closed API only. Available via OpenRouter and ByteDance direct. Subscription / per-second pricing model (survey doesn't pin exact figures; OpenRouter + GamsGo cited as pricing aggregators). [Source: Video Generation Models Survey 2026.docx p.3 + p.5; openrouter.ai/bytedance/seedance-2.0]

### Why this page exists despite project-scope memory excluding closed APIs

Per @sources/video-generation-survey-2026.md the adult-persona track concentrates on open-weight local-deployment options. Seedance 2.0 is included as a **named benchmark** because:

1. It is the canonical 2026 reference for "what I2V identity preservation looks like when done right" — local open-weight efforts (Wan 2.2, HunyuanVideo, the Mickmumpitz pipeline) measure themselves against this bar.
2. Multi-input I2V architecture (9 images + 3 clips + 3 audio) is a hint at the next wave of open-weight capability — Wan 3.0 / HunyuanVideo 2 successors are likely to chase this.

**This page does not prescribe Seedance 2.0 as a workflow target** for the adult-persona track — it is a reference benchmark only.

## Snippets

> "ByteDance released Seedance 2.0 in February 2026, utilizing a unified multimodal audio-video joint generation architecture (an evolution of the PixelDance system). Seedance 2.0 allows users to simultaneously input up to 9 images, 3 video clips, and 3 audio tracks alongside natural language prompts."
[Source: Video Generation Models Survey 2026.docx p.3, citing seed.bytedance.com/en/blog/official-launch-of-seedance-2-0 (retrieved 2026-05-06)]

> "Models like Seedance 2.0 and Kling 3.0 excel at preserving identity from I2V inputs. Seedance 2.0, in particular, offers an industry-leading consistency preservation rate, allowing the character's facial geometry to persist accurately through dynamic actions."
[Source: Video Generation Models Survey 2026.docx p.5, citing fal.ai/learn/tools/ai-video-generators]

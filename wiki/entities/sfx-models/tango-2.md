---
title: Tango 2 (Declare-Lab — instruction-tuned text-to-audio with DPO)
type: entity
tags: [sfx-generation, text-to-audio, tango-2, declare-lab, sutd, flan-t5, dpo, instruction-tuned, audio-alpaca]
keywords: [Tango, Tango 2, Declare-Lab, SUTD, FLAN-T5, DPO, Direct Preference Optimization, Audio-Alpaca, latent diffusion audio, instruction-tuned LDM]
related:
  - concepts/persona-audio-stack.md
  - entities/sfx-models/stable-audio-open.md
  - entities/sfx-models/audioldm.md
  - entities/sfx-models/audio-omni.md
  - entities/voice-models/bark.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/sfx-models/stable-audio-open.md
@entities/sfx-models/audioldm.md
@entities/sfx-models/audio-omni.md @entities/voice-models/bark.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 4 ("Tango 2 — instruction-tuned LLM + latent diffusion, outperforms AudioLDM on most metrics, trains on smaller datasets") and called out in the foley decision section as the "add if more specific text-to-sound prompting is needed" complement to Stable Audio Open. Previously no entity page.

## Narrative

### What it is

**Tango 2** is the Declare-Lab (Singapore University of Technology and Design) instruction-tuned text-to-audio model. Originated as **Tango** (NAACL 2023): FLAN-T5 instruction-tuned LLM as the prompt conditioner driving a latent diffusion model. **Tango 2** (2024) added **Direct Preference Optimization (DPO)** on **Audio-Alpaca** — a preference dataset of (prompt, preferred audio, rejected audio) triples — yielding measurably better text-prompt alignment than @entities/sfx-models/audioldm.md and the original Tango on AudioCaps + CLAP-score benchmarks despite training on **smaller datasets**.

### Key facts (May 2026)

- **License**: weights typically **CC-BY-NC-SA 4.0** [NEEDS VERIFICATION 2026-05-13] — non-commercial; SA (Share-Alike) layer added vs plain CC-BY-NC
- **Repo**: `github.com/declare-lab/tango`
- **Paper**: Tango (arXiv:2304.13731); Tango 2 (arXiv:2404.09956)
- **Architecture**:
  - **Text conditioner**: FLAN-T5-Large (instruction-tuned)
  - **Audio backbone**: latent diffusion model (LDM)
  - **Alignment**: DPO on Audio-Alpaca preference dataset (Tango 2 distinguishing feature)
- **Training data efficiency**: trained on smaller datasets than AudioLDM and matches/exceeds it — DPO + instruction-tuning compensates for data scale
- **Sample rate**: 16 kHz [VERIFY]
- **Clip length**: ~10 seconds typical
- **VRAM**: ~8-12 GB
- **Coverage**: text-to-audio (SFX + ambient + music elements; weaker on speech vs AudioLDM 2)

### Positioning vs Stable Audio Open / AudioLDM

| Axis | Tango 2 | Stable Audio Open 1.0 | AudioLDM 2 |
|------|---------|----------------------|-----------|
| Text alignment | **Best** (DPO-tuned + FLAN-T5) | Strong (T5) | Pioneer baseline |
| Sample rate | 16 kHz [VERIFY] | 44.1 kHz stereo | 16 kHz |
| Clip length | ~10 s | up to 47 s | ~10 s |
| License (weights) | CC-BY-NC-SA likely | Stability Community (<$1M ARR free) | CC-BY-NC likely |
| Training-data efficiency | High (DPO compensates) | Moderate (CC-licensed audio) | Lower |
| Best for | Instruction-style text-to-sound prompts | Production foley + 30 s+ loops | Research baseline |

### Operator notes

- **Build-track posture**: if CC-BY-NC-SA 4.0 weight license confirmed, Tango 2 is **research-only for monetized persona content**. Use @entities/sfx-models/stable-audio-open.md (Community License, <$1M ARR free) as the production-license-clean primary, fall back to Tango 2 for research / prototyping where its text-alignment advantage matters
- **Why Tango 2 over Stable Audio Open**: when the SFX prompt is **instruction-style** ("a glass shattering on tile, followed by a gasp") rather than descriptive ("ambient café sound"), DPO + FLAN-T5 instruction-tuning aligns better than Stable Audio Open's T5 conditioning. Useful for narrative-driven scene-sound prompts.
- **Why Stable Audio Open over Tango 2**: 44.1 kHz stereo + 47 s clip length + Community License all favor Stable Audio Open for production persona content. Tango 2 is the **researchy specialist** in the foley layer, not the primary.
- **Audio diffusion lineage** [Source: @entities/sfx-models/audioldm.md]: AudioLDM (2023) → Tango (2023) → Tango 2 (2024, DPO) → Stable Audio Open (2024, 44.1 kHz step-up)

## Snippets

> "Tango 2 — Instruction-tuned LLM + latent diffusion, outperforms AudioLDM on most metrics, trains on smaller datasets."
[Source: @concepts/persona-audio-stack.md Layer 4 — text-to-audio alternatives table, retrieved 2026-05-13]

> "For persona video content, Stable Audio Open covers 90% of needs (ambient, transitions, production elements). Add Tango 2 if more specific text-to-sound prompting is needed."
[Source: @concepts/persona-audio-stack.md Layer 4 — foley decision, retrieved 2026-05-13]

## Dead Ends

- **Tango 2 for monetized persona content** (pending license confirmation): if CC-BY-NC-SA 4.0 weights confirmed, use Stable Audio Open (Community License) for revenue-generating output.
- **Tango 2 as production primary**: 16 kHz output + ~10 s clip cap + license restrictions all favor Stable Audio Open. Tango 2 is the instruction-style-prompt specialist, not the default.

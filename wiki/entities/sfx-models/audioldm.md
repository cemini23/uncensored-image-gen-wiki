---
title: AudioLDM (CVSSP Surrey — first text-to-audio latent diffusion model)
type: entity
tags: [sfx-generation, text-to-audio, audioldm, latent-diffusion, cvssp, surrey, haohe-liu, icml-2023, audioldm2, non-commercial-weights]
keywords: [AudioLDM, AudioLDM 2, Haohe Liu, CVSSP Surrey, text-to-audio LDM, ICML 2023, GPT-2 conditioner, AudioMAE, 16kHz audio, latent diffusion]
related:
  - concepts/persona-audio-stack.md
  - entities/sfx-models/stable-audio-open.md
  - entities/sfx-models/tango-2.md
  - entities/sfx-models/audio-omni.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/sfx-models/stable-audio-open.md
@entities/sfx-models/tango-2.md
@entities/sfx-models/audio-omni.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 4 text-to-audio alternatives table ("AudioLDM — Text-to-audio (speech + sound effects + music), multiple checkpoints, well-established"); the academic precursor to Stable Audio Open and Tango 2. Previously no entity page.

## Narrative

### What it is

**AudioLDM** is the ICML 2023 paper (Liu et al., CVSSP, University of Surrey) and reference implementation — the **first text-to-audio latent diffusion model** to demonstrate competitive quality on AudioCaps. Established the LDM-for-audio paradigm that @entities/sfx-models/stable-audio-open.md and Tango 2 build on. **AudioLDM 2** (follow-up) added GPT-2 prompt conditioner + AudioMAE perceptual loss, broadening coverage to speech, sound effects, and music in a single model.

### Key facts (May 2026)

- **License**: weights typically **CC-BY-NC 4.0** (non-commercial research) [NEEDS VERIFICATION 2026-05-13] — same license-blocker pattern as @entities/music-models/musicgen.md; AudioLDM 2 license may differ — verify
- **Repo**: `github.com/haoheliu/AudioLDM` (v1), `github.com/haoheliu/AudioLDM2` (v2)
- **Paper**: AudioLDM (arXiv:2301.12503, ICML 2023); AudioLDM 2 (arXiv:2308.05734)
- **Architecture**: T5/CLAP text encoder → latent diffusion → HiFi-GAN decoder → 16 kHz audio
- **AudioLDM 2 architecture**: GPT-2 prompt conditioner + AudioMAE perceptual loss + LDM
- **Sample rate**: **16 kHz** (lower than Stable Audio Open's 44.1 kHz — main quality limit)
- **Clip length**: ~10 seconds typical [VERIFY]
- **VRAM**: ~8-12 GB inference
- **Coverage**: text-to-audio across speech, sound effects, music (broad but jack-of-all-trades)

### Positioning vs Stable Audio Open / Tango 2

| Axis | AudioLDM 2 | Stable Audio Open 1.0 | Tango 2 |
|------|-----------|----------------------|---------|
| Sample rate | **16 kHz** (low) | 44.1 kHz stereo | 16 kHz [VERIFY] |
| Clip length | ~10 s | up to 47 s | ~10 s typical |
| License (weights) | CC-BY-NC 4.0 likely | Stability Community (<$1M ARR free) | CC-BY-NC-SA 4.0 likely |
| Text-to-audio quality | Pioneer baseline | Strong (CC-trained) | Outperforms AudioLDM on most metrics |
| Architecture novelty | GPT-2 + AudioMAE | T5 + DiT + DCAE-like | FLAN-T5 + LDM + DPO-tuned |
| Best for | Research, AudioLDM-lineage baseline | Production foley + short loops | Instruction-following text-to-audio |

### Operator notes

- **Build-track posture**: if CC-BY-NC 4.0 weight license confirmed, AudioLDM is **research-only for monetized persona content**. Use @entities/sfx-models/stable-audio-open.md (Community License, <$1M ARR free) for revenue-generating output.
- **16 kHz sample rate** is the main production-quality blocker — Reels/IG audio is delivered at 44.1/48 kHz; AudioLDM output requires upsampling (lossy) or coexistence with higher-rate primary audio
- **Why mention it then**: AudioLDM 2 has the broadest cross-modal coverage (speech + SFX + music in one model) and remains a useful research baseline. Tango 2 (DPO-tuned descendant) outperforms it on most benchmarks
- **Audio diffusion lineage**: AudioLDM (v1, 2023) → AudioLDM 2 (2023) → Tango (2023) → Tango 2 (2024, DPO-tuned) → Stable Audio Open (2024, 44.1 kHz step-up) — each generation closes weaknesses of the prior

## Snippets

> "AudioLDM — Text-to-audio (speech + sound effects + music), multiple checkpoints, well-established."
[Source: @concepts/persona-audio-stack.md Layer 4 — text-to-audio alternatives table, retrieved 2026-05-13]

## Dead Ends

- **AudioLDM for monetized persona content** (pending license confirmation): if CC-BY-NC 4.0 weights confirmed, use Stable Audio Open (Community License) for revenue-generating output.
- **AudioLDM at production sample rates**: 16 kHz output requires upsampling for 44.1/48 kHz delivery — quality loss vs native-44.1 generators like Stable Audio Open.

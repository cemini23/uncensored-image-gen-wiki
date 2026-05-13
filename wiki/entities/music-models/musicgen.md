---
title: MusicGen (Meta FAIR / AudioCraft text + melody-conditioned music LM)
type: entity
tags: [music-generation, text-to-music, melody-conditioned, meta, facebook-research, audiocraft, encodec, cc-by-nc-4-0, non-commercial-weights, research-only]
keywords: [MusicGen, AudioCraft, Meta FAIR, EnCodec, 32kHz tokenizer, melody conditioning, musicgen-small, musicgen-medium, musicgen-melody, musicgen-large, musicgen-style, CC-BY-NC 4.0, MIT code, autoregressive transformer, single-stage]
related:
  - concepts/persona-audio-stack.md
  - entities/music-models/ace-step.md
  - entities/music-models/suno.md
  - entities/music-models/udio.md
  - entities/sfx-models/stable-audio-open.md
  - concepts/persona-monetization-models.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/music-models/ace-step.md
@entities/music-models/suno.md @entities/music-models/udio.md
@entities/sfx-models/stable-audio-open.md
@concepts/persona-monetization-models.md

## Raw Concept

Page prompted by the W4 voice/audio-gen backfill (scope expansion 2026-05-13). Named in @concepts/persona-audio-stack.md as the "fully open source" music gen alternative; the license-split detail (MIT code / **CC-BY-NC 4.0 weights**) makes it research-only for build-track persona-ops — important to surface explicitly. Previously no entity page.

## Narrative

### What it is

**MusicGen** is Meta FAIR's single-stage autoregressive transformer for text-conditioned and melody-conditioned music generation. Part of the **AudioCraft** library (`facebookresearch/audiocraft`), which also ships **EnCodec** (32 kHz neural audio compressor / tokenizer) and **AudioGen** (sound-effect gen, sibling model). MusicGen generates all 4 EnCodec codebooks in a single pass — does NOT need MusicLM's self-supervised semantic representation. Trained April-May 2023 on 20K hours of licensed music (Meta Music Initiative + ShutterStock + Pond5).

### Key facts (May 2026)

- **License**: **code MIT, weights CC-BY-NC 4.0** (non-commercial) [CONFIRMED — model card]
- **Sizes**: 300M (`musicgen-small`), 1.5B (`musicgen-medium`), 3.3B (`musicgen-large`)
- **Variants**: `musicgen-melody` (1.5B, text + melody-conditioned), `musicgen-style` (1.5B, style transfer)
- **Codec**: EnCodec at 32 kHz, 4 codebooks @ 50 Hz
- **Architecture**: single-stage autoregressive transformer LM over EnCodec tokens (no semantic intermediate)
- **VRAM**: 16 GB recommended (musicgen-medium / -melody); smaller GPUs work with `musicgen-small`
- **Best trade-off (per Meta)**: `musicgen-medium` or `musicgen-melody` quality vs compute
- **Demo / HF**: `facebook/musicgen-{small,medium,melody,large,style}`

### Positioning vs ACE-Step / Stable Audio Open

| Axis | MusicGen | ACE-Step v1.5 | Stable Audio Open |
|------|----------|---------------|-------------------|
| License (weights) | **CC-BY-NC 4.0** ❌ commercial | **Apache 2.0** ✅ | Stability Community (<$1M ARR free) |
| Sizes | 300M / 1.5B / 3.3B | 3.5B | 1.21B |
| Length | Short autoregressive clips | Several minutes (full songs) | Up to 47s |
| Melody conditioning | ✅ unique (`musicgen-melody`) | ❌ | ❌ |
| Maturity | Well-tested, large community since 2023 | Newer (2025) | Mature |
| Best for | Research / melody-guided experiments | Production persona music | Foley + ambient + short loops |

### Build-track posture: research only

For **persona-ops revenue-generating content**, MusicGen's **CC-BY-NC 4.0 weight license** is a hard blocker: any music posted to Fanvue / OnlyFans / Patreon / Reels / TikTok with monetization on is commercial use → out of license → DMCA / takedown / Meta legal exposure. Use ACE-Step (Apache 2.0) or Stable Audio Open (Community License, <$1M ARR) for monetized content.

MusicGen remains useful for:
- **Melody-conditioned experiments** (hum a tune → expand to a composition) — unique capability not in ACE-Step
- **Research / prototyping** of music-conditioning techniques
- **Synthesizing background ideas** that you then re-create with a clean-license model

### Operator notes

- **EnCodec** alone (separate from MusicGen) is MIT for both code and weights — viable for audio compression in custom pipelines
- **AudioGen** sibling (sound-effect gen) is also part of AudioCraft — surfaces in foley discussions
- Build-track decision matrix entry: **demote MusicGen** from a primary recommendation to a research-tier alt, with @entities/music-models/ace-step.md as the canonical pick

## Snippets

> "License: Code is released under MIT, model weights are released under CC-BY-NC 4.0."
[Source: github.com/facebookresearch/audiocraft/blob/main/model_cards/MUSICGEN_MODEL_CARD.md (retrieved 2026-05-13)]

> "MusicGen is a single stage auto-regressive Transformer model trained over a 32kHz EnCodec tokenizer with 4 codebooks sampled at 50 Hz. Unlike existing methods like MusicLM, MusicGen doesn't require a self-supervised semantic representation, and it generates all 4 codebooks in one pass."
[Source: github.com/aime-labs/MusicGen (retrieved 2026-05-13)]

> "We recommend 16GB of memory, but smaller GPUs will be able to generate short sequences, or longer sequences with the facebook/musicgen-small model."
[Source: facebookresearch/audiocraft/docs/MUSICGEN.md (retrieved 2026-05-13)]

### Install

```bash
git clone https://github.com/facebookresearch/audiocraft.git
cd audiocraft && pip install -e .
# minimal use
python -c "
from audiocraft.models import MusicGen
model = MusicGen.get_pretrained('facebook/musicgen-medium')
model.set_generation_params(duration=8)
wav = model.generate(['80s pop synth chorus'])
"
```

## Dead Ends

- **MusicGen for monetized persona content**: CC-BY-NC 4.0 weights block commercial use. Migrate to ACE-Step v1.5 (Apache 2.0) for any revenue-generating output.
- **MusicGen as primary local music recommendation** (legacy 2024 advice): superseded by ACE-Step v1.5 for license + speed reasons.

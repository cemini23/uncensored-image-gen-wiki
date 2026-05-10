---
title: "Fish-Speech S2 Pro (open-source zero-shot voice cloning)"
type: entity
tags: [persona-ops, voice-cloning, tts, fish-speech, open-source, zero-shot, tts-arena2-leader]
keywords: [Fish-Speech, Fish-Speech-S2-Pro, zero-shot-voice-cloning, TTS-Arena2, 50-emotion-tags, Qwen3-TTS, F5-TTS, MaskGCT, Coqui-XTTS, ElevenLabs, voice-note, NSFW-banned-elsewhere]
related:
  - sources/persona-ops-stack-2026.md
  - concepts/persona-ops-stack.md
  - concepts/persona-monetization-models.md
  - entities/persona-ops/sillytavern.md
  - entities/persona-ops/n8n.md
  - concepts/model-selection-workflow.md
  - concepts/persona-audio-stack.md
maturity: draft
created: 2026-05-07
updated: 2026-05-07
---

## Relations

@sources/persona-ops-stack-2026.md @concepts/persona-ops-stack.md @concepts/persona-monetization-models.md @entities/persona-ops/sillytavern.md @entities/persona-ops/n8n.md
@concepts/model-selection-workflow.md

@concepts/persona-audio-stack.md
## Raw Concept

Page prompted by Path A step 6 ingest of the persona-ops survey docx (May 2026). Fish-Speech S2 Pro is the open-source voice-cloning leader on TTS-Arena2 as of May 2026 — zero-shot from 10-30 seconds of reference audio, 50+ emotion tags, supports the NSFW persona-ops voice layer that ElevenLabs (NSFW-banned) won't.

Synthesized from @sources/persona-ops-stack-2026.md.

## Narrative

### Positioning (May 2026)

| Voice clone | Posture | Latency / quality | NSFW-friendly |
|-------------|---------|-------------------|---------------|
| **ElevenLabs Flash v2.5** | Hosted SaaS | 75-150ms, top-tier SFW | NO — platform-banned |
| **Fish-Speech S2 Pro** | Open-source, self-host | TTS-Arena2 leader, slower than Flash | YES (operator-controlled) |
| Qwen3-TTS | Open-source (Alibaba) | High quality, multi-lingual strong | Yes |
| F5-TTS | Open-source | Strong on English | Yes |
| MaskGCT | Open-source | Strong on multi-speaker | Yes |
| Coqui XTTS | Open-source (legacy) | Older arch, surpassed | Yes (but legacy) |

Fish-Speech S2 Pro is the **default recommendation** for NSFW persona-ops voice cloning as of May 2026.

### Capabilities

- **Zero-shot voice cloning** from 10-30 seconds of reference audio — operator records (or generates) a short audio sample and the model produces unlimited synthesis matching that voice
- **50+ emotion tags** — flirtatious, breathy, intimate, contemplative, aroused, etc. — tag-conditioned synthesis at inference time
- **Multi-lingual** support
- **Local execution** on consumer GPUs (16-24 GB VRAM tier comfortable)
- **Open-source weights** — full operator control of source audio + outputs (no platform inspection / consent issues)

### Why ElevenLabs lost the NSFW market (despite being best-in-class SFW)

ElevenLabs Flash v2.5 has 75-150ms latency and top-tier SFW quality, but enforces an NSFW ban at platform level. Operators using Eleven for NSFW persona voice notes face:
- Account termination
- Detection of cloned voices used for adult content (audio classifier)
- Legal exposure (Vacker v ElevenLabs settled — voice rights litigation)

The market migrated to open-source clones once the quality gap narrowed enough that Fish-Speech S2 Pro could lead TTS-Arena2.

### Reference architecture (DM voice notes)

```
SillyTavern persona response (text)
       ↓
Fish-Speech S2 Pro (with emotion tag from LLM context)
       ↓
Audio file (.wav / .mp3)
       ↓
n8n delivery to fan via Fanvue / Telegram / DM channel
```

Voice notes carry a high premium on Fanvue / OF — they're harder to fake at scale than generic TTS, and parasocial intimacy correlates with audio personalization. → @concepts/persona-monetization-models.md

### Operator hygiene

- **Reference audio rights**: must be operator-owned or fully synthetic. Cloning a real person's voice without consent is right-of-publicity exposure (Vacker v ElevenLabs precedent). → @concepts/persona-legal-landscape.md
- **Emotion tag discipline**: don't use intimate / aroused tags for non-consenting reference voices.
- **Output watermarking**: C2PA labeling matters in EU (AI Act Article 50, Aug 2026) and UK OSA contexts.

### Hardware viability

- 16 GB VRAM: comfortable for inference; latency higher than Eleven Flash but within usable bounds for batch DM voice notes
- 24-48 GB VRAM: handles multi-persona concurrent inference + low-latency real-time use cases
- Apple Silicon: MPS support exists in community forks; not as fast as CUDA but viable

## Snippets

> "Fish-Speech S2 Pro leads TTS-Arena2 and supports zero-shot voice cloning from 10-30 seconds of audio with 50+ emotion tags. Qwen3-TTS, F5-TTS, MaskGCT are credible alternates; Coqui XTTS is now legacy."
[Source: AI Persona Operations Software Stack.docx Section 4 (retrieved 2026-05-06)]

> "ElevenLabs Flash v2.5 has 75-150ms latency and top-tier SFW quality but is NSFW-banned at platform level."
[Source: AI Persona Operations Software Stack.docx Section 4 (retrieved 2026-05-06)]

## Dead Ends

- **ElevenLabs for NSFW persona voice notes**: NSFW-banned. Migrate to Fish-Speech S2 Pro / Qwen3-TTS / F5-TTS.
- **Coqui XTTS for new builds**: legacy architecture. Use Fish-Speech S2 Pro instead.
- **Cloning real-person voice without confirmed rights**: Vacker v ElevenLabs precedent. Must use confirmed-rights or fully synthetic source audio.

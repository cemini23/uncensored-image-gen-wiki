---
title: OmniVoice — Zero-Shot Voice Cloning (REJECTED — license)
type: entity
tags: [voice-cloning, tts, cross-wiki-stub, dead-end, license-blocker]
keywords: [omnivoice, zero-shot voice cloning, commercial-license, reject, k93, k45-retracted]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - concepts/federated-daily-research-digest.md
maturity: draft
created: 2026-05-15
updated: 2026-06-01
cross-wiki-source: "@osint-wiki/entities/tools/omnivoice.md"
provenance:
  stub: true
  ingested_from:
    - briefs/2026-06-01_k93-imagegen-digest-from-osint.md
---

## Relations

@osint-wiki/entities/tools/omnivoice.md
@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@concepts/federated-daily-research-digest.md

## Raw Concept

Cross-wiki stub from K45 tool eval (briefly marked Adopt on Apache-2.0 assumption). **K93 re-eval rejected** `debpalash/OmniVoice-Studio`: Hugging Face / repo license **NOASSERTION** with custom commercial terms — not redistributable for monetized persona-ops. [Source: @osint-wiki/sources/multi-wiki-tool-eval-v5-k93-2026-06-01.md K93 tier table]

## Narrative

### Claimed capability [TENTATIVE — pre-rejection marketing]

Zero-shot voice cloning across 600+ languages; diffusion language model architecture; emotion / non-verbal tags. Never Phase-0 audited on local hardware in this workspace.

### Verdict: dead-end for build track

| Check | Result |
|-------|--------|
| License | **Reject** — commercial poison, not Apache-2.0 [CONFIRMED 2026-06-01 via K93] |
| NSFW persona-ops | Unaudited; moot given license block |
| vs Fish-Speech S2 Pro | Fish-Speech remains Layer-1 default → @entities/persona-ops/fish-speech.md |

### Alternatives (multilingual zero-shot)

- @entities/voice-models/qwen3-tts.md — Alibaba multilingual
- @entities/voice-models/cosyvoice2.md — streaming, Apache-2.0 class
- @entities/persona-ops/fish-speech.md — TTS-Arena2 leader, 50+ emotion tags

## Dead Ends

- **Adopting OmniVoice for persona DM voice notes** — license blocker; use Fish-Speech / CosyVoice2 / Qwen3-TTS instead.
- **K45 "Apache-2.0 Adopt" tier** — `[RETRACTED 2026-06-01]`; superseded by K93 license audit.

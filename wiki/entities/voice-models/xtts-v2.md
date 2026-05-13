---
title: "XTTS-v2 (Coqui — legacy 6-second-clone TTS, company shut down 2024)"
type: entity
tags: [voice-cloning, tts, xtts, coqui, legacy, non-commercial-license, mozilla-tts-lineage, eolg]
keywords: [XTTS, XTTS-v2, Coqui TTS, Coqui Public Model License, 6-second cloning, Mozilla TTS, ⓍTTS, voice cloning legacy, company shutdown 2024]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/chatterbox.md
  - sources/persona-ops-stack-2026.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@entities/voice-models/cosyvoice2.md
@entities/voice-models/chatterbox.md
@sources/persona-ops-stack-2026.md

## Raw Concept

Page prompted by the W4 Tier 3 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 1 alternates table ("XTTS-v2 (Coqui) — Most downloaded, 6-sec cloning — Company shut down 2024; legacy arch") and in the Dead Ends section ("Coqui XTTS for new builds: company shut down 2024, legacy architecture. Use CosyVoice2 or Fish-Speech instead"). Previously no entity page — explicit deprecation deserves a dedicated page that future readers can cite.

## Narrative

### What it is

**XTTS-v2** (ⓍTTS v2) is the Coqui TTS team's open-weights voice-cloning text-to-speech model — for most of 2023-2024 the **most-downloaded open TTS model on Hugging Face** and the de-facto open-source voice-cloning baseline. Lineage: Mozilla TTS (2017-2020) → Coqui TTS (2020-2024) → XTTS-v1 → **XTTS-v2** (final release before company shutdown). Differentiator at release: **6-second reference audio** for zero-shot voice cloning across 17 languages.

### Key facts (May 2026 — historical)

- **License**: **Coqui Public Model License (CPML)** — non-commercial research / personal use only [CONFIRMED]
  - Commercial use required a paid Coqui Studio commercial license (no longer obtainable — company defunct)
- **Repo**: `github.com/coqui-ai/TTS` (now community-maintained fork)
- **Company status**: Coqui announced shutdown in **2024** (formerly Berlin-based, post-Mozilla-TTS spin-out). The open repo persists; the paid commercial license path does not.
- **Architecture**: GPT-2-style transformer encoder over speech tokens + HiFi-GAN-class vocoder + speaker conditioning via short reference clip
- **Reference audio**: **6 seconds** minimum for zero-shot cloning (industry-defining at release)
- **Languages**: 17 (English, Spanish, French, German, Italian, Portuguese, Polish, Turkish, Russian, Dutch, Czech, Arabic, Chinese, Hungarian, Korean, Japanese, Hindi)
- **VRAM**: ~4-8 GB inference (lightest in its era)
- **Strength at release**: lowest barrier to entry for voice cloning (Python pip install, 6-second reference)
- **Why it lost the market**: license posture + company shutdown + Fish-Speech / CosyVoice2 / Chatterbox displaced it on TTS-Arena2 + permissive-license alternatives emerged

### Why XTTS-v2 still matters as a reference

| Topic | Why XTTS-v2 still gets cited |
|-------|------------------------------|
| **Tutorial corpus** | The 2023-2024 ML-content boom produced 100s of YouTube/blog tutorials using XTTS — still the first hit when newcomers Google "open source voice cloning" |
| **Comparative baseline** | TTS-Arena2 / benchmark papers anchor "vs XTTS-v2" as a quality baseline; comparison context survives the deprecation |
| **License-failure case study** | The CPML + company-shutdown combo is the canonical example of why operators avoid restrictive-license OSS audio models (build-track lesson encoded in @entities/voice-models/chatterbox.md MIT preference) |

### Positioning vs current voice tier

| Axis | XTTS-v2 (2023, legacy) | Fish-Speech S2 Pro (May 2026) | CosyVoice2-0.5B (May 2026) | Chatterbox (May 2026) |
|------|------------------------|-------------------------------|----------------------------|------------------------|
| Reference clip | **6 s** (industry-defining) | 10-30 s | Few s | Few s |
| TTS-Arena2 ELO | Surpassed | **Leader (1339)** | Strong | Strong |
| Emotion control | None (prosody only) | **50+ inline tags** | Moderate | Limited |
| Language count | 17 | 80+ | Multi (CN-strong) | Multi |
| Latency | Moderate | Higher (batch) | **~150 ms streaming** | Real-time |
| **License (weights)** | **CPML (non-commercial only)** ❌ | Operator-controlled (paid commercial path) | **Apache 2.0** ✅ | **MIT** ✅ |
| **Commercial viability** | **No** (no obtainable license) | Paid license available | Free under Apache | Free under MIT |
| **Maintenance** | Community fork only (Coqui defunct) | Active (Fish Audio) | Active (Alibaba) | Active (Resemble) |
| **Best for** | Reading old tutorials | Production NSFW persona ops | Real-time DM voice notes | Cleanest-license commercial |

### Operator notes

- **Build-track posture: DO NOT USE for monetized persona content** — both the CPML restriction and the absent commercial-license path make it a legal dead end. Even if a community fork relicenses, the upstream weights' commercial restriction taints derivatives unless full retraining from clean data is done.
- **Tutorial-archive caveat**: if a 2023-2024 voice-cloning tutorial references XTTS-v2, mentally substitute @entities/voice-models/cosyvoice2.md (Apache 2.0, similar VRAM tier) or @entities/voice-models/chatterbox.md (MIT, similar capability)
- **6-second reference clip pattern**: XTTS-v2 popularized the very-short-reference cloning UX; Chatterbox / CosyVoice2 / IndexTTS-2 inherited the pattern with permissive licenses
- **Coqui Studio commercial path is closed** — company dissolved 2024, no licensing route exists

## Snippets

> "XTTS-v2 (Coqui) — Most downloaded, 6-sec cloning. Company shut down 2024; legacy arch."
[Source: @concepts/persona-audio-stack.md Layer 1 alternates table, retrieved 2026-05-13]

> "Coqui XTTS for new builds: company shut down 2024, legacy architecture. Use CosyVoice2 or Fish-Speech instead."
[Source: @concepts/persona-audio-stack.md Dead Ends, retrieved 2026-05-13]

## Dead Ends

- **XTTS-v2 for any monetized persona-ops use**: CPML license forbids commercial use; the company's 2024 shutdown closed the commercial-license path permanently. Migrate to @entities/voice-models/cosyvoice2.md (Apache 2.0) or @entities/voice-models/chatterbox.md (MIT) for new builds.
- **Treating "most downloaded on HF" as a quality signal**: download-count lags model release by 12-24 months. As of May 2026, XTTS-v2's HF download count reflects 2023-2024 momentum, not current capability.
- **Coqui Studio commercial license**: no longer obtainable. Company defunct since 2024.

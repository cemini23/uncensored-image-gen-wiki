---
title: "supertonic — financial-speech TTS (Defer, dual-license OpenRAIL-M)"
type: entity
tags: [persona-ops, tts, voice-cloning, financial-speech, openrail-m, dual-license]
keywords: [supertonic, financial tts, openrail-m, persona voice, mit code openrail weights]
related:
  - entities/persona-ops/fish-speech.md
maturity: validated
created: 2026-05-12
updated: 2026-06-05
phase_0_verdict: DEFER
phase_0_date: 2026-06-05
osint_eval_origin: doc1-url-4 (cross-routed; image-gen persona-ops primary)
---

## Relations

- `@osint-wiki/entities/tools/supertonic.md` — OSINT cross-route
- `@osint-wiki/sources/evaluating-github-repos-trading-stack-2026-05-12.md` — origin eval (URL 4)
- `@entities/persona-ops/fish-speech.md` — current persona-ops TTS leader (TTS-Arena2)

## Raw Concept

- **License**: MIT (code) + OpenRAIL-M (weights) — DUAL LICENSE
- **Tier**: Defer (financial domain specialization may not transfer; verify against persona-voice use)

## Narrative

Financial-domain-specialized TTS engine. Dual license: code MIT, weights OpenRAIL-M (Responsible AI Licensing — use restrictions on misuse categories). For persona-ops: training/finetune target if persona voices need a financial-news-anchor flavor; otherwise Fish-Speech S2 Pro remains the TTS-Arena2 leader for general persona voice.

### Phase-0 audit [CONFIRMED 2026-06-05]

Prior K40 eval retained: **MIT code + OpenRAIL-M weights**, financial-speech specialization, deepfake-category restrictions in OpenRAIL-M. Main upstream repo URL not re-located in this batch (community wrappers only).

**Verdict: DEFER** — Fish-Speech S2 Pro remains persona Layer-1 default. Re-open if OpenRAIL-M clauses are acceptable for operator use case and canonical repo is identified.

## Dead Ends

None.

---
title: "MoneyPrinter — MIT-licensed short-form video automation (MoviePy-based)"
type: entity
tags: [persona-ops, video-automation, short-form, youtube-shorts, tiktok, mit-license]
keywords: [MoneyPrinter, FujiwaraChoki, MIT, short-form video, YouTube Shorts, TikTok, MoviePy, automation, persona-ops]
related:
  - concepts/persona-ops-stack.md
  - concepts/persona-content-cadence.md
  - entities/persona-ops/n8n.md
maturity: validated
created: 2026-05-21
updated: 2026-06-05
phase_0_verdict: CONDITIONAL-GO
phase_0_date: 2026-06-05
cross-wiki-source: "@osint-wiki/sources/multi-wiki-tool-eval-26url-2026-05-19.md"
provenance:
  stub: true
  ingested_from:
    - briefs/2026-05-19_k54-tool-eval-imagegen-items.md
---

## Relations

@concepts/persona-ops-stack.md @concepts/persona-content-cadence.md @entities/persona-ops/n8n.md

## Raw Concept

Cross-wiki tool eval item routed from OSINT K54 batch. `FujiwaraChoki/MoneyPrinter` — **MIT-licensed** (license-corrected from a phantom AGPL-3.0 rejection in the original eval), 13,259★, Python, MoviePy-based automation of YouTube Shorts / TikTok short-form video.

## Narrative

### Surface area

- Automates short-form video production (YouTube Shorts, TikTok) using MoviePy
- Python-based; integrable into n8n pipelines via shell-exec or Python nodes
- 13,259★ GitHub stars; moderately maintained (last push 2026-03-26)

### License correction

The original OSINT K54 eval **falsely rejected** this as AGPL-3.0. `gh api repos/FujiwaraChoki/MoneyPrinter` returns `spdx_id = MIT`. The eval fabricated the AGPL claim. With the real MIT license, MoneyPrinter is **license-clean** and a legitimate candidate for persona-ops short-form content workflows.

### Persona-ops application

Candidate for automating short-form video content from persona image/video assets. Could slot into the n8n content-calendar pipeline as the video-rendering stage for TikTok/YouTube Shorts distribution.

### Phase-0 audit [CONFIRMED 2026-06-05]

Repo: `FujiwaraChoki/MoneyPrinter` — **MIT**, 13.4k★, last push 2026-03-26. **Ollama-first** script/metadata generation + **Postgres queue worker** + MoviePy render — evolved from simple Shorts script to DB-backed pipeline.

**Verdict: CONDITIONAL-GO** — optional **n8n leaf** for automated TikTok/YouTube Shorts from topics. Not part of core ComfyUI persona image/video stack; requires Docker Postgres + Ollama sidecar.

## Dead Ends

None — not evaluated for NSFW Shorts policy on platforms (operator ToS risk).

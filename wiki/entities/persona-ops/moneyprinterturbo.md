---
title: "MoneyPrinterTurbo — MIT text-to-short-video generator (SIZE-SKIP handoff)"
type: entity
tags: [persona-ops, video-automation, short-form, text-to-video, mit-license, size-skip]
keywords: [MoneyPrinterTurbo, harry0703, MIT, short-form video, text-to-video, TikTok, YouTube Shorts, size-skip, cross-wiki]
related:
  - concepts/persona-ops-stack.md
  - concepts/persona-content-cadence.md
  - entities/persona-ops/moneyprinter.md
  - entities/persona-ops/n8n.md
maturity: draft
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: SIZE-SKIP
wire_status: wont_wire
cross-wiki-source: "@osint-wiki/sources/eval-repository-revenue-2026-08-20.md"
---

## Relations

@concepts/persona-ops-stack.md @concepts/persona-content-cadence.md @entities/persona-ops/moneyprinter.md @entities/persona-ops/n8n.md

## Raw Concept

Cross-wiki handoff from OSINT (`briefs/2026-08-20_moneyprinterturbo-video-gen-size-skip.md`). OSINT evaluated `harry0703/MoneyPrinterTurbo` and **SIZE-SKIP**ped it at ~536 MB, noting that video/image generation is this wiki's domain and that image-gen should clone here if it wants the tool. Filed 2026-10-06 during the incoming-brief sweep.

## Narrative

**What it is.** A text-to-short-video generator — a topic goes in, a captioned short-form clip comes out. It is **not** a diffusion video model: it assembles stock footage, TTS narration, subtitles and music into a finished clip. That places it in the *editing and assembly* lane, not the generation lane.

**Licence.** MIT — verified by OSINT via `gh api` on 2026-08-20.

**Distinct from the page already in this wiki.** `@entities/persona-ops/moneyprinter.md` covers `FujiwaraChoki/MoneyPrinter`, a different repository with the same theme. MoneyPrinterTurbo is a separate project and a separate codebase; do not treat the two as one tool.

**Phase-0 (2026-08-20, inherited).** **SIZE-SKIP** — the clone is about 536 MB, which is over the wiki's clone threshold. No local clone exists in either workspace, so nothing has been run or verified here. **Verdict: `wont_wire`.** The licence is clean, so the block is size and need, not rights. An operator who wants automated short-form assembly should compare this against the existing MoneyPrinter page and against a plain FFmpeg + n8n pipeline before paying the 536 MB.

**Where it would sit.** Alongside `@entities/persona-ops/moneyprinter.md` in the persona-ops content pipeline (`@concepts/persona-ops-stack.md`, `@concepts/persona-content-cadence.md`), as a possible rendering stage for TikTok / YouTube Shorts distribution. Neither tool is wired.

## Snippets

[Source: github.com/harry0703/MoneyPrinterTurbo — SPDX MIT, verified via `gh api` 2026-08-20]
[Source: cross-wiki brief `2026-08-20_moneyprinterturbo-video-gen-size-skip.md`]

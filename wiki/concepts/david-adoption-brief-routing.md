---
title: David adoption brief routing — RETIRED (TipDrop kit mirror)
type: concept
tags: [concept, meta, workflow, briefs, persona-ops, tipdrop, retired]
keywords: [david, tipdrop-workspace-kit, adoption-brief, retired, 2026-08-05]
related:
  - concepts/persona-audio-stack.md
  - concepts/persona-ops-stack.md
  - @osint-wiki/concepts/active-project-research-routing.md
  - @cybersecurity-wiki/concepts/local-abliterated-llm-pentest-stack.md
  - concepts/stage-aware-lora-distribution-calibrated-selection.md
  - entities/voice-models/speech-swift.md
  - sweeps/2026-07-13-daily.md
maturity: archived
created: 2026-07-12
updated: 2026-08-06
---

## Relations

- @osint-wiki/concepts/active-project-research-routing.md — TipDrop/David lane retired; local-abliterated-lab replaces research-queue slot
- @cybersecurity-wiki/concepts/local-abliterated-llm-pentest-stack.md — replacement active research topic

## Raw Concept

**RETIRED 2026-08-05.** David is no longer working on TipDrop. Do **not** mirror image-gen adoption briefs into `tipdrop-workspace-kit/briefs/`. Do **not** run `scripts/route_david_adoption_brief.py` as part of ingest. OSINT `david-persona-image-gen` brief target removed.

Historical rule (2026-07-12 → 2026-08-05): David persona adoption briefs mirrored into the TipDrop shared kit. Local `briefs/` was canonical; kit was the shared handoff copy.

## Narrative

### What to do now

- Image-gen research that is operator-relevant → write local `briefs/` and/or wiki pages only.
- Do **not** push to TipDrop workspace.
- Active research-queue replacement for the old TipDrop/David slot: **local abliterated AI lab** → `@cybersec-wiki` / `Cybersecurity wiki/briefs/`.

### Historical routing (do not use)

1. ~~Write adoption brief locally~~
2. ~~`python3 scripts/route_david_adoption_brief.py`~~
3. ~~Destination: `tipdrop-workspace-kit/briefs/<stem>-david.md`~~

## Snippets

> "TipDrop / David kit briefs retired 2026-08-05 — local abliterated AI lab takes the research-queue slot." [Source: operator pivot 2026-08-05]

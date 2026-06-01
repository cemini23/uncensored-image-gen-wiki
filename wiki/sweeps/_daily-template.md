---
title: Daily research digest sweep template
type: brief
tags: [meta, sweep, template]
maturity: draft
created: 2026-06-01
updated: 2026-06-01
related:
  - meta/daily-research-digest-cadence.md
  - concepts/federated-daily-research-digest.md
---

# Daily Research Digest — YYYY-MM-DD

Discovery-only. Window: 7 days. Exa queries from `scripts/daily_research_config.yaml`. **Does not auto-ingest wiki pages.**

Reference: @meta/daily-research-digest-cadence.md

---

## Active topics (sync from ROADMAP)

- _(from `scripts/daily_research_config.yaml`)_

---

## Inbox (`research to be indexed/`)

_Empty — no manual drops pending._

---

## Exa candidates

### Q1: diffusion-lora-persona (N hits)

| Pick | Date | Title | Cluster | URL |
|------|------|-------|---------|-----|
| [ ] R1 | | | | |

---

## Wiki gap detect

Run: `python3 scripts/wiki_gap_detect.py` when Type-D or Type-E backlog is due.

---

## Social pass (Cursor — manual)

- **opencli-reader**: Reddit ComfyUI / StableDiffusion / LocalLLaMA
- **twitter-reader**: CivitAI / FLUX / Wan / voice-clone releases

---

## Ingest session prompt

```
Ingest selected rows from wiki/sweeps/YYYY-MM-DD-daily.md:
- Run python3 scripts/preingest_check.py on new files/URLs
- Discuss takeaways before writing; touch 3–15 wiki pages; lint; update ROADMAP
```

---

## Summary

| Metric | Count |
|--------|-------|
| Exa hits (deduped) | 0 |
| Inbox files | 0 |

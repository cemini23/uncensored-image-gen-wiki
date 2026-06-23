---
title: Daily research digest cadence (image-gen)
type: concept
tags: [meta, wiki, automation, discovery, k93]
keywords: [daily-research-digest, exa, sweep, discovery, ingest-pipeline, launchagent]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-06-01-inbox-triage.md
  - sweeps/_daily-template.md
  - sweeps/2026-06-01-daily.md
  - sweeps/2026-06-02-daily.md
  - sweeps/2026-06-02-inbox-triage.md
  - sweeps/2026-06-03-daily.md
  - sweeps/2026-06-04-daily.md
  - sweeps/2026-06-04-inbox-triage.md
  - sweeps/2026-06-05-inbox-triage.md
  - sweeps/2026-06-05-daily.md
  - sweeps/2026-06-06-daily.md
  - sweeps/2026-06-07-daily.md
  - sweeps/2026-06-08-daily.md
  - sweeps/2026-06-10-daily.md
  - sweeps/2026-06-09-daily.md
  - sweeps/2026-06-11-daily.md
  - sweeps/2026-06-12-daily.md
  - sweeps/2026-06-15-daily.md
  - sweeps/2026-06-13-daily.md
  - sweeps/2026-06-14-daily.md
  - sweeps/2026-06-16-daily.md
  - sweeps/2026-06-17-daily.md
  - sweeps/2026-06-18-daily.md
  - sweeps/2026-06-19-daily.md
  - sweeps/2026-06-20-daily.md
  - sweeps/2026-06-21-daily.md
  - sweeps/2026-06-22-daily.md
  - sweeps/2026-06-23-daily.md
maturity: core
created: 2026-06-01
updated: 2026-06-23
---

## Relations

@concepts/federated-daily-research-digest.md

## Narrative

| Field | Value |
|-------|-------|
| **Cadence** | Daily @ 08:15 local (LaunchAgent `com.cemini.daily-research-digest.image-gen`) |
| **Script** | `python3 scripts/daily_research_digest_run.py` or `~/bin/cemini-daily-research-digest-image-gen` |
| **Config** | `scripts/daily_research_config.yaml` |
| **Report** | `wiki/sweeps/YYYY-MM-DD-daily.md` |
| **Template** | `wiki/sweeps/_daily-template.md` |
| **Inbox** | `research to be indexed/` (gitignored) |

**Workflow:** overnight Exa + optional arXiv fetch → non-duplicate PDFs land in inbox → morning review sweep → **full ingest** in Cursor when rows are worth keeping.

**Does not:** auto-write wiki entity pages, auto-commit, or bypass `preingest_check.py`.

**Weekly overlay:** `monokern_pipeline` block in config — one deep-research pass on the top `active_topics` row (NotebookLM / yt-dlp / inbox PDFs).

**Federation spec:** @concepts/federated-daily-research-digest.md (K93 install from OSINT).

**Gap detect pairing:** run `python3 scripts/wiki_gap_detect.py` weekly alongside digest review when Type-D `[NEEDS VERIFICATION]` backlog is active (see ROADMAP).

---
title: Open-Generative-AI — Local-First Generative Media Platform
type: entity
tags: [inference-ui, generative-media-platform, local-first, sd-cpp, desktop-app, steal-from]
keywords: [open-generative-ai, sd.cpp, wan2gp, cinema studio, c++ inference engine, generative-media-skills]
related:
  - entities/uis/comfyui.md
  - entities/uis/swarmui.md
  - entities/models/wan-2-2.md
maturity: draft
created: 2026-05-15
updated: 2026-06-05
phase_0_verdict: STEAL-FROM
phase_0_date: 2026-06-05
cross-wiki-source: "@osint-wiki/entities/tools/open-generative-ai.md"
---

## Relations

@osint-wiki/entities/tools/open-generative-ai.md @entities/uis/comfyui.md @entities/uis/swarmui.md

## Raw Concept

Phase-0 audit 2026-06-05 — `Anil-matcha/Open-Generative-AI`. K45 v3 **Steal-from** tier reaffirmed.

## Narrative

Cross-platform desktop app (200+ models, Image/Cinema Studio, sd.cpp + Wan2GP C++ engines). **18.1k★**, pushed 2026-06-03. README claims MIT; GitHub API returned `license: null` — **verify LICENSE file before fork** `[NEEDS VERIFICATION 2026-06-05]`.

### Phase-0 audit

**Verdict: STEAL-FROM** — extract C++ inference parameters + Generative-Media-Skills CLI patterns into ComfyUI/headless workflows. **Do not adopt** full Electron/React client (conflicts with terminal-native + ComfyUI-first stack).

Wan2GP local video memory on 32 GB M-series `[NEEDS VERIFICATION 2026-06-05]`.

## Dead Ends

Full desktop adoption — parallel UI to ComfyUI; maintenance burden without replacing node-graph flexibility.

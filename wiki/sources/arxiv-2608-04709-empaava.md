---
title: "EmpaAva — agentic 3D-avatar empathetic live chatbot (arXiv:2608.04709)"
type: source
tags: [paper, avatar, persona-ops, lipsync, 3d-gaussian, apache-2-0]
keywords: [EmpaAva, Tri-Agent, FLAME, Gaussian-splatting, empathetic-chatbot]
related:
  - entities/persona-ops/empaava.md
  - entities/persona-ops/personalive.md
  - entities/models/avatar-v.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/liveportrait.md
  - concepts/persona-ops-stack.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-08-06-daily.md
maturity: draft
read_status: read
created: 2026-08-06
updated: 2026-08-06
---

## Relations

@entities/persona-ops/empaava.md @entities/persona-ops/personalive.md @entities/models/avatar-v.md @concepts/persona-ops-stack.md @sweeps/2026-08-06-daily.md

## Raw Concept

- **Title**: EmpaAva: An Open-source Agentic 3D-Avatar Empathetic Live Chatbot
- **Authors**: Jie Yang, Wenhao Xu, Shuhui Lin, Hao Fei
- **Type**: arXiv:2608.04709
- **Code**: github.com/1114531938/EmpaAva_System (Apache-2.0 first-party)
- **Project page**: github.com/1114531938/EmpaAva
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.04709-empaava-an-open-source-agentic-3d-avatar-empathe.pdf`
- **URL**: https://arxiv.org/abs/2608.04709
- **Retrieved**: 2026-08-06

## Narrative

Open agentic **3D Gaussian avatar** live chat: Perception / Response / Render Tri-Agent + Response Planning layer (voice, expression, background on one empathetic intent). Emotional TTS + FLAME motion + GS rendering. Paper notes ~45.8s/turn — not true real-time yet.

**Phase-0: CONDITIONAL-GO (code)** — Apache-2.0 system cloned `~/Desktop/projects/EmpaAva_System` (~17 MB code; weights deferred to operator CUDA). Complements PersonaLive (2D/portrait) with embodied 3D path. Audit third-party TTS/avatar licenses before NSFW/monetized use. Phase-1: `deferred` Image-gen local wire; brief local-only.

## Snippets

_(none)_

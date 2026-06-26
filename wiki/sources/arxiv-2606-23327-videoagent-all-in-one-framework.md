---
title: "VideoAgent — agentic all-in-one video understanding and editing (arXiv:2606.23327)"
type: source
tags: [paper, video-editing, agent, orchestration, vlm, snap]
keywords: [VideoAgent, agentic video editing, shot planning, multi-agent orchestration, VideoEdit benchmark, textual-gradient graph, HKUDS]
related:
  - concepts/agentic-video-editing-orchestration.md
  - entities/models/videoagent.md
  - entities/persona-ops/n8n.md
  - concepts/persona-ops-stack.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - sweeps/2026-06-26-daily.md
maturity: draft
read_status: read
created: 2026-06-26
updated: 2026-06-26
---

## Relations

@concepts/agentic-video-editing-orchestration.md @entities/models/videoagent.md @entities/persona-ops/n8n.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: VideoAgent: All-in-One Framework for Video Understanding and Editing
- **Authors**: Hengji Zhou, Lingxuan Huang, et al. (SCUT, HKU, Snap Inc., HIT Shenzhen)
- **Type**: arXiv:2606.23327
- **Location**: `raw-sources/arxiv-2606.23327-videoagent-all-in-one-framework-for-video-unders.pdf`
- **URL**: https://arxiv.org/abs/2606.23327 · https://github.com/HKUDS/VideoAgent
- **Retrieved**: 2026-06-26
- **Read status**: read (abstract + framework overview)

## Narrative

**VideoAgent** — agentic framework for **long-form automated video editing** via natural language.

**Two pillars:**

| Component | Role |
|-----------|------|
| Shot planning + cross-modal retrieval | Coherent multi-shot narratives from long sources |
| Multi-agent orchestration | 30+ specialized editing agents; intent parsing + **textual-gradient graph** assembly |

Introduces **VideoEdit** benchmark. Claims **87–95% orchestration success**, **~60% API cost reduction**, human ratings within **4%** of human-created videos across six categories `[TENTATIVE]`.

Includes montage, music video, cover, rhythm detection, SVC analysis agents (Fig. 1).

### Workspace relevance

Persona Reel/post production orchestration axis — complements **n8n** workflow skeletons and unified editors (TIDE, AnchorEdit). Phase-0: **GO** — `HKUDS/VideoAgent` MIT — `briefs/2026-06-26_phase-0-videoagent-tatoxa.md`.

## Snippets

> "Intent parsing filters relevant tools while textual-gradient graph optimization assembles complex editing pipelines."

## Dead Ends

Snap-affiliated; depends on external API/tool ecosystem — audit tool ToS + NSFW policy before persona deployment.

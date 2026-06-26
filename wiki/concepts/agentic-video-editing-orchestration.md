---
title: Agentic video editing orchestration (VideoAgent)
type: concept
tags: [concept, video-editing, agent, orchestration, workflow]
keywords: [VideoAgent, multi-agent, shot planning, textual-gradient graph, intent parsing, long-form video]
related:
  - sources/arxiv-2606-23327-videoagent-all-in-one-framework.md
  - entities/models/videoagent.md
  - entities/persona-ops/n8n.md
  - concepts/persona-ops-stack.md
  - concepts/seam-stitching-strategies.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-26
updated: 2026-06-26
---

## Relations

@sources/arxiv-2606-23327-videoagent-all-in-one-framework.md @entities/models/videoagent.md @entities/persona-ops/n8n.md

## Raw Concept

Ingest 2026-06-26 from Zhou et al. (arXiv:2606.23327) — LLM-orchestrated video understanding + editing agent graph.

## Narrative

### vs single-model editors (TIDE, Vera, AnchorEdit)

| Pattern | Control surface | Strength |
|---------|-----------------|----------|
| Unified DiT editor | Instruction + masks/refs | Pixel-level VFX quality |
| **Agent orchestrator** | Natural language → tool graph | Long-form narrative + diverse ops |

**VideoAgent stack:**

```
User intent → Intent parsing → Agent graph (textual-gradient opt) → 30+ tool agents → Output video
                ↑
        Shot planning + retrieval (long sources)
```

### Persona ops mapping

Montage Reels, music-sync clips, multi-step post workflows map to **n8n + specialized nodes** pattern — VideoAgent is the research reference for graph-based assembly vs monolithic ComfyUI graphs.

### Build-track note

`HKUDS/VideoAgent` — **MIT**, Phase-0 **GO**. Audit embedded tools (CosyVoice path in repo) for NSFW + API dependencies before production persona use.

## Snippets

> "Multi-agent orchestration framework integrating over thirty specialized editing agents."

## Dead Ends

None until tool audit blocks NSFW persona workflows.

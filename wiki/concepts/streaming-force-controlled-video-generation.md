---
title: Streaming force-controlled video generation (StreamForce)
type: concept
tags: [video-generation, world-model, interactive, force-control, streaming, autoregressive]
keywords: [StreamForce, force conditioning, global force, local force, time-varying control, causal video, interactive world model, Self-Forcing, physics control]
related:
  - sources/arxiv-2606-07508-streamforce-streaming-force-video.md
  - concepts/world-models-video-generation.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/seam-stitching-strategies.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
  - concepts/one-step-autoregressive-video-distillation.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-09150-ultra-flash-streaming-hr-video.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - sources/arxiv-2607-14076-interactive-world-models-game-engines.md
maturity: draft
created: 2026-06-10
updated: 2026-07-16
---

## Relations

@sources/arxiv-2606-07508-streamforce-streaming-force-video.md @concepts/world-models-video-generation.md @concepts/one-step-autoregressive-video-distillation.md @entities/models/wan-2-2.md @concepts/cascaded-streaming-high-resolution-video.md @sources/arxiv-2607-14076-interactive-world-models-game-engines.md

## Raw Concept

Ingest 2026-06-10 from StreamForce paper — force (not trajectory) as the control signal for **streaming interactive** video from a single image.

## Narrative

**Force control** specifies *cause* (push magnitude/direction, wind field) and lets the model infer *effect* (heavy vs light object motion). Contrasts with Kling Motion Brush / track control where the user pre-draws where things go.

### StreamForce stack

| Component | Role |
|-----------|------|
| Unified force tensor | Global (mask=1 everywhere) + local (disk mask) in one representation |
| Bidirectional teacher | Blender synthetic + ControlNet-style force branch |
| Causal student | Self-Forcing DMD distillation; KV-cache streaming |
| Runtime | ~16 FPS, sub-second latency; mid-roll force edits |

### vs persona/video ops today

Not a replacement for Wan I2V persona clips — no identity adapter story, no dialogue. Useful mental model for **interactive world-model UIs** (what-if physics on a still frame) alongside camera-control world models (@concepts/world-models-video-generation.md).

Shares AR distillation lineage with AAD-1 / CausVid (@concepts/one-step-autoregressive-video-distillation.md) but optimizes for **control responsiveness**, not one-step speed alone.

## Snippets

> "Streaming generation, where video unfolds sequentially, allowing users to observe results and adjust forces at any point during generation."

## Dead Ends

Blender-only training — transfer to real human video unverified. Closed/open weight status `[NEEDS VERIFICATION 2026-06-10]`.

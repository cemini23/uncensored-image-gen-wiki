---
title: "Fooocus (GPL-3.0 SD UI — reference-only)"
type: entity
tags: [ui, stable-diffusion, gpl, reference-only]
keywords: [Fooocus, lllyasviel, GPL-3.0, SD UI, Gradio, community reference]
related:
  - entities/uis/comfyui.md
  - entities/uis/forge.md
  - sources/ai-persona-launch-strategy-analysis.md
  - concepts/persona-ops-stack.md
maturity: draft
created: 2026-05-22
updated: 2026-05-22
provenance:
  stub: true
  ingested_from:
    - briefs/2026-05-22_k57-ai-influencer-pipeline-from-osint.md
---

## Relations

@entities/uis/comfyui.md @entities/uis/forge.md @sources/ai-persona-launch-strategy-analysis.md

## Raw Concept

K57 cross-wiki tool eval (`lllyasviel/Fooocus`, GPL-3.0). Listed in @0xKiyoro's AI-influencer playbook as a community SD UI. **Not a deploy candidate** for this workspace — GPL-3.0 requires derivative works to be GPL if distributed; steal UX/workflow patterns only.

## Narrative

Fooocus is a Gradio-based Stable Diffusion UI (same author family as Forge). Useful as a **pattern reference** for simplified operator UX (preset-driven generation, minimal node graph). This workspace standardizes on **ComfyUI** (workflow JSON, uncensored local control) and **Forge** (A1111 performance fork).

Prior ingest already rejected Fooocus/Colab for persona builds → @sources/ai-persona-launch-strategy-analysis.md (cloud Colab violates data-sovereignty posture).

## Dead Ends

- **Deploying Fooocus in a monetized persona pipeline** — GPL-3.0 copyleft conflicts with typical commercial redistribution; use ComfyUI/Forge instead.
- **Fooocus via Google Colab** — rejected in launch-strategy analysis (dataset control, NSFW filters, latency).

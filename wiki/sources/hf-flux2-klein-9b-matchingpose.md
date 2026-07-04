---
title: "Flux.2 Klein 9B MatchingPose — Hugging Face model card"
type: source
tags: [model-card, lora, flux2, klein, pose-transfer, persona-consistency]
keywords: [Flux.2-Klein-9B-MatchingPose, matchingpose9b, mannequin, pose transfer, FLUX.2 Klein, LoRA, serotoninboi]
related:
  - entities/adapters/flux2-klein-matchingpose.md
  - entities/models/flux-2-klein.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - entities/uis/comfyui.md
  - concepts/model-selection-workflow.md
  - sweeps/2026-07-04-daily.md
maturity: draft
read_status: read
created: 2026-07-04
updated: 2026-07-04
---

## Relations

@entities/adapters/flux2-klein-matchingpose.md @entities/models/flux-2-klein.md @concepts/persona-consistency-methods.md @concepts/video-identity-inheritance.md @entities/uis/comfyui.md @concepts/model-selection-workflow.md

## Raw Concept

- **Title**: Flux.2-Klein-9B-MatchingPose
- **Author / publisher**: `serotoninboi` Hugging Face namespace
- **Type**: Hugging Face model card / LoRA adapter
- **Location**: https://huggingface.co/serotoninboi/Flux.2-Klein-9B-MatchingPose
- **Retrieved**: 2026-07-04
- **Read status**: read (model-card snippet via web search; direct raw model card gated/401 in tool context)

## Narrative

**Flux.2 Klein 9B MatchingPose** is a LoRA for FLUX.2 Klein 9B that transfers a clean mannequin pose onto a target character while preserving face, identity, style, clothing, and lighting. It is designed as stage 2 of a two-stage workflow:

1. Convert a human/pose reference into a neutral mannequin using a companion Mannequin LoRA.
2. Feed the mannequin pose plus the character reference through MatchingPose with trigger `matchingpose9b`.

The useful abstraction is **identity-free pose conditioning**. The mannequin strips away source identity, clothing, and face bias, leaving pose/proportions as the control signal. That makes it better aligned with persona workflows than using a detailed real-photo pose reference directly.

Phase-0: **GO (smoke-test)** — Apache-2.0 LoRA, immediate ComfyUI placement path (`ComfyUI/models/loras/`), trigger word documented. Caveat: the LoRA license is permissive, but David must separately satisfy the FLUX.2 Klein base-model terms.

## Snippets

> "A LoRA adapter for FLUX.2 Klein 9B that transfers any mannequin pose reference onto a character subject — producing perfectly pose-matched characters while preserving the subject's identity, face, and style."

> "Trigger Word: matchingpose9b"

> "Place in: ComfyUI/models/loras/"

## Dead Ends

- **Treating MatchingPose as a full identity adapter**: it is pose-transfer glue. Keep PuLID/native multi-reference/face-swap stack for identity lock.
- **Skipping the mannequin stage**: using a detailed human source image reintroduces source clothing/face bias; the point is to isolate pose first.

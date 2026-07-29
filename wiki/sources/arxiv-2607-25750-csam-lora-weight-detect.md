---
title: "Detecting CSAM T2I LoRAs from weights (arXiv:2607.25750)"
type: source
tags: [paper, safety, moderation, lora, defensive, uk-aisi]
keywords: [LoRA-fingerprint, u1-singular-vector, weight-space-moderation, CSAM-detection, AISI]
related:
  - concepts/lora-weight-fingerprint-moderation.md
  - concepts/persona-ops-stack.md
  - entities/marketplaces/civitai.md
  - sweeps/2026-07-29-daily.md
maturity: draft
read_status: read
created: 2026-07-29
updated: 2026-07-29
---

## Relations

@concepts/lora-weight-fingerprint-moderation.md @concepts/persona-ops-stack.md @sweeps/2026-07-29-daily.md

## Raw Concept

- **Title**: Detecting CSAM Text-to-Image LoRAs From Weights
- **Authors**: David Demitri Africa et al. (UK AI Security Institute)
- **Type**: arXiv:2607.25750
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.25750-detecting-csam-text-to-image-loras-from-weights.pdf`
- **URL**: https://arxiv.org/abs/2607.25750
- **Code**: none public at ingest
- **Retrieved**: 2026-07-29

## Narrative

Defensive moderation: top-left singular vector (u1) of LoRA updates as an **inference-free fingerprint** of what the adapter was trained on. Uses human-subject **age as a benign proxy** (not CSAM generation). Signal generalizes across base models; robust to noise/rescale/precision. Motivation: metadata lies; generating suspected CSAM outputs for inspection is unacceptable/illegal.

**Phase-0: REFERENCE / WATCH code** — no install path. Wiki + cybersec brief only (defensive marketplace awareness). Not TipDrop gen stack; not atto/poker/prod. Do not attempt to reverse into generation tooling.

## Snippets

> a safer signal lives in the weights… without relying on metadata or generating harmful outputs.

[Source: arXiv:2607.25750 abstract]

Defensive brief filed at Cybersecurity wiki `briefs/2026-07-29_aisi-lora-weight-fingerprint-from-image-gen.md` (not an `@` wiki-page link).

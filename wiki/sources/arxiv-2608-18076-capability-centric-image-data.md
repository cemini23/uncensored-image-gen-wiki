---
title: "Capability-centric data design for generalist T2I (arXiv:2608.18076)"
type: source
tags: [paper, dataset, curriculum, t2i, alibaba, watch]
keywords: [capability-centric data, curriculum scheduling, text-image grounding, inter-image transformation, image-knowledge association]
related:
  - concepts/capability-centric-image-data.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-19-daily.md
maturity: draft
read_status: read
created: 2026-08-19
updated: 2026-08-19
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/capability-centric-image-data.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-19-daily.md

## Raw Concept

- **Title**: From Corpora to Co-Evolving Capabilities: Capability-Centric Data Design for Generalist Image Generation
- **Authors**: Xingjian Wang, Zhao Wang, Taihang Hu, Jun Zheng, Qing Jin, Qinye Zhou, et al. (Alibaba Group)
- **Type**: arXiv:2608.18076 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18076-from-corpora-to-co-evolving-capabilities-capabil.pdf`
- **URL**: https://arxiv.org/abs/2608.18076
- **Retrieved**: 2026-08-19
- **Code**: PDF links COYO dataset only (`kakaobrain/coyo-dataset`), not the Alibaba engines. No SPDX for their infra.

## Narrative

Alibaba argument: scaling T2I is not only bigger recaptioned piles. Task-specific corpora are usually optimized **in isolation**, so you never schedule supervision in the order capabilities actually depend on. Their infrastructure pairs three interoperable **data engines** (text–image grounding, inter-image transformation, image–knowledge association) with caption experts that align T2I vs editing labels, then a multi-stage **curriculum** over task mix, concept distribution, quality, and resolution.

Useful as a data-ops concept for LoRA/persona corpora (don’t dump every caption style into epoch 1). Not a model to run. **WATCH.** `wire_status: deferred`.

## Snippets

> "We present a capability-driven data infrastructure that couples capability-specific supervision construction with capability-aligned curriculum scheduling. Its three specialized yet interoperable data engines build complementary relational supervision for text-image grounding, inter-image transformation, and image-knowledge association"

[Source: arxiv-2608.18076, abstract]

---
title: "PerFact 3D brain MRI report generation (arXiv:2608.17926) — skip medical"
type: source
tags: [paper, skip, medical, radiology, vlm, mri]
keywords: [PerFact, brain MRI, radiology report generation, Imperial College]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-20-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: PerFact: Perception-Derived Fact Prompting for 3D Brain MRI Report Generation
- **Authors**: Jianyu Sun, Zhenxuan Zhang, Guang Yang, Peter J. Lally (Imperial College London / King's College London)
- **Type**: arXiv:2608.17926 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.17926-perfact-perception-derived-fact-prompting-for-3d.pdf`
- **URL**: https://arxiv.org/abs/2608.17926
- **Retrieved**: 2026-08-20
- **Code**: none at ingest.

## Narrative

**Phase-0: SKIP medical.** PerFact serializes upstream 3D segmentation/classification into a fact sentence and LoRA-prompts a VLM to write brain-MRI radiology reports. The claim is that injected grounding, not backbone scale, is the lever (entity F1 0.644→0.775 vs 0.015 across five backbones). Chest-trained report VLMs fail by writing thoracic prose for a brain study.

This is clinical report generation, not T2I/T2V/TTS persona work. Image-gen `wont_wire`. No sibling ROUTE.

## Snippets

> "On 3D brain MRI, grounding information, not model choice, is the dominant controllable factor in report quality."

[Source: arxiv-2608.17926, abstract]

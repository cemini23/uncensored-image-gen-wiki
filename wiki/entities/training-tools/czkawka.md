---
title: "czkawka — Rust filesystem dedup tool for LoRA training dataset prep [image-gen cross-route]"
type: entity
category: tool
tags: [entity, tool, training-data-prep, lora-dataset-dedup, visual-similarity, dual-license, k44, steal-from-doc-level-pending-phase-0]
keywords: [czkawka, czkawka-core, lora-training, dataset-deduplication, perceptual-hash, visual-similarity, mit-core-gpl-gui]
related:
  - concepts/multi-angle-dataset-prep.md
  - concepts/lora-taxonomy.md
maturity: steal-from-doc-level-pending-phase-0
created: 2026-05-14
updated: 2026-05-15
cross-wiki-source: @osint-wiki/sources/eval-tool-evaluation-cemini-multi-wiki-v3-2026-05-14.md
---

## Relations

- @osint-wiki/sources/eval-tool-evaluation-cemini-multi-wiki-v3-2026-05-14.md — K44 source (doc-level verdict)
- @cybersecurity-wiki/entities/tools/czkawka.md — Cybersec-side primary entity (filesystem analysis use case)
- @concepts/multi-angle-dataset-prep.md — perceptual-hash dedup is a dataset-hygiene step before LoRA training
- @concepts/lora-taxonomy.md — training-pipeline hub; dataset dedup feeds LoRA training quality

## Raw Concept

K44 cross-route from Cybersec to Image-gen: the **visual-similarity image deduplication** functionality from `czkawka_core` (MIT-licensed crate, isolated from GPL-3.0 GUI). Useful for de-duplicating LoRA training datasets prior to model-training cycles. **31,000 stars** in K44 doc-level eval.

## Narrative

LoRA training quality is materially degraded by duplicate or visually-near-identical training samples — they over-weight the duplicated regions of pixel space and bias the resulting LoRA toward those exemplars.

The `czkawka_core` MIT crate provides:
- Perceptual-hash-based visual similarity detection
- Fast Rust implementation suitable for 10k+ image corpora

**Critical license isolation**: extract `czkawka_core` only. The GPL-3.0 Slint-based GUI frontends (Krokiet, Cedinia) must remain unbuilt. Verify with `cargo tree`.

See @cybersecurity-wiki/entities/tools/czkawka.md for the full Phase-0 gate set.

## Snippets

> "We must actively extract the cleanly MIT-licensed czkawka_core library to deduplicate enormous image datasets prior to initiating LoRA model training protocols within the Image-gen wiki."
[Source: @osint-wiki/sources/eval-tool-evaluation-cemini-multi-wiki-v3-2026-05-14.md ¶337]

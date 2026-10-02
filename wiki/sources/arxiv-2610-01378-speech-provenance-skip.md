---
title: "Speech generation provenance auditing (arXiv:2610.01378) — SKIP"
type: source
tags: [paper, provenance, audit, out-of-domain, skip]
keywords: [generation provenance, research object, synthetic speech audit, manifest, care handoff, schema, no-code]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-02-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-02
updated: 2026-10-02
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-02-daily.md

## Raw Concept

- **Title**: Generation Provenance Before Behavior Attribution: Auditing Synthetic Speech Research Objects
- **Type**: arXiv:2610.01378 (Blossom AI / Blossom AI Labs; Sidi Chang, Peiying Zhu)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.01378-generation-provenance-before-behavior-attributio.pdf (archived 2026-10-02)
- **URL**: https://arxiv.org/abs/2610.01378
- **Retrieved**: 2026-10-02

## Narrative

**What it is.** A "generation-provenance substrate" — a research-object schema that binds source spec, generated content, waveform, target, fact requirements, quality signals, review lineage and an immutable manifest identity. The thesis is that provenance (what produced an item) is a prerequisite for behaviour attribution (what an item caused). It audits a private Japanese care-handoff synthetic-speech pipeline.

**What it is not.** No model, no training, no algorithm, no detection, no watermarking. It defines an object Oi = (I, S, R, A, Y, F, M, Q, H, P), five invariants and a five-pass audit protocol.

**Audit results.** 113 assets, 1.552 hours (5,586.88 s), 24 kHz mono, six scenario families. Two manifests: 221 clips plus 32 seeds, then 313 clips plus 58 seeds, with zero cross-partition seed overlap. Two adaptation runs consume the same 182 rows and emit exactly 39 held-out IDs. Exact upstream attribution is **blocked** by floating generator aliases, missing per-clip TTS stamps and an unversioned checking prompt. No causal effect is computed.

**Phase-0 (2026-10-02).** No code, no public licence; the reproducibility package is available on request and the corpus is under controlled access. No TTS or adaptation model is even named.

**Why SKIP.** It would not let an operator verify, detect or label their own outputs — the usual reason a wiki tracks provenance work. Its only operator-facing content is a generic logging checklist (pin generator and version, prompt, seed, code, manifest hash), which is standard MLOps hygiene rather than a tool. The one plausible sibling home is cybersec, but the paper lacks the detection angle that wiki's deepfake surface would want, so no route is opened. Page kept as the triage record.

## Snippets

[Source: https://arxiv.org/abs/2610.01378 (retrieved 2026-10-02)]

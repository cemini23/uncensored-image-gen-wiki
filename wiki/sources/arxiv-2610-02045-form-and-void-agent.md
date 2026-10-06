---
title: "Form and Void Agent — entangled positive/negative-space composition (arXiv:2610.02045)"
type: source
tags: [paper, text-to-image, agent, composition, cross-wiki-in, watch]
keywords: [FaV-A, Form and Void, negative space, figure-ground, composition agent, staged pipeline, MLLM, Gemini, Gestalt]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/staged-composition-agent.md
  - sources/arxiv-2610-06844-contextual-reader-dit.md
  - sweeps/2026-10-03-daily.md
  - concepts/mllm-mid-generation-video-correction.md
maturity: draft
read_status: skimmed
created: 2026-10-07
updated: 2026-10-07
phase0_verdict: WATCH
wire_status: deferred
cross-wiki-source: "@cybersecurity-wiki/sources/arxiv-2610-02045-form-and-void-agent-ood.md"
---

## Relations

@concepts/federated-daily-research-digest.md @concepts/staged-composition-agent.md @sources/arxiv-2610-06844-contextual-reader-dit.md @sweeps/2026-10-03-daily.md @cybersecurity-wiki/sources/arxiv-2610-02045-form-and-void-agent-ood.md @concepts/mllm-mid-generation-video-correction.md

## Raw Concept

- **Title**: Form and Void: Entangled Composition through an Autonomous AI Agent
- **Type**: arXiv:2610.02045
- **Source**: incoming cross-wiki brief from cybersec (`briefs/2026-10-03_k394-ood-routing-image-gen.md`); classified there as not security-relevant
- **URL**: https://arxiv.org/abs/2610.02045
- **Retrieved**: 2026-10-07
- **Note**: the PDF was never fetched to this inbox — this page is written from the routing brief, which carried the numbers.

## Narrative

**What it does.** FaV-A (Form and Void Agent) generates **positive-negative space** artwork — a figure whose negative space forms a second figure — from an abstract topic. It is **mask-free**: no masks, edges, bounding boxes or layout templates.

**The transferable technique — a three-stage pipeline, not one prompt.**

1. **Plan** — an abstract topic plus design priors (figure-ground structure, negative space, compositional balance) becomes a base-object prompt and a composition blueprint.
2. **Parse / anchor** — generate the base image, then have the MLLM analyse its *shape and spatial structure* to propose candidate negative-space semantics, anchored by N=3 visual-textual exemplars. The output is a natural-language **anchor** describing contour relationships and constraints — explicitly *not* a mask.
3. **Synthesise** — generate the final image conditioned on the base image plus the anchor, and emit a text description of the figure-ground relationship.

**The pattern worth stealing.** Each stage consumes the previous stage's **artifact**, not just its text. That is what lets a composition constraint survive across a boundary a single pass cannot hold. See `@concepts/staged-composition-agent.md`.

**Numbers.** User study N=50 on a 5-point Likert scale. Full-pipeline topic adherence **4.65 ± 0.35** against 3.45–4.15 for the ablations, with the largest gaps on Gestalt quality (**4.58 ± 0.40** against 1.60–2.15). Removing multi-modal generation hurts most overall; removing the topic-analysis stage hurts topic adherence most.

**Phase-0 (2026-10-07).** **No benchmark and no automatic metric** — no FID, no CLIP; the baseline comparison is qualitative. Models used are **closed APIs** (`gemini-3.1-flash` for understanding, `gemini-3.1-flash-image` for generation), so nothing runs locally and there is no licence or code to audit. **Verdict: WATCH** — the *staging pattern* is the asset, not the implementation. Being API-bound and metric-free, it is a technique to reimplement rather than a tool to adopt.

## Snippets

[Source: cross-wiki brief `2026-10-03_k394-ood-routing-image-gen.md` — Gestalt quality 4.58 ± 0.40 vs 1.60–2.15 for ablations.]

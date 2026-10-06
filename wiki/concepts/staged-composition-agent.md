---
title: Staged composition agent (artifact-chaining for entangled constraints)
type: concept
tags: [text-to-image, composition, agent, technique]
keywords: [staged pipeline, artifact chaining, composition agent, negative space, figure-ground, anchor, MLLM planning, entangled constraints, mask-free]
related:
  - sources/arxiv-2610-02045-form-and-void-agent.md
  - concepts/mllm-mid-generation-video-correction.md
  - concepts/agentic-video-editing-orchestration.md
  - sweeps/2026-10-03-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
created: 2026-10-07
updated: 2026-10-07
---

## Relations

@sources/arxiv-2610-02045-form-and-void-agent.md @concepts/mllm-mid-generation-video-correction.md @concepts/agentic-video-editing-orchestration.md @sweeps/2026-10-03-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

The question this page answers: when two concepts must share a boundary — a figure and the figure hidden in its negative space — a single prompt cannot hold both. What structure does? Synthesized from arXiv:2610.02045 (Form and Void Agent).

## Narrative

**The failure mode.** Some composition targets are **entangled**: the shape of one element is defined by the other. Positive-negative-space artwork is the clearest case, but the same structure appears in reflections, occlusion relationships, and interlocking logos. A single text prompt describing both halves tends to produce one strong subject and a decorative afterthought, because the sampler has no mechanism to enforce the boundary relationship. Masks and ControlNets solve it by adding supervision the operator must author by hand.

**The technique.** Split the work into stages, and make each stage consume the previous stage's **artifact** rather than a restatement of it.

| Stage | Input | Output | Why it is separate |
|---|---|---|---|
| Plan | abstract topic + design priors | base-object prompt + composition blueprint | decouples *what* from *how arranged* |
| Parse / anchor | the generated base image | a natural-language **anchor** describing contour relationships | reads the actual pixels, not the intent |
| Synthesise | base image + anchor | final image + text description of the relationship | conditions on a concrete artifact |

**Why the artifact matters, not the text.** If stage 2 returns text restating the plan, nothing is gained — the model is still guessing at geometry. Reading the *rendered* base image is what lets the anchor describe contour constraints that actually hold. The anchor is deliberately a natural-language description rather than a mask: it keeps the pipeline mask-free, so the second figure can be semantically rich rather than a filled region.

**Reported effect.** With all three stages, topic adherence reaches **4.65 ± 0.35**; ablations land at 3.45–4.15. The largest margins are on Gestalt quality (4.58 ± 0.40 against 1.60–2.15), which is the measure of whether the two figures actually read as entangling. Dropping the multi-modal stage hurts most overall; dropping topic analysis hurts adherence most. So both the *planning* and the *reading* stages carry weight.

**Where it sits in this wiki.** This is a sibling of two existing MLLM-in-the-loop patterns: `@concepts/mllm-mid-generation-video-correction.md` puts an MLLM *inside* the sampler to correct mid-generation, and `@concepts/agentic-video-editing-orchestration.md` orchestrates edit operations across a clip. The staged composition agent differs in shape: it is **sequential, artifact-chained, and pre/post rather than mid-generation** — each stage completes before the next begins, and the handoff is a rendered image.

**Operator caveats.** The reference implementation is **closed-API Gemini** and reports **no automatic metric** — no FID, no CLIP, only a 50-person Likert study. So the evidence for the pattern is human-judgement only, and adopting it locally means reimplementing the three stages against a local MLLM plus a local T2I backbone. Expect the anchor quality to depend heavily on the local MLLM's spatial reasoning. The pattern is also untested on the persona workflow, where the constraint is usually identity consistency rather than figure-ground entanglement.

## Snippets

[Source: cross-wiki brief `2026-10-03_k394-ood-routing-image-gen.md` — "Each stage consumes the previous stage's artifact, not just its text."]

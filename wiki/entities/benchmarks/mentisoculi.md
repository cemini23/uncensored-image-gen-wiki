---
related:
  - sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md
  - concepts/machine-mental-imagery.md
  - concepts/holistic-visual-tokenizer-umm.md
  - concepts/understanding-generation-gap.md
  - sources/unireasoner.md
  - entities/models/bagel.md
  - entities/models/hydra-x.md
  - entities/models/janus-pro.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - sweeps/2026-06-13-daily.md
  - entities/benchmarks/geot2v-bench.md
title: MentisOculi — procedural visual mental-imagery benchmark
type: entity
tags: [entity, benchmark, visual-reasoning, umm, evaluation, k114]
keywords: [mentisoculi, form board, hinge folding, paper fold, rush hour, sliding puzzle, procedural benchmark, stratified difficulty]
maturity: draft
created: 2026-06-13
updated: 2026-06-24
---

## Relations

- @sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md — paper + methodology
- @concepts/machine-mental-imagery.md — conceptual synthesis
- @concepts/understanding-generation-gap.md — UMM gap diagnosis context

## Raw Concept

Entity for **MentisOculi** benchmark (arXiv:2602.02465) — procedural suite testing multi-step **reasoning with mental imagery** across five geometric/planning tasks. Latin *mentis oculi* = "eyes of the mind."

## Narrative

| Attribute | Value |
|-----------|-------|
| **Tasks** | Form Board, Hinge Folding, Paper Fold, Rush Hour, Sliding Puzzle |
| **Levels** | 1–5 (minimum steps 1→5); 30 samples/level/task in v1 |
| **Generation** | Procedural with ground-truth visual CoT; extensible difficulty |
| **Scoring** | Exact match (Form Board, Paper Fold); simulated action sequences (Hinge, Sliding, Rush Hour); video auto-rater for pixel rollouts |
| **Evaluated families** | MLLMs, latent-visual (Mirage/LS), UMMs (Gemini-I, Emu 3.5), video (Veo 3.1, Wan 2.6) |

### Task summary

| Task | Core capability |
|------|-----------------|
| Form Board | Subset selection covering target silhouette without overlap |
| Hinge Folding | Predict discrete rotation steps for chained polygons |
| Paper Fold | Unfold hole-punch pattern after fold sequence |
| Rush Hour | Navigate red car out; continuous positions, discrete moves |
| Sliding Puzzle | Restore permuted natural image via empty-tile moves |

### Benchmark role in wiki

Use MentisOculi as the **reference eval** when assessing claims that UMMs (HYDRA-X, BAGEL, Janus-Pro) perform native visual chain-of-thought. As of 2026-06-13, SotA models fail Level 5 across tasks; UMM interleaved images do not beat MLLM text-only on Rush Hour `[CONFIRMED]` per @sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md.

**Not in scope:** persona identity consistency, T2I aesthetic quality, uncensored generation — orthogonal to MentisOculi task design.

## Snippets

> "MentisOculi consists of five multi-step visual reasoning tasks designed to be best-solved with mental imagery."
> — [Source: arXiv:2602.02465 §2, retrieved 2026-06-13]

## Dead Ends

- **Adopting MentisOculi as ComfyUI regression test** — task domain (spatial puzzles) unrelated to diffusion workflow QA.

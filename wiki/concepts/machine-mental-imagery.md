---
title: Machine mental imagery — visual reasoning spectrum and limits
type: concept
tags: [concept, visual-reasoning, umm, mllm, mental-imagery, k114]
keywords: [machine mental imagery, visual chain-of-thought, interleaved generation, latent visual tokens, interpretation error, generation error, mentisoculi]
related:
  - sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md
  - entities/benchmarks/mentisoculi.md
  - concepts/holistic-visual-tokenizer-umm.md
  - concepts/understanding-generation-gap.md
  - sources/unireasoner.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - entities/models/bagel.md
  - entities/models/janus-pro.md
  - entities/models/hydra-x.md
maturity: draft
created: 2026-06-13
updated: 2026-06-13
---

## Relations

- @sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md — primary evidence (K114)
- @entities/benchmarks/mentisoculi.md — procedural benchmark entity
- @concepts/holistic-visual-tokenizer-umm.md — tokenizer-side UMM bet vs MentisOculi negative results
- @concepts/understanding-generation-gap.md — verify-vs-generate mismatch in unified models
- @sources/unireasoner.md — external critic / DED pipeline when internal visual CoT fails

## Raw Concept

K114 ingest (2026-06-13): synthesis from MentisOculi (arXiv:2602.02465) — whether frontier models can **form, maintain, and manipulate visual representations** for multi-step reasoning, and why current approaches fail.

## Narrative

Human problem-solving often uses **mental imagery** — quasi-sensory internal visuals manipulated without external stimuli. ML analogues span a spectrum of explicitness:

| Paradigm | Mechanism | Examples |
|----------|-----------|----------|
| **Implicit** | Internal representations only; text output | MLLMs (Gemini 3, GPT-5.1, Qwen3-VL) |
| **Latent visual tokens** | Interleaved hidden visual latents in CoT | Mirage, LatentSketchpad on Qwen2.5-VL |
| **Explicit interleaved images** | UMM generates images mid-reasoning | Gemini 3-I, Emu 3.5, HYDRA-X class |
| **Natively visual rollouts** | Pixel/video trajectories | Veo 3.1, Wan 2.6 |

Prior benchmarks mostly test **reasoning about** visuals (VQA-style), not **reasoning with** self-maintained visual state. MentisOculi enforces desiderata: visual nature, high information density (non-grid), sequential manipulation, procedural generation, stratified difficulty, 2D-feasible visuals.

### Current state (MentisOculi results) [CONFIRMED]

**Takeaway 1 — Benchmark unsaturated:** Level 5 performance at or below chance for all SotA models; early termination / under-used action budget drives sub-chance scores.

**Takeaway 2 — Visual thoughts ineffective:** Self-generated imagery (latent, interleaved, video) does **not** reliably improve over text-only MLLMs on multi-step tasks.

**Takeaway 3 — Dual UMM failure:**

| Failure | Description |
|---------|-------------|
| **Generation error** | Compounding visual mistakes across steps |
| **Interpretation error** | Model fails to use even **oracle** correct visuals for planning on Hinge Folding / Paper Fold |

**Text–image decoupling:** On Rush Hour, text and image channels solve ~50% disjoint puzzle sets at Level 1; inversion at Level 2+ — text carries planning image channel misses. Stronger MLLM (Gemini 3) does **not** reduce decoupling vs Gemini 2.5-I.

**Planning competence in text:** Full symbolic Rush Hour transcription → Gemini 3 / GPT-5.1 near-human — bottleneck is **visual state manipulation**, not abstract planning.

### Implications for unified multimodal research

| Claim | MentisOculi verdict |
|-------|---------------------|
| "UMM native gen closes understanding gap" | `[TENTATIVE]` weakened — gen + text competence coexist without integration |
| "Holistic tokenizer enables visual CoT" | Open — HYDRA-X untested on MentisOculi `[NEEDS VERIFICATION 2026-06-13]` |
| "External critic (UniReasoner DED) still needed" | Consistent with interpretation-error ceiling |

**Production persona ops:** Wan 2.2 + ComfyUI + LoRA remains the practical path; MentisOculi informs **research UMM eval**, not near-term workflow replacement.

## Snippets

> "We find that explicit visual thoughts are currently ineffective; no visual intervention reliably outperforms text-only baselines."
> — [Source: arXiv:2602.02465 §4, retrieved 2026-06-13]

## Dead Ends

- **ASCII-art visual proxies in MLLMs** — insufficient for MentisOculi task fidelity; not a deployment path for spatial reasoning.
- **Single-step visual fill-in benchmarks (STARE-class)** — low information density; overstate visual reasoning progress.

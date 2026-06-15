---
title: MentisOculi — limits of reasoning with mental imagery (arXiv 2602.02465)
type: source
tags: [source, arxiv, visual-reasoning, benchmark, umm, mllm, k114]
keywords: [2602.02465, mentisoculi, machine mental imagery, visual chain-of-thought, unified multimodal model, procedural benchmark]
related:
  - concepts/machine-mental-imagery.md
  - entities/benchmarks/mentisoculi.md
  - concepts/holistic-visual-tokenizer-umm.md
  - concepts/understanding-generation-gap.md
  - sources/unireasoner.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - entities/models/hydra-x.md
  - entities/models/bagel.md
  - entities/models/janus-pro.md
  - sweeps/2026-06-13-daily.md
maturity: draft
read_status: read
created: 2026-06-13
updated: 2026-06-15
---

## Relations

- @concepts/machine-mental-imagery.md — synthesis of visual-reasoning spectrum + failure modes
- @entities/benchmarks/mentisoculi.md — benchmark entity (five tasks, five difficulty levels)
- @concepts/holistic-visual-tokenizer-umm.md — UMM interleaved-gen hypothesis vs MentisOculi evidence
- @concepts/understanding-generation-gap.md — UMMs can generate but not leverage visuals for reasoning
- @sources/unireasoner.md — Draft-Evaluate-Diffuse as post-hoc correction alternative

## Raw Concept

| Field | Value |
|-------|-------|
| Title | MentisOculi: Revealing the Limits of Reasoning with Mental Imagery |
| Authors | Jana Zeller, Thaddäus Wiedemer, Fanfei Li, Thomas Klein, Prasanna Mayilvahanan, Matthias Bethge, Felix Wichmann, Ryan Cotterell, Wieland Brendel |
| arXiv | 2602.02465 |
| Location | `research to be indexed/arxiv-2602.02465-mentisoculi-revealing-the-limits-of-reasoning-wi.pdf` |
| Retrieved | 2026-06-13 |
| Read status | **read** (abstract + benchmark design + main results) |

## Narrative

Frontier models are shifting from **passive-vision MLLMs** to **unified multimodal models (UMMs)** that natively interleave text and image generation. A central hypothesis: models can use **intermediate visualizations as reasoning aids** — machine analogues of human mental imagery (form, maintain, manipulate visual state).

**MentisOculi** ("eyes of the mind") is a **procedural, stratified benchmark** of five multi-step visual reasoning tasks with ground-truth visual chain-of-thought — designed so tasks are hard to textualize yet intuitive for humans to solve visually.

### Five tasks (Levels 1–5 each, 30 samples/level)

| Task | Skill tested |
|------|--------------|
| **Form Board** | Shape comparison, spatial constraints, translation-invariant geometry |
| **Hinge Folding** | Mental rotation, chained polygon dependencies |
| **Paper Fold** | Reflection symmetry, hole-punch unfold prediction |
| **Rush Hour** | Multi-step planning under continuous (non-grid) geometry |
| **Sliding Puzzle** | Multi-step planning + visual coherence on natural images |

Difficulty scales by minimum steps required (1→5). Level 5 exceeds current frontier models.

### Model families evaluated

| Family | Examples | Visual strategy |
|--------|----------|-----------------|
| MLLMs | Gemini 3, GPT-5.1, Qwen3-VL | Text-only / ASCII proxies |
| Latent reasoning | Qwen2.5-VL + Mirage / LatentSketchpad on Rush Hour | Interleaved visual latents |
| UMMs | Gemini 3-I, Gemini 2.5-I, Emu 3.5 | Interleaved generated images |
| Video | Veo 3.1, Wan 2.6 | Pixel-space rollouts |

### Headline findings [CONFIRMED]

1. **Explicit visual thoughts do not help** — no visual intervention reliably beats text-only baselines on multi-step tasks.
2. **UMMs often underperform MLLMs** — Gemini 3-I / 2.5-I lag their text-only counterparts on most tasks.
3. **Dual failure mode on UMMs:** (a) **generation errors** — compounding mistakes over steps; (b) **interpretation errors** — even **oracle** ground-truth visuals fail to lift performance on Hinge Folding / Paper Fold to MLLM levels.
4. **Text–image decoupling** — on Rush Hour, image and text channels solve largely **different** puzzle subsets; stronger MLLM backbone does not reduce coupling failure.
5. **Competence exists in text** — lossless Rush Hour transcription lets Gemini 3 / GPT-5.1 match human performance; bottleneck is visual manipulation, not planning logic.
6. **ICL, prompt optimization, reasoning budget, tool use** — no consistent gains on visual Rush Hour at higher levels.

Latent Mirage tokens show limited Level 2–3 gains on Rush Hour but collapse to chance at Level 5.

**Persona / image-gen relevance:** UMM hype (HYDRA-X, BAGEL, Janus) assumes shared tokenizers close the understanding–generation gap via native visual reasoning. MentisOculi suggests **generation capability ≠ visual reasoning integration** — UniReasoner-style post-hoc Draft-Evaluate-Diffuse may remain necessary `[TENTATIVE]`. Does not invalidate Wan/ComfyUI production path; benchmarks research UMM architectures.

## Snippets

> "Despite their inherent appeal, visual thoughts do not yet benefit model reasoning."
> — [Source: arXiv:2602.02465 abstract, retrieved 2026-06-13]

> "UMMs often possess the textual reasoning capacity to solve a task and can sometimes generate correct visuals, they suffer from compounding generation errors and fail to leverage even ground-truth visualizations."
> — [Source: arXiv:2602.02465 abstract, retrieved 2026-06-13]

## Dead Ends

- **Using MentisOculi scores for T2I persona quality** — tasks probe spatial reasoning, not aesthetic/identity consistency.
- **Assuming UMM interleaved images replace ComfyUI verification loops** — interpretation errors persist with oracle visuals.

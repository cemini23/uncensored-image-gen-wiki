---
title: Draft-Evaluate-Diffuse pipeline (UniReasoner)
type: concept
tags: [llm, diffusion, vision-tokens, self-critique, conditioning, t2i]
keywords: [Draft-Evaluate-Diffuse, vision tokens, SigLIP 2, VQ tokenization, grounded evaluation, self-critique, joint conditioning, MM-DiT]
related:
  - sources/unireasoner.md
  - concepts/understanding-generation-gap.md
  - concepts/llm-as-image-conditioning.md
  - entities/models/sana.md
  - concepts/holistic-visual-tokenizer-umm.md
maturity: draft
created: 2026-05-06
updated: 2026-06-12
---

## Relations

@sources/unireasoner.md
@concepts/understanding-generation-gap.md
@concepts/llm-as-image-conditioning.md
@entities/models/sana.md
@entities/models/bagel.md

## Raw Concept

UniReasoner's three-stage pipeline that converts an LLM's verification competence into corrective signal for diffusion synthesis. Introduced in @sources/unireasoner.md (Ren et al., arXiv:2605.04040, 2026). Direct response to the @concepts/understanding-generation-gap.md.

## Narrative

### The three stages

```
prompt p ──► [Draft] ──► visual draft d (discrete tokens)
              │
              └─► [Evaluate] ──► grounded eval e (text describing what's wrong)
                      │
                      └─► [Diffuse] ──► image I conditioned on (p, d, e)
```

Same LLM `\phi` performs Draft and Evaluate. Diffusion model `\theta` performs the final synthesis.

#### 1. Draft — autoregressive vision-token sampling

- Vision tokens are **discretized SigLIP 2 features** (not VQGAN-style pixel-reconstruction tokens). The codebook size is K; each codebook index becomes a special token `<v_k>` added to the LLM's vocabulary.
- LLM samples a contiguous `<DRAFT> <v_q1> ... <v_qN> </DRAFT>` block via standard cross-entropy over the expanded vocabulary.
- Output is a *coarse spatial-semantic plan*, not a final image. The draft can be decoded back to pixels for inspection but is consumed by downstream stages as tokens.

[CONFIRMED] (Section 3.1, Eq. 3.2–3.4)

#### 2. Evaluate — same-LLM self-critique

- Inputs: original prompt `p`, discrete draft `d`, instruction to identify semantic inconsistencies.
- Output: short text `e` that pinpoints specific failures — missing objects, count errors, swapped attributes, wrong spatial relations, physical implausibility.
- Crucially `e` is **diagnostic, not descriptive**. It says "what to fix in `d` to satisfy `p`", not "what `d` depicts". This distinction matters: a descriptive caption would lock in errors; a diagnostic eval directs the corrector to fix them.

[CONFIRMED] (Section 3.2)

#### 3. Diffuse — joint conditioning on (p, d, e)

- All three signals are concatenated and encoded by the LLM into a unified feature sequence.
- The diffusion model attends to that sequence via either MM-DiT cross-conditioning (SD3-style) or cross-attention (SANA-style). No architectural change to the underlying diffusion backbone.
- Backbone in the paper: **SANA** (@entities/models/sana.md), but the authors describe the approach as backbone-agnostic.

[CONFIRMED] (Section 3.3, Eqs. 3.7–3.8)

### Design choices that mattered (and why)

[CONFIRMED] (ablation tables 4–5 in @sources/unireasoner.md)

| Choice | Alternative tested | Outcome |
|--------|--------------------|---------|
| SigLIP 2 features quantized via VQ | continuous VAE latents | VAE drops GenEval to 0.72 (worse than text-only). Continuous features resist autoregressive sampling. |
| SigLIP 2 features quantized via VQ | VQGAN-style pixel-recon VQ | VQGAN reaches 0.84; SigLIP reaches 0.88. Semantic primitives are more "readable" by the same LLM doing self-critique. |
| Same LLM does Draft + Evaluate | separate models | Not directly ablated, but argued: same model means same internal world knowledge, no cross-model translation cost. |
| Single-pass joint conditioning | iterative regenerate-and-critique (Reflect-DiT, UniGen BoN) | Single-pass means inference-time cost ≈ standard T2I + LLM forward; iterative methods scale linearly with N. |
| Diagnostic `e` (what's wrong) | descriptive `e` (what's there) | Implicit in design — a descriptive caption would replicate the prompt-as-conditioning problem and freeze in errors. Authors don't run a head-to-head ablation. |

### What the pipeline costs

[NEEDS VERIFICATION 2026-05-06] (paper does not explicitly publish wallclock or tokens/sec numbers; below is inferred)

- One LLM forward to draft (≈ N vision tokens, where N is the SigLIP grid size — likely 256–1024)
- One LLM forward to evaluate (short text output, plus the prompt + draft prefix)
- One diffusion run (same as a standard T2I call)
- Total: ~2 LLM forwards + 1 diffusion run, vs. 0 or 1 LLM forward + 1 diffusion run for text-only or LLM-text-encoder pipelines.

For consumer-hardware local workflows the LLM forwards dominate (Qwen3-7B+ scale). The pipeline is realistic only with quantized LLMs running alongside the diffusion stack.

### What this means for local workflows

[TENTATIVE]

- **Not yet implementable in stock ComfyUI/Forge/A1111**: requires a custom-trained LLM with the SigLIP-VQ vocabulary extension and a diffusion backbone fine-tuned to consume `(p, d, e)` joint conditioning. Both are training-time changes.
- **Closest existing analogues** in current local workflows:
  - "Detail prompt then refine" two-pass workflows (use one model for layout, second for refinement) — coarsely matches Draft → Diffuse, lacks the Evaluate step
  - VLM-in-the-loop ComfyUI nodes (e.g. JoyTag, image-to-prompt feedback loops) — match the Evaluate step but feed it back into a *new* generation rather than into the same diffusion pass
  - Regional prompter / Layered Diffusion node packs — provide spatial planning, not draft tokens
- The paper's strongest implication for local users: **use a VLM critique pass to identify the failure mode of any generation that misses the prompt**, then choose a remediation that addresses that specific mode. Don't keep rerolling.

### Limitations the paper acknowledges (and ones it doesn't)

Acknowledged: rests on the LLM's verification ability, which has its own ceilings; SigLIP-VQ codebook design is fixed.

Not addressed:
- Decoding of draft tokens to pixels for human inspection — handled, but draft pixel-quality is much lower than final and not benchmarked.
- Style / aesthetics-only prompts (no compositional constraint): the framework adds overhead without benefit, since there's nothing for `e` to flag.
- NSFW / content-policy-misaligned prompts: paper trains on standard public datasets; behavior on adversarial prompts is unknown.

## Snippets

> "We propose UniReasoner to alleviate the observed understanding-generation gap via a three-stage Draft-Evaluate-Diffuse reasoning pipeline: $d \sim \text{Draft}_\phi(p), \, e = \text{Eval}_\phi(p, d), \, I \sim \text{Diffuse}_\theta(p, d, e)$, where d is a visual draft represented as discrete vision tokens (serving as a coarse visual plan), e is a grounded evaluation describing discrepancies between the prompt p and the draft d, and Diffuse_θ is a diffusion model conditioned on the joint tuple."
> [Source: arXiv:2605.04040v1 p.4]

> "Conditioning a generator solely on the pair (p, d) would inadvertently encourage the model to preserve errors present in the draft. By contrast, the grounded evaluation e instructs the generator on exactly where and how the draft deviates from the prompt."
> [Source: arXiv:2605.04040v1 p.5]

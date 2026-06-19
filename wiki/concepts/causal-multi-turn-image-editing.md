---
title: Causal multi-turn image editing
type: concept
tags: [concept, image-editing, multi-turn, autoregressive, consistency, video-prior]
keywords: [multi-turn editing, AnchorEdit, causal attention, self-rollout, identity anchoring, exposure bias, iterative img2img, ChronoEdit]
related:
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - entities/models/anchoredit.md
  - entities/adapters/flux-kontext.md
  - entities/models/wan-2-2.md
  - concepts/persona-consistency-methods.md
  - concepts/two-pass-generation-workflow.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-19103-productconsistency-product-identity-editing.md
  - concepts/product-identity-instruction-editing.md
maturity: draft
created: 2026-06-15
updated: 2026-06-19
---

## Relations

@sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md @entities/models/anchoredit.md @entities/adapters/flux-kontext.md @entities/models/wan-2-2.md

## Raw Concept

Ingest 2026-06-15 from AnchorEdit (arXiv:2606.11751) — why bidirectional video priors fail for interactive edit chains and what causal AR + memory fixes.

## Narrative

**Workflow shape:** User iterates NL edits on one subject image (change outfit → fix hands → adjust lighting). Each turn conditions on **past edits only**, not future instructions.

### Failure modes in bidirectional video-edit transfer

| Issue | Cause |
|-------|-------|
| Instruction leakage | Future turn text visible in full-context attention |
| Identity drift | Errors compound across turns |
| Fixed horizon | Cannot extrapolate beyond trained context length |

### Causal AR recipe (AnchorEdit pattern)

1. **Video backbone as edit engine** — each turn = state transition in latent sequence
2. **Expanded RoPE stride** — discrete edits ≠ smooth motion prior
3. **Self-rollout training** — history includes model's own predictions (exposure-bias fix)
4. **Inference memory** — sink anchor frame + sliding KV + bounded RoPE indices

### vs single-turn tools in workspace

@entities/adapters/flux-kontext.md excels at **one-shot** prompt edits (hair, props, background). Multi-turn causal editing is the missing layer for **long img2img persona refinement sessions** without re-running PuLID each turn.

**VRAM reality:** Wan-14B-class finetunes need datacenter GPUs — concept is build-track **watch**, not deploy today.

## Snippets

> "Minor artifacts or identity deviations can be recursively amplified."

## Dead Ends

Training-free DDIM inversion multi-turn methods (prior literature) generalize poorly vs finetuned causal editors. No FLUX-native AnchorEdit port announced.

---
title: "VoidPadding — [VOID] vs EOS in masked diffusion LMs (arXiv:2606.17999)"
type: source
tags: [paper, mdlm, masked-diffusion, language-model, training, inference, dream, llada]
keywords: [VoidPadding, VOID token, MDLM, Dream-7B, LLaDA, EOS overflow, RainbowPadding, canvas expansion, block decoding]
related:
  - concepts/mdlm-padding-termination-decoupling.md
  - sweeps/2026-06-21-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-06-21
updated: 2026-06-21
---

## Relations

@concepts/mdlm-padding-termination-decoupling.md

## Raw Concept

- **Title**: VoidPadding: Let [VOID] Handle Padding in Masked Diffusion Language Models so that `[EOS]` Can Focus on Semantic Termination
- **Authors**: Chunyu Liu, Zhengyang Fan, Kaisen Yang, Alex Lamb
- **Type**: arXiv:2606.17999
- **Location**: `raw-sources/arxiv-2606.17999-2606-17999v1-voidpadding-let-void-handle-padding.pdf`
- **URL**: https://arxiv.org/abs/2606.17999 · https://github.com/Haru-LCY/VoidPadding
- **Retrieved**: 2026-06-21
- **Read status**: read (abstract + method)

## Narrative

**VoidPadding** fixes instruction-tuning pathology in **masked diffusion language models (MDLMs)** where `[EOS]` serves **both** semantic termination and AR-style padding — causing **EOS overflow** under large-block decoding.

**Fix:** Introduce dedicated **`[VOID]`** padding token; reserve `[EOS]` for true semantic ends. At inference: EOS enables early stop; VOID signal guides **adaptive canvas expansion**.

**Eval [TENTATIVE]:** Dream-7B-Instruct — +17.84 pts vs baseline and +6.95 vs RainbowPadding on four-task math/code mean (block-size averaged); −55.7% decoding NFE on average. Also LLaDA-8B experiments in appendix.

### Workspace relevance

- **Peripheral** to image/video gen core — text MDLM training technique
- Relevant if operator runs **Dream / LLaDA** class MDLMs for captioning, prompt expansion, or persona dialogue backends
- MIT code + HF Dream-Void adapter weights `[TENTATIVE]`

## Snippets

> "The dual role [of EOS as terminator and padding] is a root cause of EOS overflow under large-block decoding."

> "VoidPadding introduces [VOID] for padding and reserves `[EOS]` for termination."

## Dead Ends

Not a T2I/T2V technique. No ComfyUI integration. Dream model family may differ from operator's Fish-Speech / SillyTavern LLM stack.

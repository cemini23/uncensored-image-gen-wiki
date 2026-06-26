---
title: "Tatoxa — text detoxification for low-resource languages (arXiv:2606.26015)"
type: source
tags: [paper, nlp, detoxification, moderation, peripheral, low-resource]
keywords: [Tatoxa, text detoxification, Tatar, CLEF-2025, cross-lingual transfer, mT0, NLLB LoRA]
related:
  - concepts/low-resource-text-detoxification.md
  - concepts/domain-sensitive-llm-over-alignment.md
  - concepts/chinese-llm-safety-guardrails.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-06-26-daily.md
maturity: draft
read_status: read
created: 2026-06-26
updated: 2026-06-26
---

## Relations

@concepts/low-resource-text-detoxification.md @concepts/domain-sensitive-llm-over-alignment.md

## Raw Concept

- **Title**: The Tatoxa System for Text Detoxification in Low-Resource Languages: The Case of Tatar
- **Authors**: Ilseyar Alimova et al. (Skoltech, HSE, ITMO, AIRI)
- **Type**: arXiv:2606.26015
- **Location**: `raw-sources/arxiv-2606.26015-the-tatoxa-system-for-text-detoxification-in-low.pdf`
- **URL**: https://arxiv.org/abs/2606.26015 · https://github.com/s-nlp/tatoxa
- **Retrieved**: 2026-06-26
- **Read status**: read (abstract + pipeline)

## Narrative

**Tatoxa** — four-stage Tatar **text detoxification** pipeline:

1. NLLB LoRA for Russian→Tatar translation
2. Translate Russian detox parallel corpora to Tatar (LaBSE filter)
3. Ensemble LoRA fine-tune on `s-nlp/mt0-xl-detox-orpo`
4. Multi-candidate inference + toxicity/meaning reranking

Adds **701** annotated Tatar toxic–neutral pairs. Cross-lingual transfer from Russian **underperforms** native Tatar training despite larger Russian corpora.

### Workspace relevance

**Peripheral** — moderation/detox NLP, not generative media. Informs persona **comment/DM sanitization** design for low-resource locales; Phase-0 **NO-GO** for build track — `briefs/2026-06-26_phase-0-videoagent-tatoxa.md`.

## Snippets

> "Cross lingual transfer experiments indicate that transfer from other languages… performs significantly worse than training on native Tatar data."

## Dead Ends

Tatar-only NLP stack — no image/video/audio pipeline integration.

---
title: "Never Stop Speaking — DoS attack on E2E speech LLMs (arXiv:2608.10405) — routed cybersec"
type: source
tags: [paper, routed, security, speech, dos, adversarial-audio, cross-wiki]
keywords: [E2E speech LLM, ALLM, denial-of-service, EOS suppression, VAD-masked perturbation, acoustic adversarial]
related:
  - concepts/unified-audio-text-llm-no-text-regression.md
  - concepts/persona-audio-stack.md
  - concepts/generative-ai-era-deepfake-landscape.md
  - sweeps/2026-08-13-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

Primary: cybersecurity wiki brief `briefs/2026-08-13_speech-e2e-dos-from-image-gen.md`. Dedup stub for image-gen digest.
@concepts/unified-audio-text-llm-no-text-regression.md @concepts/persona-audio-stack.md @concepts/generative-ai-era-deepfake-landscape.md @sweeps/2026-08-13-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Never Stop Speaking: a Denial-of-Service Attack on End-to-End Speech Language Models
- **Authors**: Shuozhe Cheng, Kunlan Xiang, Mingxuan Li et al. (UESTC et al.)
- **Type**: arXiv:2608.10405 (10 pp)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.10405-never-stop-speaking-a-denial-of-service-attack-o.pdf`
- **URL**: https://arxiv.org/abs/2608.10405
- **Code**: none released in PDF
- **Retrieved**: 2026-08-13

## Narrative

**Routed stub (cybersec).** Perturbation-based DoS against end-to-end Audio LLMs: imperceptible acoustic perturbations jointly suppress EOS generation, encourage prolonged decoding, and preserve semantic consistency (weighted EOS loss + top-k logit loss + length loss + semantic alignment loss). VAD-masked injection targets voiced regions only for stealth. Validated on three open-source E2E speech LLMs — stable attack success with large generation-length and GPU-resource growth.

**Image-gen/voice touchpoint:** DoS is a speech-LLM attack-surface concern, not a persona production feature. Relevant to `@concepts/unified-audio-text-llm-no-text-regression.md` (audio-text LLM family) and persona-audio stack only as *defensive awareness* — an E2E speech-LLM service (voice assistant / voice DM) inherits this vulnerability class.

**Phase-0: SKIP gen / ROUTE cybersec.** No runnable code in PDF; no SPDX to check. Not atto / poker / guruwatcher / prod.

## Snippets

> "Optimizes imperceptible acoustic perturbations to directly influence the model's autoregressive generation process while preserving the original input length." [Source: arXiv:2608.10405 Abstract]

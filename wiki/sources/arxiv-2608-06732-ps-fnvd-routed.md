---
title: "PS-FNVD T2V pure-synthesis fake news — routed cybersec (arXiv:2608.06732)"
type: source
tags: [paper, routed, deepfake, t2v, fake-news, cross-wiki]
keywords: [PS-FNVD, R-T2V, T2V-FNVD, HunyuanVideo, Qwen2.5-VL]
related:
  - concepts/generative-ai-era-deepfake-landscape.md
  - concepts/persona-ops-stack.md
  - entities/models/hunyuanvideo-1-5.md
  - sweeps/2026-08-10-daily.md
maturity: draft
read_status: read
created: 2026-08-10
updated: 2026-08-10
---

## Relations

Primary: cybersecurity wiki brief `briefs/2026-08-10_ps-fnvd-t2v-fake-news-from-image-gen.md`. Dedup stub for image-gen digest.
@concepts/generative-ai-era-deepfake-landscape.md @concepts/persona-ops-stack.md @entities/models/hunyuanvideo-1-5.md @sweeps/2026-08-10-daily.md

## Raw Concept

- **Title**: From Cheap Fakes to Pure Synthesis: Addressing the New Era of T2V Fake News Videos
- **Type**: arXiv:2608.06732 · DOI 10.1145/3767308.3836334 (MM '26)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.06732-from-cheap-fakes-to-pure-synthesis-addressing-th.pdf`
- **URL**: https://arxiv.org/abs/2608.06732
- **Code**: https://github.com/TrustworthyComp/PS-FNVD (~11 KB; **no SPDX license** on GitHub)
- **Dataset**: Google Drive PS-FNVD (HunyuanVideo synthetics only) — FakeSV join gated by FakeSV authors
- **Retrieved**: 2026-08-10

## Narrative

**Routed stub.** Ternary FNVD (real / cheap fake / pure synthesis). PS-FNVD blocks unimodal shortcuts; R-T2V = Qwen2.5-VL-7B + LlamaFactory LoRA SFT with rationale. Synthetic videos generated with **HunyuanVideo**.

**Image-gen touchpoint:** open T2V (Hunyuan) can fabricate news-aligned video from scratch — detection is a cybersec/defensive concern, not a persona production feature.

**Phase-0: SKIP gen / ROUTE cybersec REFERENCE.** Do not clone FakeSV/PS-FNVD media. Code-only clone optional (~11 KB) under cybersec shelf. Not atto/poker/guru/prod.

## Snippets

_(none)_

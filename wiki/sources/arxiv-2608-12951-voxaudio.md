---
title: "VoxAudio: vocalized audio synthesis via multi-reward autoregressive flow matching (arXiv:2608.12951)"
type: source
tags: [paper, audio, t2a, speech, soundscape, watch]
keywords: [VoxAudio, vocalized audio, text-to-audio, speech-in-soundscape, flow matching, multi-reward, VoxCorpus, VoxBench, streaming, podcast, dubbing]
related:
  - entities/sfx-models/voxaudio.md
  - concepts/persona-audio-stack.md
  - concepts/multi-shot-audio-video-evaluation.md
  - sweeps/2026-08-14-daily.md
maturity: draft
read_status: read
created: 2026-08-14
updated: 2026-08-14
---

## Relations

@entities/sfx-models/voxaudio.md @concepts/persona-audio-stack.md @concepts/multi-shot-audio-video-evaluation.md @sweeps/2026-08-14-daily.md

## Raw Concept

- **Title**: VoxAudio: Vocalized Audio Synthesis via Multi-Reward Autoregressive Flow Matching
- **Authors**: Wenxiang Guo, Changhao Pan, Ziyue Jiang, Fei Wu, Zhou Zhao (IEEE Transactions on Multimedia)
- **Type**: arXiv:2608.12951 [cs.SD] (IEEE TMM)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.12951-voxaudio-vocalized-audio-synthesis-via-multi-rew.pdf`
- **URL**: https://arxiv.org/abs/2608.12951
- **Retrieved**: 2026-08-14
- **Code**: project page `voxaudio.github.io`; no GitHub repo in PDF → no SPDX check

## Narrative

**Vocalized audio** = intelligible speech embedded in an environmental soundscape (podcasts, video dubbing). Existing T2A either makes quoted speech unintelligible murmur or delegates to separate TTS with post-hoc mixing (loses control over *when* speech occurs and scene interaction). VoxAudio is a **causal autoregressive flow-matching** model attacking three angles:

- **Architecture**: chunk-wise causal factorization + per-chunk noise levels → sliding-window streaming inference with KV caching at variable target durations; randomized chunk boundaries at pretrain.
- **Preference**: multi-reward Negative-aware FineTuning (NFT) jointly optimizes semantic fidelity, linguistic accuracy, aesthetic quality, temporal grounding.
- **Data**: VoxCorpus (large-scale, captions quote verbatim transcript of embedded speech + time intervals) + VoxBench (interval-annotated benchmark with temporal-grounding metric).

**Phase-0: WATCH** — speech-in-soundscape is persona-audio mux-adjacent (quoted/embedded voice vs TTS+dub post-mix). No repo/weights → no SPDX; project-page only. Temporal-grounding eval (VoxBench) is a reusable QA angle for dubbing/podcast persona content. Phase-1: Image-gen local wire `deferred`.

## Snippets

> "Existing Text-to-Audio (T2A) systems either reduce quoted speech to unintelligible vocal murmur or delegate it to a separate TTS model with post-hoc mixing, which forfeits control over when speech occurs and how it interacts with the scene."

_[Source: arxiv-2608.12951, abstract]_

---
title: "BareWave — waveform-native flow-matching TTS (arXiv:2606.09048)"
type: source
tags: [paper, tts, voice-cloning, flow-matching, waveform-native, zero-shot]
keywords: [BareWave, waveform-native TTS, flow matching, VAPA, REPA, zero-shot voice cloning, Tongyi, Alibaba, no vocoder, DiT waveform patches]
related:
  - concepts/waveform-native-flow-matching-tts.md
  - entities/voice-models/barewave.md
  - entities/voice-models/f5-tts.md
  - entities/voice-models/cosyvoice2.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-06-11-daily.md
maturity: draft
read_status: read
created: 2026-06-11
updated: 2026-06-11
---

## Relations

@concepts/waveform-native-flow-matching-tts.md @entities/voice-models/barewave.md @entities/voice-models/f5-tts.md @entities/voice-models/cosyvoice2.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: BareWave: Waveform-Native Flow-Matching Text-to-Speech
- **Authors**: Wei Fan, Chao-Hong Tan, Qian Chen, Wen Wang, Xiangang Li, Kejiang Chen, Weiming Zhang, Nenghai Yu (USTC + Tongyi Fun Team, Alibaba)
- **Type**: arXiv:2606.09048
- **Location**: `raw-sources/arxiv-2606.09048-2606-09048v1-barewave-waveform-native-flow-match.pdf`
- **URL**: https://arxiv.org/abs/2606.09048 · https://barewave.github.io/
- **Retrieved**: 2026-06-11
- **Read status**: read (abstract + method + training design)

## Narrative

**BareWave** — **direct text-to-waveform** zero-shot TTS via conditional flow matching. No intermediate mel/codec representation and **no separate vocoder at inference** — auxiliary SSL alignment (REPA), staged noise schedules, and Velocity-Aware Perceptual Alignment (VAPA) are **training-only**; test path is a single waveform-patch DiT + ODE solver (Heun) with interval-scoped CFG.

### vs dominant zero-shot TTS (VALL-E, CosyVoice, F5-TTS)

| Axis | Codec/latent TTS (CosyVoice, F5-TTS) | BareWave |
|------|--------------------------------------|----------|
| Inference stack | Codec tokens or mel + vocoder | Raw waveform patches only |
| Pretrained inference deps | Codec model / vocoder required | None at test time |
| Training support | Often end-to-end in latent space | REPA (frozen SSL teacher) + VAPA + staged t-sampling |
| Zero-shot cloning | Yes (community standard) | Yes — claims competitive intelligibility / similarity / naturalness `[TENTATIVE]` |

**Architecture:** 1-D waveform patchify → DiT blocks; character-level text via ConvNeXt; prompt audio via conv frontend + raw patch concat. Training: Stage 1 logit-normal t + L_fm + λ₁ L_REPA; Stage 2 uniform t + L_VAPA.

**Availability:** Open-source weights promised ("released soon") `[NEEDS VERIFICATION 2026-06-11]`. Tongyi/Alibaba lineage — watch license vs CosyVoice2 Apache posture.

### Persona-ops relevance

Simpler deployment stack (no vocoder chain) if weights + license permit local persona voice cloning. Competes conceptually with F5-TTS flow-matching path (@entities/voice-models/f5-tts.md) but removes latent interface entirely. Integrates into @concepts/persona-audio-stack.md Layer 1 if released with permissive license.

## Snippets

> "Experiments on zero-shot voice cloning show that strong intelligibility, speaker similarity, and naturalness can be achieved under a fully waveform-native inference path."

> "All auxiliary branches are removed at test time, so the model remains a single waveform-native generator."

## Dead Ends

Not yet runnable locally — checkpoint release pending. License terms unknown vs Fish-Speech / CosyVoice commercial paths.

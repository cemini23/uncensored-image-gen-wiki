---
title: Generative-AI-era deepfake landscape
type: concept
tags: [concept, deepfake, detection, security, persona-ops, diffusion]
keywords: [deepfake taxonomy, BioDeepAV, OOD detection, POI detection, diffusion fakes, voice clone, portrait animation]
related:
  - concepts/likeness-collision-verification.md
  - concepts/persona-audio-stack.md
  - concepts/persona-consistency-methods.md
  - concepts/persona-failure-modes.md
  - concepts/persona-legal-landscape.md
  - entities/lipsync/latentsync.md
  - entities/persona-ops/fish-speech.md
  - sources/arxiv-2411-19537-deepfake-generation-detection-survey.md
  - sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md
  - sources/arxiv-2607-14753-lalms-spoofing-aware-asv.md
  - sources/arxiv-2607-15694-voice-clone-attribution-geometry-floor.md
  - sources/arxiv-2608-05507-affectdf-routed.md
  - sources/arxiv-2608-06732-ps-fnvd-routed.md
  - sources/arxiv-2608-10405-speech-dos-routed.md
  - sources/arxiv-2608-10870-nulledit-routed.md
  - sources/arxiv-2608-11201-vidforensics-m1-routed.md
  - sources/arxiv-2608-12536-indic-speech-encoders-routed.md
  - sources/arxiv-2608-14391-ra-bench-crisis-video-routed.md
  - sources/persona-monetization-2026.md
  - sweeps/2026-06-30-daily.md
  - sweeps/2026-07-17-daily.md
  - sweeps/2026-07-20-daily.md
maturity: draft
created: 2026-06-30
updated: 2026-08-17
---
## Relations

@sources/arxiv-2411-19537-deepfake-generation-detection-survey.md @concepts/persona-failure-modes.md @concepts/persona-audio-stack.md @sources/arxiv-2608-05507-affectdf-routed.md @sources/arxiv-2608-06732-ps-fnvd-routed.md @sources/arxiv-2608-10405-speech-dos-routed.md @sources/arxiv-2608-10870-nulledit-routed.md @sources/arxiv-2608-11201-vidforensics-m1-routed.md @sources/arxiv-2608-12536-indic-speech-encoders-routed.md

## Raw Concept

Ingest 2026-06-30 from Croitoru et al. (arXiv:2411.19537) — umbrella gen+det survey for diffusion-era fakes.

## Narrative

### Generation taxonomy (persona-relevant)

| Modality | Local stack examples | Deepfake class |
|----------|---------------------|----------------|
| Image | FLUX + PuLID/LoRA | Identity-conditioned T2I |
| Video | Wan I2V + LivePortrait/EMOSH | Portrait animation / cross-drive |
| Audio | Fish-Speech / CosyVoice | Voice cloning |
| Multimodal | LatentSync + TTS mux | AV talking-head |

Survey notes diffusion **prompt deepfakes** (celebrity name in text) are lower fidelity than **adapter/LoRA identity** methods — matches workspace build-track (@concepts/persona-consistency-methods.md).

### Detection vs operator reality

**BioDeepAV finding:** detectors trained on older GAN fakes drop sharply on **unseen diffusion generators** `[TENTATIVE per survey]`.

**Operator implication:** short-term evasion of platform classifiers is plausible; **long-term** exposure remains from law (2257, DEFIANCE, UK OSA), payment rails, and human reporting — not ML detection alone (@concepts/persona-failure-modes.md).

### POI detection task

**Person-of-interest (POI) detection** — given a reference identity, classify whether new media depicts a fake of that person. Relevant to **likeness collision** and **right-of-publicity** disputes (@concepts/likeness-collision-verification.md).

### 2026-08-13 — meta-detection forensics + inference-time image protection

- **VidForensics-M1** (@sources/arxiv-2608-11201-vidforensics-m1-routed.md → cybersec) — first **meta-detection** RL for AI-generated video: jointly scores the fake/real label *and* the supporting **temporal-grounding** evidence. Detector generalization to emerging generators is the motivating gap — matches the "unseen diffusion generator" finding above.
- **NullEdit** (@sources/arxiv-2608-10870-nulledit-routed.md → cybersec) — **inference-time** stealthy image protection: redirects the VLM condition representation so unauthorized edits collapse into a natural no-op. Sits alongside CAP/training-time anti-personalization (@concepts/anti-personalization-privacy.md) as the DiT-era counterpart.

**Operator implication:** detection research keeps moving to *evidence-grounded* (temporal/geometric) signals rather than label-only classifiers, and protection research moves from training-time to **inference-time** interception of the edit pipeline.

### 2026-08-15 — Indic SDD / OOD TTS (language axis)

**Rai et al.** (@sources/arxiv-2608-12536-indic-speech-encoders-routed.md → cybersec): frozen speech encoders (AST / Vaani / Wav2vec2 / Whisper / BEATs) on 22 Indic languages + a four-TTS OOD holdout (freevc24, XTTS-v2). OOD synthetic recall tracks **proximity to unseen TTS embeddings**, not distance from natural speech; expanding the train pool 1→4 TTS systems lifts recall **7% → 51%** `[TENTATIVE, single source]`. AASIST/RawNet2 on IndicSynth sat near chance (EER >50%) vs sub-1% on ASVspoof 2019.

Sibling to AffectDF’s **emotion** axis (@sources/arxiv-2608-05507-affectdf-routed.md): persona TTS (Fish-Speech / CosyVoice / F5 / XTTS lineage) can sit OOD vs English ASVspoof-trained detectors on **language** as well as prosody. ML detection ≠ legal/payment-rail immunity (same operator implication as BioDeepAV above).

### 2026-08-17 — RA-Bench crisis-video LastMile (Detection OOD)

**Liang et al.** (@sources/arxiv-2608-14391-ra-bench-crisis-video-routed.md → cybersec): 17,886 clips (1,830 real anchors × 10 social-risk categories + 16,056 generated from 4 open + 5 closed generators). Traditional detectors do not transfer; zero-shot MLLMs are prompt/source-unstable; fine-tuned MLLMs show class bias. **LastMile** social-dissemination simulation further weakens detection — generators already beat last-mile detectors on crisis-video dissemination [TENTATIVE, single source]. Detection-eval only; no evasion recipes. Repo has no SPDX; 93.8 GB dataset not cloned.

## Snippets

> "Covering both generation and detection, as well as all deepfake media types."

### 2026-07-20 — voice-clone attribution floor

Kato (arXiv:2607.15694): geometry-limited ASV misID floor on pro Japanese voice actors; fixed-threshold 1:N clone attribution unreliable / unfair on generic encoders. Reinforces operator rule: ML attribution ≠ enforcement. See @sources/arxiv-2607-15694-voice-clone-attribution-geometry-floor.md.

## Dead Ends

Defensive ML stack — operators should not treat detector OOD weakness as legal immunity.

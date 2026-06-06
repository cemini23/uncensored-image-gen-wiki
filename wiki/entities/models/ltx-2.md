---
title: LTX-2 (Lightricks)
type: entity
tags: [model, video, asymmetric-av, audio-visual, ltx, lightricks, joint-foundation]
keywords: [ltx-2, ltx-video, lightricks, asymmetric-av, audio-visual, 19b, 14b-visual, 5b-audio, bidirectional-cross-attention, 4k, 50fps, foley, modality-specific-vae, ltx-2-community-license]
related:
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/seam-stitching-strategies.md
  - concepts/censorship-tier-taxonomy.md
  - entities/uis/comfyui.md
  - concepts/persona-audio-stack.md
  - entities/models/sana-wm.md
  - sources/sana-wm-minute-scale-world-model.md
  - concepts/world-models-video-generation.md
  - entities/models/foley-omni.md
  - sources/arxiv-2604-11283-mllm-video-translation-survey.md
  - sources/arxiv-2606-03672-foley-omni.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - entities/models/javedit.md
  - concepts/joint-audio-visual-instruction-editing.md
maturity: draft
created: 2026-05-07
updated: 2026-06-06
---

## Relations

@sources/video-generation-survey-2026.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @concepts/seam-stitching-strategies.md @concepts/censorship-tier-taxonomy.md

@concepts/persona-audio-stack.md
@concepts/world-models-video-generation.md — LTX-2's high-compression video tokenizer is the codec layer SANA-WM uses for minute-scale single-GPU world modeling
@entities/models/sana-wm.md — SANA-WM uses a high-compression LTX2 tokenizer as its video latent codec
@sources/sana-wm-minute-scale-world-model.md
## Raw Concept

Page prompted by the May 2026 video survey ingest. LTX-2 is the open-weights joint audio-visual foundation model released January 2026 by Lightricks — the only open-weight peer to Veo 3.1 / Seedance 2.0 in the native-A/V class.

Synthesized from @sources/video-generation-survey-2026.md.

## Narrative

### Architecture — asymmetric joint A/V

- **Total**: 19B parameters
- **Visual stream**: 14B parameters (spatial detail + temporal coherence)
- **Audio stream**: 5B parameters (audio generation, dialogue timing, environmental sound)
- **Inter-stream communication**: bidirectional cross-attention layers
- **Native output**: 4K @ 50 fps with synchronized lipsync + foley audio in a single pass
- **Modality-specific VAEs** at 1:192 compression ratio (mitigates memory bottlenecks despite 4K output)

[CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.2, citing huggingface.co/Lightricks/LTX-2 + introl.com/blog/ltx-2-audiovisual-diffusion-synchronized-video-audio-2026]

### Licensing — LTX-2 Community License

Permits **commercial use without royalties** for entities generating **under $10 million in annual revenue**. [CONFIRMED] Above the $10M threshold, commercial license required.

This is a hybrid model — more permissive than the FLUX.1 Dev non-commercial clause but more restrictive than Apache 2.0 (which Wan 2.2 / Mochi 1 / CogVideoX use). For adult-persona indie operators, the $10M cap is effectively unrestricted commercial use.

### Censorship tier — TBD

Survey didn't classify LTX-2 explicitly within the censorship taxonomy. The model's optimization for cinematic single-pass output and audio synthesis suggests Western-style alignment posture but not the strict architectural scrubbing seen on Wan 2.2 / HunyuanVideo. [NEEDS VERIFICATION 2026-05-07]

### Audio failure modes

LTX-2's audio stream **occasionally struggles with extended, complex conversational dialogue** — but remains unmatched in open-weight ambient sound synthesis. For long-form persona dialogue, separate audio synthesis + post-hoc lipsync (LatentSync / MuseTalk / UniSync) is recommended over LTX-2 native generation. [CONFIRMED]

### Hardware viability

| Tier | Variant | Notes |
|------|---------|-------|
| 24 GB | LTX-2.3 19B FP8 (720p) | Workstation tier; FP8 quantization required |
| Multi-GPU | LTX-2 native 4K | (implied — survey doesn't pin exact figures) |

[Source: Video Generation Models Survey 2026.docx p.5]

### Training tool support

LTX-2.3 is **not** in Musubi Tuner's architecture coverage list (per training-tool sub-sweep E, 2026-05-07). LTX fine-tuning path remains an open question — the survey doesn't flag a canonical community trainer. [NEEDS VERIFICATION 2026-05-07]

## Snippets

> "Lightricks redefined the paradigm of real-time and multimodal generation with the release of LTX-2 in January 2026. … LTX-2 is an asymmetric joint audio-visual foundation model. The architecture distributes 19 billion parameters asymmetrically: 14 billion parameters are dedicated to visual spatial detail and temporal coherence, while 5 billion parameters independently manage audio generation, dialogue timing, and environmental sound."
[Source: Video Generation Models Survey 2026.docx p.2, citing huggingface.co/Lightricks/LTX-2 (retrieved 2026-05-06)]

> "LTX-2 is distributed under the LTX-2 Community License, which permits commercial use without royalties for entities generating under $10 million in annual revenue. The model utilizes modality-specific VAEs to compress raw signals at a 1:192 ratio."
[Source: Video Generation Models Survey 2026.docx p.2]

> "While highly optimized for single-pass cinematic outputs, the model's audio stream occasionally struggles with extended, complex conversational dialogue, though it remains unmatched in open-weight ambient sound synthesis."
[Source: Video Generation Models Survey 2026.docx p.2]

## Dead Ends

- **LTX-2 native dialogue for long-form persona monologues**: don't rely on it. Separate audio + post-hoc lipsync (UniSync 2026 SOTA, MuseTalk for real-time) is the production path. → @concepts/seam-stitching-strategies.md

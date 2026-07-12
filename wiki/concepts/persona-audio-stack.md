---
title: Persona Audio Stack — Voice, Lipsync, Music, and Sound Effects
type: concept
tags: [audio, voice-cloning, tts, lipsync, music-generation, sound-effects, persona-ops, audio-pipeline]
keywords: [voice cloning, TTS, Fish-Speech, CosyVoice, lipsync, LatentSync, MuseTalk, Wav2Lip, music generation, MusicGen, ACE-Step, Stable Audio, sound effects, AudioLDM, Tango, audio-video integration, FFmpeg, ComfyUI audio nodes]
related:
  - entities/persona-ops/fish-speech.md
  - concepts/persona-ops-stack.md
  - concepts/persona-ops-workflow.md
  - entities/uis/comfyui.md
  - concepts/video-identity-inheritance.md
  - concepts/seam-stitching-strategies.md
  - concepts/model-selection-workflow.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
  - sources/persona-ops-stack-2026.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/kokoro.md
  - entities/voice-models/indextts-2.md
  - entities/voice-models/qwen3-tts.md
  - entities/voice-models/f5-tts.md
  - entities/voice-models/chatterbox.md
  - entities/voice-models/maskgct.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/wav2lip.md
  - entities/lipsync/sadtalker.md
  - entities/music-models/ace-step.md
  - entities/music-models/musicgen.md
  - entities/sfx-models/stable-audio-open.md
  - entities/sfx-models/audioldm.md
  - entities/sfx-models/tango-2.md
  - entities/voice-models/xtts-v2.md
  - entities/voice-models/dia.md
  - entities/voice-models/bark.md
  - entities/voice-models/elevenlabs.md
  - entities/lipsync/liveportrait.md
  - entities/music-models/suno.md
  - entities/music-models/udio.md
  - entities/sfx-models/audio-omni.md
  - entities/omnivoice.md
  - entities/voicebox.md
  - entities/persona-ops/delive.md
  - concepts/federated-daily-research-digest.md
  - concepts/sync-audio-video-customization.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - sources/arxiv-2604-11283-mllm-video-translation-survey.md
  - concepts/mllm-video-translation.md
  - entities/models/foley-omni.md
  - sources/arxiv-2606-03672-foley-omni.md
  - entities/models/omnicustom.md
  - sources/arxiv-eventspeech-neuromorphic-tts-2605-26672.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - concepts/joint-audio-visual-instruction-editing.md
  - entities/models/javedit.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/voice-models/barewave.md
  - concepts/waveform-native-flow-matching-tts.md
  - sources/arxiv-2606-09048-barewave-waveform-native-tts.md
  - sources/arxiv-2606-10413-soul-computing-digital-consciousness.md
  - concepts/soul-computing-digital-persona.md
  - sources/arxiv-2606-14049-foleygenex-unified-vta.md
  - concepts/unified-controllable-video-to-audio.md
  - entities/models/foleygenex.md
  - sources/arxiv-2606-13872-avatar-v-video-reference-avatar.md
  - concepts/video-reference-avatar-generation.md
  - entities/models/avatar-v.md
  - sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md
  - entities/voice-models/confucius4-tts.md
  - sources/arxiv-2411-19537-deepfake-generation-detection-survey.md
  - concepts/generative-ai-era-deepfake-landscape.md
  - sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md
  - concepts/unified-audio-text-llm-no-text-regression.md
  - entities/voice-models/nemotron-audex.md
  - sweeps/2026-07-12-daily.md
maturity: validated
created: 2026-05-09
updated: 2026-07-12
---

## Relations

@entities/persona-ops/fish-speech.md
@concepts/persona-ops-stack.md
@concepts/persona-ops-workflow.md
@entities/uis/comfyui.md
@concepts/video-identity-inheritance.md
@concepts/seam-stitching-strategies.md
@concepts/model-selection-workflow.md
@sources/persona-ops-stack-2026.md
@entities/voice-models/cosyvoice2.md
@entities/voice-models/kokoro.md
@entities/voice-models/indextts-2.md @entities/voice-models/qwen3-tts.md @entities/voice-models/f5-tts.md @entities/voice-models/chatterbox.md @entities/voice-models/maskgct.md
@entities/lipsync/latentsync.md
@entities/lipsync/musetalk.md
@entities/lipsync/wav2lip.md @entities/lipsync/sadtalker.md
@entities/music-models/ace-step.md
@entities/music-models/musicgen.md
@entities/sfx-models/stable-audio-open.md
@entities/sfx-models/audioldm.md @entities/sfx-models/tango-2.md
@entities/voice-models/xtts-v2.md @entities/voice-models/dia.md @entities/voice-models/bark.md @entities/voice-models/elevenlabs.md
@entities/lipsync/liveportrait.md @entities/music-models/suno.md @entities/music-models/udio.md @entities/sfx-models/audio-omni.md
@entities/omnivoice.md — **dead-end** (K93 license reject); was Layer-1 multilingual alternate candidate
@entities/voicebox.md — Layer 1 alternate: local-first multi-engine TTS voice studio
@entities/persona-ops/delive.md — Apache-2.0 system-audio capture + ASR for TTS-output-to-text audit trail
@concepts/federated-daily-research-digest.md
@concepts/sync-audio-video-customization.md @entities/models/omnicustom.md @sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
@sources/arxiv-eventspeech-neuromorphic-tts-2605-26672.md — REFERENCE-ONLY neuromorphic TTS research

## Raw Concept

Synthesizes the four-layer audio stack needed for full persona operations: voice cloning (DM voice notes, video voiceover), lipsync (talking-head video), music generation (social content background), and sound effects / foley (video production). Drawn from May 2026 web research across TTS, lipsync, music, and audio-generation landscapes. Extends the voice-cloning coverage in @entities/persona-ops/fish-speech.md into a complete audio pipeline.

## Narrative

### The four-layer audio stack

An AI persona doesn't just need images and video — it needs a voice. The audio stack has four distinct layers, each with its own tooling and integration points:

| Layer | Purpose | Key tools (May 2026) |
|---|---|---|
| **1. Voice Cloning / TTS** | DM voice notes, video voiceover, persona "speaking voice" | Fish-Speech S2 Pro, CosyVoice2, IndexTTS-2 |
| **2. Lipsync** | Marry generated audio to generated video faces | LatentSync, MuseTalk, Wav2Lip |
| **3. Music Generation** | Background music for social posts, persona theme music | ACE-Step 1.5, Meta MusicGen, Stable Audio Open |
| **4. Sound Effects / Foley** | Ambient sound, scene audio for video content | Stable Audio Open, AudioLDM, Tango 2 |

**Unified audio-text LLMs (Jul 2026):** NVIDIA **Audex** collapses layers 1+4 (+ ASR) into one MoE checkpoint but ships under **noncommercial license** and multi-GPU inference — @entities/voice-models/nemotron-audex.md. Production stack unchanged: modular Fish-Speech + Stable Audio Open.

### MSAVBench implication (multi-shot dialogue reels)

@sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md systematically shows that **video-first + post-hoc dubbing** (Wan2.2 + HunyuanFoley class pipelines) fails lip-sync, WER, and cross-shot timbre vs unified A/V models — especially at 5+ shots. The default Layer 1–2 cascade (Fish-Speech → Wan I2V → LatentSync) mirrors that failure mode for **multi-cut persona monologues** `[TENTATIVE]`.

**Mitigations:** (a) native joint gen via LTX-2.3 / OmniCustom / JAVEdit for dialogue-heavy reels; (b) keep cascade for single-shot clips; (c) generate A/V jointly per segment before @concepts/seam-stitching-strategies.md, not dub after stitch.

→ @concepts/multi-shot-audio-video-evaluation.md · @entities/models/ltx-2.md

---

### Layer 1 — Voice Cloning / TTS

The persona needs a consistent, recognizable voice. This voice must be operator-controlled (no platform bans), locally runnable, and capable of emotional range for parasocial intimacy.

#### Primary recommendation: Fish-Speech S2 Pro

Already documented in @entities/persona-ops/fish-speech.md. Key facts as of May 2026:

- **Open weights** (not fully open source — commercial use requires paid license from Fish Audio)
- Trained on 10M+ hours of multilingual audio across 80+ languages
- **Inline emotion control**: natural-language prosody descriptions embedded at word positions (`[whisper in small voice]`, `[excited and fast]`, `[pitch up]`)
- Zero-shot voice cloning from 10-30 seconds of reference audio
- TTS-Arena2 ELO leader (score 1339)
- ~100ms TTFA on H200 with SGLang; higher latency on consumer GPUs
- 16-24 GB VRAM for self-hosted inference

#### Lightweight alternative: CosyVoice2-0.5B (Alibaba)

- Ultra-low latency, streaming-capable, 0.5B parameters — fits on 8 GB VRAM
- Zero-shot voice cloning, strong Chinese + English
- Good for real-time or near-real-time DM voice note generation
- Trade-off: less emotional range than Fish-Speech S2 Pro

#### Other credible alternates

| Model | Strength | Weakness |
|---|---|---|
| **IndexTTS-2** | Zero-shot + emotion + duration control | Smaller community |
| **Qwen3-TTS** | Strong multilingual, open source | Less emotion control than Fish |
| **F5-TTS** | Strong English quality | Limited language support |
| **XTTS-v2 (Coqui)** | Most downloaded, 6-sec cloning | Company shut down 2024; legacy arch |
| **Chatterbox (Resemble AI)** | Permissive license, real-time, lightweight | Newer, smaller ecosystem |
| **Dia (Nari Labs)** | Dialogue-focused TTS, conversational | Purpose-built for chat, not broadcast |

#### Decision matrix for persona voice

| Need | Pick |
|---|---|
| **Maximum quality + emotional range** | Fish-Speech S2 Pro |
| **Real-time / low-latency DM voice notes** | CosyVoice2-0.5B |
| **Budget / 8 GB VRAM / quick testing** | CosyVoice2-0.5B or Chatterbox |
| **Multi-language persona** | Fish-Speech S2 Pro (80+ languages) |
| **Fully open source (no license concerns)** | Qwen3-TTS or F5-TTS |

**2026-07-04 update:** Qwen3-TTS is confirmed Apache-2.0 with released 12Hz 0.6B/1.7B Base / CustomVoice / VoiceDesign checkpoints. Use it when license purity, multilingual coverage, or streaming is more important than Fish-Speech's mature persona-ops quality. OpenAudio S1-mini is a Fish Audio 0.5B lightweight side path; do not replace Fish-Speech S2 Pro with it for premium voice notes.

#### Dead end: ElevenLabs

ElevenLabs Flash v2.5 has 75-150ms latency and top-tier SFW quality but enforces NSFW ban at platform level. Operators face account termination, audio classification detection, and legal exposure (Vacker v ElevenLabs). The NSFW market has fully migrated to open-source clones.

[CONFIRMED] Sources: @sources/persona-ops-stack-2026.md §4, bentoml.com article (retrieved 2026-05-09), siliconflow.com article (retrieved 2026-05-09)

---

### Layer 2 — Lipsync

When the persona appears in video (TikTok, Reels, Fanvue), mouth movements must match generated audio. The lipsync layer takes a video frame + audio clip and produces a talking-head output.

#### Primary recommendation: LatentSync (ByteDance)

- **Diffusion-based**, works in latent space (not pixel space) — produces sharp, high-resolution mouth movements
- Best visual quality among open-source lipsync tools as of May 2026
- Open source, local-capable, GPU required
- Slower than real-time alternatives but quality-first posture
- [CONFIRMED] Sources: lipsync.com article, Reddit r/StableDiffusion (retrieved 2026-05-09)

#### Speed alternative: MuseTalk (Tencent / Lyra Lab)

- **30+ FPS** on consumer GPU, real-time capable
- Multi-modal approach (not pure diffusion) — balances speed and quality
- Setup is more complex (depends on OpenMMLab libraries)
- Better for batch processing or near-real-time workflows
- [CONFIRMED] Sources: lipsync.com article, sync.so blog (retrieved 2026-05-09)

#### Accuracy baseline: Wav2Lip

- GAN-based, industry staple for sync accuracy
- Older architecture, visual quality lower than LatentSync/MuseTalk
- Best for: dubbing existing footage where lip-sync precision matters more than visual fidelity
- Extensions: Wav2Lip-HD, CodeFormer for face restoration
- Widest community, easiest setup, most tutorials
- [CONFIRMED] Source: lipsync.com article (retrieved 2026-05-09)

#### Other options

| Tool | Best for |
|---|---|
| **SadTalker** | Single-image avatar + head motion + lip sync — fastest for quick talking-head posts |
| **LivePortrait** | Premium single-image quality, static portrait animation |
| **VideoReTalking** | Full pipeline: audio dubbing → lip sync → face enhancement |
| **GeneFace++** | 3D-aware digital human generation |
| **KeySync** | Newer but reportedly buggy (May 2026) — skip for now |

#### Lipsync decision matrix

| Need | Pick |
|---|---|
| **Best visual quality, batch processing** | LatentSync |
| **Real-time or high-throughput** | MuseTalk |
| **Maximum sync accuracy on real footage** | Wav2Lip |
| **Quick talking-head from one image** | SadTalker or LivePortrait |

---

### Layer 3 — Music Generation

Social content (Reels, TikToks, YouTube Shorts) needs background music. The persona may also benefit from a recognizable "theme" or audio brand.

#### Primary recommendation: ACE-Step 1.5

- Best all-around local music generation model as of May 2026
- Text-to-music, runs offline on consumer GPU
- Good for instrumental backgrounds, loops, short-form content scoring
- [TENTATIVE] Source: musicmaker.im article (retrieved 2026-05-09)

#### Strong alternative: Meta AudioCraft / MusicGen

- Fully open source (Meta/Facebook Research)
- Text-to-music, melody-conditioned generation (hum a tune → expand to full composition)
- Includes AudioGen for sound effects, EnCodec for neural audio compression
- Older but well-tested, large community
- Available via HuggingFace demo or local install
- [CONFIRMED] Source: github.com/facebookresearch/audiocraft

#### Sound design / short-form: Stable Audio Open 1.0 (Stability AI)

- Open source, generates up to 47 seconds
- Specialized for: drum beats, instrument riffs, ambient sounds, foley, production elements
- Less suited for full song generation, but excellent for video background audio
- [CONFIRMED] Source: stability.ai/news (retrieved 2026-05-09)

#### Cloud-only (best quality but not local)

| Tool | Quality | Local? | NSFW posture |
|---|---|---|---|
| **Suno v4** | Best-in-class song generation | No (web/API only) | Unknown — likely ToS-restricted |
| **Udio** | Top-tier music generation | No (web only) | Unknown — likely ToS-restricted |
| **MusicMaker AI** | Browser-based, royalty-free | No (web) | TBD |

For persona ops, local models are preferred (no platform ToS risk, no content moderation on background music). But if quality is paramount, Suno API could be used for instrumental-only tracks where content moderation is unlikely to trigger.

#### Music decision matrix

| Need | Pick |
|---|---|
| **Best local quality, full songs** | ACE-Step 1.5 |
| **Open source, melody-conditioned, proven** | Meta MusicGen |
| **Short background loops, foley, ambient** | Stable Audio Open |
| **Maximum quality (accept cloud risk)** | Suno v4 API or Udio |

---

### Layer 4 — Sound Effects / Foley

Video content needs ambient sound, scene audio, transitions, and effects. This is the least critical layer for persona ops but matters for production quality.

#### Primary recommendation: Stable Audio Open 1.0

- Already in the stack for music — dual-use for foley
- Drum beats, instrument riffs, ambient sounds, production elements
- 47-second max, open source, runs locally
- [CONFIRMED] Source: stability.ai/news (retrieved 2026-05-09)

#### Text-to-audio alternatives

| Tool | Strength |
|---|---|
| **AudioLDM** | Text-to-audio (speech + sound effects + music), multiple checkpoints, well-established |
| **Tango 2** | Instruction-tuned LLM + latent diffusion, outperforms AudioLDM on most metrics, trains on smaller datasets |
| **Audio-Omni** | New (SIGGRAPH 2026): unified understanding + generation + editing across sound, music, and speech. Research-future, not build-track today |
| **Bark (Suno)** | Text-to-audio including sound effects, but older and surpassed |

#### Foley decision

For persona video content, **Stable Audio Open** covers 90% of needs (ambient, transitions, production elements). Add **Tango 2** if more specific text-to-sound prompting is needed.

---

### Integration: the full audio pipeline

#### Architecture diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    AUDIO PIPELINE                           │
│                                                              │
│  LAYER 1 (Voice)           LAYER 3 (Music)                  │
│  ┌─────────────────┐       ┌──────────────────┐             │
│  │ Fish-Speech S2   │       │ ACE-Step 1.5 /   │             │
│  │ (DM voice notes) │       │ MusicGen         │             │
│  └────────┬────────┘       └────────┬─────────┘             │
│           │                         │                        │
│           ▼                         ▼                        │
│  ┌─────────────────────────────────────────┐                │
│  │          n8n ORCHESTRATION              │                │
│  │  - Text → TTS → .wav                    │                │
│  │  - Prompt → Music → .mp3                │                │
│  │  - Prompt → Foley → .wav                │                │
│  └────────────────┬────────────────────────┘                │
│                   │                                          │
│        ┌──────────┼──────────┐                               │
│        ▼          ▼          ▼                               │
│  ┌──────────┐ ┌────────┐ ┌──────────┐                       │
│  │ DM Voice │ │ Video  │ │ Social   │                       │
│  │ Note     │ │ Dub    │ │ Reel     │                       │
│  │ .mp3     │ │ .mp4   │ │ .mp4     │                       │
│  └──────────┘ └───┬────┘ └──────────┘                       │
│                    │                                          │
│              ┌─────▼──────┐                                  │
│              │ LAYER 2    │                                  │
│              │ Lipsync    │                                  │
│              │ LatentSync │                                  │
│              │ or MuseTalk│                                  │
│              └─────┬──────┘                                  │
│                    │                                          │
│              ┌─────▼──────┐                                  │
│              │ LAYER 4    │                                  │
│              │ Foley      │                                  │
│              │ Stable     │                                  │
│              │ Audio Open │                                  │
│              └─────┬──────┘                                  │
│                    │                                          │
│              ┌─────▼──────┐                                  │
│              │ FFmpeg     │                                  │
│              │ final mux  │                                  │
│              │ video+audio│                                  │
│              └────────────┘                                  │
└─────────────────────────────────────────────────────────────┘
```

#### Delivery paths

| Content type | Audio stack used | Output |
|---|---|---|
| **DM voice note** | Fish-Speech S2 Pro (text → emotion-tagged clone → .mp3) | .mp3 delivered via Fanvue/Telegram |
| **Talking-head Reel** | Fish-Speech → LatentSync → Stable Audio Open (ambient) → FFmpeg mux | .mp4 posted to Instagram/TikTok |
| **Video clip (no talking)** | ACE-Step 1.5 background music → FFmpeg overlay | .mp4 posted to social |
| **Full scene video** | Fish-Speech voiceover + ACE-Step 1.5 music + Stable Audio Open foley → FFmpeg multi-track mux | .mp4 posted to Fanvue/YouTube |

#### ComfyUI audio integration

As of May 2026, audio support in ComfyUI is growing but not as mature as image/video:

- **ComfyUI-VideoHelperSuite** — video encode/decode, frame extraction. Does NOT handle audio tracks natively.
- **ComfyUI-AudioScheduler** (community) — experimental audio-reactive generation
- **ComfyUI-MMAudio** (community) — video-to-audio synthesis node

**Current recommendation**: generate audio outside ComfyUI (Fish-Speech, MusicGen, Stable Audio Open) and mux with FFmpeg as a post-processing step. The n8n orchestration layer handles this well:

```
n8n workflow:
  1. ComfyUI API call → generate video (no audio track)
  2. Fish-Speech API call → generate voiceover .wav
  3. MusicGen local call → generate background music .mp3
  4. FFmpeg node → mux video + voiceover + music → final .mp4
  5. Postiz → schedule to Instagram/TikTok
```

#### Hardware requirements

| Layer | Model | VRAM required |
|---|---|---|
| Voice cloning | Fish-Speech S2 Pro | 16-24 GB |
| Voice cloning (light) | CosyVoice2-0.5B | 8 GB |
| Lipsync | LatentSync | 12-16 GB |
| Lipsync | MuseTalk | 8-12 GB |
| Music | ACE-Step 1.5 / MusicGen | 8-16 GB |
| Foley | Stable Audio Open | 8-12 GB |

**Modal 4090 (24 GB) configuration**: Fish-Speech S2 Pro runs comfortably. LatentSync + Stable Audio Open can run sequentially. ACE-Step 1.5 can run concurrently with TTS if VRAM is managed. Total audio stack fits on a single 4090.

**Apple Silicon (M3/M4 36+ GB)**: Fish-Speech S2 Pro runs via MPS. LatentSync has CUDA dependencies — cloud burst via RunPod may be needed for lipsync.

---

### Priority order for implementation

1. **Voice cloning** — highest ROI. Voice notes sell on Fanvue. Fish-Speech S2 Pro first, CosyVoice2 as lightweight DM responder.
2. **Lipsync** — needed once you're posting talking-head video. LatentSync for quality, MuseTalk if you need speed.
3. **Music** — nice to have for social content polish. ACE-Step 1.5 or MusicGen.
4. **Foley** — lowest priority. Stable Audio Open when production quality demands it.

## Snippets

### Fish-Speech S2 Pro inline emotion control examples

```
"[whisper in small voice] I missed you today..."
"[excited and fast] You won't believe what just happened!"
"[pitch up, breathy] Good morning... did you sleep well?"
```

Source: bentoml.com article (retrieved 2026-05-09)

### One-shot audio pipeline (n8n pseudo-flow)

```json
{
  "steps": [
    {"tool": "Fish-Speech",   "input": "DM text + emotion tag", "output": "voice.wav"},
    {"tool": "ComfyUI",       "input": "video generation prompt", "output": "video_no_audio.mp4"},
    {"tool": "LatentSync",    "input": "video_no_audio.mp4 + voice.wav", "output": "lipsynced.mp4"},
    {"tool": "StableAudio",   "input": "ambient café sounds", "output": "ambient.wav"},
    {"tool": "FFmpeg",        "input": "lipsynced.mp4 + voice.wav + ambient.wav + music.mp3",
                              "output": "final_post.mp4"}
  ]
}
```

### Quick install: audio stack on RunPod 4090

```bash
# Voice cloning
git clone https://github.com/fishaudio/fish-speech.git
cd fish-speech && pip install -e .

# Lipsync
git clone https://github.com/bytedance/LatentSync.git
cd LatentSync && pip install -r requirements.txt

# Music
git clone https://github.com/facebookresearch/audiocraft.git
cd audiocraft && pip install -e .

# Foley
git clone https://github.com/Stability-AI/stable-audio-tools.git
cd stable-audio-tools && pip install -e .
```

### Model weights download

```bash
# Fish-Speech S2 Pro weights
huggingface-cli download fishaudio/fish-speech-s2-pro --local-dir ./models/fish-speech

# MusicGen weights
huggingface-cli download facebook/musicgen-medium --local-dir ./models/musicgen

# Stable Audio Open weights
huggingface-cli download stabilityai/stable-audio-open-1.0 --local-dir ./models/stable-audio
```

## Dead Ends

- **ElevenLabs for NSFW persona voice**: NSFW-banned at platform level. Migrated to Fish-Speech S2 Pro.
- **Coqui XTTS for new builds**: company shut down 2024, legacy architecture. Use CosyVoice2 or Fish-Speech instead.
- **KeySync for lipsync**: reportedly buggy as of May 2026. Use LatentSync or MuseTalk.
- **Bark (Suno) for sound effects**: surpassed by Stable Audio Open and Tango 2.
- **ComfyUI-native audio nodes**: too immature as of May 2026. Use external tools + FFmpeg post-processing.

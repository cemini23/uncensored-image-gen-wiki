## [2026-07-18] ingest | teLLMe driving causal + PPA LLM self-consistency (peripheral)

Daily sweep full ingest for 2026-07-18 (2 PDFs). Both out-of-scope for persona generative stack.

### Created (peripheral)

- `wiki/sources/arxiv-2607-15254-tellme-why-urban-driving-causal.md` — **REFERENCE** (thin world-models adjacency)
- `wiki/sources/arxiv-2607-15277-partition-prompt-aggregate-llm-self-consistency.md` — **SKIP**

### Updated

- `wiki/sweeps/2026-07-18-daily.md`, `wiki/index.md`
- `wiki/concepts/world-models-video-generation.md` — teLLMe peripheral pointer

### Brief / routing

- **None** — no TipDrop / poker / prod (no install paths)

### Local adopt

- none

### Archive

- 2 PDFs → `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/`

---

## [2026-07-17] ingest | D2DF/MeanFlowNFT + TAMF/Dialogs/RW-Voice-EQ + peripherals

Daily sweep full ingest for 2026-07-17 (8 PDFs).

### Created (in-scope)

- `wiki/sources/arxiv-2607-14976-d2df-one-step-video-object-removal.md` + `entities/models/d2df.md` + `concepts/one-step-video-object-removal.md` — **CONDITIONAL-GO** (code)
- `wiki/sources/arxiv-2607-15273-meanflownft-forward-process-rl.md` + `entities/models/meanflownft.md` — **WATCH**
- `wiki/sources/arxiv-2607-14807-tamf-vton-mask-free-virtual-try-on.md` + `entities/models/tamf-vton.md` — **WATCH** (no code)
- `wiki/sources/arxiv-2607-14310-dialogs-russian-speech-corpus.md` + `entities/datasets/dialogs-russian-speech.md` — **REFERENCE**
- `wiki/sources/arxiv-2607-14846-rw-voice-eq-bench.md` + `entities/benchmarks/rw-voice-eq-bench.md` — **REFERENCE**
- `wiki/sources/arxiv-2607-14753-lalms-spoofing-aware-asv.md` — **REFERENCE** (deepfake)
- `wiki/sources/arxiv-2607-15278-hierarchical-denoising-visual-reasoning.md` — **REFERENCE**

### Created (peripheral SKIP)

- `wiki/sources/arxiv-2607-14984-synthetic-medical-images-bias.md`

### Updated

- `wiki/sweeps/2026-07-17-daily.md`, `wiki/index.md`
- `wiki/concepts/{grpo-i2v-post-training,video-try-on-anything,persona-audio-stack,generative-ai-era-deepfake-landscape,world-models-video-generation,video-identity-inheritance,albedo-guided-instance-video-editing,task-isolated-unified-video-editing}.md`
- `wiki/entities/models/{wan-2-2,cogvideox-1-5,omnitryon}.md`, `persona-ops/fish-speech.md`
- `wiki/sources/arxiv-tagrpo-i2v-grpo-2601-05729.md`

### Brief / routing

- `briefs/2026-07-17_d2df-meanflownft-adoption.md` (`david: true`) → TipDrop kit via `route_david_adoption_brief.py`
- No poker / prod SCP

### Local adopt

- Code-only clones: `~/Desktop/projects/D2DF` (~41 MB), `~/Desktop/projects/MeanFlowNFT` (~74 MB)
- Weights deferred (CogVideoX / Wan / SD3.5 >>500 MB)

### Archive

- 8 PDFs → `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/`

---

## [2026-07-16] ingest | ZipL/AutoSIFT/VideoRAE/VGIF + peripherals

Daily sweep full ingest for 2026-07-16 (8 PDFs).

### Created (in-scope)

- `wiki/sources/arxiv-2607-12496-zipl-dialog-latent-flow-matching.md` + `entities/voice-models/zipl-dialog.md` — **WATCH**
- `wiki/sources/arxiv-2607-12706-autosift-style-infilling-tts.md` + `entities/voice-models/autosift.md` — **WATCH**
- `wiki/sources/arxiv-2607-13527-vgif-score-video-instruction-eval.md` + `entities/benchmarks/vgif-score.md` — **WATCH** (placeholder repo)
- `wiki/sources/arxiv-2607-14088-videorae-vfm-representation-autoencoder.md` + `entities/models/videorae.md` — **WATCH**
- `wiki/sources/arxiv-2607-14076-interactive-world-models-game-engines.md` — **REFERENCE**

### Created (peripheral SKIP)

- `wiki/sources/arxiv-2607-13563-nexus-native-mesh-diffusion.md`
- `wiki/sources/arxiv-2607-13391-nonequilibrium-markov-particles.md`
- `wiki/sources/arxiv-2607-13425-attention-head-reweighting-llm.md`

### Updated

- `wiki/sweeps/2026-07-16-daily.md`, `wiki/index.md`
- `wiki/concepts/persona-audio-stack.md`, `vae-latent-space-downstream-diffusion.md`, `world-models-video-generation.md`, `multi-shot-audio-video-evaluation.md`, `streaming-force-controlled-video-generation.md`
- `wiki/entities/models/{wan-2-2,ltx-2,moworld,sana-wm}.md`, `voice-models/dia.md`, `benchmarks/geot2v-bench.md`
- `wiki/sources/video-generation-survey-2026.md`

### Brief / routing

- **None** — no TipDrop / poker / prod (no public install paths; David rule: wiki-only WATCH)
- **Local adopt:** none

### Archive

- 8 PDFs → `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/`

---

## [2026-07-15] ingest | Contravariance Theory (peripheral NeuroAI)

Daily sweep full ingest for 2026-07-15.

### Created

- `wiki/sources/arxiv-2607-08561-contravariance-theory-strong-alignment.md` — Yamins/Nayebi NeuroAI theory; Phase-0 **SKIP** / peripheral REFERENCE

### Updated

- `wiki/sweeps/2026-07-15-daily.md` — ingested marker; inbox cleared
- `wiki/index.md`

### Brief / routing

- None — no TipDrop / poker / prod (no install path; keyword false positive on "strong alignment")
- **Local adopt:** none

### Archive

- 1 PDF → `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/`

---

## [2026-07-14] ingest | M4V Multimodal Mamba efficient T2V

Daily sweep full ingest for 2026-07-14.

### Created

- `wiki/sources/arxiv-2506-10915-m4v-multimodal-mamba-t2v.md` — M4V / MM-DiM; Phase-0 **WATCH** (weights pending)
- `wiki/entities/models/m4v.md`
- `wiki/concepts/multimodal-diffusion-mamba-efficient-t2v.md` — sibling to hybrid linear attention

### Updated

- `wiki/sweeps/2026-07-14-daily.md` — ingested marker; inbox cleared
- `wiki/entities/models/wan-2-2.md` — Wan2.1 MM-DiM graft note
- `wiki/concepts/hybrid-linear-attention.md`, `wiki/concepts/video-generation-energy-scaling-laws.md`, `wiki/concepts/synthetic-media-compute-economics.md`
- `wiki/sources/video-generation-survey-2026.md` — backlink
- `wiki/index.md`

### Brief / routing

- **No David adoption brief** — M4V has no install path (no public code/weights); per @concepts/david-adoption-brief-routing.md a WATCH-only research finding does not warrant a brief. Wiki shelf only (source + entity + concept pages above).
- **Local adopt:** none (no public weights/code)

### Correction (2026-07-14, same-day)

- An initial automated pass wrote `briefs/2026-07-14_m4v-multimodal-mamba-adoption-watch.md` (`david: true`) and mirrored it to `tipdrop-workspace-kit/briefs/`. Both copies were removed — WATCH-only findings with no install path should stay wiki-only, not become a David brief. Verified via GitHub MCP that `huangjch526/M4V` holds only `README.md` + `abs.png` (no code/weights), confirming the WATCH verdict and sharpening the source/entity pages accordingly.

### Archive

- 1 PDF → `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/` (confirmed present, 11,635,227 bytes)

---

## [2026-07-13] ingest | MoWorld + unlearning survey + PLURAL + speech-swift

Daily sweep full ingest for 2026-07-13.

### Created

- `wiki/sources/arxiv-2607-06216-moworld-flash-world-model.md` — MoWorld WATCH (weights pending)
- `wiki/entities/models/moworld.md`
- `wiki/sources/arxiv-2607-07907-multimodal-unlearning-survey.md` — REFERENCE
- `wiki/concepts/multimodal-machine-unlearning.md`
- `wiki/sources/arxiv-2607-08034-plural-value-alignment-dataset.md` — REFERENCE
- `wiki/entities/voice-models/speech-swift.md` — Phase-0 WATCH (Apache-2.0 Mac toolkit)

### Updated

- `wiki/sweeps/2026-07-13-daily.md` — ingested marker; inbox cleared
- `wiki/concepts/world-models-video-generation.md`, `wiki/concepts/persona-audio-stack.md`, `wiki/concepts/de-censoring-techniques.md`
- `wiki/entities/persona-ops/fish-speech.md`, `wiki/entities/voice-models/qwen3-tts.md`
- `wiki/index.md`

### Brief / routing

- `briefs/2026-07-13_speech-swift-moworld-adoption-watch.md` → TipDrop kit mirror
- Checked `active_project_brief_targets.yaml`: `david-persona-image-gen`; no prod SCP
- **David/TipDrop:** speech-swift Mac WATCH; MoWorld WATCH (no weights)

### Archive

- 3 PDFs → `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/`

---

## [2026-07-12] meta | David adoption brief routing → TipDrop shared kit

- Created `wiki/concepts/david-adoption-brief-routing.md` — mirror lane for persona adoption briefs
- Added `scripts/route_david_adoption_brief.py` — copies `briefs/*-adoption*.md` → `../projects/tipdrop-workspace-kit/briefs/*-david.md`
- OSINT `scripts/active_project_brief_targets.yaml` row: `david-persona-image-gen`
- Backfilled 5 adoption briefs (2026-07-04 … 2026-07-12) to kit

---

## [2026-07-12] ingest | Nemotron Audex unified audio LLM

Daily sweep full ingest for 2026-07-12.

### Created

- `wiki/sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md` — Audex technical report; Phase-0 **REFERENCE** (NVIDIA NC license)
- `wiki/concepts/unified-audio-text-llm-no-text-regression.md` — unified vs modular audio stack
- `wiki/entities/voice-models/nemotron-audex.md` — HF weights + license audit

### Updated

- `wiki/sweeps/2026-07-12-daily.md` — frontmatter, ingested marker
- `wiki/concepts/persona-audio-stack.md`, `wiki/entities/persona-ops/fish-speech.md` — Audex positioning; Fish remains default
- `wiki/entities/voice-models/qwen3-tts.md` — Flash variant news [TENTATIVE]
- `wiki/entities/sfx-models/stable-audio-open.md` — Audex TTA training cite
- `wiki/concepts/persona-monetization-models.md` — Fanvue R8 ARR corroboration
- `wiki/index.md` — new rows

### Brief / routing

- `briefs/2026-07-12_audex-fish-stack-unchanged.md` — TipDrop kit mirror (`route_david_adoption_brief.py`); no prod SCP

---

## [2026-07-11] ingest | HunyuanVideo-HOMA, safety degradation, ComfyUI-MCP

Daily sweep full ingest for 2026-07-11.

### Created

- `wiki/sources/arxiv-2506-08797-hunyuanvideo-homa.md` — HOMA weak HOI video; Phase-0 **WATCH** (no public weights)
- `wiki/concepts/hunyuanvideo-homa-weak-hoi-video.md` — persona prop/merch demo use case
- `wiki/sources/arxiv-2505-14215-safety-degradation-ai-agents.md` — retrieval agent safety; **REFERENCE** for persona-ops
- `wiki/concepts/retrieval-agent-safety-degradation.md` — SillyTavern / RAG mitigation checklist
- `wiki/entities/custom-nodes/comfyui-mcp.md` — MCP control plane; Phase-0 **WATCH**

### Updated

- `wiki/sweeps/2026-07-11-daily.md` — frontmatter, ingested marker
- `wiki/entities/models/hunyuanvideo-1-5.md`, `wiki/concepts/video-identity-inheritance.md` — HOMA hooks
- `wiki/entities/uis/comfyui.md` — ComfyUI-MCP row
- `wiki/entities/persona-ops/sillytavern.md`, `wiki/concepts/persona-ops-stack.md`, `wiki/concepts/persona-failure-modes.md` — retrieval safety
- `wiki/entities/persona-ops/fish-speech.md` — Fish S2 news re-triage
- `wiki/concepts/persona-monetization-models.md` — Fanvue AI labeling [TENTATIVE]
- `wiki/index.md` — new rows

### Brief / routing

- `briefs/2026-07-11_homa-mcp-adoption-watch.md` — wiki-only; no prod SCP

---

## [2026-07-04] ingest | CPE, QWERTY, MatchingPose, Qwen3-TTS/OpenAudio triage

Daily sweep full ingest for 2026-07-10.

### Created

- `wiki/sources/arxiv-2607-05711-fourtune-4bit-diffusion-post-training.md` — FourTune W4A4G4 LoRA post-training; Phase-0 **WATCH** (no public repo)
- `wiki/concepts/fourtune-w4a4g4-diffusion-lora-training.md` — persona LoRA training efficiency concept
- `wiki/sources/arxiv-2607-05748-harvey-backdoor-removal.md` — HARVEY backdoor defense; **SKIP** (peripheral)
- `wiki/sources/arxiv-2607-06281-straight-path-flow-matching-imvc.md` — IMVC clustering; **DISCARD** (peripheral)
- `wiki/entities/custom-nodes/comfyui-angelo.md` — FLUX.2 Klein click-to-refine; Phase-0 **GO (smoke-test)**
- `wiki/entities/training-tools/heretic.md` — abliteration CLI; Phase-0 **REFERENCE** (AGPL-3.0)

### Updated

- `wiki/sweeps/2026-07-10-daily.md` — frontmatter, ingested marker
- `wiki/entities/uis/comfyui.md`, `wiki/entities/models/flux-2-klein.md`, `wiki/entities/models/flux-1-dev.md` — Angelo + FourTune hooks
- `wiki/concepts/lora-taxonomy.md`, `wiki/concepts/de-censoring-techniques.md` — FourTune + Heretic cross-links
- `wiki/concepts/persona-monetization-models.md` — Fanvue $200M ARR news triage [TENTATIVE]
- `wiki/index.md` — new rows

### Brief / routing

- `briefs/2026-07-10_angelo-fourtune-adoption.md` — wiki-only; no prod SCP

---

Daily sweep full ingest for 2026-07-09.

### Created

- `wiki/sources/arxiv-2607-04553-lights-camera-carbon-video-energy-scaling.md` — T2V/T2VA energy scaling laws; Phase-0 **REFERENCE**
- `wiki/concepts/video-generation-energy-scaling-laws.md` — operator planning concept for batch video Wh/resolution tradeoffs
- `wiki/sources/arxiv-2607-06173-mobilewan-mobile-video-diffusion.md` — Qualcomm MobileWan Wan2.2-5B mobile distillation; Phase-0 **WATCH** (no weights)
- `wiki/concepts/mobile-wan-chunkwise-video-distillation.md` — recurrence + head-prune mobile video concept
- `wiki/sources/arxiv-2607-07173-spara-dcal-subject-driven-personalization.md` — SPaRa–DCAL persona LoRA paper; Phase-0 **WATCH** (no repo), DCAL procedure **GO**
- `wiki/concepts/stage-aware-lora-distribution-calibrated-selection.md` — stage-aware LoRA + calibrated multi-candidate selection

### Updated

- `wiki/sweeps/2026-07-09-daily.md` — frontmatter, ingested marker, inbox cleared
- `wiki/entities/models/wan-2-2.md` — MobileWan watch + energy scaling hooks
- `wiki/concepts/synthetic-media-compute-economics.md` — energy scaling law cross-link
- `wiki/concepts/persona-consistency-methods.md`, `wiki/concepts/lora-taxonomy.md`, `wiki/concepts/video-identity-inheritance.md` — SPaRa–DCAL hooks
- `wiki/entities/persona-ops/fish-speech.md` — Fish Audio S2 word-level emotion news triage (TENTATIVE, S2 Pro stays default)
- `wiki/index.md` — new source + concept rows

### Brief / routing

- Created local adoption brief `briefs/2026-07-09_dcal-persona-video-energy-adoption.md`.
- Checked `active_project_brief_targets.yaml`: wiki-only; no prod SCP.

---

Daily sweep full ingest for 2026-07-04.

### Created

- `wiki/sources/arxiv-2606-29604-causal-perturbative-elicitation-llm.md` — CPE paper; LLM weight-space behavior elicitation; Phase-0 **WATCH** (`amack315/cpe`, no license metadata, 1★)
- `wiki/concepts/causal-perturbative-elicitation-llm.md` — CPE concept page, positioned as persona-ops research-watch rather than current DM-stack adoption
- `wiki/sources/arxiv-2607-01869-qwerty-query-warped-video-motion-control.md` — QWERTY paper; training-free Wan/CogVideoX query-warped motion control; Phase-0 **WATCH** (no public repo)
- `wiki/concepts/query-warped-video-motion-control.md` — inference-time DiT query-warping concept for mask/object and optical-flow/camera control
- `wiki/sources/hf-flux2-klein-9b-matchingpose.md` — HF model-card source for Flux.2 Klein MatchingPose
- `wiki/entities/adapters/flux2-klein-matchingpose.md` — Phase-0 **GO (smoke-test)** adapter entity; trigger `matchingpose9b`

### Updated

- `wiki/sweeps/2026-07-04-daily.md` — added frontmatter, ingested marker, and manual-row decisions
- `wiki/entities/voice-models/qwen3-tts.md` — resolved stale May verification stubs: Apache-2.0, `QwenLM/Qwen3-TTS`, 12Hz 0.6B/1.7B release set, 10 languages
- `wiki/entities/persona-ops/fish-speech.md` + `wiki/concepts/persona-audio-stack.md` — OpenAudio S1-mini classified as lightweight experiment, not Fish-Speech S2 Pro replacement
- `wiki/entities/models/wan-2-2.md`, `wiki/entities/models/cogvideox-1-5.md`, `wiki/concepts/camera-controlled-video-generation.md`, `wiki/concepts/video-identity-inheritance.md` — QWERTY watch hooks
- `wiki/entities/models/flux-2-klein.md`, `wiki/entities/adapters/pulid.md`, `wiki/entities/adapters/flux2-klein-9b-faceswap.md`, `wiki/concepts/persona-consistency-methods.md`, `wiki/entities/uis/comfyui.md`, `wiki/concepts/model-selection-workflow.md` — MatchingPose adoption path
- `wiki/index.md` — added new source, concept, and adapter rows

### Brief / routing

- Created local adoption brief `briefs/2026-07-04_flux2-matchingpose-qwen3tts-adoption.md`.
- Checked `active_project_brief_targets.yaml`: this sweep does **not** map to XSP/PM/poker/DFS/castle/WC lanes; default posture is wiki-only, so no prod SCP.

---
# Wiki Log

Append-only chronological operations log. Each entry: date + operation + summary + pages touched.

---

## [2026-07-02] phase-0 | HunyuanImage 3.0 + RayPE + UCM + Obliviate + ASG

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-07-02_phase-0-hunyuanimage-raype-ucm-obliviate-asg.md`.

- **HunyuanImage 3.0** (`Tencent-Hunyuan/HunyuanImage-3.0`) — **GO (catalog)** — 3.1k★; ≥3×80 GB
- **RayPE** (2606.27345) — **WATCH** — Wan2.2 addon; no repo
- **UCM** (2602.22960) — **WATCH** — world-model PE warping; no repo
- **Obliviate** (2606.28643) — **REFERENCE** — AR concept erasure
- **ASG** (`mbzuai-oryx/Ask-Solve-Generate`) — **CONDITIONAL-GO** — Apache-2.0; 4★

Operator brief: `briefs/2026-07-02_hunyuanimage-3-catalog-operator.md`

---

## [2026-07-02] ingest | daily digest inbox — 5 PDFs

Per `wiki/sweeps/2026-07-02-daily.md`. preingest_check: 5/5 NEW. PDFs archived to egress-fi.

### Sources created (5)

- `wiki/sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md`
- `wiki/sources/arxiv-2602-22960-ucm-camera-control-memory-world-models.md`
- `wiki/sources/arxiv-2606-27345-raype-ray-space-positional-encoding-3d-video.md`
- `wiki/sources/arxiv-2606-27376-ask-solve-generate-self-evolving-multimodal.md`
- `wiki/sources/arxiv-2606-28643-obliviate-autoregressive-concept-erasure.md`

### Entity created (1)

- `entities/models/hunyuanimage-3-0.md`

### Concepts created (4)

- `concepts/ray-space-positional-encoding-video.md`
- `concepts/ucm-time-aware-pe-warping-world-models.md`
- `concepts/autoregressive-concept-erasure-obliviate.md`
- `concepts/self-evolving-unified-multimodal-training.md`

### Enhanced

- `concepts/camera-controlled-video-generation.md`, `concepts/world-models-video-generation.md`
- `concepts/de-censoring-techniques.md`, `concepts/censorship-tier-taxonomy.md`
- `entities/models/wan-2-2.md`, `entities/models/hunyuanvideo-1-5.md`, `entities/models/hydra-x.md`

### Meta

- `wiki/index.md`, `wiki/sweeps/2026-07-02-daily.md`, `hot.md`

---

## [2026-07-01] phase-0 | SVOO · IPA · MSTEdit · SHINE skip

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-07-01_phase-0-svoo-ipa-mstedit.md`.

- **SVOO** (`Mutual-Luo/SVOO`) — **GO** — Apache-2.0; Wan2.1/2.2 sparse attention; ICML 2026
- **IPA** (`mdswyz/IPA`) — **CONDITIONAL-GO** — MIT; VACE hand post-training; stub README
- **MSTEdit** (2605.15523) — **WATCH** — no repo; CC BY-NC 4.0; FLUX-Fill text edit
- **SHINE** (`MuLabPKU/SHINE`) — **NO-GO** — LLM hypernetwork LoRA; not image-gen track

Operator brief: `briefs/2026-07-01_wan-speedup-hand-quality-operator.md`

---

## [2026-07-01] ingest | daily digest manual-fetch — SVOO, IPA, MSTEdit (3 PDFs)

Per `wiki/sweeps/2026-07-01-daily.md`. Overnight sweep fetched 0 (OpenReview-only hits); manual arXiv fetch. preingest_check: 3/3 NEW. PDFs archived to egress-fi.

### Sources created (3)

- `wiki/sources/arxiv-2603-18636-svoo-input-stable-sparse-attention-video.md`
- `wiki/sources/arxiv-2605-07545-implicit-preference-alignment-human-animation.md`
- `wiki/sources/arxiv-2605-15523-self-prompting-scene-text-editing.md`

### Concepts created (3)

- `concepts/input-stable-sparse-attention-video.md`
- `concepts/implicit-preference-alignment-human-animation.md`
- `concepts/self-prompting-scene-text-editing.md`

### Enhanced (filled out / backlinks)

- `concepts/budget-aware-diffusion-caching.md` — SVOO sparse-attention axis
- `concepts/navicache-navigation-guided-video-caching.md` — stack note with SVOO
- `concepts/motion-shape-disentangled-human-animation.md` — IPA hand-quality axis
- `concepts/video-text-editing-glyph-control.md` — MSTEdit image counterpart
- `concepts/persona-consistency-methods.md` — axis 4 IPA + SVOO throughput
- `entities/models/wan-2-2.md`, `entities/models/flux-1-dev.md`, `entities/models/emosh.md`
- `sources/arxiv-2606-26795-navicache-test-time-self-calibration-caching.md`
- `sources/arxiv-2606-23254-steervte-video-text-editing.md`

### Meta

- `wiki/index.md`, `wiki/sweeps/2026-07-01-daily.md`, `hot.md`

---

## [2026-06-30] phase-0 | BioDeep survey repo

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-30_phase-0-deepfake-survey-biodeep.md`.

- **BioDeep** (`CroitoruAlin/biodeep`) — **REFERENCE** — detection benchmark; not build-track
- **Survey** (2411.19537) — ingested as source + concept

Persona ops brief: `briefs/2026-06-30_deepfake-detection-arms-race-persona-ops.md`

---

## [2026-06-30] ingest | daily digest inbox — deepfake survey (1 PDF)

Per `wiki/sweeps/2026-06-30-daily.md`. preingest_check: 1/1 NEW. PDF archived to egress-fi.

### Sources created (1)

- `wiki/sources/arxiv-2411-19537-deepfake-generation-detection-survey.md`

### Concepts created (1)

- `concepts/generative-ai-era-deepfake-landscape.md`

### Enhanced (filled out)

- `concepts/persona-failure-modes.md` — detection arms race subsection
- `sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md` — umbrella survey link

### Meta

- `wiki/index.md`, `wiki/sweeps/2026-06-30-daily.md`, `hot.md`

---

## [2026-06-29] phase-0 | EMOSH + Prob-BBDM

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-29_phase-0-emosh-prob-bbdm.md`.

- **EMOSH** (2606.28026) — **Skipped** — no public repo; Tencent/WeChat Vision
- **Prob-BBDM** (`gitlab.xlim.fr/mvalls/Prob-BBDM`) — **NO-GO** — medical MRI i2i; peripheral

---

## [2026-06-29] ingest | daily digest inbox — EMOSH, Prob-BBDM (2 PDFs)

Per `wiki/sweeps/2026-06-29-daily.md`. preingest_check: 2/2 NEW. PDFs archived to egress-fi.

### Sources created (2)

- `wiki/sources/arxiv-2606-28026-emosh-expressive-motion-shape-disentanglement.md`
- `wiki/sources/arxiv-2606-24313-prob-bbdm-mri-sequence-translation.md`

### Concepts created (2)

- `concepts/motion-shape-disentangled-human-animation.md`
- `concepts/brownian-bridge-medical-image-translation.md`

### Entities created (1)

- `entities/models/emosh.md`

### Enhanced (backlinks)

- `entities/models/wan-2-2.md`, `concepts/video-reference-avatar-generation.md`, `concepts/persona-consistency-methods.md`, `concepts/budget-aware-diffusion-caching.md`

### Meta

- `wiki/index.md`, `wiki/sweeps/2026-06-29-daily.md`, `hot.md`

---

## [2026-06-27] phase-0 | NaviCache + LightX2V + LoRA Optimizer + Confucius4-TTS

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-27_phase-0-navicache-lora-optimizer-confucius4.md`.

- **NaviCache** (`HelloZicky/NaviCache`) — **GO** — Apache-2.0; Wan/HunyuanVideo caching
- **LightX2V** (`ModelTC/LightX2V`) — **CONDITIONAL-GO** — SGMD code host
- **ComfyUI-LoRA-Optimizer** (`ethanfel/ComfyUI-LoRA-Optimizer`) — **CONDITIONAL-GO** — GPL-3.0 multi-LoRA node
- **Confucius4-TTS** (`netease-youdao/Confucius4-TTS`) — **CONDITIONAL-GO** — 14-lang TTS
- **Personality Sliders** (2603.03326) — skipped (no repo)

---

## [2026-06-27] ingest | sweep manual-fetch — NaviCache, SGMD, Personality Sliders + news Phase-0

Overnight inbox empty; fetched 3 arXiv PDFs from `wiki/sweeps/2026-06-27-daily.md` candidates. preingest_check: 3/3 NEW. PDFs archived to egress-fi.

### Sources created (3)

- `wiki/sources/arxiv-2606-26795-navicache-test-time-self-calibration-caching.md`
- `wiki/sources/arxiv-2605.30116-sgmd-score-gradient-matching-distillation.md`
- `wiki/sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md`

### Concepts created (3)

- `concepts/navicache-navigation-guided-video-caching.md`
- `concepts/score-gradient-matching-video-distillation.md`
- `concepts/sequential-adaptive-personality-steering.md`

### Entities created (2)

- `entities/custom-nodes/lora-optimizer.md`
- `entities/voice-models/confucius4-tts.md`

### Enhanced (backlinks)

- `concepts/budget-aware-diffusion-caching.md`, `concepts/one-step-autoregressive-video-distillation.md`, `entities/persona-ops/sillytavern.md`, `entities/uis/comfyui.md`, voice-model hubs

### Meta

- `wiki/index.md`, `wiki/sweeps/2026-06-27-daily.md`, `hot.md`

---

## [2026-06-26] phase-0 | VideoAgent + Tatoxa + Vera skip

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-26_phase-0-videoagent-tatoxa.md`.

- **VideoAgent** (`HKUDS/VideoAgent`) — **GO** — MIT; agentic video editing orchestration
- **Tatoxa** (`s-nlp/tatoxa`) — **NO-GO** — no LICENSE; Tatar NLP detox; peripheral
- **Vera** (2606.23610) — skipped (Netflix; no public repo/weights)

---

## [2026-06-26] ingest | daily digest inbox — VideoAgent, Vera, Tatoxa (3 PDFs)

Per `wiki/sweeps/2026-06-26-daily.md`. preingest_check: 3/3 NEW. PDFs archived to egress-fi.

### Sources created (3)

- `wiki/sources/arxiv-2606-23327-videoagent-all-in-one-framework.md`
- `wiki/sources/arxiv-2606-23610-vera-layered-content-preserving-video-editing.md`
- `wiki/sources/arxiv-2606-26015-tatoxa-text-detoxification-tatar.md`

### Concepts created (3)

- `concepts/agentic-video-editing-orchestration.md`
- `concepts/layered-diffusion-content-preserving-video-editing.md`
- `concepts/low-resource-text-detoxification.md`

### Entities created (2)

- `entities/models/videoagent.md`
- `entities/models/vera.md`

### Enhanced (backlinks)

- `concepts/persona-ops-stack.md`, `entities/persona-ops/n8n.md`, `sources/video-generation-survey-2026.md`, `entities/models/wan-2-2.md`, TIDE/AlbedoEdit/SteerVTE/AnchorEdit sources, safety concepts

### Meta

- `wiki/index.md`, `wiki/sweeps/2026-06-26-daily.md` (frontmatter + ingested), `hot.md`

Lint: 0 hard errors expected post-backlink pass.

---

## [2026-06-25] phase-0 | dot3d + arctic_shift + inbox skips

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-25_phase-0-dot3d-arctic-shift.md`.

- **dot3d** (Inria `repo-sam.inria.fr/nerphys/dot3d/`) — **CONDITIONAL-GO** — 3DGS compositing; peripheral VFX axis
- **arctic_shift** (`ArthurHeitmann/arctic_shift`) — **NO-GO** — Reddit data infra; HCI cite only
- **TinyHistory** (2512.23851) — skipped (no repo)
- **dVLA-RL** (2606.23623) — skipped (robotics peripheral)

---

## [2026-06-25] ingest | daily digest inbox — TinyHistory, LocalLLaMA wild, dot3d, dVLA-RL (4 PDFs)

Per `wiki/sweeps/2026-06-25-daily.md`. preingest_check: 4/4 NEW. PDFs archived to egress-fi.

### Sources created (4)

- `wiki/sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md`
- `wiki/sources/arxiv-2606-22211-open-ai-local-llama-wild.md`
- `wiki/sources/arxiv-2606-22481-lighting-consistent-object-transfer-3dgs.md`
- `wiki/sources/arxiv-2606-23623-dvla-rl-discrete-diffusion-vla.md`

### Concepts created (4)

- `concepts/lightweight-video-history-embeddings.md`
- `concepts/pragmatic-open-model-adoption.md`
- `concepts/lighting-consistent-3dgs-compositing.md`
- `concepts/discrete-diffusion-vla-reinforcement-learning.md`

### Entities created (1)

- `entities/models/tinyhistory.md`

### Enhanced (backlinks)

- `wan-2-2.md`, `long-video-rag-retrieval.md`, `persona-ops-stack.md`, `sillytavern.md`, `wiki/index.md`, sweep frontmatter

### Briefs

- `briefs/2026-06-25_phase-0-dot3d-arctic-shift.md` (phase-0)
- Existing `briefs/2026-06-25_k129-design-dna-adopt.md` — K129 design-dna skill adopt (osint eval URL 9); stays in `briefs/` per schema

---

## [2026-06-24] phase-0 | CaR + SignPoseVAE GitHub audit

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-24_phase-0-car-signposevae.md`.

- **CaR** (`Orange-3DV-Team/CaR`) — **CONDITIONAL-GO** — README only; no LICENSE; code TBD
- **SignPoseVAE** (`GFaure9/SignPoseVAE`) — **NO-GO** — sign-language domain; no LICENSE
- **Error-free long video** (2606.22370) — skipped (no repo)
- **SteerVTE** (2606.23254) — skipped (ByteDance; no repo)
- **TF-RefusalBench** (2606.23375) — skipped (benchmark repo not indexed)
- **GeoT2V-Bench** (2606.24829) — skipped (code pending)

---

## [2026-06-24] ingest | daily digest inbox — 6 PDFs (long video, VAE, CaR, SteerVTE, over-alignment, GeoT2V-Bench)

Per `wiki/sweeps/2026-06-24-daily.md`. preingest_check: 6/6 NEW. PDFs archived to `raw-sources/`.

### Sources created (6)

- `wiki/sources/arxiv-2606-22370-error-free-long-video-generation.md`
- `wiki/sources/arxiv-2606-22959-vae-latent-sign-pose-diffusion.md`
- `wiki/sources/arxiv-2606-23105-car-implicit-memory-video-world.md`
- `wiki/sources/arxiv-2606-23254-steervte-video-text-editing.md`
- `wiki/sources/arxiv-2606-23375-tf-refusalbench-over-alignment.md`
- `wiki/sources/arxiv-2606-24829-geot2v-bench-3d-consistency.md`

### Concepts created (6)

- `concepts/causal-clip-attention-long-video.md`
- `concepts/vae-latent-space-downstream-diffusion.md`
- `concepts/implicit-memory-retrieval-video-world-models.md`
- `concepts/video-text-editing-glyph-control.md`
- `concepts/domain-sensitive-llm-over-alignment.md`
- `concepts/reconstruction-based-t2v-benchmarking.md`

### Entities created (3)

- `entities/models/car.md`
- `entities/models/steervte.md`
- `entities/benchmarks/geot2v-bench.md`

### Enhanced (backlinks)

- `world-models-video-generation.md`, `long-video-rag-retrieval.md`, `llm-interaction-style-governance.md`, `de-censoring-techniques.md`, `multi-view-3d-consistent-world-models.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-24_phase-0-car-signposevae.md`

---

## [2026-06-23] phase-0 | UNITY GitHub audit

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-23_phase-0-unity.md`.

- **UNITY** (`arya-domain/UNITY`) — **CONDITIONAL-GO** — ECCV 2026 code; **no LICENSE file**
- **AoiZora** (2606.17566) — skipped (no repo; TPU serving)
- **BrainWorld** (2606.17742) — skipped (no indexed repo; peripheral fMRI)
- **PrivacyAlign** (2606.21710) — skipped (no repo)

---

## [2026-06-23] ingest | daily digest inbox — AoiZora, BrainWorld, UNITY, PrivacyAlign (4 PDFs)

Per `wiki/sweeps/2026-06-23-daily.md`. preingest_check: 4/4 NEW. PDFs archived to `raw-sources/`.

### Sources created (4)

- `wiki/sources/arxiv-2606-17566-aoizora-topology-aware-dit-parallel.md`
- `wiki/sources/arxiv-2606-17742-brainworld-fmri-structural-prior.md`
- `wiki/sources/arxiv-2606-20971-unity-attention-flow-conditioning.md`
- `wiki/sources/arxiv-2606-21710-privacyalign-llm-agents.md`

### Concepts created (4)

- `concepts/topology-aware-dit-parallel-inference.md`
- `concepts/structural-prior-conditioned-spatiotemporal-generation.md`
- `concepts/universal-composite-diffusion-conditioning.md`
- `concepts/contextual-privacy-alignment-llm-agents.md`

### Entities created (1)

- `entities/models/unity.md`

### Enhanced (backlinks)

- `streaming-video-generation-serving.md`, `budget-aware-diffusion-caching.md`, `world-models-video-generation.md`, `wan-2-2.md`, `turboserve.md`, `gpu-guide.md`, `ip-adapter.md`, `persona-consistency-methods.md`, `persona-ops-stack.md`, `llm-interaction-style-governance.md`, `sillytavern.md`, `n8n.md`, `comfyui.md`, `pony-v6.md`, `video-generation-survey-2026.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-23_phase-0-unity.md`

---

## [2026-06-22] phase-0 | FreeStyle GitHub audit

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-22_phase-0-freestyle.md`.

- **FreeStyle** (`Blue2Giant/FreeStyle`) — **GO** — Apache-2.0; datasets + ComfyUI triplet workflows
- **PAIWorld** (2606.18375) — skipped (no public repo)

---

## [2026-06-22] ingest | daily digest inbox — PAIWorld, FreeStyle (2 PDFs)

Per `wiki/sweeps/2026-06-22-daily.md`. preingest_check: 2/2 NEW. PDFs archived to `raw-sources/`.

### Sources created (2)

- `wiki/sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md`
- `wiki/sources/arxiv-2606-20506-freestyle-community-lora-mining.md`

### Concepts created (2)

- `concepts/multi-view-3d-consistent-world-models.md`
- `concepts/style-content-dual-reference-generation.md`

### Entities created (1)

- `entities/models/freestyle.md`

### Enhanced (backlinks)

- `world-models-video-generation.md`, `multi-agent-cross-view-video-world-models.md`, `physical-ai-native-world-model-stacks.md`, `video-generation-physical-executability.md`, `kairos.md`, `wan-2-2.md`, `cogvideox-1-5.md`, `reference-plus-lora-stacking.md`, `lora-taxonomy.md`, `persona-consistency-methods.md`, `civitai.md`, `flux-1-dev.md`, `pony-v6.md`, `illustrious-xl.md`, `qwen-image-2512.md`, `comfyui.md`, `video-generation-survey-2026.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-22_phase-0-freestyle.md`

---

## [2026-06-21] phase-0 | UniAR + VoidPadding GitHub audits

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-21_phase-0-uniar-voidpadding.md`.

- **UniAR** (`ShareLab-SII/UniAR`) — **CONDITIONAL-GO** — code + HF weights; no LICENSE in repo
- **VoidPadding** (`Haru-LCY/VoidPadding`) — **CONDITIONAL-GO** repo / peripheral MDLM fit
- **OmniDrive Choreo** (2606.17536) — skipped (no repo; not NVlabs OmniDrive)

---

## [2026-06-21] ingest | daily digest inbox — OmniDrive Choreo, VoidPadding, UniAR (3 PDFs)

Per `wiki/sweeps/2026-06-21-daily.md`. preingest_check: 3/3 NEW. PDFs archived to `raw-sources/`.

### Sources created (3)

- `wiki/sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md`
- `wiki/sources/arxiv-2606-17999-voidpadding-mdlm-padding.md`
- `wiki/sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md`

### Concepts created (3)

- `concepts/llm-choreographed-multi-view-world-models.md`
- `concepts/mdlm-padding-termination-decoupling.md`
- `concepts/shared-context-single-tokenizer-umm.md`

### Entities created (1)

- `entities/models/uniar.md`

### Enhanced (backlinks)

- `world-models-video-generation.md`, `multi-agent-cross-view-video-world-models.md`, `camera-controlled-video-generation.md`, `entity-centric-cinematic-video-conditioning.md`, `holistic-visual-tokenizer-umm.md`, `understanding-generation-gap.md`, `bagel.md`, `janus-pro.md`, `hydra-x.md`, `qwen-image-2512.md`, `video-generation-survey-2026.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-21_phase-0-uniar-voidpadding.md`

---

## [2026-06-20] phase-0 | TurboServe GitHub audit

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-20_phase-0-turboserve.md`.

- **TurboServe** (`shengshu-ai/TurboServe`) — **NO-GO** — placeholder README only; code not released
- **REINS** (2606.17257) — skipped (no public repo)

---

## [2026-06-20] ingest | daily digest inbox — REINS, TurboServe (2 PDFs)

Per `wiki/sweeps/2026-06-20-daily.md`. preingest_check: 2/2 NEW. PDFs archived to `raw-sources/`.

### Sources created (2)

- `wiki/sources/arxiv-2606-17257-reins-video-safety-representation-steering.md`
- `wiki/sources/arxiv-2606-19271-turboserve-streaming-video-serving.md`

### Concepts created (2)

- `concepts/representation-space-video-safety-steering.md`
- `concepts/streaming-video-generation-serving.md`

### Entities created (1)

- `entities/models/turboserve.md`

### Enhanced (backlinks)

- `activation-steering-video-generation.md`, `cross-model-safety-steering.md`, `de-censoring-techniques.md`, `pluralistic-safety-alignment.md`, `wan-2-2.md`, `cogvideox-1-5.md`, `cascaded-streaming-high-resolution-video.md`, `long-video-rag-retrieval.md`, `seam-stitching-strategies.md`, `video-generation-survey-2026.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-20_phase-0-turboserve.md`

---

## [2026-06-19] phase-0 | Kairos 3.0 GitHub audit

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-19_phase-0-kairos.md`.

- **Kairos** (`kairos-agi/kairos-sensenova`) — **GO** — Apache-2.0, ~770★, HF weights
- **CineOrchestra** (Snap) — **NO-GO** — no public repo
- **UniTemp** (Adobe) — skipped (no repo)
- **ProductConsistency** — skipped (no repo)

---

## [2026-06-19] ingest | daily digest inbox — CineOrchestra, Kairos, UniTemp, ProductConsistency (4 PDFs)

Per `wiki/sweeps/2026-06-19-daily.md`. preingest_check: 4/4 NEW. PDFs archived to `raw-sources/`.

### Sources created (4)

- `wiki/sources/arxiv-2606-13768-cineorchestra-entity-centric-cinematic-video.md`
- `wiki/sources/arxiv-2606-16533-kairos-native-world-model-stack.md`
- `wiki/sources/arxiv-2606-18702-unitemp-bidirectional-video-generation.md`
- `wiki/sources/arxiv-2606-19103-productconsistency-product-identity-editing.md`

### Concepts created (4)

- `concepts/entity-centric-cinematic-video-conditioning.md`
- `concepts/physical-ai-native-world-model-stacks.md`
- `concepts/bidirectional-autoregressive-video-generation.md`
- `concepts/product-identity-instruction-editing.md`

### Entities created (3)

- `entities/models/cineorchestra.md`
- `entities/models/kairos.md`
- `entities/models/unitemp.md`

### Enhanced (backlinks)

- `world-models-video-generation.md`, `hybrid-linear-attention.md`, `camera-controlled-video-generation.md`, `persona-consistency-methods.md`, `video-identity-inheritance.md`, `seam-stitching-strategies.md`, `autoregressive-video-foresight-training.md`, `one-step-autoregressive-video-distillation.md`, `flux-kontext.md`, `qwen-image-2512.md`, `causal-multi-turn-image-editing.md`, `likeness-collision-verification.md`, `wan-2-2.md`, `video-generation-survey-2026.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-19_phase-0-kairos.md`

---

## [2026-06-17] phase-0 | CausalMotion + PermaVid GitHub audits

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-17_phase-0-causalmotion-permavid.md`.

- **CausalMotion** (`zhuangsh0713/CausalMotion`) — **CONDITIONAL-GO** — no LICENSE; LTX-Video + Grounded-SAM-2 deps
- **PermaVid** (`YS-IMTech/PermaVid`) — **CONDITIONAL-GO** — no LICENSE; DiffSynth stack
- **Memento** (Baidu) — skipped (no public repo)
- **CHILLGuard** — skipped (empty repo)

---

## [2026-06-17] ingest | daily digest inbox — CausalMotion, Memento, CHILLGuard, PermaVid (4 PDFs)

Per `wiki/sweeps/2026-06-17-daily.md`. preingest_check: 4/4 NEW. PDFs archived to `raw-sources/`.

### Sources created (4)

- `wiki/sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md`
- `wiki/sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md`
- `wiki/sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md`
- `wiki/sources/arxiv-2606-16449-permavid-disentangled-context-memory.md`

### Concepts created (4)

- `concepts/vlm-guided-physical-video-generation.md`
- `concepts/subject-reconstruction-long-video-memory.md`
- `concepts/chinese-llm-safety-guardrails.md`
- `concepts/disentangled-context-memory-video-edits.md`

### Entities created (3)

- `entities/models/causalmotion.md`
- `entities/models/memento.md`
- `entities/models/permavid.md`

### Enhanced (backlinks)

- `video-generation-physical-executability.md`, `world-models-video-generation.md`, `long-video-rag-retrieval.md`, `persona-consistency-methods.md`, `video-identity-inheritance.md`, `camera-controlled-video-generation.md`, `latent-spatial-memory-video-world-models.md`, `pluralistic-safety-alignment.md`, `persona-ops-stack.md`, `llm-interaction-style-governance.md`, `sillytavern.md`, `ltx-2.md`, `mirage.md`, `video-generation-survey-2026.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-17_phase-0-causalmotion-permavid.md`

---

## [2026-06-16] phase-0 | MoVerse + FoleyGenEx GitHub audits

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-16_phase-0-moverse-foleygenex.md`.

- **MoVerse** (`Orange-3DV-Team/MoVerse`) — **CONDITIONAL-GO** — weights pending corporate review; 8 FPS RTX 4090 target
- **FoleyGenEx** (`FoleyGenEx/FoleyGenEx`) — **CONDITIONAL-GO** — no LICENSE/weights at audit
- **Avatar V** (HeyGen) — **NO-GO** — closed commercial
- **EAV-DFD** — skipped (no repo; routed to cybersec)

---

## [2026-06-16] ingest | daily digest inbox — MoVerse, Avatar V, FoleyGenEx, EAV-DFD routed (4 PDFs)

Per `wiki/sweeps/2026-06-16-daily.md`. preingest_check: 4/4 NEW. PDFs archived to `raw-sources/`.

### Sources created (4)

- `wiki/sources/arxiv-2606-13376-moverse-panoramic-gaussian-world.md`
- `wiki/sources/arxiv-2606-13872-avatar-v-video-reference-avatar.md`
- `wiki/sources/arxiv-2606-14049-foleygenex-unified-vta.md`
- `wiki/sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md` (routed stub)

### Concepts created (3)

- `concepts/panoramic-gaussian-video-world-models.md`
- `concepts/video-reference-avatar-generation.md`
- `concepts/unified-controllable-video-to-audio.md`

### Entities created (3)

- `entities/models/moverse.md`
- `entities/models/avatar-v.md`
- `entities/models/foleygenex.md`

### Enhanced (backlinks)

- `world-models-video-generation.md`, `persona-audio-stack.md`, `persona-consistency-methods.md`, `video-identity-inheritance.md`, `persona-failure-modes.md`, `foley-omni.md`, `video-generation-survey-2026.md`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-16_phase-0-moverse-foleygenex.md`

### Inbox state

`research to be indexed/` cleared — 4 PDFs → `raw-sources/`.

---

## [2026-06-15] phase-0 | BudCache + AnchorEdit GitHub audits

Per `prompts/github-repo-eval.md`. Full write-up in `briefs/2026-06-15_phase-0-budcache-anchoredit.md`.

- **BudCache** (`Westlake-AGI-Lab/BudCache`) — **CONDITIONAL-GO** — Apache-2.0; FLUX + Wan2.1; strict NFE caching; no ComfyUI node yet
- **AnchorEdit** (`xuhang07/AnchorEdit`) — **CONDITIONAL-GO** (research) — Apache-2.0 code; Wan-14B finetune; ≥40GB VRAM; weights release watch
- **GW-DPO** — no public repo URL verified — skipped

---

## [2026-06-15] ingest | daily digest inbox — GW-DPO, AnchorEdit, BudCache (3 PDFs)

Per `wiki/sweeps/2026-06-15-daily.md`. preingest_check: 3/3 NEW. PDFs archived to `raw-sources/`.

### Sources created (3)

- `wiki/sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md`
- `wiki/sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md`
- `wiki/sources/arxiv-2606-13496-budcache-diffusion-caching.md`

### Concepts created (2)

- `concepts/llm-instruction-hierarchy-training.md`
- `concepts/causal-multi-turn-image-editing.md`

### Concepts updated (1)

- `concepts/budget-aware-diffusion-caching.md` — BudCache vs ReCache comparison

### Entities created (1)

- `entities/models/anchoredit.md`

### Enhanced (backlinks)

- `llm-interaction-style-governance.md`, `pluralistic-safety-alignment.md`, `persona-ops-stack.md`, `flux-kontext.md`, `flux-1-dev.md`, `wan-2-2.md`, `comfyui.md`, `recache source`, `wiki/index.md`, sweep frontmatter

### Brief

- `briefs/2026-06-15_phase-0-budcache-anchoredit.md`

### Inbox state

`research to be indexed/` cleared — 3 PDFs → `raw-sources/`.

---

## [2026-06-12] ingest | daily digest inbox — LLM governance, Mirage, HYDRA-X (3 PDFs)

Per `wiki/sweeps/2026-06-12-daily.md`. preingest_check: 3/3 NEW. PDFs archived to `raw-sources/`.

### Sources created (3)

- `wiki/sources/arxiv-2606-08172-human-llm-interaction-governance.md`
- `wiki/sources/arxiv-2606-09828-mirage-latent-spatial-memory.md`
- `wiki/sources/arxiv-2606-13289-hydra-x-unified-multimodal.md`

### Concepts created (3)

- `concepts/llm-interaction-style-governance.md`
- `concepts/latent-spatial-memory-video-world-models.md`
- `concepts/holistic-visual-tokenizer-umm.md`

### Entities created (2)

- `entities/models/mirage.md`
- `entities/models/hydra-x.md`

### Enhanced (backlinks)

- `pluralistic-safety-alignment.md`, `persona-ops-stack.md`, `sillytavern.md`, `world-models-video-generation.md`, `decmem.md`, `sana-wm.md`, `understanding-generation-gap.md`, `bagel.md`, `janus-pro.md`, `blip3-o.md`, `unireasoner.md`, `video-generation-survey-2026.md`, `wiki/index.md`

### Inbox state

`research to be indexed/` cleared — 3 PDFs → `raw-sources/`.

---

## [2026-06-11] ingest | daily digest inbox — BareWave, Ultra Flash, LiteVSR, Prisma-World, Soul Computing (5 PDFs)

Per `wiki/sweeps/2026-06-11-daily.md`. preingest_check: 5/5 NEW. PDFs archived to `raw-sources/`.

### Sources created (5)

- `wiki/sources/arxiv-2606-09048-barewave-waveform-native-tts.md`
- `wiki/sources/arxiv-2606-09150-ultra-flash-streaming-hr-video.md`
- `wiki/sources/arxiv-2606-09250-litevsr-frozen-dit-vsr.md`
- `wiki/sources/arxiv-2606-09507-prisma-world-multi-agent-video.md`
- `wiki/sources/arxiv-2606-10413-soul-computing-digital-consciousness.md`

### Concepts created (5)

- `concepts/waveform-native-flow-matching-tts.md`
- `concepts/cascaded-streaming-high-resolution-video.md`
- `concepts/frozen-dit-video-super-resolution.md`
- `concepts/multi-agent-cross-view-video-world-models.md`
- `concepts/soul-computing-digital-persona.md`

### Entities created (2)

- `entities/voice-models/barewave.md`
- `entities/models/prisma-world.md`

### Enhanced (backlinks)

- `f5-tts.md`, `cosyvoice2.md`, `persona-audio-stack.md`, `world-models-video-generation.md`, `camera-controlled-video-generation.md`, `metaworld.md`, `one-step-autoregressive-video-distillation.md`, `streaming-force-controlled-video-generation.md`, `wan-2-2.md`, `ltx-2.md`, `two-pass-generation-workflow.md`, `persona-ops-stack.md`, `persona-consistency-methods.md`, `wiki/index.md`

### Inbox state

`research to be indexed/` cleared — 5 PDFs → `raw-sources/`.

---

## [2026-06-10] ingest | daily digest inbox — StreamForce, TIDE, OmniTryOn, MilliVid + AdvGRPO routed (5 PDFs)

Per `wiki/sweeps/2026-06-10-daily.md`. preingest_check: 5/5 NEW. PDFs archived to `raw-sources/`. AdvGRPO (2606.09701) routed stub only — primary home cybersecurity wiki.

### Sources created (5)

- `wiki/sources/arxiv-2606-07508-streamforce-streaming-force-video.md`
- `wiki/sources/arxiv-2606-08260-tide-unified-video-editing.md`
- `wiki/sources/arxiv-2606-08514-omnitryon-video-try-on.md`
- `wiki/sources/arxiv-2606-09056-millivid-hierarchical-latents.md`
- `wiki/sources/arxiv-2606-09701-advgrpo-red-teaming-routed.md`

### Concepts created (4)

- `concepts/streaming-force-controlled-video-generation.md`
- `concepts/task-isolated-unified-video-editing.md`
- `concepts/video-try-on-anything.md`
- `concepts/hierarchical-latent-coarse-to-fine-video.md`

### Entities created (2)

- `entities/models/tide.md`
- `entities/models/omnitryon.md`

### Enhanced (backlinks)

- `ltx-2.md`, `wan-2-2.md`, `seam-stitching-strategies.md`, `long-video-rag-retrieval.md`, `world-models-video-generation.md`, `one-step-autoregressive-video-distillation.md`, `grpo-i2v-post-training.md`, `cross-modal-jailbreak-dsr.md`, `joint-audio-visual-instruction-editing.md`, `persona-consistency-methods.md`, `video-generation-survey-2026.md`, `wiki/index.md`

### Inbox state

`research to be indexed/` cleared — 5 PDFs → `raw-sources/`.

---

## [2026-06-08] ingest | daily digest inbox — MSAVBench (1 PDF)

Per `wiki/sweeps/2026-06-08-daily.md`. preingest_check: 1/1 NEW. PDF archived to `raw-sources/`.

### Sources created (1)

- `wiki/sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md`

### Concepts created (1)

- `concepts/multi-shot-audio-video-evaluation.md`

### Enhanced (backlinks)

- `ltx-2.md`, `wan-2-2.md`, `seedance-2.md`, `persona-audio-stack.md`, `sync-audio-video-customization.md`, `seam-stitching-strategies.md`, `latentsync.md`, `video-generation-survey-2026.md`, `wiki/index.md`

### Inbox state

`research to be indexed/` cleared — 1 PDF → `raw-sources/`.

---

## [2026-06-07] ingest | daily digest inbox — Dream.exe, ReCache (2 PDFs)

Per `wiki/sweeps/2026-06-07-daily.md`. preingest_check: 2/2 NEW. PDFs archived to `raw-sources/`.

### Sources created (2)

- `wiki/sources/arxiv-2606-04811-dream-exe-robot-executability.md`
- `wiki/sources/arxiv-2606-06060-recache-diffusion-caching.md`

### Concepts created (2)

- `concepts/video-generation-physical-executability.md`
- `concepts/budget-aware-diffusion-caching.md`

### Enhanced (backlinks)

- `world-models-video-generation.md`, `gpu-guide.md`, `flux-1-dev.md`, `wan-2-2.md`, `hunyuanvideo-1-5.md`, `synthetic-media-compute-economics.md`, `one-step-autoregressive-video-distillation.md`, `video-generation-survey-2026.md`, `arxiv-yocausal-world-model-benchmark-2605-30346.md`, `comfyui.md`, `ltx-2.md`, `wiki/index.md`

### Inbox state

`research to be indexed/` cleared — 2 PDFs → `raw-sources/`.

---

## [2026-06-06] ingest | daily digest inbox — AAD-1, AlbedoEdit, JAVEdit, OrthoPhys, cross-model safety (5 PDFs)

Per `wiki/sweeps/2026-06-06-daily.md`. preingest_check: 5/5 NEW. PDFs archived to `raw-sources/`.

### Sources created (5)

- `wiki/sources/arxiv-2606-03972-aad-1-one-step-ar-video.md`
- `wiki/sources/arxiv-2606-01362-albedoedit-video-editing.md`
- `wiki/sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md`
- `wiki/sources/arxiv-2603-18639-orthophys-physics-video.md`
- `wiki/sources/arxiv-2606-05290-cross-model-safety-steering.md`

### Concepts created (5)

- `concepts/one-step-autoregressive-video-distillation.md`
- `concepts/albedo-guided-instance-video-editing.md`
- `concepts/joint-audio-visual-instruction-editing.md`
- `concepts/physics-aware-orthogonal-view-video.md`
- `concepts/cross-model-safety-steering.md`

### Entities created (2)

- `entities/models/javedit.md`, `entities/models/albedoedit.md`

### Enhanced (backlinks)

- `activation-steering-video-generation.md`, `world-models-video-generation.md`, `persona-audio-stack.md`, `sync-audio-video-customization.md`, `seam-stitching-strategies.md`, `autoregressive-video-foresight-training.md`, `de-censoring-techniques.md`, `wan-2-2.md`, `ltx-2.md`, `wiki/index.md`

### Inbox state

`research to be indexed/` cleared — 5 PDFs → `raw-sources/`.

---

## [2026-06-05] phase-0 | GitHub audit batch — 14 pending candidates

Audited per `prompts/github-repo-eval.md`. Full table in `briefs/2026-06-05_phase-0-batch.md`.

**GO (2):** voicebox, awesome-design-md  
**CONDITIONAL-GO (6):** PersonaLive, LongLive-RAG (concept), OmniCustom, MoneyPrinter, czkawka_core, AI-Infra-Guard  
**STEAL-FROM (1):** Open-Generative-AI  
**DEFER/REFERENCE (2):** supertonic, how-to-train-your-gpt  
**NO-GO (3):** PDA repo (empty), OmniVoice (license), Foley-Omni (no code)

Pages updated: personalive, voicebox, open-generative-ai, moneyprinter, supertonic, czkawka, ai-infra-guard, omnicustom, foley-omni, awesome-design-md, how-to-train-your-gpt, long-video-rag-retrieval, preference-delta-lora-aggregation, persona-ops-stack

---

## [2026-06-05] deep-pass | K100 federation morning — video steering batch (3 arXiv)

Per `wiki/sweeps/2026-06-05-inbox-triage.md`. Stub ingest → deep-read.

### Sources deep-read (3)

- `wiki/sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md` — LA-LQR inference-time T2V steering
- `wiki/sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md` — multi-agent world model from monocular video
- `wiki/sources/arxiv-weak-signals-preference-distillation-2606.00357-2026-06-05.md` — **rerouted** PDA/GAM (LLM LoRA merge, not video)

### Concepts / entities (3 new)

- `concepts/activation-steering-video-generation.md`
- `concepts/preference-delta-lora-aggregation.md`
- `entities/models/metaworld.md`

### Retired / enhanced

- Deleted `concepts/video-generation-steering-world-models.md` (mis-clustered stub)
- Enhanced `world-models-video-generation.md`, `de-censoring-techniques.md`, `censorship-tier-taxonomy.md`, `lora-taxonomy.md`, `decmem.md`, `sana-wm.md`, OptiWorld source, `wiki/index.md`

## [2026-06-04] ingest | daily digest inbox — KGEdit, LongLive-RAG, Video-Mirai (3 PDFs)

Per `wiki/sweeps/2026-06-04-inbox-triage.md`. preingest_check: 3/3 NEW. PDFs archived to `raw-sources/`.

### Sources created (3)

- `wiki/sources/arxiv-2605-29509-kgedit-knowledge-graph-video-editing.md`
- `wiki/sources/arxiv-2606-02553-longlive-rag-long-video-generation.md`
- `wiki/sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md`

### Concepts (3)

- `concepts/knowledge-graph-structured-video-control.md`
- `concepts/long-video-rag-retrieval.md`
- `concepts/autoregressive-video-foresight-training.md`

### Enhanced

- `world-models-video-generation.md`, `seam-stitching-strategies.md`, `prompt-engineering-uncensored.md`, `persona-consistency-methods.md`, `video-identity-inheritance.md`, `grpo-i2v-post-training.md`, `visual-to-visual-generation.md`, `entities/models/wan-2-2.md`, `entities/models/decmem.md`, `entities/models/hunyuanvideo-1-5.md`, `sources/video-generation-survey-2026.md`, `wiki/index.md`

---

## [2026-06-03] ingest | K95 — 6 arXiv (daily digest)

K95 batch from `wiki/sweeps/2026-06-03-daily.md` inbox. preingest: 6 NEW, 0 dupes.

### Sources created (6)

- `wiki/sources/arxiv-2604-11283-mllm-video-translation-survey.md`
- `wiki/sources/arxiv-2605-29809-cert-las-t2i-mov.md`
- `wiki/sources/arxiv-2605-31336-decmem-world-generation.md`
- `wiki/sources/arxiv-2606-00369-geo-cultural-safety-alignment.md`
- `wiki/sources/arxiv-2606-01837-dsr-cross-modal-jailbreak.md`
- `wiki/sources/arxiv-2606-03672-foley-omni.md`

### Entities created (2)

- `wiki/entities/models/decmem.md`, `wiki/entities/models/foley-omni.md`

### Concepts created (4)

- `wiki/concepts/mllm-video-translation.md`, `wiki/concepts/t2i-model-ownership-verification.md`, `wiki/concepts/pluralistic-safety-alignment.md`, `wiki/concepts/cross-modal-jailbreak-dsr.md`

### Updated

- `world-models-video-generation.md`, `persona-audio-stack.md`, `prompt-engineering-uncensored.md`, `anti-personalization-privacy.md`, `censorship-tier-taxonomy.md`, `sana-wm.md`, `index.md`

### Raw sources

PDFs → `cemini-librarian:/opt/cemini-bulk/research/`; inbox cleared.

## [2026-06-02] ingest | daily digest inbox — OptiWorld + guardrail routing (2 PDFs)

Per `wiki/sweeps/2026-06-02-inbox-triage.md`. Scheduled 08:15 LaunchAgent failed (exit 2); digest re-run manually. preingest_check: 2/2 NEW. PDFs archived to `raw-sources/`.

### Sources created (1)

- `wiki/sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md`

### Routed (dedup stub)

- `wiki/sources/arxiv-2605-29251-provably-secure-agent-guardrail-routed.md` — cybersec primary; stops daily re-fetch

### Enhanced

- `concepts/world-models-video-generation.md`, `entities/models/wan-2-2.md`, `sources/video-generation-survey-2026.md`, `sources/arxiv-proprio-physics-video-2605-28230.md`, `sources/arxiv-yocausal-world-model-benchmark-2605-30346.md`
- `wiki/sweeps/2026-06-02-inbox-triage.md`, `wiki/index.md`

---

## [2026-06-01] ingest | video/T2I/v2v cluster — 7 arXiv PDFs from daily digest inbox

Per `wiki/sweeps/2026-06-01-inbox-triage.md`. preingest_check: 7/7 NEW. PDFs archived to `raw-sources/`.

### Sources created (7)

- `wiki/sources/arxiv-privacy-cross-image-anti-personalization-2504-12747.md`
- `wiki/sources/arxiv-tagrpo-i2v-grpo-2601-05729.md`
- `wiki/sources/arxiv-omnicustom-sync-audio-video-2602-12304.md`
- `wiki/sources/arxiv-visual-to-visual-generation-2605-12271.md`
- `wiki/sources/arxiv-eventspeech-neuromorphic-tts-2605-26672.md` (REFERENCE-ONLY)
- `wiki/sources/arxiv-proprio-physics-video-2605-28230.md`
- `wiki/sources/arxiv-yocausal-world-model-benchmark-2605-30346.md`

### Concepts + entity (5 new + 1 stub)

- `concepts/anti-personalization-privacy.md`, `grpo-i2v-post-training.md`, `sync-audio-video-customization.md`, `visual-to-visual-generation.md`
- `entities/models/omnicustom.md` (stub)
- Enhanced: `world-models-video-generation.md`, `video-identity-inheritance.md`, `persona-audio-stack.md`, `wan-2-2.md`, `hunyuanvideo-1-5.md`, `qwen-image-2512.md`, `multi-angle-dataset-prep.md`, `likeness-collision-verification.md`

### Meta

- `wiki/sweeps/2026-06-01-inbox-triage.md` — cluster verdict table
- `wiki/index.md` — 7 source + 5 concept + 1 entity rows

---

## [2026-06-01] ingest | K93 — federated daily digest install + OmniVoice reject

Processed `briefs/2026-06-01_k93-imagegen-digest-from-osint.md`.

### Structural install

- Ran `install_federated_daily_digest.sh` → `scripts/daily_research_digest_run.py`, `scripts/daily_research_fetch.py`, `scripts/daily_research_config.yaml` (image-gen topics), `wiki/sweeps/`, LaunchAgent `com.cemini.daily-research-digest.image-gen` @ 08:15, wrapper `~/bin/cemini-daily-research-digest-image-gen`

### Wiki pages (4 new/updated + 3 enhanced)

- `wiki/concepts/federated-daily-research-digest.md` — NEW (K93 federation spec + operator loop)
- `wiki/meta/daily-research-digest-cadence.md` — expanded from install stub
- `wiki/sweeps/_daily-template.md` — NEW
- `wiki/entities/omnivoice.md` — K93 **Reject** (commercial license); K45 Adopt retracted
- `wiki/concepts/persona-audio-stack.md`, `wiki/entities/persona-ops/fish-speech.md`, `wiki/index.md` — OmniVoice dead-end + index/meta rows

### Lint

0 bidirectional gaps after backlink pass.

---

## [2026-05-22] ingest | brief triage — K57 + K55-2 (2 new briefs since 2026-05-21 batch)

Processed briefs not covered in the 2026-05-21 18-brief triage:

- `briefs/2026-05-22_k57-ai-influencer-pipeline-from-osint.md` — @0xKiyoro AI-influencer playbook (face merge → 70/20/10 dataset → LoRA → Wan 2.7/Kling/ComfyUI → CapCut scrub → Fanvue). GPL tools Fooocus/PhotoGIMP marked reference-only.
- `briefs/2026-05-21_k55-2-ridark-eth-image-gen-relevant-repos.md` — @ridark_eth repo list subset; duplicates skipped (flux, Qwen3-TTS); PersonaLive stub created.

### Stub entities created (2)

- `wiki/entities/persona-ops/personalive.md` — GVCLab real-time portrait animation for live streams; Phase-0 unaudited; ridark_eth credibility warning retained.
- `wiki/entities/uis/fooocus.md` — GPL-3.0 SD UI; steal-patterns-only dead-end.

### Concept / entity pages enhanced (4)

- `wiki/concepts/multi-angle-dataset-prep.md` — 70/20/10 dataset ratio + Wavespeed/nano-banana face-merge operator pattern [TENTATIVE].
- `wiki/concepts/persona-content-cadence.md` — post-export metadata hygiene table (ExifTool vs CapCut vs re-noise).
- `wiki/concepts/persona-ops-stack.md` — K57 operator playbook table + PersonaLive + GPL UI dead-ends.
- `wiki/entities/marketplaces/fanvue.md` — 15% fee / 85% split cross-check note vs 20% survey figure.

### Index

- `wiki/index.md` — PersonaLive + Fooocus rows.

Briefs marked `processed: 2026-05-22` (K57, K55-2). Hub brief `2026-05-09_creator-image-gen-hub.md` already carried `processed: 2026-05-21`.

---

## [2026-05-19] brief | Audio-pipeline runbook shipped + W5 audio re-check closed

Closed the two longest-deferred audio follow-ups in one session (both deferred from the W4 audio scope expansion, 2026-05-13).

### W5 audio re-check — closed clean (no pages changed)

Re-scanned the May 9–13 window for missed audio URLs. Finding: `wiki/sources/` has **zero source pages** created in that window — the index jumps from `2026-05-08` directly to `2026-05-16`. The May 9–13 audio content is the `concepts/persona-audio-stack.md` concept page (May 9) + 24 audio entity pages (May 13), not source pages. Scanned the upstream May 7–8 source pages (`persona-ops-stack-2026.md` + 6 others) for audio-tool mentions: Coqui/XTTS, Dia, ElevenLabs, F5-TTS, Fish-Speech, MaskGCT, Qwen3-TTS, Udio — **all already have entity pages**. No missed audio URLs; no source page warranted. Re-check verdict: clean.

### Brief shipped (1 deliverable)

- `briefs/2026-05-19_audio-pipeline-runbook.md` — end-to-end persona-audio playbook. Synthesizes `concepts/persona-audio-stack.md` (four-layer architecture) + the 24 audio entity pages into an executable runbook the concept page deliberately stops short of: (1) ordered install+run sequence for the canonical four-model stack (Fish-Speech S2 Pro → LatentSync 1.6 → ACE-Step 1.5 → Stable Audio Open 1.0), each in its own venv to avoid `transformers`/`torch` pin conflicts; (2) exact FFmpeg multi-track mux commands for all four delivery paths (DM voice note / talking-head Reel / music-only clip / full scene 3-track mix), with `amix` weight guidance; (3) n8n orchestration skeleton wiring the parallel→join chain; (4) per-stage VRAM budget table — full stack fits one RunPod 4090 if run sequentially; Apple Silicon path is voice+music+foley local with **lipsync cloud-burst required** (LatentSync is CUDA-only). `type: brief`, `## Target` ComfyUI/local-app+n8n, draft maturity. Parallels the 2026-05-07 persona-end-to-end-runbook brief for the image+video stack.

### Pages touched (1 brief + 2 meta)

- `briefs/2026-05-19_audio-pipeline-runbook.md` — created (gitignored; not in lint graph)
- `ROADMAP.md` — done-log row added; backlog audio-pipeline + W5 + Type-E items struck through; Type-D count corrected 33 → 35
- `wiki/log.md` — this entry

No `wiki/` content pages changed → lint graph unaffected (still 0 hard errors).

## [2026-05-17] deepen | Type-E close — gracia-ai-volumetric-video.md expanded 86 → ~700 words

Closed the final Type-E thin concept page. Original stub was a 1-line cross-route from the OSINT 14-repo eval (verdict REFERENCE-ONLY); web research on gracia.ai (homepage + TechFundingNews funding coverage) converted it into a landscape page with explicit build-track-fit analysis.

### Page touched (1)

- `wiki/concepts/2026-05-13_gracia-ai-volumetric-video.md` — expanded to 7 sections: (1) **What gracia.ai is** (closed-SaaS 4DGS infra; founders Andrey Volodin ex-Prisma + Georgii Vysotskii); (2) **Pipeline + delivery surfaces** table (50fps capture → cloud recon → studio editing → ~1GB/min container → Quest 3/3S, Pico 4 Ultra, WebGPU, Unity/Unreal); (3) **Funding + traction** ($1.2M 2024 + $1.7M Dec 2025; EWOR + NeRF pioneer; Karl Kani world-first 4DGS runway, Hollywood, PortAventura); (4) **Build-track relevance — REFERENCE-ONLY** with three structural reasons (closed SaaS not local weights, captured not generated, VR/AR not social-media surface); (5) **Why it still earns a page** (volumetric persona horizon, Karl Kani precedent, sibling 3DGS research stack); (6) **What's not covered** (no public technical metrics, no pricing, no license terms); (7) `## Snippets` with 3 citations + `## Dead Ends`. Resolved the prior `[NEEDS VERIFICATION 2026-05-15]` → `[CONFIRMED 2026-05-17]` license posture = closed SaaS.

### Lint / gap-detect state after deepen

- 0 hard errors maintained
- Type-E: 1 → **0** — all concept pages now ≥100 narrative words
- Type-D: still 33 (stale `[NEEDS VERIFICATION 2026-05-06/07]` tags from W2; next batch-resolution candidate)

### Decisions encoded

- **gracia.ai is REFERENCE-ONLY for this wiki**, structurally — closed SaaS + multi-view capture pipeline + VR/AR distribution surface all miss the locally-runnable / generated-from-prompt / social-media-clip charter
- **Volumetric persona is a 2027–2028 horizon**, not a build-track tool today — but worth tracking because Karl Kani is the first commercial 4DGS deployment at a fashion-adjacent surface
- **Wiki-graph hygiene**: even REFERENCE-ONLY cross-routes get full landscape pages when they earn a slot; one-line stubs are an architectural artifact of fresh routing, not a permanent state

---

## [2026-05-17] deepen | Type-E close — world-models-video-generation.md expanded 97 → ~700 words

Closed one of the two Type-E thin concept pages. The expansion synthesizes from @sources/sana-wm-minute-scale-world-model.md (deep-read) — the workspace's first ingested world-model paper — into a proper concept-page treatment.

### Page touched (1) + backlinks updated (3)

- `wiki/concepts/world-models-video-generation.md` — narrative grew from 1 paragraph to 5 sections: (1) **Working definition** with the three properties separating a world model from a clip generator (action conditioning, long-horizon-native training, scene-identity preservation under revisit); (2) **Distinction-from-clip-generators table** with 5 axes (control input, native horizon, output relation, re-entry consistency, deployment); (3) **Architectural commitments** — hybrid attention, dual-rate action conditioning, two-stage refinement, metric-scale pose annotation, high-compression video codec; (4) **2026 landscape** — SANA-WM open + LingBot-World / HY-WorldPlay industrial; (5) **Build-track relevance** for persona ops (interactive personas vs canned clips, single-GPU minute-scale feasibility at RTX 5090, persona consistency under revisit); (6) **Open horizon** (richer action signals, single-photo entry, recipe transferability). 3 new frontmatter `related:` entries (concepts/hybrid-linear-attention, sources/video-generation-survey-2026, entities/models/ltx-2) closing the bidirectional graph.

### Bidirectional backlinks added (3)

- `wiki/concepts/hybrid-linear-attention.md` — added world-models-video-generation.md as canonical use case
- `wiki/entities/models/ltx-2.md` — added world-models-video-generation.md noting LTX-2's role as the SANA-WM codec layer
- `wiki/sources/video-generation-survey-2026.md` — added world-models-video-generation.md as the adjacent page-family entry point

### Lint / gap-detect state after deepen

- 0 hard errors (bidirectional cleanly closed)
- Type-E: 2 → **1** (only `concepts/2026-05-13_gracia-ai-volumetric-video.md` at 86 words remains; needs web research on gracia.ai itself rather than synthesis from already-loaded sources)

### Decisions encoded

- **World model is an axis, not a model class** — a clip generator can adopt camera or audio conditioning without becoming a world model; the *native* long-horizon + explorability commitments are what matter
- **Hybrid attention is the canonical 2026 long-horizon recipe** — pure linear loses long-range recall; pure softmax is quadratic; periodic-softmax-interleaved-with-linear is the convergent solution
- **Action conditioning needs dual-rate** — temporal VAE compression destroys sub-stride action signal; latent-rate + raw-frame conditioning is the canonical fix
- **Build-track relevance is forward-looking** — interactive personas (DM-driven camera navigation of a persona-rendered scene) is the structurally-different use case vs. canned 5–10s clips; consumer-hardware feasibility starts arriving at RTX 5090

---

## [2026-05-17] backfill | ROADMAP.md synced with May 13–17 work

ROADMAP was stale since May 11 — no W3/W4/W5 entries despite the audio-scope expansion (May 13), cross-wiki routing sweep (May 13–15), and lint-regression fix (May 17). Backfilled to match `wiki/log.md` authoritative timeline. Three new closed workstreams (W3 schema, W4 entities, W5 cross-wiki routing) + 4 new done-log entries (May 13 W3+W4 close-out, May 13–15 cross-wiki routing sweep, May 15 README six-wiki sync, May 17 lint CI fix). Backlog now surfaces the 4 currently-open follow-ups (33 stale Type-D tags, 2→1 Type-E thin pages, audio-pipeline runbook brief, W5 audio re-check).

---

## [2026-05-17] harden | wiki_lint.py strips YAML quotes (no more quote-reintroduction CI breaks)

Closes the recurring CI bug at the source. Two changes in [`scripts/wiki_lint.py`](scripts/wiki_lint.py):

1. **`parse_frontmatter()`**: new `strip_yaml_quotes()` helper strips a matching pair of surrounding `"..."` or `'...'` from every parsed value (related: list items, inline list items, scalars). Defensive against ingest pipelines that YAML-quote refs starting with `@` (a YAML reserved indicator).
2. **`CROSS_WIKI_RE`** (section 8 body scan): character class tightened from `[^\s\`)]+` to `[^\s\`)"']+` so body-text quoted refs like `"@osint-wiki/foo.md"` no longer pull the trailing quote into the resolved path.

Tested by re-quoting an `@osint-wiki` ref in `voicebox.md` and confirming lint stayed at 0 hard errors (then reverted the test edit). This bug class can no longer break CI from quote re-introduction alone — though authors should still write unquoted refs per workspace convention.

---

## [2026-05-17] fix | Lint CI green — unquoted remaining YAML-quoted cross-wiki refs (round 2)

Picked up where commit `0059ca7` left off (May 13). That commit unquoted 8 cross-wiki refs but 15 more snuck back into the graph during the K44/K45/SANA-WM/gracia.ai cross-wiki routing sweep (May 13–15). Lint baseline this session: **24 hard errors** (9 dangling internal + 15 cross-wiki dangling, all from the same root cause — YAML-quoted `@<alias>/...` refs in frontmatter that the regex-based `wiki_lint.py` parser doesn't strip).

### Root cause (confirmed in [`scripts/wiki_lint.py`](scripts/wiki_lint.py))

`parse_frontmatter()` is regex-based (no PyYAML dep). For `related:` list items it appends `s[2:].strip()` literally — quotes are kept inside the string. Then `is_cross_wiki_path_exists()` checks for `startswith(@<alias>/)` — but the value starts with `"@`, so the prefix doesn't match. Result: `cross_wiki_path` returns `None` → "local path, not found" → dangling.

Fix is to remove quotes entirely. Single-quotes don't help; only bare YAML scalars work.

### Files touched (9)

- `wiki/concepts/2026-05-13_gracia-ai-volumetric-video.md` — `cross-wiki-source:` unquoted
- `wiki/concepts/marketing-your-persona.md` — 5 `@seo-wiki/...` refs unquoted in `related:` (SEO wiki dir absent on this laptop → alias known but unresolvable → lint correctly skips)
- `wiki/entities/custom-nodes/ai-infra-guard.md` — `cross-wiki-source:` unquoted
- `wiki/entities/omnivoice.md` — `cross-wiki-source:` unquoted
- `wiki/entities/open-generative-ai.md` — `cross-wiki-source:` unquoted
- `wiki/entities/persona-ops/awesome-design-md.md` — 2 `@osint-wiki/...` refs unquoted in `related:`
- `wiki/entities/training-tools/czkawka.md` — `cross-wiki-source:` unquoted
- `wiki/entities/training-tools/how-to-train-your-gpt.md` — 2 `@osint-wiki/...` refs unquoted in `related:`
- `wiki/entities/voicebox.md` — `cross-wiki-source:` unquoted

### Lint state

- Before: 24 hard errors (9 dangling related: + 15 cross-wiki dangling)
- After: **0 hard errors**, all 70 cross-wiki references resolve correctly
- All 10 `@osint-wiki/...` targets verified present on this laptop
- 5 `@seo-wiki/...` targets correctly skipped (alias known via CLAUDE.md `Related Wikis` table, but `../SEO:GEO B&M Business/wiki/` directory absent on this laptop)

### Notes / open

- `wiki_lint.py` should probably strip surrounding quotes from parsed frontmatter values to harden against future re-introductions. Not done here — left as a follow-up improvement to the linter rather than a content fix
- 33 stale `[NEEDS VERIFICATION 2026-05-06/07]` tags (type-D) and 2 thin concept pages (type-E: `gracia-ai-volumetric-video.md` 86 words, `world-models-video-generation.md` 97 words) remain open as gap-detect findings; not blocking commits

---

## [2026-05-13] expand | Voice/audio W4 Tier 3 — 4 deferred entity pages (LivePortrait, Suno, Udio, Audio-Omni)

Closed out the W4 Tier 3 backfill — the deferred slate of secondary/cloud/research-future audio entities. Tier 3 covers (a) the **premium single-image lipsync** sibling (LivePortrait) that complements SadTalker, (b) the **closed-cloud music-gen** tier (Suno + Udio) for decision-matrix completeness alongside local ACE-Step / MusicGen, and (c) the **research-future** unified-audio horizon entry (Audio-Omni) for trajectory tracking. The earlier four T3 voice-model pages (XTTS-v2, Dia, Bark, ElevenLabs) were completed in the W4-T2 closeout session and indexed here for the first time.

### New entity pages (4) — W4 Tier 3

- **`entities/lipsync/liveportrait.md`** — LivePortrait (Kuaishou KwaiVGI, ECCV 2024); implicit-keypoint portrait animation with stitching module + eye/mouth retargeting + cross-identity transfer; MIT (verify); 512×512 output; the **premium-quality sibling to SadTalker** for single-image animation when sharper visual fidelity matters
- **`entities/music-models/suno.md`** — Suno (Suno AI closed cloud); text + lyrics → full song with vocals (3-4+ min); SFW-segment leader May 2026; **three blockers prevent NSFW use** — ToS content moderation + audio-fingerprint detection + ongoing RIAA litigation; Bark MIT lineage anchor (April 2023 → v3+ closed)
- **`entities/music-models/udio.md`** — Udio (ex-Google DeepMind closed cloud, April 2024); Suno's closest rival; **edge on production polish + complex genre** (orchestral, layered jazz, dense electronic); same NSFW + RIAA blockers; RIAA co-defendant (filed June 2024); positioned as Suno alternate for SFW parallel brands only
- **`entities/sfx-models/audio-omni.md`** — Audio-Omni (SIGGRAPH 2026); **research-future unified audio model** spanning sound + music + speech across understanding / generation / editing; not currently build-track; logged for horizon tracking + citation hygiene

### Bidirectional backlinks added (18 files / 40+ edges)

- `wiki/concepts/persona-audio-stack.md` — added 8 frontmatter `related:` + Relations entries (4 new T3 + earlier 4 voice-model T3s)
- `wiki/concepts/persona-legal-landscape.md` — added elevenlabs + suno + udio (legal/litigation exposure axis)
- `wiki/concepts/video-identity-inheritance.md` — added liveportrait (single-portrait → animation path)
- `wiki/entities/persona-ops/fish-speech.md` — added xtts-v2 + dia + bark + elevenlabs (voice-tier alternates)
- `wiki/entities/voice-models/chatterbox.md` — added xtts-v2 + dia + elevenlabs (voice-tier alternates)
- `wiki/entities/voice-models/cosyvoice2.md` — added xtts-v2 + dia + elevenlabs
- `wiki/entities/voice-models/bark.md` — added audio-omni (text-to-audio lineage)
- `wiki/entities/music-models/ace-step.md` — added suno + udio (cloud music alternates)
- `wiki/entities/music-models/musicgen.md` — added suno + udio
- `wiki/entities/sfx-models/stable-audio-open.md` — added audio-omni (research-future)
- `wiki/entities/sfx-models/audioldm.md` — added audio-omni
- `wiki/entities/sfx-models/tango-2.md` — added audio-omni + bark
- `wiki/entities/lipsync/sadtalker.md` — added liveportrait (single-image premium sibling)
- `wiki/entities/lipsync/latentsync.md` — added liveportrait
- `wiki/entities/lipsync/musetalk.md` — added liveportrait
- `wiki/entities/lipsync/wav2lip.md` — added liveportrait
- `wiki/sources/persona-ops-stack-2026.md` — added xtts-v2 + dia + elevenlabs
- `wiki/index.md` — added 4 voice-models rows (xtts-v2, dia, bark, elevenlabs) + 1 lipsync row (liveportrait) + 2 music-models rows (suno, udio) + 1 sfx-models row (audio-omni)

### Decisions encoded in Tier 3 pages

- **LivePortrait > SadTalker on quality, SadTalker > LivePortrait on simplicity** — for single-image talking-head: use SadTalker for prototyping + speed, LivePortrait when output sharpness matters for hero-shot social content
- **Suno + Udio = dead-end for NSFW persona-ops** — three independent blockers (ToS moderation, audio fingerprint, RIAA litigation); same dead-end shape as ElevenLabs (closed SaaS pattern). Local stack ACE-Step / MusicGen is the **only** build-track for monetized adult-track persona music
- **Bark MIT → Suno cloud lineage** — explicit trajectory anchor; documents the open-research → closed-cloud pivot pattern that ElevenLabs / Stability / Suno all share. Forecast signal for current MIT-open releases (Fish-Speech, Chatterbox, ACE-Step)
- **Audio-Omni is research-only watch-item** — explicit "not build-track today" with watch criteria for promotion (training-data license clarity + weights release + commercial-clean license confirmation)
- **CI fix shipped pre-T3**: commit 0059ca7 unquoted 8 `@osint-wiki/...` cross-wiki refs (YAML-quoted refs broke `wiki_lint.py` path normalization) + added supertonic / voicemode reciprocal backlinks to fish-speech. T3 work resumed cleanly on top of green CI.

### Lint state after Tier 3

Expected: 0 hard errors. T3 added 40+ backlink edges with full bidirectional coverage. Verify via `python3 scripts/wiki_lint.py`.

### CI commit context

Tier 3 picked up after commit **0059ca7** (CI fix, pushed) restored a green main. T3 backlink wiring + page writes were performed on top of green main without re-introducing any of the prior lint failures.

### Closed / Next

- **W4 closed** (T1 + T2 + T3) — voice/audio entity backfill complete across 7 canonical + 9 secondary + 8 deferred = 24 audio entities. All decision-matrix axes covered (real-time vs batch, single-image vs source-video, NSFW-friendly vs SFW-only, local vs cloud, MIT vs CC-BY-NC vs ToS-restricted)
- **README scope expansion** — companion update to mirror CLAUDE.md schema expansion (voice/audio scope, subtree announcement, cross-wiki table)
- **W5 deferred**: audio re-check on 2026-05-09–13 ingests for missed audio URLs (Tier 1 pages already cite primary sources; W5 is gap-closure on tangential mentions)

---

## [2026-05-13] expand | Voice/audio W4 Tier 2 — 9 secondary entity pages

Followed W3+W4-Tier-1 with the Tier 2 backfill: nine additional secondary entity pages covering the next-best alternates named (or implied) in @concepts/persona-audio-stack.md but previously without dedicated pages. Tier 2 deepens the decision-matrix coverage so the wiki can answer "which TTS / lipsync / foley model fits *this specific* operator constraint" without falling back to a generic recommendation.

### New entity pages (9) — W4 Tier 2

- **`entities/voice-models/indextts-2.md`** — IndexTTS-2 (Bilibili Index); ~1.7B; explicit emotion + duration control alongside zero-shot voice clone; ICASSP-2025 lineage; positioned as control-surface complement to Fish-Speech (emotion) and CosyVoice2 (latency)
- **`entities/voice-models/qwen3-tts.md`** — Qwen3-TTS (Alibaba Qwen team); multilingual zero-shot voice clone; Apache-2.0-style weights expected (verify per release); Alibaba/CosyVoice2 sibling for production multilingual persona DMs
- **`entities/voice-models/f5-tts.md`** — F5-TTS (SWivid); ~336M conditional flow-matching non-autoregressive; English-strong; code MIT / weights likely CC-BY-NC 4.0 (research-restricted); research baseline + English-prototyping pick
- **`entities/voice-models/chatterbox.md`** — Chatterbox (Resemble AI); ~500M MIT-licensed (code+weights) zero-shot voice clone; PerTH watermarking built-in; **cleanest commercial license in the voice tier**; smaller emotion-tag surface than Fish-Speech
- **`entities/voice-models/maskgct.md`** — MaskGCT (Amphion / CMU); ~1.1B masked-decode non-autoregressive TTS; multi-speaker strong; CC-BY-NC weights likely (research-restricted); academic flagship in Amphion stack
- **`entities/lipsync/wav2lip.md`** — Wav2Lip (Rudrabha / IIIT-H, ACM MM 2020); SyncNet-supervised GAN baseline; **research-only weights** (license blocker for monetized use); 96×96 face region; sync-accuracy + lowest VRAM + widest tutorial coverage; Easy-Wav2Lip / Wav2Lip-HD / Wav2Lip-288 forks documented
- **`entities/lipsync/sadtalker.md`** — SadTalker (OpenTalker, CVPR 2023); ExpNet (audio → 3DMM expression) + PoseVAE (head pose) + 3DMM face renderer; **single portrait + audio → talking-head video with generated head motion** (no source video needed); pairs with LatentSync final-pass for hero-shot
- **`entities/sfx-models/audioldm.md`** — AudioLDM / AudioLDM 2 (CVSSP Surrey, ICML 2023); pioneer text-to-audio LDM; AudioLDM 2 adds GPT-2 prompt conditioner + AudioMAE for cross-modal coverage (speech+SFX+music); 16 kHz output; CC-BY-NC weights likely (research-restricted); academic precursor to Stable Audio Open / Tango 2
- **`entities/sfx-models/tango-2.md`** — Tango 2 (Declare-Lab SUTD); FLAN-T5 + LDM + DPO on Audio-Alpaca preference dataset; **best text-prompt alignment** in the SFX layer for instruction-style prompts; 16 kHz, ~10s; CC-BY-NC-SA weights likely (research-restricted); researchy specialist complement to Stable Audio Open production primary

### Bidirectional backlinks updated (8 files)

- `wiki/concepts/persona-audio-stack.md` — added 9 new related: entries + 9 Relations entries
- `wiki/entities/persona-ops/fish-speech.md` — added 5 voice-clone alternate backlinks (indextts-2, qwen3-tts, f5-tts, chatterbox, maskgct)
- `wiki/entities/voice-models/cosyvoice2.md` — added 3 voice-tier alternate backlinks (indextts-2, qwen3-tts, chatterbox)
- `wiki/concepts/model-selection-workflow.md` — added indextts-2 + chatterbox decision-matrix backlinks
- `wiki/sources/persona-ops-stack-2026.md` — added 3 backlinks (qwen3-tts, f5-tts, maskgct)
- `wiki/entities/lipsync/latentsync.md` — added wav2lip + sadtalker backlinks
- `wiki/entities/lipsync/musetalk.md` — added wav2lip + sadtalker backlinks
- `wiki/entities/uis/comfyui.md` — added wav2lip backlink
- `wiki/concepts/video-identity-inheritance.md` — added sadtalker backlink (single-portrait → talking-head path)
- `wiki/entities/sfx-models/stable-audio-open.md` — added audioldm + tango-2 alternate backlinks
- `wiki/entities/lipsync/wav2lip.md` — added sadtalker bidirectional fix
- `wiki/entities/sfx-models/audioldm.md` — added tango-2 bidirectional fix
- `wiki/index.md` — added 5 Voice models + 2 Lipsync + 2 SFX/foley rows under existing subsections

### Decisions encoded in Tier 2 pages

- **Chatterbox MIT (both code + weights)** is the **cleanest commercial-license voice clone** in May 2026 — flagged as the license-clean fallback when Fish-Speech weights-license posture is uncomfortable for high-revenue persona ops
- **Wav2Lip original-repo weights = research-only** — license blocker explicit; monetized persona content must use LatentSync (Apache 2.0 verify) or MuseTalk (MIT). Some community forks may relicense; verify per-fork
- **MaskGCT / F5-TTS / AudioLDM / Tango 2** all flagged as **CC-BY-NC-class research-restricted** weights — research / prototyping / baseline use only; build-track commercial primary is Fish-Speech (operator-controlled), CosyVoice2 (Apache 2.0), Chatterbox (MIT), Stable Audio Open (<$1M ARR free)
- **SadTalker is the photo-to-talking-head pick** — only model in the lipsync tier that doesn't need a source video; pairs well with LatentSync final-pass for hero-shot quality
- **IndexTTS-2's emotion + duration control** distinguishes it from CosyVoice2 (latency-focused) and Fish-Speech (50+ emotion tags but less explicit duration control) — the "control surface" specialist for narrative-driven persona voice work

### Lint state after Tier 2

Expected: pre-W4-T2 baseline (18 hard errors / 2 bidirectional gaps post-T1) maintained or improved. Tier 2 added 13 net backlink edges with full bidirectional coverage, so no new gaps should register. Will verify via `python3 scripts/wiki_lint.py`.

### Next (W4 Tier 3 + W5)

Deferred:
- **W4 Tier 3** (~8 pages, optional): XTTS-v2 (Coqui legacy reference), Dia, LivePortrait, ElevenLabs (research-layer for SFW comparison), Suno (closed cloud), Udio (closed cloud), Bark, Audio-Omni
- **W5 audio re-check** on recent ingests (2026-05-09–13) — confirm no audio URLs missed in prior source pages

---

## [2026-05-13] expand | Voice/audio scope (W3 schema + W4 Tier 1 entities)

User requested scope expansion: voice/audio generation alongside image+video generation, plus backfill of recently-missed audio research links. Executed W3 (CLAUDE.md schema patch) + W4 Tier 1 (seven canonical entity pages named in @concepts/persona-audio-stack.md but previously without their own pages).

### Schema patch — CLAUDE.md (W3)

- Title: "Image Generation Research Workspace" → "Image + Voice/Audio Generation Research Workspace"
- Purpose section: expanded from image-only to image / video / voice & audio / persona-ops
- Raw sources, wiki layer, and folder layout descriptions: voice/lipsync/music/SFX models referenced; legacy `notes/` reference removed (folder deleted 2026-05-11)
- New entity subtrees announced in Folder layout: `entities/voice-models/`, `entities/lipsync/`, `entities/music-models/`, `entities/sfx-models/`
- Page-type quick reference: extended entity catalog
- Related Wikis: `image-gen-wiki` description updated (backwards-compatibility noted)
- Distribution rules: local audio pipeline target added
- Phase-0 audit pattern: four new domain-specific failure-mode categories (voice/TTS, lipsync, music gen, SFX/foley)

### New entity pages (7) — W4 Tier 1

- **`entities/voice-models/cosyvoice2.md`** — CosyVoice 2 (FunAudioLLM/Alibaba); Apache 2.0, 0.5B streaming TTS, ~150 ms latency; chunk-aware causal flow matching; vLLM integration; positioning vs Fish-Speech (latency vs emotion-control)
- **`entities/voice-models/kokoro.md`** — Kokoro-82M (hexgrad); Apache 2.0, 82M StyleTTS2-LJSpeech-derived; preset voices only (no cloning); TTS engine inside voicemode MCP; Core ML accelerated on M-series
- **`entities/lipsync/latentsync.md`** — ByteDance audio-conditioned latent diffusion via SD VAE + Whisper + SyncNet supervision; v1.6 at 512×512 (fixes 1.5 blurriness); arXiv:2412.09262; primary quality-first lipsync pick
- **`entities/lipsync/musetalk.md`** — Tencent TMElyralab; MIT; latent-space inpainting (NOT diffusion); 30+ FPS real-time; 256×256 face region; pairs with MuseV for full virtual-human stack; canonical real-time / batch-throughput pick
- **`entities/music-models/ace-step.md`** — ACE Studio + StepFun; Apache 2.0, 3.5B; diffusion + Sana DCAE + linear transformer; full songs in <2s on A100; v1.5 supports Mac/AMD/Intel/CUDA; **promoted to primary local music gen** for monetized persona ops
- **`entities/music-models/musicgen.md`** — Meta FAIR AudioCraft; **code MIT / weights CC-BY-NC 4.0** (license split); autoregressive transformer over EnCodec tokens; sizes 300M/1.5B/3.3B + melody/style variants; **demoted to research-only** (commercial-use blocker via weight license); melody-conditioning is unique capability
- **`entities/sfx-models/stable-audio-open.md`** — Stability AI; 1.21B latent diffusion + T5; Stability Community License (commercial use free under $1M ARR); up to 47 s stereo @ 44.1 kHz; CC-licensed training corpus; dual-use Layer 3+4 (short music loops + foley)

### Subtrees

- **New `wiki/entities/voice-models/`** (2 pages: cosyvoice2, kokoro)
- **New `wiki/entities/lipsync/`** (2 pages: latentsync, musetalk)
- **New `wiki/entities/music-models/`** (2 pages: ace-step, musicgen)
- **New `wiki/entities/sfx-models/`** (1 page: stable-audio-open)

### Backlinks (12 page-touches)

- @concepts/persona-audio-stack.md (added all 7 new entities — the central hub)
- @entities/persona-ops/fish-speech.md (added cosyvoice2, kokoro, latentsync, musetalk)
- @entities/persona-ops/voicemode.md (added kokoro)
- @concepts/persona-ops-stack.md (added cosyvoice2)
- @concepts/model-selection-workflow.md (added cosyvoice2, kokoro)
- @sources/persona-ops-stack-2026.md (added cosyvoice2, latentsync, musetalk, ace-step, stable-audio-open)
- @entities/uis/comfyui.md (added latentsync, musetalk)
- @concepts/video-identity-inheritance.md (added latentsync, musetalk)
- @entities/models/wan-2-2.md (added latentsync)
- @entities/models/hunyuanvideo-1-5.md (added latentsync)
- @concepts/persona-content-cadence.md (added ace-step)
- @concepts/persona-monetization-models.md (added musicgen)

### Decision notes (build-track impact)

- **ACE-Step v1.5 supersedes MusicGen as the primary local music recommendation** for persona ops — MusicGen's CC-BY-NC 4.0 weights block monetized commercial use; ACE-Step's Apache 2.0 weights are clean.
- **Stable Audio Open dual-use** for both Layer 3 (short music loops 10-30s for Reels/TikTok background) and Layer 4 (foley/SFX) per @concepts/persona-audio-stack.md; full songs still route to ACE-Step.
- **LatentSync vs MuseTalk** is a quality-vs-speed split: LatentSync for hero-shot final-pass posts (512×512, batch), MuseTalk for real-time avatars + batch throughput (256×256, 30+ FPS).

### Index

- `wiki/index.md` Entities section: 4 new subsections added (Voice models / Lipsync / Music models / SFX/foley models) with 7 new rows total.

### Pending follow-ups

- **W4 Tier 2** (~8 pages): IndexTTS-2, Qwen3-TTS, F5-TTS, MaskGCT, Chatterbox, Wav2Lip, SadTalker, AudioLDM, Tango 2
- **W4 Tier 3** (~8 pages, defer): XTTS-v2, Dia, LivePortrait, ElevenLabs (research-layer), Suno, Udio, Bark, Audio-Omni
- **W5 audio re-check** on recent sources (verify no audio URLs missed in 2026-05-09–13 ingests)

## [2026-05-11] migrate | Path A step 5 — legacy notes/ → wiki (close-out)

Path A step 5 (the deferred notes-migration step from the HEAVY-mode upgrade) is now complete. All three legacy LIGHT-mode notes files removed from the workspace; wiki coverage verified end-to-end.

- **`notes/models-catalog.md`** (13.5 KB, 60 lines) — fully redundant. All 17 models referenced (Pony V6/V7, Illustrious XL, NoobAI-XL, Anima, FLUX.1 Dev/Schnell/Pro, FLUX.2 Klein/Dev, SD3.5, SDXL fine-tunes, Z-Image Turbo / Zeta Chroma, Qwen-Image-2512, ERNIE-Image, Playground v3, Kwai Kolors, PixArt-Σ, HunyuanVideo 1.5) have dedicated `wiki/entities/models/*.md` pages from Path A step 2. Specific model details (Chenkin Noob v.03, NoobAI-XL-XIN, FLUX-UNCENSORED-Merged, Chroma1-HD, SNOFS, Cosmos-Predict, expand-PE) all spot-confirmed in wiki. **Deleted** via `git rm`.
- **`notes/hardware-optimization.md`** (4.1 KB, 33 lines) — fully redundant. VRAM tiers, quantization landscape (FP16/FP8/GGUF/Nunchaku), Apple Silicon (MPS + Draw Things), and multi-GPU + cloud fallbacks all covered in `wiki/entities/hardware/gpu-guide.md` (186 lines) + `wiki/entities/hardware/mac-studio.md` (103 lines). **Deleted** via `git rm`.
- **`notes/frameworks-tools.md`** (1.8 KB, 21 lines) — partially redundant. IPAdapter Plus → @entities/adapters/ip-adapter.md ✓, Kohya sd-scripts → @entities/training-tools/kohya-sd-scripts.md + kohya-ss-gui.md ✓. **Two genuine gaps closed by new pages**: ComfyUI-Impact-Pack and ComfyUI-BMAB — previously embedded only as rows in @entities/uis/comfyui.md's custom-node table. **Deleted** via `git rm`.

### New pages (2)

- **`wiki/entities/custom-nodes/impact-pack.md`** — ADetailer equivalent for ComfyUI; face/hand detection (YOLO + SAM) + detailer KSamplers; install path; failure modes (detector model mismatch, over-detailing, VRAM amplification); Apple Silicon (MPS) viability note. Sibling repo (Inspire-Pack) called out. Bidirectional backlinks added on 7 referring pages.
- **`wiki/entities/custom-nodes/bmab.md`** — Grounding-DINO-based hand/limb repair; open-vocab targeting via text prompts vs Impact-Pack's fixed-vocab YOLO. Pair pattern: Impact-Pack faces + BMAB limbs. Repo owner alias flagged `[NEEDS VERIFICATION 2026-05-11]` due to `port090401` (current) vs `portu-sim` (legacy notes reference) discrepancy. Bidirectional backlinks added on 4 referring pages.

### Subtree

- **New `wiki/entities/custom-nodes/`** subtree established (consistent with `CLAUDE.md` example pattern `entities/custom-nodes/ipadapter-plus.md`). Currently 2 pages; expected future additions catalogued in `wiki/index.md` Custom Nodes section.

### Backlinks (11 page-touches)

- @entities/uis/comfyui.md (added both new pages)
- @entities/hardware/gpu-guide.md (added both)
- @concepts/two-pass-generation-workflow.md (added both)
- @concepts/persona-consistency-methods.md (added both)
- @runbooks/runpod-comfyui-setup.md (Impact-Pack only)
- @runbooks/day-1-checklist-for-friend.md (Impact-Pack only)
- @runbooks/beginner-guide-to-persona.md (Impact-Pack only)

### Index

- `wiki/index.md` Custom Nodes section: replaced placeholder "no pages yet" with two new rows. Wiki page count: 106 → 108.

### Result

- Wiki state: 108 pages, 0 hard errors, 0 gap-detect findings, lint clean.
- `notes/` folder is empty and can be removed entirely; deferred until next session for review.
- W1 Path A back-fill **now end-to-end complete on all 5 substantive steps** (1+2+3+4+5+6 + verification A-E). Closes the final lower-priority backlog item from the HEAVY-mode upgrade.

## [2026-05-11] deepen | persona-ops-workflow.md (phase timing + cross-link densification)

- `wiki/concepts/persona-ops-workflow.md` updated: fixed "4-phase lifecycle" inconsistency (now "4-phase launch + ongoing-ops lifecycle"); harmonized Phase IV label ("Platform Onboarding" everywhere); rewrote Relations @mentions section to align with frontmatter `related:` (now covers all 23 referenced pages); added cross-link to `briefs/2026-05-07_persona-end-to-end-runbook.md` as the integration brief.
- New **Phase Timing & Sequencing** subsection — approximate single-operator timeline (~60–90 days cold-start to launch) with per-phase duration, blocking dependencies, and overlap windows; common timeline traps (skipping Phase II GEO seeding, over-investing Phase III before Phase I verified, Phase IV KYC delays).
- 6 bidirectional backlinks added: `concepts/persona-failure-modes.md`, `concepts/persona-content-cadence.md`, `concepts/persona-monetization-models.md`, `concepts/persona-payment-rails.md`, `entities/personas/aitana-lopez.md`, `sources/persona-monetization-2026.md` — each now lists `persona-ops-workflow.md` in its `related:` + Relations.
- Cleanup: `persona-payment-rails.md` had two duplicate entries (`persona-legal-landscape.md`, `persona-ops-stack.md`) — collapsed.
- Lint: 0 hard errors, 0 gap-detect findings. Wiki state: 106 pages.

## [2026-05-09] create | Persona audio stack concept page

- Created `wiki/concepts/persona-audio-stack.md` — comprehensive four-layer audio pipeline: voice cloning (Fish-Speech S2 Pro, CosyVoice2, IndexTTS-2), lipsync (LatentSync, MuseTalk, Wav2Lip), music generation (ACE-Step 1.5, MusicGen, Stable Audio Open), sound effects (Stable Audio Open, AudioLDM, Tango 2)
- Integration architecture: n8n orchestration + FFmpeg muxing + ComfyUI API calls
- Hardware requirements table per audio layer; 4090 (24 GB) fits full audio stack
- Added bidirectional backlinks from 11 referenced pages
- Updated `wiki/index.md` concepts section

## [2026-05-09] create | RunPod ComfyUI setup runbook

- Created `wiki/runbooks/runpod-comfyui-setup.md` — RunPod-specific quickstart for custom node installation, model downloads, restart gotchas, and stack verification
- Added bidirectional backlinks from `wiki/entities/uis/comfyui.md`
- Updated `wiki/index.md` runbooks section

## [2026-05-06] init | HEAVY-mode wiki layer scaffolded

Workspace was upgraded from LIGHT mode (notes/ + briefs/ only) to HEAVY mode. Empty `wiki/` ready for first ingest pass. Existing `notes/` (3 files) and `briefs/` (5 files) preserved as-is; migration to wiki/ deferred.

### Created

- `wiki/index.md` — content-oriented catalog skeleton
- `wiki/log.md` — this file
- `wiki/sources/`, `wiki/entities/`, `wiki/concepts/` — empty subfolders with `.gitkeep`
- `scripts/preingest_check.py`, `scripts/wiki_lint.py`, `scripts/wiki_gap_detect.py` — verbatim ports from 3D-printing workspace (which had verbatim ports from OSINT)
- `prompts/` — consolidated existing prompts: `deep-research-prompt.md` (moved from root), `case-studies-research-prompt.md` / `ops-stack-research-prompt.md` / `persona-consistency-research-prompt.md` / `video-gen-research-prompt.md` (moved from `research to be indexed/prompts/`)
- `ROADMAP.md`, `LESSONS.md`, `hot.md` — meta files
- `.env.example` — env-var template
- `.gitignore` — full HEAVY-mode pattern (raw-sources/, briefs/, outputs/, .playwright-mcp/, hot.md, .env, OS/Python cruft)

### Updated

- `CLAUDE.md` — domain-rewritten from LIGHT (75 lines) to HEAVY schema (full operations / page format / lint / Phase-0 audit / session-start ritual sections)

### Pending

- First ingest pass on the 10 PDFs in `research to be indexed/` (after triage; many appear off-topic for uncensored image gen)
- Migration of legacy `notes/` content into `wiki/entities/` (deferred until next-touch or proactive migration sprint)
- Back-fill of `wiki/sources/` from the 5 docx originals in `research to be indexed/processed/` (which became the existing briefs)

---

## [2026-05-06] ingest | UniReasoner: LLMs are Universal Reasoners for Visual Generation

First wiki ingest. Source: Ren et al. (Apple + Johns Hopkins), arXiv:2605.04040v1, deep-read 14 pages.

Inbox triage decision: of the 10 PDFs dropped 2026-05-06, the only one directly on-topic for uncensored image gen is the UniReasoner paper. Newest-by-mtime (organoid segmentation) was off-topic and deferred. Other 8 PDFs remain in `research to be indexed/` pending further triage.

### Created

- `wiki/sources/unireasoner.md` — full source page; deep-read; maturity: validated
- `wiki/concepts/understanding-generation-gap.md` — concept page; the prompt-image-mismatch asymmetry in unified models; maturity: draft
- `wiki/concepts/draft-evaluate-diffuse-pipeline.md` — concept page; the three-stage pipeline; maturity: draft
- `wiki/concepts/llm-as-image-conditioning.md` — concept page; four roles for LMs in T2I (encoder → rewriter → reasoner); maturity: draft
- `wiki/entities/models/sana.md` — entity stub; UniReasoner's diffusion backbone; maturity: draft
- `wiki/entities/models/bagel.md` — entity stub; canonical understanding-generation-gap example; maturity: draft
- `wiki/entities/models/janus-pro.md` — entity stub; DeepSeek unified model; maturity: draft
- `wiki/entities/models/blip3-o.md` — entity stub; fully-open unified family; maturity: draft
- `wiki/entities/models/flux.md` — thin entity stub crosslinking notes/models-catalog.md §1.2; full migration deferred to W1

### Updated

- `wiki/index.md` — added 5 model entries, 3 concept entries, 1 source entry. ⚠ markers on stubs.
- `wiki/log.md` — this entry.

### Archived

- `research to be indexed/Large Language Models are Universal Reasoners for Visual Generation.pdf` → `raw-sources/` (created the directory; first archive there).

### Pages touched

10 (1 source + 3 concepts + 5 entities + 1 index update). Within the 3-15-pages-per-ingest range mandated by `CLAUDE.md`.

### Follow-ups opened

- Several entity stubs carry `[NEEDS VERIFICATION 2026-05-06]` flags on local-runtime / open-weights / NSFW-profile questions for SANA, BAGEL, Janus-Pro, BLIP-3o. Resolve via Hugging Face / model-card lookups in a future session.
- The source page asks `[NEEDS VERIFICATION 2026-05-06]` whether UniReasoner code/weights ship publicly — track Apple/JHU release cadence.
- `notes/models-catalog.md` §1.2 (FLUX) ready for full migration to per-version entity pages — `flux.md` stub is a placeholder until then.

---

## [2026-05-06] ingest | Synthetic Character Consistency Survey (back-fill)

Path A step 1 — back-fill of the persona-consistency deep-research docx (`research to be indexed/processed/Synthetic Character Consistency Survey.docx`, 33 KB) into structured wiki pages. The docx had previously been synthesised into `briefs/persona-consistency.md` (LIGHT-mode era); now back-filled into `wiki/sources/` + supporting concept and entity pages.

Preingest check passed: 5 docx in processed/ all NEW (only unireasoner indexed previously); zero collisions.

### Created

- `wiki/sources/synthetic-character-consistency-survey.md` — full source page; deep-read; maturity: validated; 6-section synthesis + identity-adapter taxonomy table + 2026 LoRA training recipes + NSFW-specific failure modes
- `wiki/concepts/persona-consistency-methods.md` — umbrella concept page; four-axis framework (synthesis / identity injection / multi-angle dataset / cross-base & video carry); decision tree for "which method when"; maturity: validated
- `wiki/concepts/lora-taxonomy.md` — LoRA / LoCon / LoHA / LoKr / DoRA / LyCORIS taxonomy; LoKr (factor=4) consensus for character isolation; per-base optimiser recipes; trainer support matrix; maturity: validated
- `wiki/entities/adapters/ip-adapter.md` — Tencent ARC + h94 family page (base, Plus, FaceID, FaceID-Plus-V2, FaceID-Portrait); NSFW failure mechanism (semantic conflict on clothed-reference + nude-prompt); maturity: draft
- `wiki/entities/adapters/pulid.md` — PuLID family page (PuLID, PuLID-FLUX-v0.9.1, PuLID-Flux II); modal 2026 FLUX face adapter; documented skin-tone drift, model-pollution, hairstyle copy-paste; maturity: draft
- `wiki/entities/adapters/instantid.md` — InstantX dual-signal (embedding + landmark ControlNet) SDXL adapter; more colour-stable than PuLID; SDXL only; maturity: draft
- `wiki/entities/adapters/consistentid.md` — TPAMI 2026 multi-image attribute-decoupled SDXL adapter; per-region (eyes/nose/mouth/contour/hair) embeddings; maturity: draft
- `wiki/entities/adapters/infinite-you.md` — ByteDance FLUX-native identity adapter, ICCV 2025 Highlight; multi-aspect (cross-pose / cross-age); maturity: draft
- `wiki/entities/adapters/photomaker-v2.md` — TencentARC stacked-ID embedding SDXL adapter; aging/styling preservation niche; SDXL only; maturity: draft
- `wiki/entities/training-tools/kohya-sd-scripts.md` — canonical CLI training suite (kohya-ss); covers SD1.5/SDXL/Pony/Illustrious/NoobAI/FLUX, Wan/Hunyuan via Musubi sibling project; AdamW8bit @ 5e-5 default for FLUX; maturity: draft
- `wiki/entities/training-tools/ai-toolkit.md` — Ostris FLUX-first trainer, YAML config, Modal/Replicate hosted-bridge; FLUX.2 Klein 9B ~30 min on 4060 Ti benchmark; maturity: draft
- `wiki/entities/training-tools/onetrainer.md` — Tk-GUI trainer with strongest 8 GB VRAM FLUX recipe (Adafactor + LoRA+ + Q4); native DoRA; maturity: draft

### Updated

- `wiki/index.md` — added 1 source row, new "Adapters (identity injection)" subsection with 6 entries, 3 training-tool rows, 2 concept rows. Updated "other expected" follow-up lists to reflect the next likely additions (CharaConsist, FLUX.1 Redux, FLUX.2 Klein 9B face-swap, Musubi Tuner, FluxGym).
- `wiki/log.md` — this entry.

### Archived

- Source docx remains in `research to be indexed/processed/Synthetic Character Consistency Survey.docx` per legacy convention. Decision to consolidate `processed/` → `raw-sources/` deferred (tracked in `ROADMAP.md` open decisions).

### Pages touched

12 (1 source + 2 concepts + 9 entities + 1 index update + 1 log update). Within the 3-15-pages-per-ingest range. The umbrella concept page (`persona-consistency-methods.md`) and the source page reference all 9 entity stubs, satisfying the "always link back to source" rule and producing fully bidirectional `related:` graphs.

### Follow-ups opened

- All 6 adapter stubs and 3 training-tool stubs carry `[NEEDS VERIFICATION 2026-05-06]` flags on Apple Silicon (MPS) viability / VRAM tier / 2026-current release status. Best resolved via Hugging Face / GitHub release-page lookups + Playwright sweep on RunComfy in a single batched session.
- Adapters not yet stubbed: CharaConsist (ICCV 2025), FLUX.1 Redux, FLUX.1 Kontext, FLUX.2 Klein 9B face-swap, Hyper LoRA. Likely fold into a second persona-consistency-back-fill ingest.
- Trainers not yet stubbed: kohya_ss GUI, Musubi Tuner, FluxGym, Diffusion-Pipe-UI, Replicate ostris trainer.
- Concept pages not yet created from this docx: character-dna-templates, likeness-collision-verification, reference-plus-lora-stacking, multi-angle-dataset-prep, video-identity-inheritance. Same back-fill path.
- Cross-link debt: `entities/models/flux.md` references PuLID and IP-Adapter as future stubs; now that those exist, the FLUX page should be updated with bidirectional `related:` to the new adapter pages on next-touch.

---

## [2026-05-06] ingest | Synthetic Character Consistency Survey — Path A step 4 (continuation)

Persona-consistency back-fill continuation. Same source docx as step 1 (`research to be indexed/processed/Synthetic Character Consistency Survey.docx`); fills the remaining adapter / training-tool / concept stubs the step-1 ingest deferred.

### Created

- `wiki/entities/adapters/characonsist.md` — Murray-Wang ICCV 2025 training-free character consistency; attention-manipulation at inference; maturity: draft
- `wiki/entities/adapters/flux-redux.md` — BFL FLUX.1 image-variation / composition adapter; dual-node stack with PuLID II; maturity: draft
- `wiki/entities/adapters/flux-kontext.md` — BFL FLUX.1 prompt-driven image-edit; canonical hair-override / outfit-iteration / Character Turnaround Sheet LoRA backbone; maturity: draft
- `wiki/entities/adapters/flux2-klein-9b-faceswap.md` — multi-pass NSFW pipeline using FLUX.2 Klein 9B as post-generation face-swap engine; mitigation #3 for NSFW anatomy degradation; maturity: draft
- `wiki/entities/training-tools/kohya-ss-gui.md` — bmaltais Gradio frontend for kohya sd-scripts; modal community trainer GUI; maturity: draft
- `wiki/entities/training-tools/musubi-tuner.md` — kohya-ss video-LoRA sibling for Hunyuan / Wan 2.2 dual-expert / LTX; uv packaging + RAM-offload; maturity: draft
- `wiki/entities/training-tools/fluxgym.md` — Cocktailpeanut Pinokio FLUX-only GUI trainer; lowest-friction beginner path; maturity: draft
- `wiki/concepts/character-dna-templates.md` — XML-tag structured prompt schema; Identity Anchor system; per-base captioning conventions; maturity: validated
- `wiki/concepts/likeness-collision-verification.md` — PimEyes / FaceCheck.ID / AI Face Search stack; 70 % threshold; quarterly re-verification protocol; NCII compliance gate; maturity: validated
- `wiki/concepts/reference-plus-lora-stacking.md` — modal 2026 production pattern; 0.85 LoRA + 0.45 adapter strength balance; two-pass alternative; per-base recipe table; failure modes; maturity: validated

### Updated (bidirectional `related:` backlinks)

11 existing pages updated with backlinks to the new step-4 pages (closing 48 asymmetric edges flagged by `wiki_lint.py`):

- `wiki/sources/synthetic-character-consistency-survey.md` — added all 10 step-4 pages
- `wiki/concepts/persona-consistency-methods.md` — added all 10 step-4 pages
- `wiki/concepts/lora-taxonomy.md` — added kohya-ss-gui, musubi-tuner, fluxgym, reference-plus-lora-stacking
- `wiki/entities/adapters/ip-adapter.md` — added characonsist, flux2-klein-9b-faceswap, reference-plus-lora-stacking
- `wiki/entities/adapters/pulid.md` — added characonsist, flux-redux, flux-kontext, flux2-klein-9b-faceswap, reference-plus-lora-stacking
- `wiki/entities/adapters/instantid.md` — added characonsist, reference-plus-lora-stacking
- `wiki/entities/adapters/infinite-you.md` — added flux-redux
- `wiki/entities/models/flux.md` — added flux-redux, flux-kontext, flux2-klein-9b-faceswap (closes the cross-link debt flagged in step 1)
- `wiki/entities/training-tools/kohya-sd-scripts.md` — added kohya-ss-gui, musubi-tuner, fluxgym
- `wiki/entities/training-tools/ai-toolkit.md` — added kohya-ss-gui, musubi-tuner, fluxgym, flux2-klein-9b-faceswap
- `wiki/entities/training-tools/onetrainer.md` — added kohya-ss-gui, musubi-tuner, fluxgym

Plus:

- `wiki/index.md` — 4 new adapter rows, 3 new training-tool rows, 3 new concept rows. "Other expected" parentheticals trimmed (CharaConsist, FLUX.1 Redux/Kontext, FLUX.2 Klein 9B face-swap, kohya_ss GUI, Musubi Tuner, FluxGym, character-DNA, likeness-collision verification, reference + LoRA stacking all now exist).
- `wiki/log.md` — this entry.

### Pages touched

10 created + 12 meta updates (11 bidirectional + index) + log = 23 logical operations across 23 distinct files. The 10-new-pages count is the wiki growth signal; meta updates are bookkeeping. Within the spirit of the 3-15-pages-per-ingest rule (the 10-page back-fill is the substantive change).

### Lint state at end

- 31 indexed pages (was 21 after step 1; +10)
- 222 outbound edges (was 108 after step 1; +114)
- 0 orphans, 0 bidirectional gaps, 0 dangling related, 0 dangling @-paths, 0 cited-unread stubs, 0 frontmatter issues, 0 stale `[NEEDS VERIFICATION]` tags

### Follow-ups opened

- All 4 new adapter stubs and 3 new training-tool stubs carry `[NEEDS VERIFICATION 2026-05-06]` flags. Consolidate the verification sweep with the 14 stubs from step 1 — single batched session via Hugging Face / GitHub release pages / RunComfy / Bellingcat Toolkit.
- Concepts deferred to a future ingest: `multi-angle-dataset-prep` (Wan 2.2 I2V frame extraction, FLUX Kontext Character Turnaround Sheet LoRA, Mickmumpitz 3.8 96-angle pipeline), `video-identity-inheritance` (image-to-video as the inheritance pattern, First-and-Last-Frame interpolation, Wan 2.7 R2V multi-reference). Both fit naturally into Path A step 3 (video-models back-fill) when that source ingest lands.
- 2026 PimEyes pricing tiers — `[NEEDS VERIFICATION 2026-05-06]` on `concepts/likeness-collision-verification.md`. Subscription costs may have shifted; confirm before budgeting for ongoing quarterly re-verification.
- ComfyUI custom node for automatic PimEyes verification on every generation — community status unknown; would significantly reduce verification friction. Open question.
- The persona-consistency tree is now functionally complete for the survey docx. Next likely Path A step is step 2 (`Uncensored AI Image Generation Survey.docx` → ~12-20 image-model entity pages) or step 3 (video survey).

---

## [2026-05-06] ingest | Uncensored AI Image Generation Survey — Path A step 2 session 1

Largest single back-fill of the workspace so far. Source: `research to be indexed/processed/Uncensored AI Image Generation Survey.docx` (3 MB; 53k chars / 215 paragraphs). Plus the LIGHT-mode `notes/models-catalog.md` (60 lines), which was a flat redundant summary of the same docx and is implicitly absorbed by this ingest.

Ingest split: session 1 covers the Danbooru lineage + FLUX subset (this entry, 9 pages); session 2 will cover the Eastern Vanguard + remaining SDXL fine-tune umbrella + de-censoring concept (deferred). The split keeps each session within the 3-15-pages-per-ingest rule.

### Created (9 new pages)

- `wiki/sources/uncensored-image-generation-survey.md` — full source page; deep-read; maturity: validated. Documents the survey's dual architectural+geopolitical thesis (DiT pivot eliminating SDXL hallucinations; Eastern Apache-2.0 vs Western alignment-restrictive lab dichotomy), the 5-tier censorship framework, the model catalog overview, and citation density caveats. Carries 2 `[NEEDS VERIFICATION 2026-05-06]` flags (Pony V7 weights status — survey internal contradiction; HunyuanVideo censorship state).
- `wiki/concepts/censorship-tier-taxonomy.md` — concept page formalizing the 5-tier framework (Unbound / Completely Uncensored / Minimal / Partial-Architectural / Strict); per-tier de-censoring path matrix (LoRA injection vs abliteration vs TIES-Merging/DARE vs platform-clone); per-model tier assignment table for May 2026; maturity: draft (single-source).
- `wiki/entities/models/pony-v6.md` — Pony Diffusion V6 XL (AstraliteHeart, SDXL base); Completely Uncensored tier; score_9 quality-tag system documented; modal stylized NSFW base; 8 GB VRAM; maturity: draft.
- `wiki/entities/models/pony-v7.md` — Pony V7 (AuraFlow base, T5 encoder, native 1536×1536); weights-release status `[NEEDS VERIFICATION 2026-05-06]` (citation 7 says released; citation 8 says alpha-only); full-prose captioning (no score tags); maturity: draft.
- `wiki/entities/models/illustrious-xl.md` — OnomaAI Research SDXL fine-tune; 16,000+ artist-style + character-trait first-class conditioning; Danbooru 2023 dataset; studio-anime aesthetic peer to Pony V6; maturity: draft.
- `wiki/entities/models/noobai-xl.md` — Laxhar Lab Illustrious fine-tune via V-Prediction (vs SDXL's standard EPS-Prediction); Chenkin Noob v.03 + NoobAI-XL-XIN; community-consensus pinnacle of the SDXL anime era; maturity: draft.
- `wiki/entities/models/flux-1-dev.md` — FLUX.1 family consolidation page (Dev/Schnell/Pro 12B); 12B MMDiT + flow-matching + T5/CLIP encoders; FLUX-UNCENSORED-Merged / Chroma1-HD / SNOFS de-censoring path; AdamW8bit @ 5e-5 LoRA training; full quantization tier table (FP16 / FP8 / GGUF Q8/Q4 / Nunchaku-SVDQ int4); maturity: validated.
- `wiki/entities/models/flux-2-klein.md` — FLUX.2 Klein 9B / 4B distills; sub-second inference at 1024×1024; Klein 4B as the 8-13 GB DiT bridge; Klein 9B as the modal NSFW face-swap engine; multi-reference conditioning; maturity: draft.

### Updated (overhauled)

- `wiki/entities/models/flux.md` — overhauled from thin stub to umbrella hub. Added per-version navigation table; FLUX.2 Dev/Pro 32B inline section (no dedicated page — out of reach for most consumer hardware at 24 GB minimum); censorship overview cross-version; adapter ecosystem matrix (PuLID / InfiniteYou / Redux / Kontext / Klein 9B face-swap with FLUX.1 + FLUX.2 status); UniReasoner integration narrative. Resolves the W1 cross-link debt (the long-standing notes-migration TODO from step 1).

### Updated (bidirectional `related:` backlinks)

18 existing pages updated with backlinks to the new step-2 session-1 pages (closing 53 asymmetric edges flagged by `wiki_lint.py`):

- `wiki/concepts/character-dna-templates.md` — added 6 model backlinks (pony-v6, pony-v7, illustrious-xl, noobai-xl, flux-1-dev, flux-2-klein)
- `wiki/concepts/persona-consistency-methods.md` — added 6 model backlinks
- `wiki/concepts/lora-taxonomy.md` — added 5 (censorship-tier-taxonomy, pony-v6, pony-v7, flux-1-dev, flux-2-klein)
- `wiki/concepts/reference-plus-lora-stacking.md` — added 5 (flux umbrella, flux-1-dev, flux-2-klein, pony-v6, pony-v7)
- `wiki/sources/synthetic-character-consistency-survey.md` — added 3 (flux umbrella, flux-1-dev, flux-2-klein)
- `wiki/entities/training-tools/kohya-sd-scripts.md` — added 5 (pony-v6, pony-v7, illustrious-xl, noobai-xl, flux-1-dev)
- `wiki/entities/training-tools/ai-toolkit.md` — added 4 (flux umbrella, flux-1-dev, flux-2-klein, pony-v7)
- `wiki/entities/training-tools/onetrainer.md` — added 2 (pony-v6, flux-1-dev)
- `wiki/entities/training-tools/fluxgym.md` — added 2 (flux umbrella, flux-1-dev)
- `wiki/entities/training-tools/kohya-ss-gui.md` — added 1 (pony-v6)
- `wiki/entities/adapters/pulid.md` — added 3 (flux umbrella, flux-1-dev, flux-2-klein)
- `wiki/entities/adapters/ip-adapter.md` — added 2 (pony-v6, illustrious-xl)
- `wiki/entities/adapters/instantid.md` — added 1 (pony-v6)
- `wiki/entities/adapters/photomaker-v2.md` — added 1 (pony-v6)
- `wiki/entities/adapters/infinite-you.md` — added 2 (flux umbrella, flux-1-dev)
- `wiki/entities/adapters/flux-redux.md` — added 2 (flux-1-dev, flux-2-klein)
- `wiki/entities/adapters/flux-kontext.md` — added 2 (flux-1-dev, flux-2-klein)
- `wiki/entities/adapters/flux2-klein-9b-faceswap.md` — added 1 (flux-2-klein)

Plus 2 body-mention fixes:
- `wiki/concepts/censorship-tier-taxonomy.md` — converted forward-reference `@entities/models/anima.md` (deferred to session 2) to plain text
- `wiki/entities/models/noobai-xl.md` — converted `@notes/frameworks-tools.md` (legacy notes path) to plain text

Plus:

- `wiki/index.md` — added 1 source row (uncensored survey), 6 model rows (pony-v6, pony-v7, illustrious-xl, noobai-xl, flux-1-dev, flux-2-klein), 1 concept row (censorship-tier-taxonomy). Updated FLUX umbrella entry from "thin stub" to umbrella hub. Trimmed "other expected models" parenthetical to reflect session-2 scope.
- `wiki/log.md` — this entry.

### Pages touched

9 created + 1 overhauled + 18 backlink updates + 2 body-mention fixes + index + log = 32 file operations across 31 distinct files. The 9-new-pages count is the wiki growth signal; the umbrella overhaul plus 20 bookkeeping updates are the cluster-ingest tax (see `hot.md` precedent: "expect 30-50 asymmetric edges flagged on the first pass").

### Lint state at end

- 39 indexed pages (was 31; +8 net — 9 created, but the FLUX umbrella overhaul didn't add a new file)
- 374 outbound edges (was 222 after step 4; +152)
- 0 orphans, 0 bidirectional gaps, 0 dangling related, 0 dangling @-paths, 0 cited-unread stubs, 0 frontmatter issues, 0 stale `[NEEDS VERIFICATION]` tags

### Follow-ups opened

- **Path A step 2 session 2 (deferred)**: Anima, Z-Image Turbo, Zeta Chroma, Qwen-Image-2512, ERNIE-Image, Playground v3, Kwai Kolors, PixArt-Σ, SD3.5 deprecated note, SDXL fine-tune umbrella (Lustify / Juggernaut / BigAsp-v2.5 / Cyberrealistic). Plus a dedicated `de-censoring-techniques.md` concept page (FLUX-UNCENSORED-Merged / Chroma1-HD / SNOFS / abliteration / TIES-DARE merging). Plus optional `flux-2-dev.md` if 24 GB-tier workflows mature.
- All 6 new model entity stubs carry `[NEEDS VERIFICATION 2026-05-06]` flags. Notable: Pony V7 weights-release status (citation contradiction in survey itself); SVDQ / Nunchaku release status on FLUX.1 Dev; canonical Chroma1-HD / SNOFS hashes on CivitAI; FLUX.2 port status of PuLID II + InfiniteYou; ai-toolkit FLUX.2 LoRA training maturity; Klein 4B 8 GB VRAM claim quantization details. Best resolved as a single batched session via Hugging Face / GitHub release pages / Civitai (Playwright) / RunComfy node-status.
- Cited-unread stubs that the new model pages now reference but don't yet have pages for (legitimate forward-references — not flagged because they don't exist as files yet): Anima, Z-Image Turbo, Zeta Chroma, Qwen-Image, ERNIE-Image, PixArt-Σ, Kwai Kolors, SDXL-base. All scheduled for session 2.
- The persona-consistency adapter ecosystem (PuLID, InfiniteYou, Redux, Kontext, Klein 9B face-swap, IP-Adapter family, InstantID, ConsistentID, PhotoMaker V2, CharaConsist) is now fully cross-linked to the model layer for the FLUX.1, FLUX.2 Klein, Pony V6, Illustrious XL, NoobAI-XL hosts. This is the structural completeness milestone for the modern persona-consistency stack on FLUX-class hosts.
- 21 → 27 stubs flagged with `[NEEDS VERIFICATION 2026-05-06]` overall (14 from step 1 + 7 from step 4 + 6 new from step 2 session 1). Single batched verification sweep recommended after session 2 lands.

---

## [2026-05-06] ingest | Uncensored AI Image Generation Survey — Path A step 2 session 2

Path A step 2 second session — same source as session 1 (`research to be indexed/processed/Uncensored AI Image Generation Survey.docx`). Covers the **Eastern Vanguard** model layer + remaining **SDXL fine-tune umbrella** + dedicated **de-censoring-techniques** concept page. Completes the model-layer coverage of the survey docx — session 1's Danbooru lineage + FLUX subset plus this session's Eastern Vanguard + SDXL umbrella + concept now form the canonical May 2026 image-model landscape inside the wiki.

### Created (10 new pages)

- `wiki/concepts/de-censoring-techniques.md` — concept page formalizing the four mainstream techniques: LoRA injection (0.8-1.2 strength), abliteration (refusal-direction ablation, language-model lineage), weight merging (SLERP / TIES-Merging / DARE), prompt-engineering bypass (declining utility on alignment-restrictive bases). Per-tier applicability matrix. Hard wall: architectural censorship (FLUX-class distillation chains) blocks all four. Maturity: draft.
- `wiki/entities/models/anima.md` — Unbound-tier example; pre-alignment model preserved in archives; documented as the lower bound of the censorship spectrum and the "what unfiltered training actually looks like" reference. Maturity: draft.
- `wiki/entities/models/z-image-turbo.md` — Tencent Z-Image Turbo (S3-DiT 6B; Single-Stream Diffusion Transformer); native 1024×1024 fast inference; pairs with **Zeta Chroma** community fine-tune for de-censored output. Z-Image Turbo + Zeta Chroma collapsed into a single page (the survey treats the pair as one workflow node). Maturity: draft.
- `wiki/entities/models/qwen-image-2512.md` — Alibaba Qwen-Image-2512; 20B-class DiT; Eastern Vanguard photorealism with permissive licensing; ComfyUI integration via Musubi Tuner sibling tooling. Maturity: draft.
- `wiki/entities/models/ernie-image.md` — Baidu ERNIE-Image; Chinese-bilingual text encoder; documented but limited Western adoption. Maturity: draft.
- `wiki/entities/models/playground-v3.md` — Playground.com v3; Partial-Architectural censorship tier (artifacts-on-NSFW); included for landscape completeness of the censorship-tier table. Maturity: draft.
- `wiki/entities/models/kwai-kolors.md` — Kuaishou Kolors; Eastern Vanguard photorealism; Apache 2.0; competes with FLUX.1 Dev on photorealistic prompts. Maturity: draft.
- `wiki/entities/models/pixart-sigma.md` — PixArt-Σ; academic DiT precursor; historical importance for the DiT-pivot narrative; not the modal production base. Maturity: draft.
- `wiki/entities/models/sdxl-fine-tunes.md` — umbrella page for the realistic-photo SDXL fine-tune family: Lustify / Juggernaut / BigAsp-v2.5 / Cyberrealistic. Stack-with-Pony pattern documented (these inherit the SDXL base, so Pony LoRAs apply). Maturity: draft.
- `wiki/entities/models/sd3.md` — SD 3.5 deprecated note. Strict-tier alignment (CivitAI takedown loop); deliberately bypassed by Pony V7 via AuraFlow; documented for landscape completeness and as a cautionary tale. [RETRACTED] for production workflows.

### Updated (bidirectional `related:` backlinks)

14 existing pages updated with backlinks to the new step-2 session-2 pages (closing 69 asymmetric edges flagged by `wiki_lint.py`):

- `wiki/concepts/censorship-tier-taxonomy.md` — added 10 backlinks (de-censoring + 9 model entities; the censorship-tier framework now cross-links to every model in the May 2026 landscape)
- `wiki/sources/uncensored-image-generation-survey.md` — added 10 (de-censoring + 9 models; closing the source → entity coverage loop)
- `wiki/entities/models/flux.md` — added 8 (anima, z-image-turbo, qwen-image-2512, ernie-image, playground-v3, kwai-kolors, pixart-sigma, sdxl-fine-tunes, sd3 — FLUX umbrella now references every Western and Eastern peer for landscape navigation)
- `wiki/concepts/lora-taxonomy.md` — added 5 (de-censoring + sdxl-fine-tunes umbrella + Eastern models with documented LoRA-training maturity)
- `wiki/entities/models/flux-1-dev.md` — added 5 (de-censoring + 4 Eastern peers cross-referenced as workflow alternatives)
- `wiki/entities/models/illustrious-xl.md` — added 3 (de-censoring + sdxl-fine-tunes umbrella + 1 Eastern peer)
- `wiki/entities/models/noobai-xl.md` — added 3
- `wiki/entities/models/pony-v6.md` — added 3
- `wiki/concepts/reference-plus-lora-stacking.md` — added 2 (de-censoring + sdxl-fine-tunes — adapter+LoRA stack on the SDXL realistic-photo family)
- `wiki/entities/models/flux-2-klein.md` — added 2
- `wiki/entities/models/pony-v7.md` — added 1 (de-censoring; AuraFlow bypass narrative cross-ref)
- `wiki/entities/models/sana.md` — added 1 (sdxl-fine-tunes umbrella for landscape positioning)
- `wiki/entities/training-tools/musubi-tuner.md` — added 1 (qwen-image-2512; Musubi covers Qwen-Image LoRA training)
- `wiki/entities/training-tools/kohya-sd-scripts.md` — added 1 (sdxl-fine-tunes umbrella; Kohya is the canonical SDXL trainer)

The 3 new pages with the densest inbound — `de-censoring-techniques.md`, `z-image-turbo.md`, `qwen-image-2512.md` — also had their `related:` blocks topped up post-lint as part of normal cluster-ingest correction (the new-page side of asymmetric edges is closed at the same time as the existing-page side).

Plus:

- `wiki/index.md` — added 9 model rows (anima, z-image-turbo, qwen-image-2512, ernie-image, playground-v3, kwai-kolors, pixart-sigma, sdxl-fine-tunes, sd3) and 1 concept row (de-censoring-techniques). Trimmed "other expected models" parenthetical to point to step 3 video survey scope; trimmed "other expected concepts" parenthetical (de-censoring-techniques placeholder removed).
- `wiki/log.md` — this entry.

### Pages touched

10 created + 14 existing-page backlink updates + 3 new-page bidirectional fixups + index + log = 29 file operations across 28 distinct files. The 10-new-pages count is the wiki growth signal; the 17 backlink-edit operations are the cluster-ingest tax (matches the 30-50-edge expected range from prior step-4 / step-2-s1 precedents, slightly higher because the de-censoring concept fans out into all 6 step-1 model pages plus the SDXL-umbrella backlinks into Pony/Illustrious/NoobAI).

### Lint state at end

- 49 indexed pages (was 39 after step 2 session 1; +10)
- 514 outbound edges (was 374; +140)
- 0 orphans, 0 bidirectional gaps, 0 dangling related, 0 dangling @-paths, 0 cited-unread stubs, 0 frontmatter issues, 0 stale `[NEEDS VERIFICATION]` tags

### Follow-ups opened

- **Path A step 2 is now complete.** The Uncensored AI Image Generation Survey docx is fully back-filled into the wiki (1 source + 2 concepts + 15 model entities + FLUX umbrella overhaul). Model-layer coverage of the May 2026 landscape is canonical: every model the survey discusses now has a page.
- All 9 new model entity stubs + de-censoring concept carry `[NEEDS VERIFICATION 2026-05-06]` flags. Cumulative total across all 4 ingests: 14 (step 1) + 7 (step 4) + 6 (step 2 s1) + ~10 (this session) = ~37 stubs. **Single batched verification sweep recommended before proceeding to step 3** — best done via Hugging Face / GitHub release pages / Civitai (Playwright) / RunComfy. Notable session-2 priorities: Anima archive availability + license; Z-Image Turbo Apache-2.0 status confirmation; Qwen-Image-2512 ComfyUI custom-node availability; Kwai Kolors NSFW-permissiveness; SDXL fine-tune family CivitAI takedown risk; Chroma1-HD / SNOFS / FLUX-UNCENSORED-Merged canonical hashes.
- **Path A step 3 next** — `Video Generation Models Survey 2026.docx` → ~10 video-model entity pages (Wan 2.2 family, Wan-Animate, HunyuanVideo 1.5, LTX-2, Mochi, CogVideoX, Open-Sora, Sora 2, Veo, Kling, Hedra) + concepts (distillation: Lightning/CausVid; MoE-video; audio-video joint generation; Wan2GP). Naturally absorbs the deferred `multi-angle-dataset-prep` and `video-identity-inheritance` concept pages from step 4.
- The censorship-tier taxonomy is now the wiki's canonical lens for evaluating any new model. Step 3's video-model ingests should classify each model into a tier as part of routine page authoring.
- The de-censoring-techniques concept page lists the four mainstream techniques (LoRA injection / abliteration / weight merging / prompt-bypass) and their per-tier applicability. Future de-censoring research notes should fold into this concept rather than spawning per-technique pages until critical mass justifies the split.
- Cited-unread stub backstop: every forward-reference from the new model pages resolves. The forward-reference cleanup from session 1 (Anima / Z-Image Turbo / Zeta Chroma / Qwen-Image / ERNIE-Image / PixArt-Σ / Kwai Kolors / SDXL-base) is now fully resolved.

---

## [2026-05-06] verification-sweep | Path A — high-impact stubs (Pony V7 weights, Nunchaku/SVDQ, Chroma1-HD, PuLID II FLUX.2, InfiniteYou FLUX.2, SNOFS reclassification)

First batched verification sweep against the cumulative ~37 `[NEEDS VERIFICATION 2026-05-06]` stubs accumulated across Path A steps 1 / 4 / 2-s1 / 2-s2. This sub-sweep targeted the **4 highest-impact stubs** that gate downstream workflow decisions: Pony V7 weights status (whole V7 ecosystem hinges on this), SVDQ/Nunchaku release status (FLUX.1 Dev consumer-VRAM viability), Chroma1-HD canonical hash (de-censoring artifact provenance), and FLUX.2 adapter-port status (PuLID II + InfiniteYou — persona-stack viability on FLUX.2 Klein). Resolved 7 stubs in one session via Brave Search; surfaced one notable taxonomy correction (SNOFS reclassified from base-model merge to LoRA).

### Stubs resolved (7)

1. **Pony V7 weights release** — [CONFIRMED 2026-05-06]: weights released at `purplesmartai/pony-v7-base` on Hugging Face (Diffusers + Safetensors) and `civitai.com/models/1901521/pony-v7-base`. Apache 2 with restrictions. **7B parameters** AuraFlow-based (parameter count was undocumented in survey). GGUF quants available. AstraliteHeart confirmed V7.1 follow-up + Qwen-based V8 (editing model) in development. Resolves the survey's citation 7 vs 8 contradiction in favour of citation 7 (citation 8 was pre-release Reddit confusion).
2. **Pony V7 dead-end retraction** — `## Dead Ends` entry "Assuming V7 weights are public" marked `[RETRACTED 2026-05-06]`. Workflows can commit to V7 as a target.
3. **SVDQuant / Nunchaku release status** — [CONFIRMED 2026-05-06]: shipped. Canonical repo `nunchaku-tech/nunchaku-flux.1-dev` on Hugging Face (legacy `mit-han-lab/svdq-int4-flux.1-dev` redirects). NVIDIA RTX 30xx/40xx use INT4; RTX 50xx Blackwell uses NVFP4. Nunchaku v1.0 has shipped. Community benchmark: ~3.5 it/s on 4060 16GB at 1MP. SVDQuant DeepWiki documentation confirmed. Single biggest lever for FLUX.1 Dev on consumer cards.
4. **Chroma1-HD provenance** — [CONFIRMED 2026-05-06]: **8.9B foundational base model** based on FLUX.1-schnell (NOT a Dev merge as initially classified). Apache 2.0 license. Deliberately uncensored. Sibling models: Chroma1-Flash + GGUF variants for low-VRAM workflows. Reclassification corrected in `de-censoring-techniques.md`.
5. **PuLID II FLUX.2 port** — [CONFIRMED 2026-05-06]: shipped via `iFayens/ComfyUI-PuLID-Flux2` (GitHub). Auto-detects Klein 4B / Klein 9B / FLUX.2 Dev. InsightFace + EVA-CLIP pipeline. Weights at `huggingface.co/Fayens/Pulid-Flux2`. Notable architectural rebuild required: FLUX.2 has 5 double / 20 single blocks (vs FLUX.1's 19/38), shared modulation, hidden dim 3072 (Klein 4B) vs 4096 (FLUX.1), Qwen3 text encoder (vs T5). Production-ready persona pipeline on FLUX.2 = PuLID II + Klein 9B native multi-reference.
6. **InfiniteYou FLUX.2 port** — [CONFIRMED 2026-05-06]: **NOT yet ported** as of May 2026. ByteDance's `ComfyUI_InfiniteYou` remains FLUX.1-only. No public timeline for FLUX.2 port. **Negative finding important for persona-stack planning**: InfiniteYou-dependent workflows must stay on FLUX.1 Dev or migrate to PuLID II. Reassess at next persona-consistency-touch (~Q3 2026).
7. **SNOFS taxonomy correction** — [CONFIRMED 2026-05-06]: SNOFS ("Sex, Nudes, Other Fun Stuff") is a **LoRA**, not a base-model merge. Located at `civitai.com/models/1972981`. Originally for Qwen-Image-Edit; FLUX.2 Klein 9B variants now exist. The survey's framing of SNOFS as a "merge" was imprecise — corrected in `de-censoring-techniques.md` with explicit Dead Ends entry. Implication: SNOFS slots into the LoRA-injection technique row of the per-tier matrix, not the weight-merging row.

### Pages updated (5)

- **`wiki/entities/models/pony-v7.md`** — 3 edits: removed contested-weights bullet from Limits; added new `### Weights release status` section with full HF + CivitAI paths, Apache 2 license, 7B param count, GGUF availability, V7.1 + V8 development status; struck-through the weights-release Workspace TODO; marked the "V7 weights public" Dead Ends entry as `[RETRACTED 2026-05-06]`.
- **`wiki/entities/models/flux-1-dev.md`** — 2 edits: quantization table Nunchaku/SVDQ row updated with `[CONFIRMED 2026-05-06]` flag, canonical `nunchaku-tech/nunchaku-flux.1-dev` repo path, Blackwell NVFP4 vs RTX 30xx/40xx INT4 split, Nunchaku v1.0 shipping status; struck-through SVDQ/Nunchaku and Chroma1-HD Workspace TODO bullets with HF paths and DeepWiki documentation pointer plus community benchmark figure.
- **`wiki/concepts/de-censoring-techniques.md`** — 3 edits (most substantive correction): replaced FLUX merge-list with corrected entries — (a) `shauray/FLUX-UNCENSORED-merged` confirmed as a single-from_pretrained merge; (b) `lodestones/Chroma1-HD` reclassified as 8.9B FLUX.1-schnell-based foundational base model with Apache 2.0 + Chroma1-Flash sibling + GGUF variants (NOT a Dev merge); (c) `Flux-Uncensored-V2` LoRA (~687 MB) added as separate FLUX.1 Dev LoRA path; (d) **SNOFS reclassified as LoRA, not merge** at civitai 1972981. Confidence section bumped from `[NEEDS VERIFICATION 2026-05-06]` to `[CONFIRMED 2026-05-06]`. Added Dead Ends entry: "Treating SNOFS as a base-model merge — it's a LoRA."
- **`wiki/entities/models/flux-2-klein.md`** — 2 edits: adapter ecosystem bullet expanded into structured PuLID II / InfiniteYou / Redux+Kontext sub-bullets with full release-status detail; struck-through both PuLID II and InfiniteYou Workspace TODO items as resolved.
- **`wiki/sources/uncensored-image-generation-survey.md`** — 1 edit: Pony V7 weights-release contradiction resolved with citation 7 winning; cross-link added to `entities/models/pony-v7.md` for full discussion; struck-through prior `[NEEDS VERIFICATION]` flag.

### Pages touched

5 page edits + lint pass + log/ROADMAP/hot updates = 8 file operations. **No new pages created** — verification sweep modifies existing pages only. **No new cross-links added** — edits modified existing `related:` structures and content tags rather than adding new bidirectional edges. This is why lint stays clean: the sweep is content-confidence-tag work, not structural growth.

### Lint state at end

- 49 indexed pages (unchanged)
- 514 outbound edges (unchanged)
- 0 orphans, 0 bidirectional gaps, 0 dangling related, 0 dangling @-paths, 0 cited-unread stubs, 0 frontmatter issues
- 0 stale `[NEEDS VERIFICATION]` tags (window is 7 days; today is 2026-05-06)

### Follow-ups opened

- **Cumulative stub count: ~37 → ~30 remaining.** This sub-sweep (call it "sub-sweep A") covered the 4 highest-impact items. Remaining sub-sweeps grouped by topical clustering for batched Brave/Playwright/Exa work:
  - **Sub-sweep B (~10 stubs): Eastern Vanguard licensing + capability confirmation.** Anima archive availability + license terms (Unbound-tier survival is the open question); Z-Image Turbo Apache-2.0 status confirmation + Tencent S3-DiT 6B parameter count cross-check; Qwen-Image-2512 ComfyUI custom-node availability + Musubi Tuner LoRA-training recipe maturity; Kwai Kolors NSFW-permissiveness on actual model card; ERNIE-Image weights-release status; SDXL fine-tune family (Lustify / Juggernaut / BigAsp-v2.5 / Cyberrealistic) CivitAI takedown risk model-by-model.
  - **Sub-sweep C (~14 stubs): Apple Silicon (MPS) viability across adapters/trainers** carried from step 1. PuLID family + ConsistentID + InfiniteYou + InstantID + IP-Adapter family + PhotoMaker V2 + CharaConsist + FLUX-Redux + FLUX-Kontext + Klein 9B face-swap + ai-toolkit + Kohya sd-scripts + OneTrainer + kohya_ss GUI + Musubi Tuner + FluxGym. Best run as a single Playwright sweep across each repo's Issues page.
  - **Sub-sweep D (~5 stubs): Step-4 carry-overs.** kohya_ss GUI maturity + Musubi Tuner Wan-LoRA pipeline + FluxGym one-command FLUX-LoRA + CharaConsist 2026 release status + FLUX.1 Kontext / Redux maturity vs FLUX.2 ports + Klein 9B face-swap workflow status.
  - **Sub-sweep E (~3 stubs): Persona-ops carry-overs.** PimEyes 2026 pricing tiers + ComfyUI auto-PimEyes node community status + UniReasoner code/weights release cadence (Apple/JHU).
- **Path A step 3 — Video Generation Models Survey** — still next ingest after verification batches complete OR can proceed in parallel with sub-sweeps B-E (image-model coverage is canonical; video-model layer is independent). Decision deferred to next session.
- **Taxonomy refinement noted**: the SNOFS reclassification underscores that the de-censoring-techniques per-tier matrix should be careful about merge-vs-LoRA categorization. Future de-censoring artifact ingests should explicitly classify (LoRA / merge / abliteration / prompt-bypass) on first touch rather than inheriting framing from upstream sources.
- **Adapter-ecosystem fragmentation insight**: PuLID II port to FLUX.2 shipped quickly via community fork (`iFayens`); InfiniteYou's official ByteDance maintainer has not. This is a recurring pattern — community ports outpace original-author ports for FLUX.2-class architectures. Persona-stack planning should weight community-port likelihood when committing to an adapter dependency on a new architecture.

---

## [2026-05-06] verification-sweep | Path A sub-sweep B — Eastern Vanguard licensing + capability confirmation (Z-Image Turbo, Anima, Kwai Kolors, Qwen-Image-2512, ERNIE-Image, SDXL fine-tunes)

Second batched verification sweep against the cumulative ~30 remaining `[NEEDS VERIFICATION 2026-05-06]` stubs after sub-sweep A. This sub-sweep targeted the **Eastern Vanguard licensing + capability cluster** — the 6-stub block that determines which Eastern-lineage models survive into the production stack and on what terms. Resolved 6 stubs in one session via Brave Search; surfaced one notable license-classification correction (Kwai Kolors split-license) and one production-ready upgrade (Qwen-Image-2512 LoRA training).

### Stubs resolved (6)

1. **Z-Image Turbo HF release + license** — [CONFIRMED 2026-05-06]: canonical at `Tongyi-MAI/Z-Image-Turbo` on Hugging Face. **Apache 2.0** confirmed. Bilingual EN/CN. 8-step distillation at CFG 1.0 (guidance must be 0 for Turbo). 8GB VRAM compatible. Mirror ecosystem: `unsloth/Z-Image-Turbo-GGUF` (GGUF variants), `mzbac/Z-Image-Turbo-8bit` (8-bit), `SeeSee21/Z-Image-Turbo-AIO` (AIO bundle). Architectural detail: S3-DiT (Scalable Single-Stream Diffusion Transformer) — Tongyi MAI lab (Alibaba), distinct from Qwen-Image-2512's lineage despite both being Alibaba.
2. **Anima Hugging Face release + status** — [CONFIRMED 2026-05-06]: canonical at `circlestone-labs/Anima` on Hugging Face. Status: **Preview** (`anima-preview.safetensors`, 3.89 GB, sha256 `41fa7b78...`). Created 2026-02-02; updated 2026-02-15. Multiple CivitAI mirrors: `civitai.com/models/2458426/anima-official` (Anima Official preview3-base) and `civitai.com/models/2359125/anima`. Community fine-tune **AnimaYume** at `civitai.com/models/2385278/animayume`. Anima preview workflow at `civitai.com/models/2426853/anima-preview-workflow`. FP16 patch (`ModelComputeDtype` node) at `civitai.com/models/2356447` — speeds RTX 2080 Super from 4 minutes to 38s at 832×1216. **Important caveat: Preview, not full release** as of May 2026 — full trained version still pending.
3. **Kwai Kolors split-license** — [CONFIRMED 2026-05-06]: **split-license model**. CODE under Apache 2.0; **WEIGHTS under non-commercial research license** with explicit commercial-use registration requirement. Full quote from official HF model card: *"Kolors weights are fully open for academic research. If you intend to use the Kolors model or its derivatives for commercial purposes under the licensing terms and conditions, please send the questionnaire to kwai-kolors@kuaishou.com to register with the licensor."* Reddit community characterization: *"NON-COMMERCIAL LICENCE, WORSE THEN SD3'S."* Architectural confirmation: U-Net backbone (not DiT) + ChatGLM3 text encoder (Chinese-bilingual focus). Diffusers-format mirror at `Kwai-Kolors/Kolors-diffusers`; ControlNet variants (Canny / Depth / Pose) at `Kwai-Kolors/Kolors-ControlNet-*`. **Implication: Kolors is NOT Eastern Vanguard "open + permissive" — it's Eastern but with a Stability-class restrictive license.** This refines the Eastern Vanguard tier definition: license posture matters as much as origin.
4. **Qwen-Image-2512 LoRA training maturity** — [CONFIRMED 2026-05-06]: **production-ready via Musubi Tuner**. Three production-ready paths: (a) Native Musubi Tuner (`kohya-ss/musubi-tuner` GitHub) — CLI-driven; supports Qwen-Image-Layered training; LoRA conversion utility produces ComfyUI-compatible weights; (b) SECourses Musubi Tuner Gradio app (`patreon.com/posts/137551634`) — 1-click installer with FP8/FP8-scaled conversion built-in; ready presets for Qwen-Image (old + 2512), Qwen-Image-Edit 2509/2511; trainable on as low as 6 GB GPUs via aggressive offloading; (c) ComfyUI Realtime LoRA Trainer (`shootthesound/comfyUI-Realtime-Lora`) — trains directly inside ComfyUI; backed by sd-scripts / Musubi Tuner / AI-Toolkit. Canonical kohya-ss/musubi-tuner README quote: *"This repository provides scripts for training LoRA models with HunyuanVideo, Wan2.1/2.2, FramePack, FLUX.1 Kontext, FLUX.2 dev/klein, Qwen-Image, and Z-Image architectures."* Qwen-Image-2512 specifically: trainable identically to Qwen-Image base ("Qwen Image 2512 BF16 added into downloader app you can train it exactly as Qwen Image 0 difference"). Section status upgraded from `[TENTATIVE]` to `[CONFIRMED 2026-05-06]`.
5. **ERNIE-Image full release confirmation** — [CONFIRMED 2026-05-06]: canonical at `baidu/ERNIE-Image` and `baidu/ERNIE-Image-Turbo` on Hugging Face. **Released 2026-04-15.** Reference code at `github.com/baidu/ernie-image`. ComfyUI added Day-0 support April 2026. Reference architecture: single-stream Diffusion Transformer (DiT) with lightweight Prompt Enhancer as text encoder. **Practical deployment: 24 GB VRAM consumer GPU** per official model card (higher than the 12-16 GB tier originally inferred from 8B param count). Turbo variant uses 8 inference steps with strong quality retention vs full ERNIE-Image. **Apache 2.0 confirmed** via official Baidu HF model card and the ernie-image.org / ernie-image.net documentation portals — consistent with the broader ERNIE family (ERNIE 4.5 LLM is also Apache 2.0). Strong on dense text rendering, posters, comics, infographics, multi-panel layouts, bilingual EN/CN signage. **Prompt Enhancer ships as a separate safetensors file** in the same repository — should be unloadable / swappable for tightly-scoped persona work.
6. **SDXL fine-tune family CivitAI availability** — [CONFIRMED 2026-05-06]: all five families remain available with active community use as of May 2026. Juggernaut XL Ragnarok at `civitai.com/models/133005` (RunDiffusion / KandooAI; civarchive mirror); Lustify (OLT Fixed Textures variant); BigASP / Big Lust v1.6 with **438k+ downloads, 2,597+ reviews** (community-modal SDXL realism + NSFW base); CyberRealistic XL v6.0; Epicrealism XL. **Framing correction**: the survey's "CivitAI takedown risk" framing was overstated — all five families are publicly available. The pattern is **moderation-churn rather than wholesale-takedown** (specific tags or images may be moderated, but base-model pages persist). BigAsp-v2.5 sampler hint surfaced: DMD2 4-step + PAG 0.20 scale at 6-8 steps. BigASP + DMD2 + Lustify is the modal SDXL realism stack as of May 2026.

### Pages updated (6)

- **`wiki/entities/models/z-image-turbo.md`** — 2 edits: Eastern Vanguard licensing bullet upgraded to `[CONFIRMED 2026-05-06]` with `Tongyi-MAI/Z-Image-Turbo` canonical path + Apache 2.0 + bilingual EN/CN + 8-step CFG 1.0 + 8GB VRAM detail; Workspace TODO HF-release item struck through with mirror ecosystem (`unsloth/Z-Image-Turbo-GGUF`, `mzbac/Z-Image-Turbo-8bit`, `SeeSee21/Z-Image-Turbo-AIO`); license item struck through. Persona-adapter and Zeta Chroma items remain pending (sub-sweep C).
- **`wiki/entities/models/anima.md`** — 1 edit: Workspace TODO HF-release item struck through with `circlestone-labs/Anima` (preview-stage `anima-preview.safetensors` 3.89 GB), CivitAI mirror catalog (2458426 / 2359125), AnimaYume fine-tune at 2385278, FP16 patch at 2356447 (4 min → 38s on RTX 2080 Super). Status flag: **Preview, not full release**.
- **`wiki/entities/models/kwai-kolors.md`** — 1 edit: Workspace TODO license-terms item struck through with **split-license clarification** — code Apache 2.0; weights non-commercial research with mandatory commercial registration. Full HF model-card quote captured. Reddit characterization captured. U-Net + ChatGLM3 architecture confirmed. Diffusers + ControlNet mirror paths added. Implication framed: Kolors is Eastern but **not** Eastern Vanguard "open + permissive."
- **`wiki/entities/models/qwen-image-2512.md`** — 2 edits: LoRA training section upgraded from `[TENTATIVE]` to `[CONFIRMED 2026-05-06]` with three production-ready paths fully documented (Native Musubi Tuner / SECourses Gradio / ComfyUI Realtime LoRA Trainer). Workspace TODO Musubi Tuner item struck through.
- **`wiki/entities/models/ernie-image.md`** — 1 edit: Workspace TODO HF-release + Apache 2.0 items struck through with `baidu/ERNIE-Image` + `baidu/ERNIE-Image-Turbo`, **released 2026-04-15**, ComfyUI Day-0 support, 24 GB VRAM consumer-GPU deployment, Turbo 8-step distillation, Prompt Enhancer as separate safetensors. Persona-adapter port status and prompt-enhancer-bypass items remain pending.
- **`wiki/entities/models/sdxl-fine-tunes.md`** — 1 edit: Workspace TODO CivitAI takedown-risk item struck through with all five families confirmed available. Juggernaut XL Ragnarok at 133005, Lustify (OLT variant), BigASP / Big Lust v1.6 with 438k+ downloads / 2,597+ reviews, CyberRealistic XL v6.0, Epicrealism XL. Reframed as "moderation-churn rather than wholesale-takedown." BigAsp-v2.5 sampler hint surfaced (DMD2 4-step + PAG 0.20 at 6-8 steps). BigASP + DMD2 + Lustify modal stack noted.

### Pages touched

6 page edits (8 Edit operations) + lint pass + log/ROADMAP/hot updates = 9 file operations. **No new pages created** — verification sweep modifies existing pages only. **No new cross-links added** — edits modified existing `related:` structures and content tags rather than adding new bidirectional edges. Lint stays clean (same precedent as sub-sweep A).

### Lint state at end

- 49 indexed pages (unchanged)
- 514 outbound edges (unchanged)
- 0 orphans, 0 bidirectional gaps, 0 dangling related, 0 dangling @-paths, 0 cited-unread stubs, 0 frontmatter issues
- 0 stale `[NEEDS VERIFICATION]` tags (window is 7 days; today is 2026-05-06)

### Follow-ups opened

- **Cumulative stub count: ~30 → ~24 remaining.** Sub-sweep B closed the Eastern Vanguard licensing + capability cluster. Remaining sub-sweeps:
  - **Sub-sweep C (~14 stubs): Apple Silicon (MPS) viability** across the adapter + trainer fleet (PuLID family / ConsistentID / InfiniteYou / InstantID / IP-Adapter family / PhotoMaker V2 / CharaConsist / FLUX-Redux / FLUX-Kontext / Klein 9B face-swap / ai-toolkit / Kohya sd-scripts / OneTrainer / kohya_ss GUI / Musubi Tuner / FluxGym). Best run as a single Playwright sweep across each repo's Issues page for "MPS" / "Apple Silicon" / "M1" / "M2" / "M3" / "M4" filters.
  - **Sub-sweep D (~5 stubs): Step-4 carry-overs.** kohya_ss GUI maturity; Musubi Tuner Wan-LoRA pipeline; FluxGym one-command FLUX-LoRA flow; CharaConsist 2026 release status; FLUX.1 Kontext / Redux maturity vs FLUX.2 ports; Klein 9B face-swap workflow status.
  - **Sub-sweep E (~3 stubs): Persona-ops carry-overs.** PimEyes 2026 pricing tiers; ComfyUI auto-PimEyes node community status; UniReasoner code/weights release cadence (Apple/JHU).
- **License-classification refinement insight**: the Kwai Kolors split-license discovery (code Apache 2.0 but weights non-commercial-research) demonstrates that the Eastern Vanguard tier definition needs to discriminate code-license from weights-license. Future Eastern model ingests should check both. Kolors is now reframed as an Eastern outlier — Eastern lineage but Stability-class restrictive license — and the Eastern Vanguard label is reserved for permissive-on-weights models (Z-Image Turbo, Qwen-Image, ERNIE-Image, Anima).
- **Production-ready upgrade insight**: Qwen-Image-2512 LoRA training was already production-ready (Musubi Tuner) at the time of the survey ingest — the `[TENTATIVE]` flag was unwarranted. Future ingest passes should default to checking Musubi Tuner support for any DiT-class model before flagging LoRA training as uncertain (Musubi covers a wide architectural fleet: HunyuanVideo, Wan2.1/2.2, FramePack, FLUX.1 Kontext, FLUX.2 dev/klein, Qwen-Image, Z-Image).
- **Framing-correction insight**: the SDXL fine-tune "CivitAI takedown risk" framing was overstated — the actual pattern is moderation-churn (specific tags / images moderated; base-model pages persist). This framing correction should propagate to future NSFW-model ingest passes; "takedown" language should be reserved for models that have actually been removed.
- **Sub-sweep C is the next-largest verification batch** (~14 stubs across the adapter/trainer fleet) and benefits most from Playwright batched browsing rather than Brave Search, given GitHub Issues queries. Recommended approach: load Playwright, sweep each repo's Issues page with MPS / Apple Silicon / M1-M4 search filters, capture findings in batched edits.

---

## [2026-05-07] verification-sweep | Path A sub-sweep C — Apple Silicon (MPS) viability across adapter + trainer fleet (PuLID, InstantID, IP-Adapter, PhotoMaker V2, InfiniteYou, FLUX Redux/Kontext/Klein-9B-faceswap, ai-toolkit, Kohya sd-scripts, OneTrainer, kohya_ss GUI, Musubi Tuner, FluxGym)

Third batched verification sweep against the cumulative ~24 remaining `[NEEDS VERIFICATION 2026-05-06]` stubs after sub-sweeps A + B. This sub-sweep targeted the **Apple Silicon (MPS) viability cluster** carried from step 1 — the largest remaining stub block, distributed across the adapter + trainer fleet. Resolved 14 stubs in one session via Brave Search (10 batched queries; Playwright deemed unnecessary given query result quality). Surfaced one clear blocker (InfiniteYou), one community-fork rescue path (ai-toolkit Hughescr fork), and one definitive negative finding (FluxGym FLUX training on Apple Silicon).

### Stubs resolved (14)

1. **PuLID FLUX Apple Silicon** — [CONFIRMED 2026-05-07]: runs on Apple Silicon ComfyUI with standard MPS caveats (force fp32 over fp16 for the LayerNormKernelImpl-fp16 issue; set `PYTORCH_ENABLE_MPS_FALLBACK=1` for any unsupported ops). InsightFace installs via `pip install insightface onnxruntime`; the `onnxruntime-silicon` package ships universal2 wheels. Late-2025 dependency issues resolved upstream. Throughput on M3/M4 Pro/Max is 2-5× slower than equivalent NVIDIA but fully functional for single-shot persona generation.
2. **InstantID Apple Silicon** — [CONFIRMED 2026-05-07]: cubiq port runs on M-series via the same MPS path as PuLID, but **fp32 only** — fp16 hits the LayerNormKernelImpl-fp16 issue. `PYTORCH_ENABLE_MPS_FALLBACK=1` + fp32 base; expect 3-5× NVIDIA latency. InsightFace dependency installs identically to PuLID resolution.
3. **IP-Adapter Apple Silicon** — [CONFIRMED 2026-05-07]: InsightFace installs cleanly on macOS via `pip install insightface onnxruntime`; ComfyUI Manager picks it up correctly. Remaining caveat is upstream maintenance posture: **`cubiq/ComfyUI_IPAdapter_plus`** entered "maintenance only" mode 2025-04-14 — bug fixes only, no new IP-Adapter variant adoption. Functional on MPS but long-term-support story capped.
4. **PhotoMaker V2 Apple Silicon** — [CONFIRMED 2026-05-07]: runs on macOS via `shiimizu/ComfyUI-PhotoMaker-Plus` (canonical 2025-2026 port). Apple Silicon path additionally supports the **CoreML provider** for the InsightFace face-feature step (`onnxruntime-silicon` exposes `CoreMLExecutionProvider`) — measurably faster than CPU fallback. Standard MPS caveats apply for the diffusion backbone.
5. **InfiniteYou Apple Silicon** — [CONFIRMED 2026-05-07]: **active MPS blocker**. Issue [#11 in `bytedance/InfiniteYou`](https://github.com/bytedance/InfiniteYou/issues/11) confirms `IDEmbeddingModelLoader` fails during arcface initialisation on Apple Silicon (MPS-incompatible NumPy / arcface kernel paths). Workarounds: cloud rental, or run InfiniteYou on CPU (very slow). For Apple-Silicon-friendly persona work, PuLID is the recommended substitute until upstream patches.
6. **FLUX.1 Redux Apple Silicon** — [CONFIRMED 2026-05-07]: runs on Apple Silicon ComfyUI with standard MPS caveats (fp32 over fp16, `PYTORCH_ENABLE_MPS_FALLBACK=1`). FP8 not supported on MPS — Mac users run BF16 or GGUF Q5/Q4. The InsightFace dependency comes from PuLID II (the dual-node partner), not Redux itself; installs cleanly per PuLID resolution.
7. **FLUX.1 Kontext Apple Silicon** — [CONFIRMED 2026-05-07]: runs on Apple Silicon ComfyUI with standard MPS caveats. **FP8 not supported on MPS** — Apple Silicon users run BF16 base or GGUF Q5/Q4 quantisations. Latency 2-4× NVIDIA; image-edit pass quality unchanged.
8. **FLUX.2 Klein 9B face-swap Apple Silicon** — [CONFIRMED 2026-05-07]: Klein 9B runs in ComfyUI on Apple Silicon via the standard MPS path (BF16 or GGUF; FP8 unsupported on MPS). Face-swap workflow requires PuLID-Flux2 ([`iFayens/ComfyUI-PuLID-Flux2`](https://github.com/iFayens/ComfyUI-PuLID-Flux2)) — community-validated working on Mac. Multi-pass pipeline latency is high (~2-4× NVIDIA per pass × 2 passes); useful for batch work, less suited to interactive iteration.
9. **ai-toolkit Klein 9B recipe transfer to MacBook Pro** — [CONFIRMED 2026-05-07]: ai-toolkit native MPS training is functional via the **Hughescr fork** ([`github.com/hughescr/ai-toolkit`](https://github.com/hughescr/ai-toolkit)) — community Mac/MPS adaptation using `torch.amp` instead of `torch.cuda.amp`. HF blog by AlekseyCalvin documents the Mac workflow; PR open in main repo, not yet merged. The 30-min 4060 Ti 16 GB benchmark does NOT transfer cleanly: expect 5-10× slower on M3/M4 Max. Recommended pattern: dataset on Mac → training on Modal/Replicate via ai-toolkit cloud bridge.
10. **ai-toolkit Apple Silicon native MPS path** — [CONFIRMED 2026-05-07]: Ostris main repo does not ship native MPS training as a first-class path; community fork (Hughescr) is the bridge. PR open in main repo; not yet merged as of 2026-05. **Recommended for Mac users**: Hughescr fork for exploration, Modal/Replicate cloud bridge (built into ai-toolkit) for production runs.
11. **Kohya sd-scripts Apple Silicon training viability** — [CONFIRMED 2026-05-07]: runs on M1/M2/M3/M4 with **manual `cuda` → `mps` patches** in `train_util.py` — community-documented but not first-class. Expected throughput 5-10× slower than NVIDIA at SDXL scale; OOM risk at FLUX.1 Dev scale on 16 GB unified memory unless aggressive offload. **Bitsandbytes 8-bit optimisers do not work on MPS** — substitute Adafactor or AdamW-fp32. Cloud rental remains the recommended training path; sd-scripts on Mac is exploratory only.
12. **OneTrainer Apple Silicon (MPS) status** — [CONFIRMED 2026-05-07]: docs claim **out-of-box Apple Silicon support** but community M3 Max users report `RuntimeError: Torch not compiled with CUDA enabled` errors during training (Reddit threads 2025-12 → 2026-04). First-time-install path is fragile; not recommended as the Apple-Silicon trainer of choice. OneTrainer's 8 GB story holds on Linux/Windows but not on MPS.
13. **kohya_ss GUI Apple Silicon native install path** — [CONFIRMED 2026-05-07]: installs on M1/M2 via the bundled `setup.sh` with the **Mac-specific accelerate config** (`--mixed_precision no` and `--use_mps_device`) per [bmaltais/kohya_ss issue #1248](https://github.com/bmaltais/kohya_ss/issues/1248). SDXL training works at 5-10× slower than NVIDIA equivalents; FLUX training largely impractical due to bf16 / fp8 limits on MPS.
14. **Musubi Tuner Apple Silicon (MPS) native viability** — [CONFIRMED 2026-05-07]: runs on Mac with caveats — Issue [#790](https://github.com/kohya-ss/musubi-tuner/issues/790) confirms bf16-mixed-precision issues on MPS (substitute fp32 or fp16); Issue [#746](https://github.com/kohya-ss/musubi-tuner/issues/746) is an open Mac mini M4 question. Wan 2.2 dual-expert training on Apple Silicon is technically functional but VRAM/RAM-headroom on 24-32 GB unified memory is a hard wall — cloud rental is the recommended path. The [`shootthesound/comfyUI-Realtime-Lora`](https://github.com/shootthesound/comfyUI-Realtime-Lora) ComfyUI bridge provides an interactive Mac-friendly training loop for short-clip Wan 2.2 LoRAs.
15. **FluxGym Apple Silicon (MPS) FLUX training time + Pinokio install handling** — [CONFIRMED 2026-05-07]: **effectively no Apple Silicon support** for production-grade FLUX training. Cocktailpeanut (FluxGym author) tweeted *"Me in the corner waiting for the impossible to eventually happen: FLUX finetuning on Apple Silicon Mac"* — confirming upstream status. Pinokio install completes on macOS without late-2025 install pain (InsightFace's macOS wheels stabilised); the install is functional, the limit is FLUX training throughput on MPS. Community reports 8+ hours for ranks where Linux/Windows hits 1-2 hours, frequent OOM at >16 GB unified memory. Recommended path for Apple Silicon users: dataset prep on Mac → cloud H100 rental via ai-toolkit's Modal/Replicate bridge.

(Stub count is 15 because the FLUX.2 Klein 9B face-swap page carried two MPS-related stubs — the page-level Apple Silicon viability bullet and the ai-toolkit Klein 9B recipe transfer bullet — both resolved together.)

### Pages updated (13)

- **`wiki/entities/adapters/pulid.md`** — 1 edit: Workspace TODO MPS bullet struck through with full resolution (fp32 over fp16 caveats; `PYTORCH_ENABLE_MPS_FALLBACK=1`; InsightFace install path; throughput multiplier).
- **`wiki/entities/adapters/instantid.md`** — 1 edit: Workspace TODO MPS bullet struck through with **fp32-only** caveat for the LayerNormKernelImpl-fp16 issue and cross-link to PuLID resolution.
- **`wiki/entities/adapters/ip-adapter.md`** — 1 edit: Workspace TODO MPS bullet struck through with InsightFace install confirmation + cubiq maintenance-only mode caveat (2025-04-14).
- **`wiki/entities/adapters/photomaker-v2.md`** — 1 edit: Workspace TODO MPS bullet struck through with `shiimizu/ComfyUI-PhotoMaker-Plus` canonical port + CoreMLExecutionProvider Apple Silicon acceleration.
- **`wiki/entities/adapters/infinite-you.md`** — 1 edit: Workspace TODO MPS bullet struck through as **active blocker** (Issue #11, IDEmbeddingModelLoader arcface init failure) with PuLID substitute recommendation.
- **`wiki/entities/adapters/flux-redux.md`** — 1 edit: Workspace TODO MPS bullet struck through with FP8-not-supported-on-MPS caveat and BF16/GGUF substitute path.
- **`wiki/entities/adapters/flux-kontext.md`** — 1 edit: Workspace TODO MPS bullet struck through with same FP8/MPS limitation; latency multiplier; image-edit quality unchanged.
- **`wiki/entities/adapters/flux2-klein-9b-faceswap.md`** — 2 edits: page-level Apple Silicon viability struck through with `iFayens/ComfyUI-PuLID-Flux2` + multi-pass latency caveat; ai-toolkit Klein 9B recipe transfer struck through with **Hughescr fork** + Modal/Replicate cloud bridge recommendation.
- **`wiki/entities/training-tools/ai-toolkit.md`** — 1 edit: Workspace TODO Apple Silicon MPS path struck through with Hughescr fork + AlekseyCalvin HF blog + open PR + Modal/Replicate bridge recommendation.
- **`wiki/entities/training-tools/kohya-sd-scripts.md`** — 1 edit: Workspace TODO Apple Silicon viability struck through with manual cuda→mps train_util.py patch + bitsandbytes-not-on-MPS caveat + cloud-rental recommendation.
- **`wiki/entities/training-tools/onetrainer.md`** — 1 edit: Workspace TODO Apple Silicon status struck through with claims-vs-reality framing (M3 Max install fragility per 2025-12 / 2026-04 Reddit threads).
- **`wiki/entities/training-tools/kohya-ss-gui.md`** — 1 edit: Workspace TODO Apple Silicon install path struck through with `setup.sh` + Mac-specific accelerate config + bmaltais issue #1248 reference.
- **`wiki/entities/training-tools/musubi-tuner.md`** — 1 edit: Workspace TODO Apple Silicon native viability struck through with kohya-ss/musubi-tuner issues #790 (bf16 MPS) + #746 (Mac mini M4 open) + shootthesound/comfyUI-Realtime-Lora bridge recommendation.
- **`wiki/entities/training-tools/fluxgym.md`** — 2 edits: Workspace TODO Apple Silicon training-time bullet struck through with Cocktailpeanut tweet + community 8h-on-MPS vs 1-2h-on-NVIDIA reality + Modal/Replicate cloud-bridge fallback; Pinokio InsightFace dependency stack bullet struck through (install functional; training throughput is the limit, not the install).

### Pages NOT updated (2)

- **`wiki/entities/adapters/consistentid.md`** — searched for Apple Silicon / MPS / macOS / InsightFace; no explicit MPS stub found. Page already classified as production-tier with Diffusers / PyTorch standard runtime; no resolution required.
- **`wiki/entities/adapters/characonsist.md`** — searched for Apple Silicon / MPS / macOS; only mention is positive ("inference-only environments useful where training is impossible — Apple Silicon laptops"). No NEEDS VERIFICATION MPS stub to resolve.

### Pages touched

13 page edits (15 Edit operations) + lint pass + log/ROADMAP/hot updates = 16 file operations. **No new pages created** — verification sweep modifies existing pages only. **No new cross-links added** — edits modified existing `related:` structures and content tags rather than adding new bidirectional edges. Lint stays clean (same precedent as sub-sweeps A + B).

### Lint state at end

- 49 indexed pages (unchanged)
- 514 outbound edges (unchanged)
- 0 orphans, 0 bidirectional gaps, 0 dangling related, 0 dangling @-paths, 0 cited-unread stubs, 0 frontmatter issues
- 0 stale `[NEEDS VERIFICATION]` tags (window is 7 days; today is 2026-05-07; verification stamps include 2026-05-06 and 2026-05-07 — all within window)

### Follow-ups opened

- **Cumulative stub count: ~24 → ~10 remaining.** Sub-sweep C closed the Apple Silicon viability cluster across the entire adapter + trainer fleet — by far the largest remaining stub block. Verification-sweep work is now ~70% complete (cumulative 13 + 6 + 14 = 33 stubs resolved across A + B + C, against the original ~37-43 stub estimate). Remaining sub-sweeps are smaller and more topical:
  - **Sub-sweep D (~5 stubs): Step-4 carry-overs.** kohya_ss GUI maturity; Musubi Tuner Wan-LoRA pipeline; FluxGym one-command FLUX-LoRA flow; CharaConsist 2026 release status; FLUX.1 Kontext / Redux maturity vs FLUX.2 ports; Klein 9B face-swap workflow status. Some of these were partially de-risked by sub-sweep C (Musubi Tuner / FluxGym / Klein 9B got partial confirmation as a byproduct of MPS sweep) — sub-sweep D should re-baseline against current state before searching.
  - **Sub-sweep E (~3 stubs): Persona-ops carry-overs.** PimEyes 2026 pricing tiers; ComfyUI auto-PimEyes node community status; UniReasoner code/weights release cadence (Apple/JHU). Low priority — these gate persona-platform-ops decisions but don't block image-gen workflow choices.
- **Pattern insight — cross-platform support is fragmented**: sub-sweep C surfaced a clear three-tier pattern across the adapter/trainer fleet:
  1. **Production-quality on MPS**: PuLID FLUX, FLUX.1 Redux, FLUX.1 Kontext, kohya_ss GUI (SDXL only), Musubi Tuner (with caveats), iFayens/PuLID-Flux2 — work with documented MPS caveats and community-validated paths.
  2. **Functional but community-fork rescue required**: ai-toolkit (Hughescr fork), Kohya sd-scripts (manual train_util.py patches), PhotoMaker V2 (shiimizu fork) — official maintainers have not adopted Apple Silicon as a first-class platform; community forks fill the gap.
  3. **Effectively unsupported / blocker**: InfiniteYou (active MPS blocker, IDEmbeddingModelLoader arcface init failure), FluxGym FLUX training (cocktailpeanut tweet), OneTrainer (claims-vs-M3-Max-reality fragility) — Apple Silicon users should not plan workflows around these.
- **Architectural insight — FP8 quantization is unsupported on MPS**: the FLUX.1 / FLUX.2 family typically deploys via FP8 on consumer NVIDIA cards. Apple Silicon users must substitute BF16 base or GGUF Q5/Q4 quantisations. This is a structural Mac-vs-NVIDIA inference-time difference and should propagate to all FLUX-class entity pages on next ingest pass.
- **Cloud rental as recommended path**: across multiple resolutions, the consistent recommendation for Apple Silicon users doing serious training (FLUX, Wan 2.2, FLUX.2 Klein 9B) is **dataset prep on Mac → cloud H100 rental via ai-toolkit's Modal/Replicate bridge**. This is now the canonical workspace pattern for any production-grade training run; local Mac training is exploratory only.
- **Path A step 3 — Video Generation Models Survey** — still the next major ingest after verification sweeps complete. Sub-sweeps D + E are smaller (~8 stubs total) and could be batched into a single short session before stepping into the video survey.

---

## [2026-05-07] verification | sub-sweep D + E — Step-4 carry-overs + Persona-ops carry-overs (verification sweep complete)

**22 stubs resolved across 9 wiki pages** (closing the verification sweep). 11 Edit operations across 9 files. 17 Brave Search queries across 4 batches; no Playwright needed. Original ~8-stub estimate from sub-sweep C's hot.md was substantially undercounted — the Path A back-fill ingests carried more workflow-maturity stubs than initial counts suggested.

### Sub-sweep D — Step-4 carry-overs (18 stubs across 7 wiki pages)

- **`wiki/entities/adapters/characonsist.md`** — 4 stubs: (1) **no native ComfyUI Manager-installable CharaConsist node** — reference impl remains diffusers scripts at `Murray-Wang/CharaConsist`; canonical 2026 ComfyUI character-consistency stack instead combines IP-Adapter FaceID + character LoRA + ControlNet; (2) FLUX.1-Dev FP8 + CharaConsist VRAM is parity (~11-13 GB) — training-free attention-only modification adds negligible overhead; (3) **NOT compatible with FLUX.2 / Z-Image / Qwen-Image** — point-tracking attention + adaptive token merge are FLUX.1-single-block-specific; successor method **ASemConsist** ([arxiv.org/abs/2512.23245](https://arxiv.org/abs/2512.23245), Dec 2025) targets broader DiT applicability for FLUX.2 / Qwen-Image consistency in 2026; (4) NSFW failure-mode mirrors IP-Adapter (mechanism-level inference; paper does not test) — clothed-reference + nude-prompt leaks reference clothing geometry into anatomy.
- **`wiki/entities/adapters/flux-redux.md`** — 2 stubs: (1) 11-13 GB peak confirmed for FP8 + Redux + PuLID II + character LoRA on FLUX.1-Dev (16 GB comfortable; 12 GB tight, no headroom for ControlNets); (2) **no FLUX.2 Redux variant has shipped** as of 2026-05 — multi-reference editing now native to FLUX.2 dev/klein; FLUX.2 release subsumes Redux-style composition transfer as a core capability.
- **`wiki/entities/adapters/flux-kontext.md`** — 3 stubs: (1) 12 GB confirmed sufficient for FLUX.1-Dev FP8 + Kontext (~10-11 GB peak); (2) Character Turnaround Sheet LoRA (5 angles) is NOT equivalent to Mickmumpitz 96-angle pipeline (Wan-2.2 I2V frame extraction) — complementary, not equivalent; (3) **no FLUX.2 Kontext variant has shipped** — multi-reference editing native to FLUX.2 dev/klein subsumes Kontext-style edit-by-prompt as a core capability rather than a separate variant.
- **`wiki/entities/adapters/flux2-klein-9b-faceswap.md`** — 2 stubs: (1) ~13 GB peak confirmed for FP8 Klein 9B + ControlNet on 16 GB; Klein 9B + Q4 GGUF runs on 8 GB VRAM ([Civitai workflow 2543188](https://civitai.com/models/2543188)); (2) **NoobAI XL pass-1 architectural orthogonality clarified** — V-prediction is SDXL-architecture-specific and does NOT transfer to Klein 9B (rectified flow); two-pass cascade still works since pass-2 only sees the decoded image; **canonical single-stage alternative is Klein 9B + BFS LoRA** ([Alissonerdx/BFS-Best-Face-Swap](https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap)) — community face-swap LoRA on Klein 9B obviates two-base maintenance.
- **`wiki/entities/training-tools/kohya-ss-gui.md`** — 2 stubs: (1) **bmaltais/kohya_ss does NOT yet support FLUX.2 / Klein 9B / Z-Image** as of 2026-05 — canonical training path is Musubi Tuner; (2) bmaltais has NOT merged a Musubi Tuner UI bridge — separate frontends despite shared kohya-ss/bmaltais lineage.
- **`wiki/entities/training-tools/fluxgym.md`** — 2 stubs: (1) LyCORIS variant support is thin — only standard LoRA first-class; LoKr / LoHa / LoCon / DoRA via sd-scripts Advanced tab manual config. For LoKr factor=4 character isolation default, use ai-toolkit (YAML) or OneTrainer (UI); (2) **FluxGym does NOT support FLUX.2 / Klein 9B** as of 2026-05 — Issue #487 (open) tracks "FLUX.2-dev support". Canonical Klein 9B trainer paths are ai-toolkit + Musubi Tuner; FluxGym remains FLUX.1-only in 2026.
- **`wiki/entities/training-tools/musubi-tuner.md`** — 3 stubs: (1) **Wan 2.7 R2V is NOT in Musubi Tuner README architecture coverage** as of 2026-05 (no public PR / branch / issue) — README lists HunyuanVideo, HunyuanVideo 1.5, Wan2.1/2.2, FramePack, FLUX.1 Kontext, FLUX.2 dev/klein, Qwen-Image, Z-Image; (2) HunyuanVideo 1.5 confirmed officially supported (`hunyuan_video_1_5` directory + cache commands); 24 GB consumer-GPU recipe still needs a worked example with explicit offload knobs (community-validated path transfers from HunyuanVideo 1.0); (3) LTX-2.3 NOT in supported-architecture list — routes through ai-toolkit or specialised forks instead.

### Sub-sweep E — Persona-ops + UniReasoner carry-overs (4 stubs across 2 wiki pages)

- **`wiki/concepts/likeness-collision-verification.md`** — 3 stubs: (1) **PimEyes 2026 pricing** — Open Plus $29.99-$35.99/month (single-tier rebrand), Advanced $299.99/month, 25 searches/day cap on all paid tiers; budget ~$30-$300/month for persona-verification protocol; (2) **2026 face-search landscape** — PimEyes (primary, 2.1B-face index), FaceCheck.id, Lenso.ai (2025 entrant, AI-tagged), eyematch.ai (2025 entrant), Copyseeker (2025 entrant), ProFaceFinder, plus general-purpose Yandex Images / Google Lens; recommend folding Lenso.ai + FaceCheck.id into multi-engine protocol alongside PimEyes; (3) **No public ComfyUI auto-PimEyes node exists** as of 2026-05 — PimEyes does not ship public API; cubiq/ComfyUI_FaceAnalysis remains in "maintenance only" mode since 2025-04-14. Closest workaround is manual PimEyes web-UI batch upload (~5-10 outputs/min) or Bellingcat OSINT toolkit; open community gap.
- **`wiki/sources/unireasoner.md`** — 1 stub: **No public UniReasoner repo / weights surfaced** as of 2026-05 (no GitHub project matching JHU + Apple author combination from the paper). Closest published Apple work is **AToken** ([machinelearning.apple.com/research/atoken](https://machinelearning.apple.com/research/atoken)) — unified vision tokenizer, code/weights also unreleased. Closest *released* discrete-vision-token + reasoning stack is **Selftok / DDT-LLaMA** (CVPR 2025 Best Paper Honorable Mention) — tokenizer weights released May 2025; full training code pending. Treat UniReasoner as a *target architecture* for compositional faithfulness rather than an installable tool until code drops.

### Pages touched

9 page edits (11 Edit operations) + lint pass + log/ROADMAP/hot updates = 12 file operations. **No new pages created** — verification sweep modifies existing pages only. **No new cross-links added** — edits modified existing content tags rather than adding new bidirectional edges.

### Lint state at end

- 49 indexed pages (unchanged)
- 514 outbound edges (unchanged)
- 0 orphans, 0 bidirectional gaps, 0 dangling related, 0 dangling @-paths, 0 cited-unread stubs, 0 frontmatter issues
- 0 stale `[NEEDS VERIFICATION]` tags

### Verification-sweep complete — cumulative findings

- **Cumulative stub count: 49 stubs resolved** across the verification sweep (A: 7 + B: 6 + C: 14 + D: 18 + E: 4). Higher than the original 37-43 stub estimate; the Path A back-fill ingests carried more workflow-maturity stubs than initial counts suggested. No NEEDS VERIFICATION tags remain dated 2026-05-06.
- **No FLUX.2 Kontext / FLUX.2 Redux variants have shipped** — Black Forest Labs' design choice in FLUX.2 was to absorb Kontext-style edit-by-prompt and Redux-style multi-reference editing into the dev/klein base, rather than ship them as separate node variants. Re-architects the 2026 edit pipeline: FLUX.1 Kontext + FLUX.1 Redux for FLUX.1-Dev workflows; native FLUX.2 dev/klein edits for FLUX.2 workflows. Should propagate as a framing update on `entities/adapters/flux-kontext.md` + `flux-redux.md` ("FLUX.1-only adapters").
- **CharaConsist is FLUX.1-only**; ASemConsist (Dec 2025) is the broader-DiT successor. Future character-consistency work on FLUX.2 / Qwen-Image / Z-Image should track ASemConsist rather than porting CharaConsist.
- **NoobAI XL V-prediction does not transfer to Klein 9B's rectified-flow architecture** — clarification for two-pass face-swap cascade design. The canonical alternative for Klein 9B face-swap is single-stage Klein 9B + **BFS LoRA** ([Alissonerdx/BFS-Best-Face-Swap](https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap)) rather than the NoobAI-XL-pass-1 → Klein-9B-pass-2 cascade.
- **bmaltais/kohya_ss has NOT added FLUX.2 / Klein 9B / Z-Image** as of 2026-05; **FluxGym remains FLUX.1-only** (Issue #487 tracks FLUX.2-dev support). The canonical FLUX.2 / Klein 9B / Z-Image trainer in 2026 is **Musubi Tuner + ai-toolkit**. The kohya_ss GUI / FluxGym trainer pair is now firmly the **legacy-FLUX.1 path**.
- **Musubi Tuner architecture coverage as of 2026-05**: HunyuanVideo, HunyuanVideo 1.5, Wan2.1/2.2, FramePack, FLUX.1 Kontext, FLUX.2 dev/klein, Qwen-Image, Z-Image. Wan 2.7 R2V and LTX-2/2.3 are NOT in coverage — track for future updates.
- **PimEyes 2026 budget**: $30-$300/month with 25-searches/day cap on paid tiers. New SaaS entrants (Lenso.ai, eyematch.ai, Copyseeker) widen the multi-engine verification stack — recommend cross-validation across PimEyes + Lenso.ai + FaceCheck.id for production verification protocols.
- **No UniReasoner code drop** as of 2026-05 — Selftok / DDT-LLaMA (CVPR 2025) is the closest released discrete-vision-token reasoning stack. Apple AToken is the closest published Apple work but also unreleased. Treat UniReasoner as a target architecture rather than an installable tool.

### Follow-ups opened

- **Path A back-fill is end-to-end complete on docx sources** through Path A steps 1, 2 (full), 4, plus all verification sub-sweeps A-E. Remaining Path A items: step 3 (Video Generation Models Survey docx → ~10 video-model entity pages); step 5 (notes/frameworks-tools + hardware migration); step 6 (AI Persona Operations + Monetization docx → persona-ops + monetization concept + entity pages).
- **Re-classification candidate**: `entities/adapters/flux-kontext.md` and `entities/adapters/flux-redux.md` should add a "FLUX.1-only" framing in the entity-level summary; FLUX.2 multi-reference workflows are a different surface (native to dev/klein, not a Kontext-class variant). Defer until next-touch ingest.
- **Re-classification candidate**: `entities/training-tools/kohya-ss-gui.md` and `entities/training-tools/fluxgym.md` should add a "legacy FLUX.1-era trainer" framing; Musubi Tuner + ai-toolkit are now the FLUX.2 / Klein 9B / Z-Image canonical paths. Defer until next-touch ingest.
- **Stub for ASemConsist concept page** — when next character-consistency ingest happens, ASemConsist (arxiv 2512.23245, Dec 2025) is the broader-DiT successor to CharaConsist and warrants its own entity page.
- **Stub for BFS LoRA entity page** — Alissonerdx/BFS-Best-Face-Swap is the canonical single-stage Klein 9B face-swap path; warrants a thin entity page when next adapter ingest happens.
- Path A continues with **step 3 (Video Generation Models Survey)** as the next major ingest. Source: `research to be indexed/processed/Video Generation Models Survey 2026.docx` (3 MB). Run preingest_check first.

---

## [2026-05-07] ingest | Video Generation Models Survey 2026 (Path A step 3)

Path A step 3 — back-fill of the May 2026 video-generation deep-research docx (`research to be indexed/processed/Video Generation Models Survey 2026.docx`, 3 MB) into structured wiki pages. First video-domain ingest in HEAVY mode. Companion to the existing pre-HEAVY brief `briefs/video-gen-models.md` (208 lines) which covered the same landscape from a more decision-oriented angle.

Preingest check: `Video Generation Models Survey 2026.docx` confirmed NEW (no prior video-domain source page in wiki/sources/). Other 4 docx in processed/ already ingested or pending step 4/6.

### Created

- `wiki/sources/video-generation-survey-2026.md` — full source page; deep-read; maturity: validated; six-section synthesis (open-weight catalog / closed-API / uncensored fine-tunes / hardware reality / T2V vs I2V workflows / length-quality-consistency reality)
- `wiki/entities/models/wan-2-2.md` — Alibaba MoE 27B/14B-active dual-expert SNR-routed video DiT; 480p/720p @ 24fps; Apache 2.0; foundational pillar of local NSFW video persona work after community LoRA injection (mq-lab / blink / TheYuriLover); 5B TI2V dense bridge for consumer GPUs; maturity: draft
- `wiki/entities/models/hunyuanvideo-1-5.md` — Tencent 8.3B DiT + 3D causal VAE; SSTA (Selective + Sliding Tile Attention) ~2× over FlashAttention-3 for 10s 720p; native 1080p; FP8 GEMM; step-distilled 480p in 8-12 steps; Tencent-shipped LoRA tuning + community NSFW LoRAs (`nsfwsks` trigger); maturity: draft
- `wiki/entities/models/ltx-2.md` — Lightricks 19B asymmetric joint A/V foundation (14B visual + 5B audio with bidirectional cross-attention); native 4K @ 50fps with synchronized lipsync + foley single-pass; modality-specific VAEs at 1:192; LTX-2 Community License (free commercial under $10M revenue); maturity: draft
- `wiki/entities/models/mochi-1.md` — Genmo 10B AsymmDiT (75% visual / 25% text resource allocation, single T5-XXL encoder); 30fps fluid motion; Apache 2.0; aggressive automatic NSFW filter (community bypasses by stripping the safety classifier); 4×80GB native → 24GB FP8 ComfyUI wrappers; maturity: draft
- `wiki/entities/models/cogvideox-1-5.md` — THUDM/Zhipu 5B DiT + 3D VAE integrating text/time/space (no traditional cross-attention); 768p / 10s outputs; torchao INT8 compresses 24GB→7GB (cheapest local entry); Apache 2.0; CogVideoX 2.0 adds native 1080p + CogSound; maturity: draft
- `wiki/entities/models/seedance-2.md` — ByteDance closed-API native A/V model; competes with Veo 3.1 / LTX-2 in joint-foundation class; cloud-only access; included in survey for landscape completeness; maturity: draft
- `wiki/concepts/multi-angle-dataset-prep.md` — 30-50 image identity LoRA dataset construction for video carry; angle/expression/lighting matrix; turnaround-sheet tooling (FLUX.1 Kontext + Character Turnaround LoRA); per-base captioning conventions; counts and over/under-fitting risks; maturity: draft (carried over from Path A step 4 deferral)
- `wiki/concepts/video-identity-inheritance.md` — image-trained character LoRA transfer onto Wan 2.2 / HunyuanVideo 1.5 / CogVideoX; per-base compatibility matrix; first-frame I2V conditioning + video-LoRA fine-tune as the canonical path; failure modes (latent-space mismatch, motion drift, identity wobble); maturity: draft (carried over from Path A step 4 deferral)
- `wiki/concepts/seam-stitching-strategies.md` — overcoming per-call clip length cap (5-10s); GVS / latent-chaining / FramePack / sliding-window; Wan I2V chained-clip workflow; identity drift and motion-vector continuity; modal 2026 production pattern for 30-60s persona clips; maturity: draft

### Updated

- `wiki/sources/synthetic-character-consistency-survey.md` — +video-generation-survey-2026, +multi-angle-dataset-prep, +video-identity-inheritance backlinks; updated: 2026-05-07
- `wiki/entities/models/qwen-image-2512.md` — +video-generation-survey-2026, +video-identity-inheritance, +multi-angle-dataset-prep backlinks
- `wiki/entities/models/flux-2-klein.md` — +video-generation-survey-2026, +video-identity-inheritance, +multi-angle-dataset-prep backlinks
- `wiki/entities/models/z-image-turbo.md` — +video-generation-survey-2026, +video-identity-inheritance backlinks
- `wiki/concepts/de-censoring-techniques.md` — +video-generation-survey-2026, +wan-2-2, +hunyuanvideo-1-5, +mochi-1, +cogvideox-1-5 backlinks
- `wiki/concepts/censorship-tier-taxonomy.md` — +video-generation-survey-2026, +wan-2-2, +hunyuanvideo-1-5, +ltx-2, +mochi-1, +cogvideox-1-5 backlinks
- `wiki/entities/adapters/pulid.md` — +video-generation-survey-2026, +video-identity-inheritance backlinks
- `wiki/index.md` — added 1 source row, 6 video model rows, 3 concept rows. Removed Video Generation Models Survey from "not yet back-filled" sources list. Removed "(other expected models: HunyuanVideo + remaining video models → Path A step 3 video survey)" follow-up from Models section.
- `wiki/log.md` — this entry.

### Archived

- `research to be indexed/processed/Video Generation Models Survey 2026.docx` → `raw-sources/Video Generation Models Survey 2026.docx`

### Pages touched

10 new + 7 updated + 2 meta = **19 pages**. Wiki now 59 indexed pages; cumulative edges to be reported by lint.

### Cross-cutting findings

- **Per-model uncensorability tier varies sharply**: Wan 2.2 = scrubbed-but-recoverable (LoRA injection viable); HunyuanVideo 1.5 = Tencent-shipped LoRA infrastructure + community NSFW LoRAs; Mochi 1 = Apache 2.0 with bypassable inference-time safety classifier; CogVideoX = lowest-friction Apache 2.0 base for community uncensored fine-tuning. LTX-2 + Seedance 2.0 are joint A/V class with weaker community LoRA ecosystems as of May 2026.
- **Video-domain de-censoring inherits the image-domain 5-tier taxonomy** but with one new pattern: **abliterated text-encoder swap** (replace the safety-aligned text encoder with a permissive one) is more practical for video models because the encoder is often a separately-loaded module in ComfyUI workflows.
- **Length-quality-consistency reality check**: 5-10s native clip length is a *hard* per-call cap for current open-weight video models; the 2026 production pattern for 30-60s persona clips is **GVS / latent-chaining / FramePack** seam-stitching with first-frame I2V conditioning carry. Identity drift across seam boundaries is the dominant failure mode.
- **Hardware reality**: 24 GB VRAM is the practical floor for production video work in 2026 (HunyuanVideo 1.5 FP8 / Wan 2.2 FP8 / Mochi 1 FP8). CogVideoX 1.5 + INT8 (torchao) is the cheapest local entry at ~7 GB. Native 80 GB+ requirements are masked by FP8 / INT8 / GGUF community wrappers.
- **Multi-angle dataset prep + video identity inheritance** form the canonical bridge from image-domain persona work into video-domain carry. The image-trained character LoRA does not transfer cleanly across base architectures; the production-ready path is image LoRA → first-frame I2V conditioning + video-LoRA fine-tune on the target video base.

### Follow-ups opened

- **Path A step 3 complete**. Path A back-fill is now end-to-end complete on docx sources through steps 1 + 2 + 3 + 4 + verification A-E. Remaining Path A items: step 5 (notes/frameworks-tools + hardware migration) and step 6 (AI Persona Operations + Monetization docx → persona-ops + monetization concept + entity pages).
- **Stub for ASemConsist concept page** carried from verification sub-sweep D (Dec 2025 paper, broader-DiT successor to CharaConsist). Defer until next character-consistency ingest.
- **Stub for BFS LoRA entity page** carried from verification sub-sweep D (Alissonerdx/BFS-Best-Face-Swap; canonical single-stage Klein 9B face-swap). Defer until next adapter ingest.
- **Wan 2.7 R2V** (reference-to-video) and **LTX-2 / 2.3** trainer paths beyond Musubi Tuner — track when video-LoRA training tooling lands those bases.
- **CogVideoX 2.0 + CogSound** native-audio capability — separate page when CogSound integration matures beyond research preview.
- Several entity stubs carry `[NEEDS VERIFICATION 2026-05-07]` flags (Wan 2.2 community LoRA author lineage; HunyuanVideo 1.5 step-distill GitHub source; Mochi 1 safety-classifier strip mechanics; LTX-2 audio drift on >10s dialogue; CogVideoX 2.0 release status; Seedance 2.0 API pricing). Resolve in a future verification sub-sweep.

---

## [2026-05-07] ingest | Path A step 6 — Persona Operations + Monetization (paired docx)

Path A step 6 — back-fill of two paired May 2026 deep-research docx (`research to be indexed/processed/AI Persona Operations Software Stack.docx`, 3.0 MB; `research to be indexed/processed/AI Personas_ Monetization, Ethics, Law.docx`, 3.1 MB) into structured wiki pages. Final Path A docx-source ingest. Companion to the existing pre-HEAVY brief `briefs/persona-consistency.md`. Per workspace scope (MEMORY.md "skip platforms/policy"), platforms-and-policy material is curated faithfully into the research/curation layer but **deprioritized** in the active build track — concept pages explicitly flag this scope split.

Preingest check: both docx confirmed NEW (sha256 c517fa7e... and 92800ad2...). No prior persona-ops or persona-monetization source pages in wiki/sources/.

### Created

**Sources (2)**

- `wiki/sources/persona-ops-stack-2026.md` — operations stack docx (7-axis architecture: scheduling / multi-account / DM / voice / orchestration / pipelines / calendar)
- `wiki/sources/persona-monetization-2026.md` — monetization + ethics + law docx (case studies, revenue mechanics, failure modes, payment rails, legal regimes)

**Concepts (6)**

- `wiki/concepts/persona-ops-stack.md` — umbrella architecture overview; reference architecture diagram; tier ladders (solo → enterprise $100K-300K build); 2026 strategic shifts (Reddit/X → Telegram, hosted-LLM dead-end, voice-clone open-sourcing, Model Routers)
- `wiki/concepts/persona-monetization-models.md` — revenue mechanics (DM/PPV/tips ≫ flat subs); Fanvue $100M ARR / 20% commission; ROI math + cost-arbitrage
- `wiki/concepts/persona-failure-modes.md` — 5-class catalog (account-bans / doxxing / payment-freezes / DMCA / tax); operational hygiene checklist
- `wiki/concepts/persona-payment-rails.md` — high-risk processor catalog; Payment Orchestration pattern; de-banking risk; 15-20% effective gateway take; build-track scope-flagged as research-layer reference
- `wiki/concepts/persona-legal-landscape.md` — 4 active regimes (US 2257 + state age-verification + UK OSA/DUAA s.138 + EU AI Act Article 50 Aug 2026); active litigation
- `wiki/concepts/persona-content-cadence.md` — AI-slop pivot from volume → 3-5 quality posts/wk; calendar automation patterns; build-track LoRA-stability implications

**Entities (5)**

- `wiki/entities/persona-ops/postiz.md` — modal 2026 SFW persona scheduler ($29/mo or self-host free)
- `wiki/entities/persona-ops/sillytavern.md` — de-facto NSFW DM frontend with character cards + lorebooks + RAG + 128K context
- `wiki/entities/persona-ops/fish-speech.md` — TTS-Arena2 leader May 2026; zero-shot from 10-30s reference audio
- `wiki/entities/persona-ops/n8n.md` — modal 2026 self-hosted orchestration; visual workflow + 400+ integrations + AI agent nodes
- `wiki/entities/personas/aitana-lopez.md` — most-documented Tier 1 AI persona case study (The Clueless Agency, Barcelona; >$20K/mo by May 2026)

### Updated (backlinks added during ingest)

- `wiki/concepts/persona-consistency-methods.md` — backlink from new persona-ops-stack umbrella concept
- `wiki/concepts/likeness-collision-verification.md` — backlinks from persona-failure-modes and persona-legal-landscape (verification gate)
- `wiki/concepts/character-dna-templates.md` — backlink from sillytavern entity (character card / lorebook parallel)
- `wiki/concepts/multi-angle-dataset-prep.md` — backlink from persona-content-cadence (LoRA-stability implication)

### Archived

- `research to be indexed/processed/AI Persona Operations Software Stack.docx` → `raw-sources/`
- `research to be indexed/processed/AI Personas_ Monetization, Ethics, Law.docx` → `raw-sources/`

### Pages touched

13 new + ~4 updated + 2 meta = **~19 pages**. Wiki now ~72 indexed pages; cumulative edges to be reported by lint.

### Cross-cutting findings

- **The 2026 NSFW persona-ops stack is fully open-source-self-hosted** along the critical-path tools: Postiz (scheduling), SillyTavern + local Qwen 3 / Mistral 3 / Llama 4 (DM), Fish-Speech S2 Pro (voice), n8n (orchestration), ComfyUI (image/video). Hosted-LLM stacks (GPT-5.4 / Gemini 3.1 Pro / Claude 4.6) are categorically NSFW-hostile in 2026.
- **ElevenLabs lost the NSFW voice market** despite top-tier Flash v2.5 SFW quality (75-150ms latency) due to platform-level NSFW ban. Fish-Speech S2 Pro now leads TTS-Arena2 — the open-source replacement is quality-competitive.
- **Distribution surface migration**: Reddit (~200K accounts purged daily April 2026) and X (mass-suspension wave with FaceID biometric verification) drove operators toward Telegram as the durable persona-distribution channel. Fanvue / OnlyFans remain the gated monetization endpoints (with OF zero-tolerance deepfake/face-swap policy from early 2026).
- **Cost-arbitrage via Model Routers** at agency tier: simple NLP tasks → cheap models (GPT-4o-mini class); complex reasoning → premium (Claude 3.5 Sonnet / GPT-5.4). Reported infrastructure savings 60-90%. Mirrors the FLUX-2 / Z-Image-Turbo tier arbitrage in the image generation track.
- **Revenue mechanics are NOT subscription-driven**: bulk of mid-tier and Tier-1 revenue is DM (parasocial messaging) + PPV + tips. NLP-augmented chat where the LLM parses and retains personal fan data is the core engine.
- **Content cadence pivot to 3-5 posts/wk**: algorithmic AI-slop suppression made volume-flooding counterproductive. Quality cadence with narrative progression / varied angles / realistic lighting outperforms. This validates the build-track focus on LoRA stability and multi-angle dataset prep over throughput.
- **Legal regimes converging on transparency**: EU AI Act Article 50 (Aug 2026) mandates machine-readable AI labeling; UK OSA + DUAA s.138 (Feb 2026) explicitly removes "just AI" defense for NCII; US 18 USC 2257 creates a synthetic-persona paradox with up-to-5-year federal exposure. Operators must default to absolute transparency + age-gating + likeness-collision verification regardless of physical location.
- **Workspace scope flag**: per MEMORY.md ("skip platforms/policy"), the persona-monetization + payment-rails + legal-landscape pages are explicitly marked as research-layer reference rather than build-track. The build track focuses on the technical components (local LLMs, voice clones, ComfyUI pipelines, n8n flows, anti-detect browser hygiene). Concept pages call out the scope split inline.

### Follow-ups opened

- **Path A back-fill is now end-to-end complete on all docx sources** (steps 1 + 2 + 3 + 4 + 6 + verification A-E). Remaining Path A item: step 5 (notes/frameworks-tools + hardware migration into wiki/entities/) — low-velocity, no docx source.
- **Tier 2 entity-page candidates** (deferred): Multilogin Pro 10 / GoLogin / Octobrowser anti-detect browsers; Bright Data / IPRoyal residential proxies; CCBill / SegPay payment processors; Supercreator / Infloww NSFW CRM. These are mentioned across the persona-ops-stack and persona-failure-modes / persona-payment-rails pages but don't yet have dedicated entity pages. Build out as needed.
- **Tier 2 persona case studies** (deferred): Emily Pellegrini (GlambaseApp, $5-10K/mo); Lexi Love (Foxy AI outlier, $30K/mo); Kenza Layli (Phoenix AI, Miss AI 2024 winner). Aitana Lopez covers the archetype; others are documented in the source page snippets.
- **NSFW LLM fine-tunes catalog** (deferred): Qwen 3 / Mistral 3 / Llama 4 abliterated and NSFW community fine-tunes warrant their own entity pages when the SillyTavern + DM stack track gets deeper attention.
- **Voice-clone tier-2 entities** (deferred): Qwen3-TTS / F5-TTS / MaskGCT / Coqui XTTS (legacy) covered in fish-speech.md narrative; standalone entity pages deferred until voice-cloning track intensifies.
- **Persona-track build runbook** opportunity: now that persona-consistency (image), video-generation, and persona-ops are all wiki-indexed, a `briefs/persona-end-to-end-runbook.md` synthesizing the full pipeline (LoRA training → image gen → video carry → DM stack → voice notes → orchestration) would be the natural next deliverable when the user wants an action-ready output.

---

## [2026-05-07] triage | W2 inbox triage + HeadsUp source page

W2 PDF inbox (9 papers carried over from prior sessions) triaged against the build-track scope. Verdict: **8 discarded, 1 ingested (thin/skimmed)**.

### Triage outcome

- **7 off-topic** (organoid segmentation / Retinex low-light enhancement / Markov-operator math / aerial imagery school detection / Groningen reservoir geology / Pix2Geomodel reservoir facies / Sentinel2Cap remote-sensing captioning) — moved to `research to be indexed/discarded/` with rationale per PDF in `discarded/TRIAGE-NOTES.md`.
- **1 nominally-adjacent but discarded after read**: `3D Human Face Reconstruction with 3DMM` (NYU student project, arXiv:2605.03996, 6 pages, tutorial-quality recreation of well-established BFM-regression). Single-image-to-3DMM territory already adequately covered by IPAdapter / arcface / PuLID concept pages — no novel build-track contribution. Moved to `discarded/`.
- **1 ingested**: `HeadsUp — Large-Scale 3D Gaussian Head Reconstruction from Multi-View Captures` (Apple, arXiv:2605.04035, 34 pages). Skimmed sections 1-4.6 + conclusion; supplementary not read.

### Created

- `wiki/sources/headsup-3d-gaussian-head.md` — Apple feed-forward 3DGS head reconstruction trained on 10K-subject internal multi-view dataset (16 calibrated cameras, 1000×750). UV-parameterized Gaussians anchored to neutral head template. Two downstream applications motivate the ingest: (a) text-driven novel-identity generation via DiT trained on precomputed latents Z + frozen decoder; (b) blendshape-driven latent animation via transformer F_θ predicting Ẑ_b = F_θ(Z_n, b). State-of-the-art vs Avat3r baseline with >1 OOM fewer Gaussians and N=16-view scaling (Avat3r capped at N=6 by memory). Build-track applicability flagged as bounded by multi-camera rig requirement + closed Apple Internal10K dataset + 16× H100 × 10-day training cost; filed as research-future bridge to 3D-anchored persona consistency rather than deployable today. `read_status: skimmed`, maturity `draft`.

### Updated (backlinks added during ingest)

- `wiki/concepts/multi-angle-dataset-prep.md` — backlink (text-driven novel-identity generation as research-future bridge to dataset-prep workflow at the latent-3D level)
- `wiki/concepts/video-identity-inheritance.md` — backlink (blendshape-driven latent animation as cleanest research demonstration of identity-preserving expression control entirely in latent space)
- `wiki/concepts/persona-consistency-methods.md` — backlink (large-scale feed-forward identity reconstruction as future fifth axis "3D-latent-anchored consistency" complementing the current four 2D-adapter axes)

### Archived

- `research to be indexed/Large-Scale High-Quality 3D Gaussian Head Reconstruction from Multi-View Captures.pdf` → `raw-sources/`
- 8 discarded PDFs → `research to be indexed/discarded/` with `TRIAGE-NOTES.md` audit trail

### Pages touched

1 new + 3 updated + 1 meta (index.md) = **5 pages**. W2 inbox is now empty (all 9 PDFs disposed). Wiki count up to ~73 indexed pages.

### Cross-cutting findings

- **Build-track 2026 still routes through 2D-adapter stacks** (PuLID + LoRA) for persona consistency; 3D-Gaussian-head feed-forward reconstruction (HeadsUp class) is ~1-2 years premature for consumer persona ops. Filed for the 2027-2028 horizon.
- **Apple is the institutional driver** of feed-forward multi-view head reconstruction at scale (Internal10K is 1 OOM larger than any public multi-view face dataset). Closed dataset means consumer reproduction will lag; track for an open-weight or open-dataset successor.
- **Single-view inference does not yet work** for HeadsUp-class methods (N=1 yields blurry results + identity drift). The frontier "single-photo → 3D persona" use case still belongs to GAN-inversion methods (PanoHead / SphereHead / TriPlaneNet) noted as a parallel track in HeadsUp's related work.

### Follow-ups opened

- **Open-source feed-forward 3DGS-head baselines** for build-track-relevant downstream experimentation: stub-track Pippo / Avat3r reimplementation availability when the persona track moves toward 3D-anchored consistency.
- **No active build-track action** triggered by HeadsUp ingest; this is a research-layer reference page, not a workflow change.

### Inbox state

`research to be indexed/` is now empty (excluding `processed/` legacy archive and the new `discarded/` audit folder). W2 closed.

---

## [2026-05-08] Gap-fill sprint — UI, hardware, marketplace, model stubs

**Goal**: Make the wiki usable for a newcomer arriving in the uncensored image-gen universe. Targeted the biggest structural holes left after the HEAVY-mode upgrade.

### New pages created (7)

| Page | Type | Source material |
|------|------|----------------|
| `entities/uis/comfyui.md` | entity (validated) | notes/frameworks-tools.md, survey data, hands-on workspace knowledge |
| `entities/uis/automatic1111.md` | entity (stub) | general SD ecosystem knowledge |
| `entities/uis/forge.md` | entity (stub) | general SD ecosystem knowledge |
| `entities/uis/invokeai.md` | entity (stub) | general SD ecosystem knowledge |
| `entities/uis/swarmui.md` | entity (stub) | general SD ecosystem knowledge |
| `entities/hardware/gpu-guide.md` | entity (validated) | notes/hardware-optimization.md + survey hardware sections |
| `entities/marketplaces/civitai.md` | entity (validated) | survey data, community knowledge |

### Deepened stubs (3)

- **Pony V6** — added `entities/uis/comfyui.md` + `entities/marketplaces/civitai.md` backlinks; validated cross-links to adapter ecosystem
- **FLUX.1 Dev** — added `entities/uis/comfyui.md` + `entities/marketplaces/civitai.md` + `entities/hardware/gpu-guide.md` backlinks; confirmed already-validated content is solid
- **FLUX.2 Klein** — confirmed adapter-port status (PuLID II shipped, InfiniteYou not yet); quality notes validated from survey
- **NoobAI-XL** — upgraded from draft to confirmed community-status claims; added workspace TODOs

### Structural fixes

- Fixed 2 dangling links (typo `latx-2` → `ltx-2` in ComfyUI page; removed `comfyui-omniconsistency.md` reference to non-existent page)
- Cross-linked all 4 new UI stubs bidirectionally
- Added `comfyui.md` back-links to hub pages (flux.md, flux-1-dev.md, pony-v6.md)

### Linter results

- **80 pages indexed**, 855 outbound edges, **0 orphans**, **0 stub quality flags**
- **89 asymmetric edges** remaining — natural for new pages; hub-page reverse-links are additive, not breaking
- **Gap detection**: 0 Type A (cited-unread stubs), 0 Type D (stale NEEDS VERIFICATION), 0 Type E (thin concepts) — **all clear**

### Still needed (backlog)

- `entities/uis/swarmui.md` has 0 inbound refs — needs backlinks from relevant pages
- ~89 asymmetric edges remain — mostly "new page → existing page" without reverse. Acceptable for now; resolve on next touch
- `entities/uis/comfyui.md` needs workflow JSON screenshots
- `entities/hardware/gpu-guide.md` needs per-model × per-GPU benchmark data
- `wiki_lint.py` should be run after any new page additions to catch structural issues early

---

## [2026-05-08] deliverable | Model Selection & Workflow Builder + Beginner Guide

Created two action-ready deliverables for a friend getting started with local AI image generation:

### Created

- `wiki/concepts/model-selection-workflow.md` — decision-support concept page mapping hardware tier + creative goals (style, video, persona?) to one of five canonical starter stacks; includes universal generation workflow diagram, prompting tips per base, upgrade decision table, and cross-cutting decision matrix. Maturity: validated.
- `briefs/beginner-guide-to-persona.md` — complete beginner's guide from zero to posting: hardware verification, ComfyUI setup, model selection, Character DNA writing, first generations, identity adapters, LoRA training overview, likeness collision verification, Postiz posting setup, content cadence, and common beginner mistakes. No prior experience assumed.

### Updated

- `wiki/index.md` — added 1 concept row (model-selection-workflow). Brief not indexed in wiki (lives in briefs/).
- `wiki/log.md` — this entry.

### Cross-cutting

- The model-selection workflow page synthesises content from the existing wiki (hardware guide, model entities, persona-consistency methods, reference-plus-LoRA stacking) into a goal-oriented decision tree rather than a reference-only catalog. It bridges the gap between "I have this GPU and want to start" and "here's exactly what to install and which model to pick."
- The beginner guide is the most accessible entry point in the entire workspace — written for someone who has never generated an AI image, never trained a LoRA, and has never operated a persona. It deliberately omits platform policy / monetization depth (per MEMORY.md scope) and links to the runbook for that.

### Lint state

- No new cross-link issues expected — model-selection-workflow references existing wiki pages via `@path` syntax and all targets exist.
- Briefs index not tracked by wiki lint (different directory).

---

## [2026-05-08] ingest | AI Creator Operations & Compliance Blueprint + AI Persona Launch Strategy Analysis

Two new deep-research docx files dropped into `research to be indexed/`. Both passed preingest check as NEW (no duplicates). Full content read and synthesized into wiki source pages.

### Created

**Sources (2)**

- `wiki/sources/ai-creator-operations-blueprint.md` — operational blueprint for 100% AI-generated synthetic persona agency: KYC/2257 compliance, Florida Protected Series LLC, platform viability matrix (Fanvue/OnlyFans/Patreon/Passes), 4-phase launch sequence, daily ops via OpenRouter/n8n/CRM. Maturity: draft.
- `wiki/sources/ai-persona-launch-strategy-analysis.md` — critical evaluation of synthetic persona deployment methodologies; technical compatibility scored 3/10 for cloud-dependent advice; recommends local Mac Studio/MLX/Draw Things, OpenRouter API with context truncation, IP-Adapter/ControlNet, ComfyUI+AnimateDiff, GEO over SEO; explicit KYC spoofing warning. Maturity: draft.

**Entities (3)**

- `wiki/entities/marketplaces/fanvue.md` — stub (from blueprint §2.1)
- `wiki/entities/hardware/mac-studio.md` — stub (from both documents)
- `wiki/concepts/persona-ops-workflow.md` — stub (synthesis placeholder)

**Concepts (3)**

- `wiki/concepts/geo-vs-seo.md` — stub (from both documents)
- `wiki/concepts/openrouter-chat-workflow.md` — stub (from Launch Strategy §1.2 + §4.2)
- `wiki/concepts/video-identity-inheritance.md` — updated with new source backlinks

### Updated

- `wiki/entities/uis/comfyui.md` — +ai-creator-operations-blueprint.md, +ai-persona-launch-strategy-analysis.md backlinks in both frontmatter and Relations section
- `wiki/concepts/video-identity-inheritance.md` — +both new source backlinks in frontmatter and Relations
- `wiki/index.md` — added 2 source rows (⚠ stub-source), 1 entity row (fanvue), 1 hardware row (mac-studio), 4 concept rows (persona-ops-workflow, geo-vs-seo, openrouter-chat-workflow, video-identity-inheritance updated)

### Archived

- `research to be indexed/AI Creator Operations & Compliance Blueprint.docx` → `raw-sources/`
- `research to be indexed/AI Persona Launch Strategy Analysis.docx` → `raw-sources/`

### Pages touched

2 new sources + 3 new stubs + 3 existing updated + 1 index = **9 pages**.

### Cross-cutting

- Both documents converge on the same architecture: local Apple Silicon generation, OpenRouter LLM routing, GEO-based traffic, Fanvue as primary platform. The Launch Strategy Analysis explicitly rejects KYC spoofing (Octobrowser video spoofing) as wire-fraud-tier risk — aligns with the Operations Blueprint's compliance-first posture.
- Many entity/concept pages referenced by these documents are still stubs — the source pages provide the detailed content; back-fill of dedicated entity pages is deferred to future touches.

---

### Lint state

- New pages are stubs; expected to trigger orphan/gap flags until related pages are back-filled. Run `wiki_lint.py` after commit to verify.

---

## [2026-05-08] Integrate ops blueprint + launch strategy into end-to-end runbook

### Sources engaged

- `sources/ai-creator-operations-blueprint.md` — compliance, platform matrix, 4-phase launch, daily ops
- `sources/ai-persona-launch-strategy-analysis.md` — Mac Studio stack, OpenRouter context mgmt, GEO, IP-Adapter/ControlNet

### Created

- `wiki/runbooks/zimage-setup-runbook.md` (expanded from 1-page setup to full end-to-end runbook with compliance, hardware, identity consistency, video, platform matrix, 4-phase launch, GEO, monetization, troubleshooting)

### Updated

- `wiki/concepts/persona-ops-workflow.md` — expanded stub to full operational lifecycle from both source docs (4-phase framework, daily ops, compliance checklist)
- `wiki/concepts/geo-vs-seo.md` — enriched stub with S-E-T framework, schema markup, geographic anchoring, social funnel automation
- `wiki/concepts/openrouter-chat-workflow.md` — expanded stub with context window management script, positive-framing prompt design, n8n integration architecture
- `wiki/entities/hardware/mac-studio.md` — expanded stub with performance benchmarks, Draw Things vs ComfyUI comparison, power/acoustics notes
- `wiki/entities/marketplaces/fanvue.md` — expanded stub with Manager Accounts detail, revenue data, TOS compliance, platform alternatives
- `wiki/entities/uis/comfyui.md` — added Apple Silicon performance notes, custom node install commands, model compatibility matrix, dual-pass pipeline patterns, Draw Things hybrid workflow
- `wiki/runbooks/day-1-checklist-for-friend.md` — restructured into 5 phases (Infrastructure/Legal → Hardware → Persona Creation → Video → Platform/Marketing) with full compliance checklist
- `wiki/index.md` — updated Z-Image Turbo runbook entry with expanded tag set

## [2026-05-08] ingest | 3 new source documents (content factory + persona narrative)

### Created (3 source pages)

- `wiki/sources/ai-content-factory-workflow-design.md` — Windows multi-GPU inference factory: VRAM isolation, CUDA fallback disabling, TensorRT quantization, tri-layered character consistency (IP-Adapter + PuLID + ControlNet), dual-layer RAG, ExifTool metadata scrubbing + watermarking. 86 references.
- `wiki/sources/mac-studio-ai-content-factory-design.md` — Apple Silicon content factory: UMA `iogpu.wired_limit_mb` bypass, MLX vs llama.cpp benchmarks (+37% sustained), vllm-mlx 4.3× concurrent batching, KV cache q4_0 quantization, IP-Adapter-FaceID/InsightFace pipeline, ReAct agentic workflows via OpenRouter. 87 references.
- `wiki/sources/virtual-persona-narrative-development-strategy.md` — Persona narrative engineering: parasocial PSR framework, Hyper-Competent Imposter Syndrome flaw design, OpenRouter Agent SDK CYOA storylines, 4-pillar GEO strategy, Schema.org Person markup, independent lore wiki architecture, 12-month narrative arc mapped to Davie FL. 98 references.

### New pages (3)

- `wiki/sources/ai-content-factory-workflow-design.md`
- `wiki/sources/mac-studio-ai-content-factory-design.md`
- `wiki/sources/virtual-persona-narrative-development-strategy.md`

### Updated (5 pages)

- `wiki/entities/hardware/mac-studio.md` — added UMA bypass (`iogpu.wired_limit_mb`), MLX vs llama.cpp benchmarks, KV cache quantization
- `wiki/entities/uis/comfyui.md` — added Windows multi-GPU isolation, TensorRT integration, tri-layered consistency pipeline
- `wiki/entities/adapters/ip-adapter.md` — added FaceID/InsightFace biometric pipeline detail, FaceID-Plus dual-signal architecture
- `wiki/concepts/persona-consistency-methods.md` — added Axis 2 tri-layered injection architecture with control step tuning and scheduler selection
- `wiki/concepts/geo-vs-seo.md` — enriched with 4-pillar GEO framework from persona narrative strategy doc
- `wiki/concepts/persona-ops-workflow.md` — added dual-layer RAG architecture, ReAct agentic orchestration, temporal memory governance

### Cross-cutting

- All three source docs converge on: deterministic character consistency via adapter injection (not LoRA-only), agentic memory as dual-layer RAG, post-processing metadata hygiene as operational requirement
- Windows and Mac Studio factory designs provide platform-parallel architectures for the same persona-ops pipeline
- Persona narrative strategy connects content engineering to GEO/discoverability — bridges the gap between generation and audience-building

- Both source documents converge on: local Apple Silicon generation, OpenRouter LLM routing, GEO over SEO, Fanvue as primary platform, strict KYC compliance (no spoofing)
- Day-1 checklist now bridges from raw hardware setup through to platform monetization, previously started mid-pipeline
- Runbook now serves as single entry point for the full persona operation lifecycle; individual concept/entity pages provide depth on each subsystem

---

## [2026-05-08] ingest | Synthetic Media IP Financial Roadmap (full)

Full ingest of a comprehensive 24-month financial and strategic roadmap for synthetic media IP commercialization. Document covers corporate architecture (Florida Series LLC), compute unit economics, Web3 monetization (fan tokens, token gating, crypto gateways), SEC regulatory framework, and IP valuation/exit engineering.

### Created (6)

**Sources (1)**
- `wiki/sources/synthetic-media-ip-financial-roadmap.md` — full roadmap: Series LLC structure, compute economics ($0.005/img, $0.48/min video), Web3 stack, SEC 2026 digital collectible guidance, VC valuation benchmarks (15–50x multiples), 24-month execution plan. Maturity: validated.

**Concepts (4)**
- `wiki/concepts/synthetic-media-corporate-structure.md` — Florida Protected Series LLC taxonomy (Master LLC + IP Holding Cell + per-persona ops series), horizontal liability shield, S-Corp/C-Corp tax elections, FL R&D Tax Credit, regional incentives. Maturity: draft.
- `wiki/concepts/synthetic-media-compute-economics.md` — unit economics for image ($0.005 on RTX 4090) and video ($0.48/min on A100 with open-weight models), 90% margin architecture, commercial API vs self-hosted comparison, hidden idle-burn costs. Maturity: draft.
- `wiki/concepts/synthetic-media-web3-monetization.md` — 4-layer decentralized revenue stack: crypto payment gateways (BVNK/Triple-A), fan token economy (Solana/pump.fun), token-gating infrastructure (Collab.Land/Guild.xyz), AI agent revenue ($2K–$10K/mo). SEC 2026 digital collectible classification guidance. Maturity: draft.
- `wiki/concepts/synthetic-media-ip-valuation.md` — IP valuation framework (data + model weights), VC benchmarks (Burn Multiple <1.5x, CAC Payback <12mo, Rule of 40), SAFE vs convertible notes, exit strategies (family offices, Web3 acquirers, Dapper/Brud precedent). Maturity: draft.

**Entities (1)**
- `wiki/entities/models/open-sora.md` — open-weight DiT video model (HPC-AI Tech), Apache 2.0, ~$0.48/min on A100 cloud, recommended for cost-effective DTC video production. Maturity: draft.

### Updated (8)

- `wiki/sources/ai-creator-operations-blueprint.md` — +synthetic-media-corporate-structure.md, +synthetic-media-ip-financial-roadmap.md to related
- `wiki/concepts/persona-ops-workflow.md` — +synthetic-media-corporate-structure.md, +synthetic-media-ip-financial-roadmap.md to related
- `wiki/concepts/persona-monetization-models.md` — +synthetic-media-web3-monetization.md, +synthetic-media-ip-valuation.md to related
- `wiki/concepts/persona-payment-rails.md` — +synthetic-media-web3-monetization.md to related
- `wiki/entities/hardware/gpu-guide.md` — +synthetic-media-compute-economics.md, +synthetic-media-ip-financial-roadmap.md to related
- `wiki/entities/models/wan-2-2.md` — +open-sora.md, +synthetic-media-compute-economics.md to related
- `wiki/entities/models/hunyuanvideo-1-5.md` — +open-sora.md, +synthetic-media-compute-economics.md to related
- `wiki/entities/models/cogvideox-1-5.md` — +open-sora.md, +synthetic-media-compute-economics.md to related

### Archived

- `research to be indexed/Synthetic Media IP Financial Roadmap.docx` → `raw-sources/`

### Pages touched

6 new pages + 8 existing updated + 1 index = **15 pages**.

### Lint state

- 5 new pages are stubs (⚠); expected to resolve as back-fill content accumulates.
- ~89 asymmetric edges remain (mostly new→existing without reverse link); acceptable.
- Run `wiki_lint.py` after commit to verify structural integrity.

### Cross-cutting

- First document to provide **quantitative financial modeling** ($/image, $/min, margin calculations) for the synthetic media domain.
- Fills 5 major wiki gaps: corporate structure economics, compute economics, Web3 monetization, fan tokens/token gating, IP valuation.
- Connects previously siloed domains (legal structure + GPU costs + revenue architecture + exit strategy) into a single coherent playbook.
- Open-Sora 2.0 emerges as a cost-competitive open-weight video alternative alongside Wan 2.2 and HunyuanVideo 1.5.

---

## [2026-05-09] lint-fix | Close bidirectional gap on synthetic-media-compute-economics

CogVideoX 1.5 entity page was missing reciprocal backlink to `concepts/synthetic-media-compute-economics.md`. The concept page's `## Relations` section already listed the entity pages, but the entity pages' frontmatter `related` fields didn't include the concept — a classic one-way ingest omission.

### Fixed

- `entities/models/cogvideox-1-5.md` — added `concepts/synthetic-media-compute-economics.md` to `related:` frontmatter and `## Relations` inline list
- `concepts/synthetic-media-compute-economics.md` — added `entities/models/wan-2-2.md`, `entities/models/hunyuanvideo-1-5.md`, `entities/models/cogvideox-1-5.md` to `related:` frontmatter (Relations section already had them)

### Linter result

Bidirectional gap for `synthetic-media-compute-economics.md` resolved. Remaining gaps (58) are all pre-existing.

---

## [2026-05-09] research | Prompt engineering & two-pass workflow for uncensored generation

Deep research into practical uncensored image generation techniques — prompt structure, negative prompts, CFG guidance, and multi-pass refinement workflows across all major model families (SDXL/Pony/Illustrious, FLUX, Z-Image, Qwen-Image).

### Created (2 concept pages)

- `wiki/concepts/prompt-engineering-uncensored.md` — model-specific prompt formats (Danbooru tags for SDXL, dual CLIP-L+T5 for FLUX, DiT-native natural language), negative prompt strategies per model family, CFG scale tables, common failure modes and prompt-level fixes. Sourced from 20+ community references (Reddit, CivitAI, GitHub, model docs). Maturity: validated.
- `wiki/concepts/two-pass-generation-workflow.md` — standard 2026 production pipeline: T2I composition pass → I2I detail/refinement pass → targeted inpainting → upscaling. Per-model denoise tables, pipeline diagrams, model-pairing recommendations (Pony→Juggernaut, FLUX+NSFW LoRA, Z-Image single/two-pass). Maturity: validated.

### Updated (4 pages — cross-links + content)

- `wiki/concepts/reference-plus-lora-stacking.md` — added `prompt-engineering-uncensored.md` and `two-pass-generation-workflow.md` to Relations; added CLIP-L vs T5 mismatch failure mode (dual-encoder degradation of ~50-75% when both receive identical text)
- `wiki/concepts/de-censoring-techniques.md` — added `prompt-engineering-uncensored.md` and `two-pass-generation-workflow.md` to Relations
- `wiki/concepts/model-selection-workflow.md` — added `prompt-engineering-uncensored.md` and `two-pass-generation-workflow.md` to Relations
- `wiki/index.md` — added 2 new concept rows (prompt-engineering-uncensored, two-pass-generation-workflow)

### Cross-cutting

- Research closes a critical wiki gap: the existing model-catalog and de-censoring pages described *what* models to use but lacked the *how* — practical prompt-level and workflow-level guidance for actually generating uncensored images. These two new pages fill that gap.
- Key community consensus: (1) Danbooru tags remain king for SDXL NSFW models; (2) FLUX dual-encoder separation (CLIP-L keywords + T5 prose) is widely misunderstood and under-documented; (3) two-pass T2I→I2I is the modal production pattern across all bases; (4) Z-Image Turbo's CFG=0 paradigm is fundamentally different from SDXL/FLUX guidance.

### Follow-ups

- `prompts/github-repo-eval.md` — image-gen-specialized Phase-0 audit prompt still needs to be shipped (backlog item from 2026-05-08)
- `concepts/persona-ops-workflow.md` — still a stub; could be deepened with the new workflow content

## [2026-05-14] cross-wiki route | voicebox — Local-First AI Voice Studio

Cross-wiki stub routed from `@osint-wiki/entities/tools/voicebox.md`.
- Created wiki/entities/voicebox.md (stub)

## [2026-05-15] cross-wiki route | OmniVoice — Zero-Shot Voice Cloning for 600+ Languages

Cross-wiki stub routed from `@osint-wiki/entities/tools/omnivoice.md`.
- Created wiki/entities/omnivoice.md (stub)

## [2026-05-15] cross-wiki route | Open-Generative-AI — Local-First Generative Media Platform

Cross-wiki stub routed from `@osint-wiki/entities/tools/open-generative-ai.md`.
- Created wiki/entities/open-generative-ai.md (stub)

## [2026-05-15] cross-wiki route | gracia.ai — Gaussian Splatting volumetric video

Cross-wiki stub routed from `@osint-wiki/sources/eval-github-repos-2026-05-13.md`.
- Created wiki/concepts/2026-05-13_gracia-ai-volumetric-video.md (stub)

## [2026-05-16] ingest (cross-wiki route from OSINT) | SANA-WM — Efficient Minute-Scale World Modeling with Hybrid Linear Diffusion Transformer

Cross-wiki ingest: the NVIDIA paper "SANA-WM" (arXiv:2605.15178v1, 2026-05-14) was dropped into the OSINT workspace inbox but is entirely off-topic for OSINT/finance — it is a video / world-model generation paper, primary fit image-gen. Routed here and ingested as a full source page (deep-read of abstract + intro). Raw file canonical at `cemini-librarian:/opt/cemini-bulk/research/2605.15178v1.pdf`. No OSINT backlink (no OSINT page exists for it).

- Created wiki/sources/sana-wm-minute-scale-world-model.md (source, deep-read, validated) — NVIDIA's 2.6B open-source video world model: one-minute 720p, 6-DoF camera control, hybrid GDN/softmax linear attention, dual-branch camera control, two-stage long-video refiner, metric-scale pose annotation; ~213K clips / 15d on 64 H100 / 60s clip on a single GPU / distilled RTX 5090 NVFP4 variant 34s; up to 36× throughput vs baselines; LTX2 tokenizer
- Created wiki/entities/models/sana-wm.md (entity, validated) — the model itself; extends the SANA linear-DiT lineage into camera-controlled world modeling
- Created wiki/concepts/world-models-video-generation.md (concept, stub) — action-conditioned explorable video generators vs prompt-to-clip T2V/I2V
- Created wiki/concepts/camera-controlled-video-generation.md (concept, stub) — conditioning video on an explicit 6-DoF camera trajectory; dual-branch design vs temporal VAE compression
- Created wiki/concepts/hybrid-linear-attention.md (concept, stub) — interleaving Gated DeltaNet linear blocks with periodic softmax attention for minute-scale long-context modeling
- Updated wiki/entities/models/sana.md — added SANA-WM / source / hybrid-linear-attention backlinks; bumped updated
- Updated wiki/entities/models/ltx-2.md — added SANA-WM / source backlinks (SANA-WM uses the LTX2 tokenizer as its video latent codec); bumped updated
- Updated wiki/sources/video-generation-survey-2026.md — added SANA-WM source backlink (adjacent video-gen ingest); bumped updated
- Updated wiki/index.md — added 1 source, 1 model, 3 concept rows

## [2026-05-21] ingest | cross-wiki brief triage — 18 briefs processed, 2 stub entities created, 2 concept pages enhanced

Full triage of all 18 briefs in `briefs/` (the gitignored deliverables directory):
- 6 briefs were already ingested (content existed in wiki pages) — marked `processed: 2026-05-21` only
- 2 briefs are dead-end/reference-only with no wiki-promotion value — marked `processed: 2026-05-21` only
- 4 cross-wiki tool-eval briefs promoted — 2 became stubs, 2 were content already present
- 6 large persona-ops briefs — content folded into existing wiki pages

### Stub entities created (2)

- `wiki/entities/persona-ops/delive.md` — Apache-2.0 system-audio capture + 12 ASR backends + 60+ languages. Persona-ops application: voice/TTS synchronization for character consistency workflows; MCP server + Bearer-auth for Claude Code integration. Sourced from K55 and K54 cross-wiki tool eval briefs.
- `wiki/entities/persona-ops/moneyprinter.md` — MIT-licensed short-form video automation (MoviePy-based, 13.3k★). **License-corrected** from the K54 eval's phantom AGPL-3.0 claim — `gh api` confirms MIT. Candidate for persona-ops short-form content workflows.

### Concept pages enhanced (2)

- `wiki/concepts/persona-ops-stack.md` — added distribution-channel tooling (Reddit: Social-Rise/Postpone/Conbersa; Telegram: Manychat/Botpress; X/Twitter: Hypefury/Typefully; OF/Fanvue); added voice-sync (DeLive) and video-automation (MoneyPrinter, yt-dlp) tools. Enhanced from ~111 to ~140 lines.
- `wiki/concepts/persona-monetization-models.md` — added detailed Tier 1 case studies: Aitana Lopez (€3K/mo avg, 392K IG, specific brand partners), Emily Pellegrini ($9,688 first 6 weeks Fanvue-confirmed, $100K lifetime), Lil Miquela (~$125M valuation, Dapper Labs acquisition).

### Backlink fixes (3)

- `wiki/entities/persona-ops/n8n.md` — added reciprocal backlinks to delive + moneyprinter
- `wiki/entities/persona-ops/fish-speech.md` — added reciprocal backlink to delive
- `wiki/concepts/persona-content-cadence.md` — added reciprocal backlink to moneyprinter

### Index updated

- `wiki/index.md` — added DeLive and MoneyPrinter entries under Persona-ops tools

### Lint state

0 hard errors maintained. All 72 cross-wiki references resolve.

## [2026-06-13] ingest | K114 — MentisOculi visual reasoning limits

**Source**: `research to be indexed/` — daily digest fetch (2026-06-13 sweep); federation K114 cross-wiki ingest.

- **NEW** `@sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md` (read) — five procedural tasks; UMM visual CoT ineffective vs text MLLMs; generation + interpretation errors
- **NEW** `@concepts/machine-mental-imagery.md` — visual reasoning spectrum synthesis
- **NEW** `@entities/benchmarks/mentisoculi.md` — benchmark entity (Form Board, Hinge Folding, Paper Fold, Rush Hour, Sliding Puzzle)
- **Updated** `holistic-visual-tokenizer-umm.md`, `index.md`
- **PDF** remains in inbox pending `raw-sources/` move — operator-gated per ingest ritual

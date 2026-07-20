---
title: World Models for Video Generation
type: concept
tags: [concept, world-model, video-generation, interactive, action-controllable, world-simulator]
keywords: [world model, world simulator, interactive video generation, action-controllable, camera-controllable, minute-scale, autoregressive rollout, explorable environment, LingBot-World, HY-WorldPlay, scene identity preservation, dual-branch camera control, hybrid linear attention]
related:
  - sources/sana-wm-minute-scale-world-model.md
  - entities/models/sana-wm.md
  - concepts/camera-controlled-video-generation.md
  - concepts/hybrid-linear-attention.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - sources/arxiv-2605-31336-decmem-world-generation.md
  - entities/models/decmem.md
  - entities/models/wan-2-2.md
  - entities/models/ltx-2.md
  - concepts/long-video-rag-retrieval.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
  - entities/models/metaworld.md
  - concepts/activation-steering-video-generation.md
  - sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md
  - sources/arxiv-2603-18639-orthophys-physics-video.md
  - concepts/physics-aware-orthogonal-view-video.md
  - sources/arxiv-2606-04811-dream-exe-robot-executability.md
  - concepts/video-generation-physical-executability.md
  - sources/arxiv-2606-07508-streamforce-streaming-force-video.md
  - concepts/streaming-force-controlled-video-generation.md
  - sources/arxiv-2606-09056-millivid-hierarchical-latents.md
  - concepts/hierarchical-latent-coarse-to-fine-video.md
  - sources/arxiv-2606-09507-prisma-world-multi-agent-video.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - entities/models/prisma-world.md
  - sources/arxiv-2606-09150-ultra-flash-streaming-hr-video.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - concepts/latent-spatial-memory-video-world-models.md
  - entities/models/mirage.md
  - sources/arxiv-2606-13376-moverse-panoramic-gaussian-world.md
  - concepts/panoramic-gaussian-video-world-models.md
  - entities/models/moverse.md
  - sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md
  - concepts/subject-reconstruction-long-video-memory.md
  - entities/models/memento.md
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - concepts/disentangled-context-memory-video-edits.md
  - entities/models/permavid.md
  - concepts/vlm-guided-physical-video-generation.md
  - sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md
  - entities/models/causalmotion.md
  - sources/arxiv-2606-16533-kairos-native-world-model-stack.md
  - concepts/physical-ai-native-world-model-stacks.md
  - entities/models/kairos.md
  - sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md
  - concepts/llm-choreographed-multi-view-world-models.md
  - sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md
  - concepts/multi-view-3d-consistent-world-models.md
  - sources/arxiv-2606-17742-brainworld-fmri-structural-prior.md
  - concepts/structural-prior-conditioned-spatiotemporal-generation.md
  - sources/arxiv-2606-23105-car-implicit-memory-video-world.md
  - concepts/implicit-memory-retrieval-video-world-models.md
  - entities/models/car.md
  - sources/arxiv-2602-22960-ucm-camera-control-memory-world-models.md
  - concepts/ucm-time-aware-pe-warping-world-models.md
  - sources/arxiv-2607-06216-moworld-flash-world-model.md
  - entities/models/moworld.md
  - sweeps/2026-07-13-daily.md
  - sources/arxiv-2607-14076-interactive-world-models-game-engines.md
  - sweeps/2026-07-16-daily.md
  - sources/arxiv-2607-15278-hierarchical-denoising-visual-reasoning.md
  - sweeps/2026-07-17-daily.md
  - sources/arxiv-2607-15254-tellme-why-urban-driving-causal.md
  - sweeps/2026-07-18-daily.md
  - sources/arxiv-2607-15849-tango-test-time-noise-guided-ar-video.md
  - entities/models/tango-ar-video.md
  - sweeps/2026-07-20-daily.md
maturity: draft
created: 2026-05-16
updated: 2026-07-20
---

## Relations

@sources/sana-wm-minute-scale-world-model.md @entities/models/sana-wm.md @concepts/camera-controlled-video-generation.md @concepts/hybrid-linear-attention.md @sources/video-generation-survey-2026.md
@sources/arxiv-yocausal-world-model-benchmark-2605-30346.md @sources/arxiv-proprio-physics-video-2605-28230.md @sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md @entities/models/wan-2-2.md @sources/arxiv-2605-31336-decmem-world-generation.md @entities/models/decmem.md @entities/models/metaworld.md @concepts/activation-steering-video-generation.md @concepts/multi-agent-cross-view-video-world-models.md @entities/models/prisma-world.md @concepts/latent-spatial-memory-video-world-models.md @entities/models/mirage.md

## Raw Concept

Stub created during the cross-wiki ingest of NVIDIA's SANA-WM paper (@sources/sana-wm-minute-scale-world-model.md), routed from the OSINT workspace 2026-05-16. Anchors the distinction between *clip generators* (prompt-to-clip T2V/I2V) and *world models* as the wiki gains its first ingested example of the latter.

## Narrative

**2026-07-18 peripheral:** @sources/arxiv-2607-15254-tellme-why-urban-driving-causal.md — dashcam causal-analysis tooling (not a generator); archive-only.

### Working definition

A **video world model** is an action-conditioned, scene-identity-preserving video generator trained natively at long horizons. Three properties separate it from a clip generator:

1. **Action conditioning over prompt conditioning.** The control surface is an explicit action signal — a 6-DoF camera trajectory in the SANA-WM case — rather than (or alongside) a text prompt. The output *follows* the action.
2. **Long-horizon native training, not extrapolation.** A clip model trained on 5–10s windows produces structural artifacts past native context length; a world model is trained directly at the long horizon (minute-scale in SANA-WM) so the long context is the native regime, not an extrapolation.
3. **Scene-identity preservation under action.** Re-visiting the same point in the scene under a returning camera trajectory should yield a consistent appearance — the world is *explorable*, not a one-shot animation. SANA-WM's benchmark explicitly tests "revisit trajectories" for this reason.

### Distinction from T2V/I2V clip generators

The 2026 prompt-to-clip landscape catalogued in @sources/video-generation-survey-2026.md — Wan 2.2, HunyuanVideo 1.5, LTX-2, Mochi 1, CogVideoX 1.5/2.0, Seedance 2.0 — sits on a different axis:

| Axis | Clip generator (T2V/I2V) | World model |
|---|---|---|
| Control input | Text prompt (+ optional first frame) | Action signal (camera trajectory, etc.) + first frame |
| Native horizon | 5–10s | minute-scale and up |
| Output relation to input | Mapping (prompt → fixed clip) | Rollout (first frame + action → controllable trajectory) |
| Re-entry consistency | Not a requirement | Required (explorable environment) |
| Typical deployment | Offline render | Streaming / autoregressive / interactive |

A clip generator that accepts an audio or camera signal as auxiliary conditioning is not automatically a world model — the *native* horizon and the explorability commitment are what matter.

### Architectural commitments

To hit those properties at a tractable cost, 2026 world models converge on a recognizable stack (well-instantiated in SANA-WM):

- **Hybrid attention** — pure full-attention is quadratic in the long horizon; pure linear attention loses exact long-range recall. The current solution is to interleave linear (e.g. Gated DeltaNet) blocks with periodic softmax-attention layers. → @concepts/hybrid-linear-attention.md
- **Dual-rate action conditioning** — temporal VAE compression collapses many raw frames into one latent token, which destroys fine action signal within each stride. A latent-rate branch (e.g. UCPE) for global trajectory + a raw-frame branch (e.g. Plücker mixing) for sub-stride detail is the canonical fix. → @concepts/camera-controlled-video-generation.md
- **Two-stage refinement** — a coherent long draft from stage 1, then a dedicated long-video refiner to sharpen detail and correct structural artifacts across the full horizon.
- **Metric-scale pose annotation** — action conditioning needs the action signal in consistent real-world units (metric-scale 6-DoF), not arbitrary scale. The annotation pipeline becomes a first-class component of the model.
- **High-compression video codec** — minute-scale at 720p only stays single-GPU if the per-frame token count is aggressively compressed (e.g. SANA-WM uses the LTX-2 tokenizer → @entities/models/ltx-2.md).

### 2026 landscape

- **SANA-WM** (NVIDIA, May 2026) — workspace's first ingested example. 2.6B params, native one-minute 720p, single-GPU bidirectional / chunk-causal AR / distilled-AR variants; distilled variant runs 60s/720p in 34s on a single RTX 5090 with NVFP4. Open-source. → @entities/models/sana-wm.md
- **MoWorld** (Moxin Technology, Jul 2026) — **Flash World Model** targeting **50 FPS** real-time interaction on **NPU** hardware; weights/code not open at ingest. Efficiency / latency reference — @entities/models/moworld.md
- **Game-engine lens** (Alaya Lab, arXiv:2607.14076) — taxonomy of interactive world models as action→state→observation loops + Wukong-aligned dataset; REFERENCE map — @sources/arxiv-2607-14076-interactive-world-models-game-engines.md
- **LingBot-World** and **HY-WorldPlay** — industrial closed-source baselines cited by SANA-WM as the visual-quality reference; both predate SANA-WM's efficiency story.

### Build-track relevance

For the persona/character track, world models are a **research-layer reference, not yet a build-track tool**. The relevance is forward-looking:

- **Interactive personas vs canned clips** — a world model lets a persona's environment be navigated in real time (DM-driven camera control over a persona-rendered scene), which is qualitatively different from delivering a pre-rendered 5–10s clip from a prompt.
- **Single-GPU minute-scale at 720p (RTX 5090)** is the first concrete demonstration that consumer-hardware interactive video personas are feasible in 2026, not just 2027–2028.
- **Persona consistency under camera revisit** is structurally the same problem as identity-preservation across re-entries to a scene — the consistency primitives developed in @concepts/persona-consistency-methods.md (PuLID, IP-Adapter, multi-angle LoRA) may inherit naturally, but the verification is in latent-3D / world-state space rather than image space.

### Open horizon

- Whether the camera-trajectory control surface generalizes to richer action signals (object placement, character action, dialogue-driven scene mutation) without rebuilding the model from scratch
- Single-photo / sparse-input entry — SANA-WM still needs a first frame; whether the first frame can come from a one-shot persona render (FLUX.1 / Z-Image) and survive minute-scale rollout
- Whether the hybrid-attention + dual-branch-conditioning recipe transfers to non-camera action signals or has to be redesigned per control surface

### Evaluation beyond clip quality (2026-06 ingest)

**YoCausal** (@sources/arxiv-yocausal-world-model-benchmark-2605-30346.md) — tests whether VDMs understand **causality** vs merely **arrow of time**, by comparing denoising loss on forward vs temporally reversed real videos. **RSI** = time-direction perception; **CCI** = causal subset minus non-causal subset. Key finding: top models (incl. Wan2.2-A14B on cleaning tasks) still trail humans; physics/aesthetics scores do not substitute for causal cognition.

**Proprio** (@sources/arxiv-proprio-physics-video-2605-28230.md) — **training-free** physics gate using the generator's own **flow residual** for best-of-N or noise refinement. Complements YoCausal (semantic causality) with **dynamic plausibility** scoring — useful post-filter on Wan I2V persona rolls before lipsync.

**OptiWorld** (@sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md) — **inference-time optimal control** before rendering: zero-shot world-state extraction → Riemannian-manifold trajectory planning under safety/smoothness/efficiency constraints → video conditioned on the plan. Proactive motion vs Proprio's post-hoc scoring; pairs with 3D-aware video backbones `[NEEDS VERIFICATION 2026-06-02]` for local Wan/SANA-WM stacks.

**LongLive-RAG** (@sources/arxiv-2606-02553-longlive-rag-long-video-generation.md) — plug-in **RAG over self-generated latents** for AR long video; retrieves non-local history when sliding-window context drifts. Complements DecMem learned memory and attention-sink / seam-stitching post-processing → @concepts/long-video-rag-retrieval.md.

**DecMem** (@sources/arxiv-2605-31336-decmem-world-generation.md, @entities/models/decmem.md) — **decoupled memory** (Sparse Global + Anchored Local) for minute-scale world generation from Kling Team; targets revisit consistency and attention dispersion in long-horizon implicit memory. Industrial closed stack as of K95 ingest — complements open SANA-WM on memory architecture research axis `[NEEDS VERIFICATION 2026-06-03]`.

**MetaWorld** (@sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md, @entities/models/metaworld.md) — **multi-agent multi-egocentric** world model from **single-view monocular** training video via MWSU state unrolling + per-layer **World-State Alignment** cross-attention during joint denoising. Extends world-model axis to synchronized multi-perspective scenes without multi-camera capture — forward-looking for multi-character persona environments `[NEEDS VERIFICATION 2026-06-05]`.

**LA-LQR** (@concepts/activation-steering-video-generation.md) — not a world model; **inference-time activation steering** on DiT T2V using reduced-order LQR on contrastive activation subspaces. Listed here because it shares **optimal-control framing** with OptiWorld but operates **during denoising** (safety/concept suppression) rather than pre-render trajectory planning.

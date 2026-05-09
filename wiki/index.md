# Wiki Index

Content-oriented catalog of every page in the wiki. Updated on every ingest. Read this first when answering a query — drill into pages only after scanning here.

Format: each row is `[title](path) — one-line summary — tags`. A ⚠ marker means the stub has quality flags (see the stub's frontmatter).

---

## Sources

Sources are ingested research material (PDFs, docx, GitHub READMEs, model cards, deep-research outputs). One page per canonical source.

- [UniReasoner: LLMs are Universal Reasoners for Visual Generation](sources/unireasoner.md) — Apple+JHU paper formalizing the understanding-generation gap and proposing Draft-Evaluate-Diffuse; 0.79→0.88 GenEval on identical SANA backbone — `paper, llm, diffusion, t2i, compositional-alignment`
- [Synthetic Character Consistency Survey (May 2026)](sources/synthetic-character-consistency-survey.md) — deep-research synthesis of the 2026 persona-consistency pipeline (synthesis → LoRA training → identity adapters → multi-angle datasets → video carry → failure modes); companion to [briefs/persona-consistency.md](../briefs/persona-consistency.md) — `survey, persona-consistency, lora-training, identity-adapters, video-consistency, deep-research`
- [Uncensored AI Image Generation Survey (May 2026)](sources/uncensored-image-generation-survey.md) — deep-research synthesis of the 2026 uncensored T2I landscape: 5-tier censorship framework, DiT pivot, Eastern Vanguard vs Western alignment dichotomy, model catalog (Pony / Illustrious / NoobAI / FLUX / Z-Image / Qwen / SDXL fine-tunes), de-censoring techniques, hardware/quantization tiers — `survey, uncensored, t2i, censorship-taxonomy, de-censoring, hardware, deep-research`
- [Video Generation Models Survey (May 2026)](sources/video-generation-survey-2026.md) — deep-research synthesis of the 2026 open-weight + closed-API video model landscape: Wan / HunyuanVideo / LTX-2 / Mochi / CogVideoX / Seedance; latent-chaining for length; lipsync stack (LatentSync / MuseTalk / UniSync); abliterated text-encoder de-censoring; per-model licensing + uncensorability rating — `survey, video-generation, t2v, i2v, deep-research, uncensored, latent-chaining, lipsync`
- [Software Stack for Adult AI Persona Operations (May 2026)](sources/persona-ops-stack-2026.md) — deep-research synthesis of the 7-axis persona-ops stack (scheduling / multi-account / DM-automation / voice-cloning / orchestration / image+video pipelines / content-calendar); 2026 modal: Postiz + SillyTavern + Fish-Speech + n8n + ComfyUI; Reddit/X crackdown → Telegram migration; hosted-LLM NSFW dead-end — `survey, persona-ops, automation, scheduling, dm-automation, voice-cloning, orchestration, deep-research`
- [Adult AI Personas: Monetization, Ethics, Law (May 2026)](sources/persona-monetization-2026.md) — deep-research synthesis of the synthetic-creator economy: Aitana Lopez / Emily Pellegrini / Lexi Love case studies, Fanvue $100M ARR / 20% commission, AI-slop pivot to 3-5 posts/wk, failure modes (TikTok 51K bans, OF zero-tolerance deepfakes), payment orchestration (CCBill / SegPay / Verotel + crypto fallback), 2257/OSA/EU AI Act — `survey, persona-monetization, case-studies, fanvue, payment-rails, legal-compliance, deep-research`
- [AI Creator Operations & Compliance Blueprint (2026)](sources/ai-creator-operations-blueprint.md) — operational blueprint for 100% AI-generated synthetic persona agency: KYC/2257 compliance, Florida Protected Series LLC tax structure, platform viability matrix (Fanvue/OnlyFans/Patreon/Passes), 4-phase launch sequence, daily ops via OpenRouter/n8n/CRM — `operations, compliance, KYC, platform-viability, launch-sequence, legal` ⚠ stub-source
- [AI Persona Launch Strategy Analysis — Critical Evaluation (2026)](sources/ai-persona-launch-strategy-analysis.md) — technical compatibility evaluation (scored 3/10 for cloud-dependent advice); recommends Mac Studio/MLX/Draw Things, OpenRouter API with context truncation, IP-Adapter/ControlNet for spatial consistency, ComfyUI+AnimateDiff for video, GEO over SEO; explicit warning against KYC spoofing — `strategy, evaluation, technical-compatibility, GEO, OpenRouter, local-generation, compliance` ⚠ stub-source
- [HeadsUp: Large-Scale 3D Gaussian Head Reconstruction (Apple, May 2026)](sources/headsup-3d-gaussian-head.md) — Apple paper (arXiv:2605.04035) on feed-forward 3DGS head reconstruction trained on 10K-subject internal multi-view dataset; UV-parameterized Gaussians anchored to neutral head template; downstream apps (text-driven novel-identity generation via DiT on latents + blendshape-driven latent animation) are research-future bridge to 3D-anchored persona consistency — research-layer reference, not build-track-deployable today (multi-camera rig + closed dataset) — `paper, 3d-gaussian-splatting, head-reconstruction, multi-view, feed-forward, identity-generation, blendshape-animation, apple, research-future`

---

## Entities

### Models

- [SANA](entities/models/sana.md) — efficient linear-DiT diffusion backbone (NVIDIA+MIT, ICLR 2025); UniReasoner's primary backbone — `model, diffusion, t2i, linear-transformer` ⚠ stub
- [BAGEL](entities/models/bagel.md) — unified multimodal LLM (Qwen-based, ByteDance); the canonical understanding-generation-gap demo — `model, unified-multimodal, llm, diffusion` ⚠ stub
- [Janus-Pro](entities/models/janus-pro.md) — DeepSeek unified multimodal model; strongest pre-UniReasoner Position score (0.75 GenEval) — `model, unified-multimodal, deepseek` ⚠ stub
- [BLIP-3o](entities/models/blip3-o.md) — fully-open unified multimodal family (Salesforce et al.); GenEval 0.83 — `model, unified-multimodal, fully-open` ⚠ stub
- [FLUX (FLUX.1, FLUX.2) — umbrella hub](entities/models/flux.md) — Black Forest Labs MM-DiT family umbrella; per-version navigation + FLUX.2 Dev/Pro 32B inline; cross-generation adapter ecosystem matrix — `model, diffusion, mm-dit, t2i, black-forest-labs, umbrella`
- [FLUX.1 Dev (Black Forest Labs)](entities/models/flux-1-dev.md) — 12B MMDiT + flow-matching foundation; the modern FLUX persona-consistency stack (PuLID II / Redux / Kontext) targets Dev; FLUX.1 Schnell (Apache 2.0) + Pro (closed) covered inline; Minimal-tier censorship — `model, flux, flux-1, mm-dit, dit, minimal-censorship, t5-encoder, 12b`
- [FLUX.2 Klein (9B / 4B distills)](entities/models/flux-2-klein.md) — sub-second FLUX.2 distills for 8-16 GB consumer GPUs; Klein 9B as the modal NSFW face-swap engine; Klein 4B is the 8 GB DiT bridge — `model, flux, flux-2, klein, distilled, 8gb-vram, 9b, 4b`
- [Pony Diffusion V6 XL (AstraliteHeart)](entities/models/pony-v6.md) — SDXL fine-tune; score_9 quality-tag system; modal stylized base for completely-uncensored anime/cartoon NSFW work; 8 GB VRAM compatible — `model, sdxl, pony, completely-uncensored, score-tags, 8gb-vram`
- [Pony V7](entities/models/pony-v7.md) — AuraFlow-base T5-encoder rebuild; native 1536×1536; full-prose captioning (no score_9 tags); weights-release status `[NEEDS VERIFICATION 2026-05-06]` — `model, auraflow, pony, t5-encoder, dit-base, completely-uncensored` ⚠ stub
- [Illustrious XL (OnomaAI Research)](entities/models/illustrious-xl.md) — SDXL fine-tune trained on Danbooru 2023; 16k+ artist-style + character-trait first-class conditioning; studio-anime aesthetic peer to Pony V6 — `model, sdxl, illustrious, danbooru, anime, lora-base, completely-uncensored, artist-style`
- [NoobAI-XL (Laxhar Lab)](entities/models/noobai-xl.md) — V-Prediction Illustrious fine-tune; Chenkin Noob v.03 + NoobAI-XL-XIN; community-consensus pinnacle of the SDXL anime era — `model, sdxl, illustrious-derivative, v-prediction, danbooru, anime, completely-uncensored`
- [Anima (Circlestone Labs / Comfy Org)](entities/models/anima.md) — 2B DiT modified from Cosmos-Predict; Qwen3-0.6B encoder; 8 GB VRAM; "Unbound / WTF" tier (only canonical example) — `model, dit, anima, cosmos-predict, qwen3-encoder, unbound, completely-uncensored, 2b, 8gb-vram` ⚠ stub
- [Z-Image Turbo & Zeta Chroma (Alibaba Tongyi MAI / Lodestone Rock)](entities/models/z-image-turbo.md) — S3-DiT 6B; 8-step distillation; sub-second 12–16 GB inference; survey's "premier local model for photorealism"; Zeta Chroma is Lodestone Rock's pixel-space derivative — `model, dit, s3-dit, z-image, zeta-chroma, alibaba, tongyi-mai, completely-uncensored, photorealism, 6b, 8-step-distill, eastern-vanguard`
- [Qwen-Image-2512 (Alibaba-Qwen)](entities/models/qwen-image-2512.md) — 20B+ DiT with language+layout reasoning native; best-in-class text rendering; 40 GB BF16 → 14-16 GB GGUF Q4/Q5; Minimal-tier — `model, dit, qwen-image, alibaba-qwen, eastern-vanguard, 20b, layout-reasoning, text-rendering, minimal-censorship, gguf-quantization` ⚠ stub
- [ERNIE-Image (Baidu)](entities/models/ernie-image.md) — 8B DiT with Ministral3-class prompt enhancer; Apache 2.0; comics/posters/multi-panel layout specialist; Minimal-tier — `model, dit, ernie-image, baidu, eastern-vanguard, 8b, apache-2-0, minimal-censorship, ministral3-encoder, comics-posters` ⚠ stub
- [Playground v3 (Playground AI)](entities/models/playground-v3.md) — 16-channel VAE; expand-PE positional embedding; deep-fusion LLM encoder; Partial-Architectural tier; Western alignment posture — `model, playground, playground-v3, 16-channel-vae, expand-pe, partial-architectural-censorship, deep-fusion-llm` ⚠ stub
- [Kwai Kolors (Kuaishou Technology)](entities/models/kwai-kolors.md) — large-scale latent-diffusion T2I; aesthetics-strong / adherence-weak; commercial registration required; not natively uncensored (Eastern-but-not-Vanguard exception) — `model, kolors, kwai-kolors, kuaishou, latent-diffusion, eastern, aesthetic, commercial-registration-required, partial-censorship` ⚠ stub
- [PixArt-Σ (PixArt Sigma)](entities/models/pixart-sigma.md) — academic-lineage lightweight DiT; T5 encoder; direct 4K resolution generation; small footprint, easy to fine-tune; needs LoRA bypass for NSFW — `model, dit, pixart, pixart-sigma, t5-encoder, 4k-resolution, academic-precursor, lightweight-dit, partial-censorship` ⚠ stub
- [SDXL fine-tunes (Lustify, Juggernaut, Cyberrealistic, Epicrealism, BigAsp-v2.5) — umbrella](entities/models/sdxl-fine-tunes.md) — photorealistic SDXL fine-tune family anchoring the 8 GB VRAM tier in 2026; complement to Pony/Illustrious/NoobAI Danbooru-anime branch; BigAsp-v2.5 integrates flow-matching — `model, sdxl, sdxl-fine-tune, umbrella, lustify, juggernaut, cyberrealistic, epicrealism, bigasp, completely-uncensored, 8gb-vram, photorealism, 2-6b` ⚠ stub
- [SD3 / SD3.5 (Stability AI) — deprecated note](entities/models/sd3-deprecated.md) — Strict-tier deprecation case study; SD3.5 Large 8.1B / Medium 2B; CivitAI takedown enforcement loop; canonical architectural-censorship example — `model, sd3, sd3-5, sdxl-successor, stability-ai, strict-censorship, architectural-censorship, deprecated, civitai-takedown, openrail-m`
- [Wan 2.2 (Alibaba)](entities/models/wan-2-2.md) — MoE 27B/14B-active dual-expert SNR-routed video DiT + 3D VAE; 480p/720p @ 24fps; Apache 2.0; foundational pillar of local NSFW video persona work after community LoRA injection (mq-lab / blink / TheYuriLover); 5B TI2V dense bridge for consumer GPUs — `model, video, dit, moe, wan, alibaba, eastern-vanguard, completely-uncensored-after-lora`
- [HunyuanVideo 1.5 (Tencent)](entities/models/hunyuanvideo-1-5.md) — 8.3B DiT + 3D causal VAE; Selective and Sliding Tile Attention (SSTA) ~2× over FlashAttention-3 for 10s 720p; native 1080p; FP8 GEMM; step-distilled 480p in 8-12 steps; Tencent-shipped LoRA tuning + community NSFW LoRAs (`nsfwsks` trigger) — `model, video, dit, hunyuanvideo, tencent, eastern-vanguard, completely-uncensored-after-lora`
- [LTX-2 (Lightricks)](entities/models/ltx-2.md) — 19B asymmetric joint A/V foundation (14B visual + 5B audio with bidirectional cross-attention); native 4K @ 50fps with synchronized lipsync + foley single-pass; modality-specific VAEs at 1:192; LTX-2 Community License (free commercial under $10M revenue) — `model, video, asymmetric-av, audio-visual, ltx, lightricks, joint-foundation`
- [Mochi 1 (Genmo)](entities/models/mochi-1.md) — 10B AsymmDiT (75% visual / 25% text resource allocation, single T5-XXL encoder); 30fps fluid motion; Apache 2.0; aggressive automatic NSFW filter (community bypasses by stripping the safety classifier); 4×80GB native → 24GB FP8 ComfyUI wrappers — `model, video, asymmdit, mochi, genmo, apache-2-0`
- [CogVideoX 1.5 / 2.0 (THUDM)](entities/models/cogvideox-1-5.md) — 5B DiT + 3D VAE integrating text/time/space (no traditional cross-attention); 768p / 10s outputs; torchao INT8 compresses 24GB→7GB (cheapest local entry); Apache 2.0; CogVideoX 2.0 adds native 1080p + CogSound — `model, video, dit, cogvideox, thudm, zhipu, apache-2-0, lowest-vram`
- [Seedance 2.0 (ByteDance)](entities/models/seedance-2.md) — closed-API native A/V model; competes with Veo 3.1 / LTX-2 in joint-foundation class; cloud-only access; included in survey for landscape completeness — `model, video, closed-api, bytedance, seedance, joint-foundation`

### Adapters (identity injection)

- [IP-Adapter (family — base, Plus, FaceID, FaceID-Plus-V2, FaceID-Portrait)](entities/adapters/ip-adapter.md) — Tencent ARC + h94; foundational SDXL/SD1.5 image-prompt + face adapter family — `adapter, identity-injection, image-prompt, sdxl, sd15` ⚠ stub
- [PuLID (PuLID, PuLID-FLUX-v0.9.1, PuLID-Flux II)](entities/adapters/pulid.md) — ByteDance "Pure and Lightning ID Customization"; modal 2026 FLUX face adapter — `adapter, identity-injection, pulid, flux` ⚠ stub
- [InstantID](entities/adapters/instantid.md) — InstantX dual-signal (face embedding + landmark ControlNet) SDXL identity adapter; more colour-stable than PuLID — `adapter, identity-injection, sdxl` ⚠ stub
- [ConsistentID](entities/adapters/consistentid.md) — TPAMI 2026 multi-image, attribute-decoupled SDXL adapter; fine-grained identity via per-region embeddings — `adapter, identity-injection, sdxl, tpami-2026` ⚠ stub
- [InfiniteYou](entities/adapters/infinite-you.md) — ByteDance FLUX-native identity adapter, ICCV 2025 Highlight; multi-aspect (cross-pose / cross-age) identity — `adapter, identity-injection, flux, iccv-2025` ⚠ stub
- [PhotoMaker V2](entities/adapters/photomaker-v2.md) — TencentARC SDXL stacked-ID adapter; aging / styling preservation niche — `adapter, identity-injection, sdxl, tencentarc` ⚠ stub
- [CharaConsist](entities/adapters/characonsist.md) — Murray-Wang ICCV 2025 training-free character consistency; attention-manipulation at inference, no LoRA / no adapter weights — `adapter, identity-injection, training-free, iccv-2025` ⚠ stub
- [FLUX.1 Redux](entities/adapters/flux-redux.md) — BFL image-variation / composition adapter; pairs with PuLID II as the dual-node identity-and-composition stack — `adapter, image-variation, flux, black-forest-labs` ⚠ stub
- [FLUX.1 Kontext](entities/adapters/flux-kontext.md) — BFL prompt-driven image-edit; canonical hair-override pass after PuLID; Character Turnaround Sheet LoRA backbone — `adapter, image-edit, flux, black-forest-labs` ⚠ stub
- [FLUX.2 Klein 9B face-swap workflow](entities/adapters/flux2-klein-9b-faceswap.md) — multi-pass NSFW pipeline using Klein 9B as post-generation face-swap engine; modal mitigation #3 for NSFW anatomy degradation — `adapter, face-swap, flux2, klein, nsfw-isolation` ⚠ stub

(other expected adapters: Hyper LoRA, ACE-Plus, Mickmumpitz Consistent Character Creator)

### UIs (inference frontends)

- [ComfyUI (Inference UI)](entities/uis/comfyui.md) — open-source node-graph inference frontend; dominant local UI for SDXL, FLUX, Hunyuan, Wan, CogVideoX; extensible via custom nodes — `ui, inference-frontend, comfyui, node-graph, open-source, extensible`
- [Automatic1111 / A1111 SDXL WebUI](entities/uis/automatic1111.md) — original Stable Diffusion WebUI fork; SDXL, FLUX support via community patches — `ui, inference-frontend, sd, sdxl, webui` ⚠ stub
- [Forge](entities/uis/forge.md) — performance-optimized A1111 fork; SDXL + FLUX with VRAM efficiency patches — `ui, inference-frontend, forge, performance, sdxl, flux` ⚠ stub
- [InvokeAI](entities/uis/invokeai.md) — creative-focused UI with unified canvas workflow — `ui, inference-frontend, invokeai, creative` ⚠ stub
- [SwarmUI](entities/uis/swarmui.md) — multi-user collaborative generation UI; model management focus — `ui, inference-frontend, swarmui, multi-user` ⚠ stub

### Custom nodes

(no pages yet — expected: ComfyUI_OmniConsistency, Wan SVI 2 Pro FLF, HunyuanVideo Lora Block Edit, ColorMatch / ColorPeel, ComfyUI Manager)

### Training tools

- [Kohya sd-scripts](entities/training-tools/kohya-sd-scripts.md) — canonical CLI training suite (kohya-ss); SD1.5/SDXL/Pony/Illustrious/NoobAI/FLUX/Hunyuan/Wan via Musubi sibling project — `training-tool, lora-training, sdxl, flux, hunyuan` ⚠ stub
- [ai-toolkit (Ostris)](entities/training-tools/ai-toolkit.md) — FLUX-first Python trainer, YAML config, Modal/Replicate hosted-trainer bridge; canonical FLUX.1/FLUX.2/Wan 2.2 LoRA path — `training-tool, lora-training, flux, wan, modal` ⚠ stub
- [OneTrainer](entities/training-tools/onetrainer.md) — GUI-first Tk trainer with the strongest 8 GB VRAM FLUX recipe; native DoRA support — `training-tool, lora-training, gui, 8gb-vram` ⚠ stub
- [kohya_ss GUI (bmaltais)](entities/training-tools/kohya-ss-gui.md) — Gradio frontend wrapping kohya sd-scripts; the most-installed LoRA-trainer GUI in the 2024-2026 community; SDXL-popular, FLUX support tracking sd-scripts — `training-tool, lora-training, gui, kohya-ss, bmaltais` ⚠ stub
- [Musubi Tuner](entities/training-tools/musubi-tuner.md) — kohya-ss video-LoRA sibling for Hunyuan / Wan 2.2 dual-expert / LTX; uv packaging, RAM-offload knobs — `training-tool, lora-training, video-lora, kohya, hunyuan, wan` ⚠ stub
- [FluxGym](entities/training-tools/fluxgym.md) — Cocktailpeanut Pinokio FLUX-only GUI; lowest-friction beginner FLUX trainer; bundles low-VRAM FP8/Q recipes — `training-tool, lora-training, gui, fluxgym, flux, 8gb-vram` ⚠ stub

(other expected training tools: Diffusion-Pipe-UI, Diffusers fine-tune, Replicate ostris trainer)

### Marketplaces

- [Fanvue (Platform)](entities/marketplaces/fanvue.md) — premier platform for 100% AI-generated creators in 2026; $500M+ payouts, 85% revenue split, Manager Accounts for agencies ⚠ stub
- [CivitAI (Model Marketplace)](entities/marketplaces/civitai.md) — dominant community model marketplace for SD/FLUX/Pony; LoRAs, checkpoints, de-censoring models; takedown enforcement risks — `marketplace, model-hosting, community, civitai, nsfw, lora`

### Hardware

- [Mac Studio (Hardware)](entities/hardware/mac-studio.md) — M-series Apple Silicon with Unified Memory Architecture; up to 192GB–512GB unified memory; critical enabler for local large-model inference ⚠ stub
- [GPU & Hardware Guide](entities/hardware/gpu-guide.md) — VRAM tiers (8/12-16/24 GB), quantization formats (FP8/GGUF/Nunchaku), Apple Silicon viability, cloud fallback strategy — `hardware, gpu, vram, quantization, apple-silicon, nvidia`

### Persona-ops tools

- [Postiz (open-source AI-integrated scheduler)](entities/persona-ops/postiz.md) — modal 2026 SFW persona scheduler; $29/mo or self-host free; AI content gen, 400+ integrations, webhook-driven for n8n orchestration; displaced Buffer/Later/Hypefury for technical operators — `persona-ops, scheduling, posting, automation, open-source, ai-integrated`
- [SillyTavern (NSFW DM frontend + RAG + TTS bridge)](entities/persona-ops/sillytavern.md) — de-facto NSFW DM frontend; character cards + lorebooks + RAG + 128K context + MiniMax TTS; runs Qwen 3 / Mistral 3 / Llama 4 locally because hosted LLMs (GPT-5.4 / Gemini 3.1 Pro / Claude 4.6) are NSFW-hostile in 2026 — `persona-ops, dm-automation, llm-frontend, rag, tts, local-llm`
- [Fish-Speech S2 Pro (open-source zero-shot voice cloning)](entities/persona-ops/fish-speech.md) — TTS-Arena2 leader May 2026; zero-shot from 10-30s reference audio; 50+ emotion tags; the open-source replacement for ElevenLabs in NSFW persona-ops — `persona-ops, voice-cloning, tts, fish-speech, open-source, zero-shot`
- [n8n (self-hosted orchestration)](entities/persona-ops/n8n.md) — modal 2026 orchestration layer for persona-ops; visual workflow + 400+ integrations + AI agent nodes; self-host for data sovereignty vs Make/Zapier; ties together LLM + voice + image-gen + scheduling — `persona-ops, orchestration, n8n, automation, self-hosted, workflow-engine`

### Personas / accounts

- [Aitana Lopez (The Clueless Agency)](entities/personas/aitana-lopez.md) — most-documented Tier 1 AI persona; Clueless Agency Barcelona (Rubén Cruz + Diana Núñez Morales); fitness/gaming niches; IG → Fanvue funnel; €3K/mo (late 2023) → $20K+/mo (May 2026); hybrid generation + Photoshop compositing + Arcads video; second persona Maia demonstrates roster scaling — `persona, case-study, ai-influencer, clueless-agency, fanvue, brand-partnerships`

---

## Runbooks

Practical, printable guides for getting started — tracked in git (unlike `briefs/` which is gitignored).

- [Beginner's Guide — Zero to Posting](runbooks/beginner-guide-to-persona.md) — 7-phase walkthrough from bare metal to posting; companion to Model Selection & Workflow Builder — `beginner, guide, persona, setup, comfyui`
- [Day 1 Checklist — Friend's Start Pack](runbooks/day-1-checklist-for-friend.md) — morning image gen → afternoon OpenRouter video → evening marketing via SEO:GEO wiki cross-links — `day-1, checklist, friend, openrouter, video, marketing`
- [Z-Image Turbo GGUF — End-to-End Persona Operation Runbook](runbooks/zimage-setup-runbook.md) — local image gen, compliance (KYC/2257/LLC), platform matrix, 4-phase launch, GEO, OpenRouter chat automation, monetization — `z-image, gguf, comfyui, macos, setup-runbook, compliance, persona-ops, geo, openrouter`

---

## Concepts

- [Understanding-generation gap](concepts/understanding-generation-gap.md) — unified models verify prompt-image mismatches that they themselves cause when generating; coined in UniReasoner — `llm, diffusion, evaluation, prompt-faithfulness`
- [Draft-Evaluate-Diffuse pipeline](concepts/draft-evaluate-diffuse-pipeline.md) — UniReasoner's three-stage approach: LLM samples discrete vision tokens, self-critiques, diffusion conditions on (p,d,e) — `llm, diffusion, vision-tokens, self-critique`
- [LLM as image-generation conditioning (encoder vs reasoner)](concepts/llm-as-image-conditioning.md) — four roles for LMs in T2I: frozen encoder → stronger encoder → front-end rewriter → universal reasoner — `llm, diffusion, conditioning, t2i-architecture`
- [Persona consistency methods (umbrella)](concepts/persona-consistency-methods.md) — four-axis taxonomy (synthesis / identity injection / multi-angle dataset / cross-base & video carry) and the modal 2026 production loop — `persona-consistency, methods, taxonomy, identity-injection`
- [LoRA / LyCORIS taxonomy](concepts/lora-taxonomy.md) — LoRA / LoCon / LoHA / LoKr / DoRA variant family; LoKr (factor=4) as 2026 character-isolation default; per-base optimiser recipes — `lora, lycoris, parameter-efficient-finetuning, training`
- [Character DNA templates (XML-tag prompting)](concepts/character-dna-templates.md) — structured `<character>`/`<scene>` XML-tag schema; Identity Anchor system; per-base captioning conventions for SDXL/Pony/FLUX/NoobAI — `prompting, character-dna, xml-tags, structured-prompt, persona-prompting`
- [Likeness-collision verification (PimEyes / FaceCheck.ID / AI Face Search)](concepts/likeness-collision-verification.md) — three-tool verification stack; 70 % similarity threshold; quarterly re-verification protocol; NCII compliance gate — `verification, ncii-compliance, face-search, persona-safety, pimeyes`
- [Reference + LoRA stacking (modal 2026 production pattern)](concepts/reference-plus-lora-stacking.md) — 0.85 NSFW LoRA + 0.45 identity adapter strength balance; two-pass alternative; per-base recipe table; failure modes — `persona-consistency, production-pattern, lora-stacking, nsfw-mitigation, two-pass-pipeline`
- [Censorship-tier taxonomy (5-tier framework)](concepts/censorship-tier-taxonomy.md) — Unbound / Completely Uncensored / Minimal / Partial-Architectural / Strict; per-tier de-censoring path (LoRA injection vs abliteration vs TIES/DARE merging); per-model tier assignment May 2026 — `censorship, taxonomy, alignment, nsfw, model-classification, de-censoring`
- [De-censoring techniques (abliteration, LoRA injection, weight merging, prompt bypasses)](concepts/de-censoring-techniques.md) — companion to the censorship taxonomy; 4-technique catalog (abliteration / LoRA injection / weight merging SLERP/TIES/DARE / prompt-engineering bypasses) + architectural hard wall; named FLUX merges (FLUX-UNCENSORED-Merged, Chroma1-HD, SNOFS); per-tier decision tree — `de-censoring, alignment-removal, abliteration, lora-injection, weight-merging, ties-merging, dare, slerp, prompt-engineering`
- [Multi-angle dataset prep (turnaround sheets, captioning, target counts)](concepts/multi-angle-dataset-prep.md) — 30-50 image identity LoRA dataset construction for video carry; angle/expression/lighting matrix; turnaround-sheet tooling (FLUX.1 Kontext + Character Turnaround LoRA); captioning conventions per base; counts and over/under-fitting risks — `dataset-prep, lora-training, turnaround-sheet, multi-angle, captioning, persona-consistency`
- [Video identity inheritance (LoRA carry from image base to video base)](concepts/video-identity-inheritance.md) — how an image-trained character LoRA transfers (or fails to transfer) onto Wan 2.2 / HunyuanVideo 1.5 / CogVideoX; per-base compatibility matrix; first-frame I2V conditioning + video-LoRA fine-tune as the canonical path; failure modes (latent-space mismatch, motion drift, identity wobble across frames) — `persona-consistency, video-generation, lora-transfer, identity-inheritance, i2v, video-lora`
- [Seam stitching strategies (latent chaining for >10s clips)](concepts/seam-stitching-strategies.md) — overcoming per-call clip length cap (5-10s); GVS / latent-chaining / FramePack / sliding-window; Wan I2V chained-clip workflow; identity drift and motion-vector continuity; failure modes; modal 2026 production pattern for 30-60s persona clips — `video-generation, latent-chaining, gvs, framepack, long-form-video, seam-stitching`
- [Persona operations stack (architecture overview)](concepts/persona-ops-stack.md) — 7-axis architecture umbrella for persona-ops (scheduling / multi-account / DM / voice / orchestration / pipelines / calendar); reference architecture diagram; tier ladders (solo → enterprise $100K-300K build); 2026 strategic shifts (Reddit/X → Telegram, hosted-LLM dead-end, voice-clone open-sourcing, Model Routers) — `persona-ops, automation, stack-architecture, multi-account, dm-automation, voice-cloning, orchestration, content-pipelines`
- [Persona Operations Workflow](concepts/persona-ops-workflow.md) — detailed operational workflow synthesis from operations blueprint and strategy analysis ⚠ stub
- [GEO vs SEO (Generative Engine Optimization)](concepts/geo-vs-seo.md) — position persona as "Authoritative Building Block" for AI model citations vs traditional keyword/backlink SEO ⚠ stub
- [OpenRouter Chat Workflow (LLM Orchestration)](concepts/openrouter-chat-workflow.md) — unified API gateway patterns, `openrouter/auto` routing, context window management via Python ⚠ stub
- [Persona monetization models](concepts/persona-monetization-models.md) — three tiers (agency-flagship / mid-tier-pageant / aspirational-course-buyer); revenue mechanics (DM/PPV/tips ≫ flat subs); Fanvue $100M ARR / 20% commission; ROI math + cost-arbitrage via Model Routers; 3-5 posts/wk content cadence — `persona-monetization, fanvue, onlyfans, revenue-mechanics, roi, ppv, dm-economics, parasocial, ai-influencer`
- [Persona failure modes](concepts/persona-failure-modes.md) — 5-class catalog (account-bans / doxxing / payment-freezes / DMCA / tax); TikTok 51K bans + Instagram May-Aug 2025 wave + OnlyFans zero-tolerance + Reddit Apr-2026 + X FaceID; operational hygiene checklist — `failure-modes, persona-ops, account-bans, doxxing, payment-freezes, dmca, ai-slop, deepfakes, platform-enforcement`
- [Persona payment rails](concepts/persona-payment-rails.md) — high-risk processor catalog (CCBill / SegPay / Verotel / Epoch / Paxum); $1,450/yr Visa-MC fee; Payment Orchestration pattern (primary → backup → crypto); de-banking risk; 15-20% effective gateway take; build-track scope-flagged as research-layer reference — `persona-monetization, payment-processors, payment-orchestration, crypto-rails, de-banking, high-risk`
- [Persona legal landscape](concepts/persona-legal-landscape.md) — 4 active regimes (US 2257 + state age-verification + UK OSA/DUAA s.138 + EU AI Act Article 50 Aug 2026); active litigation (NYT v OpenAI, Getty v Stability, Vacker v ElevenLabs, Lehrman v LOVO, Grok mass tort); compliance posture for build-track operators — `legal, compliance, persona-monetization, 2257, age-verification, deepfake-law, ai-regulation`
- [Model selection & workflow builder (by hardware & goals)](concepts/model-selection-workflow.md) — decision-support page mapping hardware tier + creative goals to a concrete model stack, image-gen workflow, and optional video/DM pipeline; five canonical starter stacks; universal generation loop; upgrade decision tree — `model-selection, workflow, hardware-matching, decision-tree, quickstart`
- [Persona content cadence (post-AI-slop rhythm)](concepts/persona-content-cadence.md) — AI-slop pivot from volume → 3-5 quality posts/wk with narrative progression / varied angles / realistic lighting; calendar automation patterns (Batch Prompting / Gap Analysis / Trend Expansion); repurposing automation (Opus Clip / Vidyo.ai / Orshot / Repurpose.io); build-track implications for LoRA stability — `content-cadence, persona-monetization, ai-slop, c2pa, narrative-progression, posting-strategy, algorithm`

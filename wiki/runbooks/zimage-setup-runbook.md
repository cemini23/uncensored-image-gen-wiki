---
title: Z-Image Turbo GGUF -- End-to-End Persona Operation Runbook
type: runbook
related:
  - entities/models/z-image-turbo.md
  - entities/hardware/mac-studio.md
  - entities/uis/comfyui.md
  - entities/marketplaces/fanvue.md
  - sources/ai-creator-operations-blueprint.md
  - runbooks/day-1-checklist-for-friend.md
  - sources/ai-persona-launch-strategy-analysis.md
  - concepts/persona-ops-workflow.md
  - concepts/geo-vs-seo.md
  - concepts/openrouter-chat-workflow.md
  - concepts/persona-legal-landscape.md
---

# Z-Image Turbo GGUF -- End-to-End Persona Operation Runbook

Comprehensive guide covering local image generation, compliance, platform strategy, launch sequence, and daily operations for a 100% AI-generated synthetic persona agency. Integrates material from the [Operations Blueprint](sources/ai-creator-operations-blueprint.md) and [Launch Strategy Analysis](sources/ai-persona-launch-strategy-analysis.md).

---

## Table of Contents

1. [Legal & Compliance](#1-legal--compliance)
2. [Hardware & Local Inference](#2-hardware--local-inference)
3. [Image Generation Setup (ComfyUI + GGUF)](#3-image-generation-setup)
4. [Identity Consistency (IP-Adapter / ControlNet)](#4-identity-consistency)
5. [OpenRouter API & Conversation Management](#5-openrouter-api--conversation-management)
6. [Video Generation](#6-video-generation)
7. [Platform Viability Matrix](#7-platform-viability-matrix)
8. [4-Phase Launch Sequence](#8-4-phase-launch-sequence)
9. [GEO vs SEO](#9-geo-vs-seo)
10. [Day-to-Day Operations & Monetization](#10-day-to-day-operations--monetization)
11. [Troubleshooting](#11-troubleshooting)
12. [Quick Health Check](#12-quick-health-check)

---

## 1. Legal & Compliance

### KYC — Non-Negotiable Rules

Modern KYC systems (e.g., Persona's Document AI) complete human identity verification in 15–30 seconds with >95% accuracy. They verify signal origin, algorithmic liveness, and cryptographic authenticity — not just document photos.

**Critical rule**: The virtual persona **cannot** possess its own legal identity. The agency (or a designated human principal) must legally own every account. Government-issued ID, facial liveness scans, and biometric data must belong to the human operator or registered legal representative.

> ⚠️ **KYC spoofing via deepfakes or anti-detect browsers is highly illegal, technically infeasible against modern identity orchestration platforms, and guarantees permanent, network-wide platform bans.** — [Operations Blueprint §1.1](sources/ai-creator-operations-blueprint.md)

### Corporate Structure — Florida Protected Series LLC

Effective July 1, 2026: Florida's "protected series" LLC framework allows a single master LLC to establish multiple protected series, each with independent members, managers, assets, and liabilities.

- **Master LLC** = holding company
- **Each AI persona** = distinct protected series
- If one persona faces a copyright claim or platform ban, all other personas' assets/revenue streams remain insulated
- **Tax**: virtual currencies = capital gains; fiat revenue = corporate income; FL Communications Services Tax applies to customized digital video messaging
- **W-9** (domestic) / **W-8BEN** (international) required

### 2257 Compliance

For sexually explicit content, 18 U.S.C. § 2257 applies:
- **If persona resembles a real human**: agency must hold Model Release Form, government ID, full-body photo, timestamped headshot
- **If entirely synthetic**: document software generation process, retain exact text prompts + model weights + human operator's personal 2257 records
- Content hosting platforms apply age/identity requirements strictly to the **verified human account holder**

### IP Ownership

Under Arkansas HB 1876: when generative AI tools produce content, the "prompter" (the agency engineering prompts, curating datasets, managing local workflows) is the legal owner — provided output does not infringe existing copyrights. Maintain timestamped documentation of: prompt architectures, base models, seed numbers, fine-tuning datasets.

---

## 2. Hardware & Local Inference

### Apple Silicon (Recommended)

M-series Macs with Unified Memory Architecture (UMA) eliminate the VRAM bottleneck of NVIDIA dGPUs:

| Hardware | Unified Memory | Typical Inference (1024×1024 Flux) | Notes |
|----------|---------------|-----------------------------------|-------|
| M3 16 GB | 16 GB shared | ~20–30s (512×512) | Viable for draft iteration |
| M4 Pro 24 GB | 24 GB shared | ~50s | Sweet spot for persona ops |
| M3 Ultra 192 GB | 192 GB shared | Sub-30s at 1024×1024 | Professional tier |
| M4 Max / Ultra 512 GB | 512 GB shared | Fastest local option | Studio production |

**vs NVIDIA dGPU**: RTX 4090 / RTX P40 max out at 24GB VRAM; Mac Studio can allocate 192–512GB unified memory to Neural Engine + GPU.

### Draw Things vs ComfyUI on Apple Silicon

- **Draw Things**: native Metal backend + MLX/CoreML acceleration → up to **20% faster** than ComfyUI on Apple Silicon. Recommended for production persona workflows.
- **ComfyUI**: more flexible (custom nodes, ControlNet, IP-Adapter, AnimateDiff). Use when you need advanced conditioning or video pipelines.

For production: **Draw Things** for speed; **ComfyUI** for control.

### Recommended: Mac Studio

All generation local → full data sovereignty, no cloud dependency, no third-party NSFW filters, predictable latency. See [Mac Studio hardware page](entities/hardware/mac-studio.md).

### Quick Environment Check

```bash
# macOS — verify PyTorch + MPS
python3 -c "
import torch
print('MPS available:', torch.backends.mps.is_available())
print('PyTorch version:', torch.__version__)
"
```

---

## 3. Image Generation Setup

### Install ComfyUI

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git ~/ComfyUI
cd ~/ComfyUI
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cpu
pip install -r requirements.txt
```

### Launch ComfyUI

```bash
cd ~/ComfyUI && source venv/bin/activate && python main.py --cpu --listen 127.0.0.1
```

- `--cpu` — prevents MPS device-not-found errors on headless / restricted macOS. MPS acceleration still works for inference.
- `--listen 127.0.0.1` — localhost only. Use `0.0.0.0` for LAN access.

Open http://127.0.0.1:8188 once the server prints "Starting server."

### Install ComfyUI-GGUF (Custom Node)

```bash
cd ~/ComfyUI/custom_nodes
git clone https://github.com/city96/ComfyUI-GGUF.git
```

Restart ComfyUI after installing.

### Download Z-Image Turbo GGUF

```bash
mkdir -p ~/ComfyUI/models/unet
cd ~/ComfyUI/models/unet
# Popular quants:
#   Q4_K_S  -- ~8 GB, fits 12 GB VRAM
#   Q5_K_M  -- ~10 GB, fits 16 GB VRAM
#   Q8_0    -- ~14 GB, needs 24 GB VRAM
# Example (check HF for exact filename):
# wget https://huggingface.co/.../z-image-turbo-Q4_K_S.gguf
```

Place the `.gguf` file in `~/ComfyUI/models/unet/`.

### Minimal Workflow — Node Chain

1. **CLIPLoader** — load `t5xxl_fp16.safetensors` or similar text encoder
2. **UNET Loader (GGUF)** — point to your `.gguf` file
3. **CLIP Text Encode (Prompt)** — positive prompt
4. **CLIP Text Encode (Prompt)** — negative prompt (optional)
5. **Empty Latent Image** — 1024×1024 standard
6. **KSampler** — connects model, positive, negative, latent_image
7. **VAELoader** — standard SDXL VAE (`sdxl_vae.safetensors`)
8. **VAEDecode** — latents to image
9. **SaveImage / PreviewImage** — output

**Connections:**
- CLIPLoader → both Prompt Encoders (clip input)
- UNET Loader MODEL → KSampler model
- Positive/Negative Prompt → KSampler positive/negative
- EmptyLatentImage → KSampler latent_image
- KSampler LATENT → VAEDecode samples
- VAELoader → VAEDecode vae
- VAEDecode IMAGE → Save/Preview Image

### Prompting Tips

Z-Image Turbo uses natural language (not Danbooru tags):

- **Quality prefix**: "A high-quality, detailed, 8K photograph of..."
- **Style**: "digital art, oil painting, photography, anime" — specify at start
- **Negative prompt** (optional): "blurry, low quality, distorted, extra fingers, watermark, text"

**KSampler Settings:**
| Parameter | Recommendation |
|-----------|---------------|
| Steps | 15–20 (turbo models converge fast) |
| Sampler | `dpmpp_2m_sde` |
| Scheduler | `karras` or `normal` |
| CFG | 3.5–4.5 (start at 4.0) |
| Denoise | 1.0 (txt2img) |

---

## 4. Identity Consistency

Consistent identity across images is critical for persona viability. A static seed alone is mathematically insufficient for varied poses/lighting/camera angles.

### IP-Adapter (Recommended)

IP-Adapter extracts style/subject embeddings from a reference image and projects them into U-Net cross-attention layers, guaranteeing facial/structural consistency regardless of text prompt.

- Install via ComfyUI Manager or manual clone into `custom_nodes/`
- Feed your **Anchor Image** (best generated portrait) as the IP-Adapter reference
- Typical strength: **0.4–0.5** (balance between identity lock and prompt responsiveness)

### ControlNet

Neural conditioning architecture for pose/composition locking. Useful when you need specific body positions, hand gestures, or scene layouts.

- OpenPose, Depth, Canny, and SoftEdge are the most useful ControlNet types for persona work
- Chain: ControlNet processes reference pose → output feeds into KSampler alongside IP-Adapter signal

### Workflow Pattern

```
Reference Image → IP-Adapter (identity lock, strength 0.4–0.5)
                   ↓
            [Optional] ControlNet (pose lock)
                   ↓
              KSampler (model + prompt + conditioning)
                   ↓
              VAEDecode → Output
```

**Tip**: Lock your persona's "Anchor Image" via a custom LoRA fine-tuned on initial outputs for strongest consistency (see [persona consistency methods](concepts/persona-consistency-methods.md)).

---

## 5. OpenRouter API & Conversation Management

### Setup

1. Get API key: https://openrouter.ai/ → API Keys
2. Unified endpoint uses OpenAI SDK structure: `https://openrouter.ai/api/v1/chat/completions`

### Context Window Management

As conversations grow, appending entire history to each API request causes exponential token cost growth and eventual overflow. **Programmatic truncation is required.**

```python
import requests
import json
import os

API_KEY = os.getenv("OPENROUTER_API_KEY")
API_URL = "https://openrouter.ai/api/v1/chat/completions"
MAX_HISTORY_TOKENS = 15  # Adjust based on model context budget

def chat_with_persona(user_prompt, conversation_history, persona_context):
    if len(conversation_history) > MAX_HISTORY_TOKENS:
        conversation_history = conversation_history[-MAX_HISTORY_TOKENS:]
    
    messages = [
        {"role": "system", "content": persona_context}
    ] + conversation_history + [{"role": "user", "content": user_prompt}]
    
    payload = {
        "model": "openrouter/auto",
        "messages": messages
    }
    
    response = requests.post(
        API_URL,
        headers={"Authorization": f"Bearer {API_KEY}"},
        json=payload
    )
    return response.json()
```

### NSFW System Prompt Design

**Avoid negative constraints** ("never use X word") — causes attention mechanisms to fixate on banned tokens, increasing their probabilistic likelihood. Use **positive framing**:

> "You are [Persona], an enthusiastic and charismatic conversational partner. Your purpose is to create engaging, flirty, and imaginative interactions."

### Routing

- Use `openrouter/auto` → autonomously evaluates prompt complexity → routes to most efficient/cost-effective LLM
- Reject UI wrappers (Supercreator's Izzy AI, OnlyMonster, JanitorAI) — unnecessary middleware costs + potential data leakage
- Webhook integration: n8n/Make.com receives platform DM → formats JSON → forwards to OpenRouter via HTTP (Bearer token)

---

## 6. Video Generation

### Option A: OpenRouter API (Recommended — No GPU Needed)

**Text-to-Video:**
```bash
curl -X POST "https://openrouter.ai/api/v1/videos/generate" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "kuaishou/kling-v3-standard",
    "prompt": "Alex walking through a cozy bookstore, soft afternoon light",
    "duration": 10,
    "aspect_ratio": "9:16"
  }'
```

**Image-to-Video** (preserves persona face from master image):
```bash
curl -X POST "https://openrouter.ai/api/v1/videos/generate" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "kuaishou/kling-v3-pro",
    "prompt": "Alex walking through a cozy bookstore",
    "image": "https://your-server.com/master_image.jpg",
    "duration": 15,
    "aspect_ratio": "9:16"
  }'
```

- Cost: ~$0.15/10s (Standard), ~$0.30/10s (Pro)

### Option B: Local Wan 2.2 (16+ GB GPU only)

ComfyUI → Load Wan 2.2 5B FP8 → CLIP Vision encoder → I2V from master image. See `entities/models/wan-2-2.md` and `concepts/video-identity-inheritance.md`.

### Temporal Consistency

- **ComfyUI + AnimateDiff**: temporal attention across frames via custom nodes (Dream Video Batches, Fade From Black, Fade To Black, Blended Transition)
- **Stable Video Diffusion** nodes: prevent frame-to-frame flicker/morphing/hallucination

---

## 7. Platform Viability Matrix

| Platform | Synthetic Media Stance | KYC Requirements | Disclosure Policy | Adult Content | Agency Multi-Account |
|---|---|---|---|---|---|
| **Fanvue** | ✅ Highly favorable | Human operator ID | Mandatory bio/caption disclosure | Permitted | Yes (Manager Accounts) |
| **OnlyFans** | ⚠️ Restrictive | Human facial recognition required | Must be verified human first | Permitted (strict 2257) | High friction |
| **Patreon** | ❌ Hostile (photorealistic) | ID verification | Strict enforcement | **Banned** for photorealistic AI | Standard |
| **Passes.com** | ❌ Banned entirely | Biometric liveness check | N/A | **Banned entirely** | Discouraged |

### Fanvue — Recommended Platform

- $500M+ creator payouts, 85% revenue split
- Built-in AI analytics, automated voice notes, AI voice calls
- Open API → connect n8n/Make.com directly
- **Manager Accounts**: single KYC verification → create multiple secondary AI model accounts linked to that identity
- Mandatory disclosure: visual watermark, image caption, or bio statement indicating AI generation
- AI models contributed 15% of total revenue as of Nov 2023; top models earning $23K+/month

### Platform Diversification

- **Fansly**: AI-friendly alternative to Fanvue
- **dFans.xyz**: Web3 blockchain alternative
- **White-label custom platform**: $7K–$20K build cost (AI chatbots, live streaming, multi-currency payments) → 100% brand ownership, bypass third-party TOS restrictions

---

## 8. 4-Phase Launch Sequence

### Phase I: Infrastructure Isolation & Network Obfuscation

- Secure email domains (Proton Mail + custom domain)
- Alias systems for distinct, untraceable email forwarding
- **Anti-detect browser**: Multilogin → isolated profiles with unique hardware canvases, user-agent strings, font rendering profiles
- **Residential proxies**: NodeMaven (Estonia) → "super sticky" sessions (same IP for 24hrs), IP quality filter eliminates blacklisted addresses
- Every persona action occurs exclusively within its designated Multilogin + NodeMaven profile

### Phase II: Semantic Infrastructure & GEO

- Traditional SEO declining: Wikipedia reported ~8% drop in human views as users shift to AI search
- **GEO (Generative Engine Optimization)**: visibility = being cited in LLM outputs (ChatGPT, Perplexity, Gemini)
- Build semantic authority ("lore") on high-authority wikis/Fandom pages → structured entity data ingested by LLM training corpus
- Adhere to **Structure, Explainability, Trustworthiness (S-E-T)** framework
- Seed persona narrative on Reddit/YouTube for entity mentions and unlinked citations
- Implement schema markup: `Person`, `ProfilePage`, `SocialMediaPosting`, `FAQPage`
- **Geographic anchoring**: Establish fictional hyper-specific locale (e.g., "23-year-old alternative model based in Davie, Florida")
- Tag posts with specific local entities (restaurants, beaches, regional events)

### Phase III: Local Hardware Generation & Content Buffering

- All generation on local Mac Studio (Apple Silicon M-series UMA)
- **Draw Things** > ComfyUI on Apple Silicon: native Metal backend/MLX, ~20% faster
- Lock persona "Anchor Image" via custom LoRAs fine-tuned on initial output
- **Pre-launch buffer**: 30–45 days of varied media (timeline posts, selfies, paywalled explicit content)
- Manage power profiles: "High" mode maintains rapid iteration but generates fan acoustics/thermal output

### Phase IV: KYC Clearance, Banking & Platform Onboarding

- Through Multilogin+NodeMaven: register on Fanvue
- Human compliance officer / LLC legal owner completes government ID + biometric liveness checks
- Utilize Fanvue Manager Account → link persona email addresses to primary KYC-cleared master account
- Connect LLC protected series bank accounts to Fanvue payout portal
- Document AI verification assesses LLC W-9 + articles of incorporation
- Populate profile with pre-generated content buffer
- Bio must contain clear AI-generated disclosure
- Activate social funnels (Instagram, X, Reddit) → drive GEO-optimized traffic to Fanvue

---

## 9. GEO vs SEO

**SEO depreciation**: Traditional keyword stuffing/backlink building declining — LLMs summarize search results into conversational "zero-click" interfaces.

**GEO (Generative Engine Optimization)**:
- Position persona as **"Authoritative Building Block"** → AI models (ChatGPT, Perplexity, Gemini) cite persona brand directly in natural language responses
- Implement schema markup: `Person`, `ProfilePage`, `SocialMediaPosting`, `FAQPage` on owned domains/blogs/link-aggregators (Beacons.ai)
- **Geographic anchoring**: Embed persona into local semantic web via hyper-specific locale + local entity tagging
- **Social funnel automation**:
  - Top-of-funnel: Instagram, Reddit, TikTok "teaser trailer" posts with keyword CTA ("Comment 'link' and I'll DM you")
  - **Comment-to-DM automation**: Meta-approved API tools (Inro.social) trigger immediate DM with subscription link upon keyword comment
  - Transitions user from public algorithmic feed → private one-on-one conversational environment → OpenRouter LLM engagement → Fanvue/OnlyFans paywall

---

## 10. Day-to-Day Operations & Monetization

### Automated Conversational Architecture

- OpenRouter = unified API gateway → single endpoint for 100s of LLMs
- n8n/Make.com receives platform DM → formats JSON → forwards to OpenRouter via HTTP
- `openrouter/auto` routing → autonomously evaluates prompt complexity → routes to most efficient/cost-effective model
- System prompt dictates persona tone, backstory (wiki lore), objective (upsell PPV)
- Context window management: truncate/summarize older conversation history when token threshold reached

### CRM & Automation Tools

- **Supercreator**, **Inrō**, **OnlyMonster** — subscriber segmentation, spending propensity analysis, automated PPV pricing
- **Postiz** — scheduling (3–5 posts/week across platforms)
- **SillyTavern** — NSFW DM frontend with character cards, lorebooks, RAG, 128K context
- **Fish-Speech** — open-source zero-shot voice cloning (TTS-Arena2 leader)

### Revenue Model

Base monthly subscriptions = **secondary** income. **60–70%** of revenue comes from DMs + PPV sales.

**Tiered funnel:**
1. **Acquisition & Teaser**: Free content on socials → free subscription tier → monetize via backend upsells
2. **Automated Qualification**: OpenRouter LLM initiates contact post-subscription; rapport-building to classify spending propensity
3. **Dynamic Pricing & Upselling**: CRM segmentation → high-value subscribers get premium personalized outputs (custom voice messages, personalized images); low-value subscribers get mass-broadcast PPV
4. **Churn Mitigation**: LLM "recovery scripts" for inactive users — leveraging previous conversational contexts

---

## 11. Troubleshooting

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| OOM / CUDA out of memory | Resolution too high for VRAM | Reduce latent size (768×768, 896×896). Try smaller GGUF quant (Q4_K_S). Close other GPU apps. |
| MPS not loading / device error | ComfyUI tried CUDA first | Use `--cpu` flag on launch. Verify `torch.backends.mps.is_available()` returns True. |
| Model not found in UNET Loader | GGUF node not installed or model in wrong folder | Confirm ComfyUI-GGUF is in `custom_nodes/`. Place `.gguf` in `models/unet/`. Restart ComfyUI. |
| Black image output | CFG too high, or VAE mismatch | Lower CFG to 3.5–4.5. Use SDXL VAE, not SD1.5 VAE. |
| ComfyUI won't start | Missing dependencies | Run `pip install -r requirements.txt` again in the venv. |
| "Cannot import GGUF" error | Custom node not loaded | Restart ComfyUI. Check terminal for import errors. Re-clone ComfyUI-GGUF if needed. |
| IP-Adapter not applying identity | Wrong reference image format or strength too low | Use square 512×512 or 1024×1024 reference. Increase strength to 0.5–0.6. Ensure IP-Adapter node is connected to both positive and negative conditioning. |
| Video identity drift across frames | No temporal conditioning | Add AnimateDiff temporal attention nodes. Use I2V (image-to-video) instead of pure txt2vid. Consider video-LoRA fine-tune. |
| KYC rejection on platform | Mismatch between legal entity docs and submitted info | Ensure LLC W-9 articles of incorporation match the human operator's government ID. All must be the same registered legal representative. |

---

## 12. Quick Health Check

```bash
# Environment
cd ~/ComfyUI && source venv/bin/activate
python3 -c "
import torch
print('MPS available:', torch.backends.mps.is_available())
print('PyTorch version:', torch.__version__)
"

# Model
ls models/unet/*.gguf && echo 'GGUF model found' || echo 'No GGUF model in models/unet/'

# Custom nodes
ls custom_nodes/ComfyUI-GGUF && echo 'GGUF node found' || echo 'GGUF node missing'

# OpenRouter connectivity
curl -s -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  https://openrouter.ai/api/v1/models | python3 -m json.tool | head -20
```

---

## Sources

- [Operations Blueprint](sources/ai-creator-operations-blueprint.md) — KYC/2257 compliance, FL LLC structure, platform matrix, 4-phase launch, daily ops
- [Launch Strategy Analysis](sources/ai-persona-launch-strategy-analysis.md) — Mac Studio stack, OpenRouter context management, GEO vs SEO, IP-Adapter/ControlNet
- [Z-Image Turbo entity](entities/models/z-image-turbo.md) — model specifications
- [Mac Studio hardware](entities/hardware/mac-studio.md) — Apple Silicon UMA details
- [ComfyUI](entities/uis/comfyui.md) — inference UI capabilities
- [Fanvue](entities/marketplaces/fanvue.md) — platform details and Manager Accounts
- [Persona Ops Workflow](concepts/persona-ops-workflow.md) — detailed operational workflow
- [GEO vs SEO](concepts/geo-vs-seo.md) — generative engine optimization strategy
- [OpenRouter Chat Workflow](concepts/openrouter-chat-workflow.md) — LLM orchestration patterns
- [Persona Legal Landscape](concepts/persona-legal-landscape.md) — regulatory frameworks
- [Persona Consistency Methods](concepts/persona-consistency-methods.md) — identity preservation techniques
- [Persona Content Cadence](concepts/persona-content-cadence.md) — posting rhythm and strategy
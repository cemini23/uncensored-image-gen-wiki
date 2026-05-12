---
title: Day 1 Checklist — Start Your AI Persona Operation
type: brief
target: Friend starting AI persona OF operation (Image + Video + Marketing)
created: 2026-05-08
updated: 2026-05-08
related:
  - concepts/model-selection-workflow.md
  - entities/models/openrouter-video.md
  - sources/ai-creator-operations-blueprint.md
  - sources/ai-persona-launch-strategy-analysis.md
  - runbooks/zimage-setup-runbook.md
  - entities/hardware/mac-studio.md
  - entities/marketplaces/fanvue.md
  - concepts/geo-vs-seo.md
  - concepts/openrouter-chat-workflow.md
  - concepts/persona-ops-workflow.md
  - concepts/persona-legal-landscape.md
  - entities/custom-nodes/impact-pack.md
maturity: draft
---

## Target

Your friend, starting tomorrow: set up a full AI persona operation — local image generation, video, compliance, platform launch, and automated marketing — using this wiki + SEO:GEO marketing wiki.

---

## Summary

Actionable Day 1–4 checklist combining:
- **Image gen** from `wiki/` + `briefs/beginner-guide-to-persona.md`
- **Video gen** from `wiki/entities/models/openrouter-video.md` (OpenRouter API)
- **Compliance & ops** from `wiki/sources/ai-creator-operations-blueprint.md`
- **Strategy & dev** from `wiki/sources/ai-persona-launch-strategy-analysis.md`
- **Marketing** from `@seo-wiki/` cross-wiki links (SEO:GEO wiki)

---

## Phase I — Infrastructure & Legal Prep (Before Day 1)

### Proton Mail + Custom Domain
- [ ] Set up Proton Mail account for persona communications
- [ ] Register custom domain for email forwarding aliases
- [ ] Create unique alias per platform / persona

### Legal Entity (Florida Protected Series LLC)
- [ ] Consult attorney about Florida Protected Series LLC formation
- [ ] File articles of incorporation (master LLC + per-persona protected series)
- [ ] Obtain EIN for each protected series
- [ ] Open dedicated bank account per protected series
- [ ] Prepare W-9 (domestic) or W-8BEN (international) for each entity

### Proxy & Browser Isolation
- [ ] Subscribe to NodeMaven residential proxies (Estonia)
- [ ] Install Multilogin — create isolated profile per persona
- [ ] Configure unique hardware canvas, user-agent, font rendering per profile

> ⚠️ **KYC spoofing via anti-detect browsers or deepfake video is highly illegal and guarantees permanent platform bans.** All KYC must use real human identity of the LLC's registered legal representative.

---

## Phase II — Local Hardware & Software Setup (Day 1 Morning, ~3 hours)

### Step 1: Verify Hardware (15 min)
```bash
# macOS:
system_profiler SPDisplaysDataType  # Look for "VRAM (Dynamic)" — need 16 GB+ unified

# Check PyTorch + MPS:
python3 -c "
import torch
print('MPS available:', torch.backends.mps.is_available())
print('PyTorch version:', torch.__version__)
"
```

**Hardware recommendations (from Launch Strategy Analysis §1.1):**

| Configuration | Memory | Typical Inference (Flux, 1024×1024) |
|---|---|---|
| M4 Pro 24 GB | Unified | ~50s |
| M3 Ultra 192 GB | Unified | Sub-30s |
| M4 Max / Ultra 512 GB | Unified | Fastest |

> Unlike NVIDIA dGPUs (max 24GB on RTX 4090), Mac Studio UMA allocates 192–512GB to Neural Engine + GPU.

### Step 2: Install ComfyUI (30 min)
```bash
git clone https://github.com/comfyanonymous/ComfyUI.git ~/ComfyUI
cd ~/ComfyUI && python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
pip install -r requirements.txt
```

Also install **Draw Things** for faster production generation:
- Download from https://github.com/lllyasviel/draw-things
- Native Metal + MLX/CoreML → ~20% faster than ComfyUI on Apple Silicon

### Step 3: Install Essential Custom Nodes
```bash
cd ~/ComfyUI/custom_nodes

# GGUF support (for Z-Image Turbo)
git clone https://github.com/city96/ComfyUI-GGUF.git

# Identity consistency (critical for persona)
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git   # IP-Adapter
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git  # Face detailer

# Video generation
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git

# Face swap pipeline
git clone https://github.com/iFayens/ComfyUI-PuLID-Flux2.git

# Restart ComfyUI after installing all nodes
```

### Step 4: Download First Model (15–30 min)

| Hardware | Model | Where | Notes |
|----------|-------|-------|-------|
| 8–12 GB unified | Pony V6 XL | [CivitAI 169278](https://civitai.com/models/169278) | SDXL fine-tune, score_9 tags |
| 16+ GB unified | FLUX.1 Dev | [HF: black-forest-labs/FLUX.1-dev](https://huggingface.co/black-forest-labs/FLUX.1-dev) | Full quality, uncensored |
| 24+ GB unified | Z-Image Turbo GGUF | HF / ComfyUI-GGUF | Sub-second, great for drafts |
| 16–24 GB unified | FLUX.2 Klein 4B | [HF: black-forest-labs/FLUX.2-Klein-dev](https://huggingface.co/black-forest-labs/FLUX.2-Klein-dev) | Sub-second, excellent quality |

Place model files in `ComfyUI/models/checkpoints/` (safetensors) or `ComfyUI/models/unet/` (GGUF).

### Step 5: Install OpenRouter CLI tools
```bash
# Get API key: https://openrouter.ai/ → API Keys
export OPENROUTER_API_KEY="your-key-here"

# Verify connectivity:
curl -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  https://openrouter.ai/api/v1/models | python3 -m json.tool | head -20
```

---

## Phase III — Persona Identity Creation (Day 1 Afternoon, ~2 hours)

### Step 6: Write Character Bible
Create `my_persona/character.md`:
```
Name: [chosen fictional name]
Trigger word: [unique trigger, e.g. "alex_persona"]
Age: 25, Ethnicity: South Asian
Face: dark brown eyes, straight black hair, small scar on left chin
Body: 5'6", slim, light brown skin
Signature: silver hoop earring, oversized sweaters
Personality: tech-savvy, calm, witty
```

### Step 7: Generate Anchor Image Set (20–30 images)

**Pony V6 (Danbooru-tag style):**
```
alex_persona, score_9, 1girl, solo, standing, masterpiece, best quality
```

**FLUX (natural language, as described in Z-Image runbook §Prompting Tips):**
```
A high-quality, detailed 8K photograph of Alex, a 25-year-old South Asian woman with dark brown eyes and a small scar on the left chin, wearing an oversized cream sweater, warm room lighting, digital art
```

**KSampler Settings** (from runbook):
| Parameter | Value |
|-----------|-------|
| Steps | 15–20 |
| Sampler | `dpmpp_2m_sde` |
| Scheduler | `karras` |
| CFG | 3.5–4.5 |
| Denoise | 1.0 |

### Step 8: Apply Identity Consistency
- Install **IP-Adapter** on best image (strength 0.4–0.5) — locks facial structure regardless of prompt
- Optionally add **ControlNet** (OpenPose) for consistent body positioning
- **Likeness collision check**: Upload best images to [PimEyes](https://pimeyes.com/) and [FaceCheck.ID](https://facecheck.id/) — if ≥70% match to any real person, modify Character Bible and regenerate

### Step 9: Lock Persona via LoRA Fine-Tune
Train a small LoRA (or use DreamBooth) on the 10–15 best images to create an identity-locked model. This becomes your "Anchor LoRA" for all future generation.

---

## Phase IIII — Video Setup (Day 1 Evening or Day 2 Morning, ~1.5 hours)

### Option A: OpenRouter API (Recommended — No GPU needed)

**Text-to-video:**
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

**Image-to-video** (preserves persona face):
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

> **Context window management**: Use the Python script in `concepts/openrouter-chat-workflow.md` to truncate conversation history and avoid token cost explosion. Positive-framing system prompts work better than negative constraints for NSFW content.

### Option B: Local Wan 2.2 (16+ GB GPU only)
ComfyUI → Load Wan 2.2 5B FP8 → CLIP Vision → I2V from master image.
For longer clips, use **AnimateDiff** with temporal attention nodes + **seam stitching** (latent chaining).

---

## Phase IV — Platform Setup & Compliance (Day 2, ~3 hours)

### Step 10: Fanvue KYC
- [ ] Through Multilogin + NodeMaven: register on Fanvue
- [ ] Human compliance officer / LLC legal owner completes government ID + biometric liveness checks
- [ ] Activate Manager Account → link all persona email addresses
- [ ] Connect LLC protected series bank account to Fanvue payout portal

**Why Fanvue** (from Operations Blueprint §2.1):
- $500M+ creator payouts, 85% revenue split
- Manager Accounts: single KYC verification → N secondary AI accounts
- Open API → connect n8n/Make.com for DM automation
- Mandatory AI-generated content disclosure (bio watermark/caption)

### Step 11: Platform Diversification
| Platform | Role | Notes |
|----------|------|-------|
| **Fanvue** | Primary monetization | Premier for AI personas |
| **Fansly** | Secondary | AI-friendly alternative |
| **dFans.xyz** | Web3 alternative | Blockchain-native |
| **White-label** | Full brand ownership | $7K–$20K build, bypass TOS restrictions |

> **Avoid**: OnlyFans (hostile to pure AI personas), Patreon (bans photorealistic AI adult content), Passes.com (banned entirely).

### Step 12: Pre-Launch Content Buffer
- [ ] Generate 30–45 days of varied content:
  - Timeline posts (varied angles, outfits, lighting)
  - Selfies (casual, styled, "candid")
  - Paywalled explicit content (PPV-ready)
- [ ] All persona action occurs exclusively within designated Multilogin + NodeMaven profile

---

## Phase V — Marketing & Launch (Day 3–5)

### Step 13: GEO Foundation (Generative Engine Optimization)

From `concepts/geo-vs-seo.md`:
- [ ] Implement schema markup (`Person`, `ProfilePage`, `SocialMediaPosting`, `FAQPage`) on owned blog/domain
- [ ] Establish geographic anchor: assign hyper-specific locale (e.g., "23-year-old alternative model based in Davie, Florida")
- [ ] Seed persona narrative on Reddit/YouTube for LLM citations
- [ ] Follow **S-E-T framework** (Structure, Explainability, Trustworthiness)

### Step 14: Social Funnel Setup
- [ ] Create Instagram, X, TikTok accounts (within Multilogin profiles)
- [ ] Post 3–5 teaser posts/week with keyword CTA ("Comment 'link' and I'll DM you")
- [ ] Set up [comment-to-DM automation](concepts/geo-vs-seo.md) via Inro.social
- [ ] Install [Postiz](entities/persona-ops/postiz.md) for scheduled posting

### Step 15: Automated DM & Conversation System
- [ ] Configure n8n/Make.com webhook → OpenRouter API pipeline
- [ ] Design persona system prompt (positive framing, no negative constraints)
- [ ] Implement context window truncation script
- [ ] Connect CRM (Supercreator / Inrō / OnlyMonster) for subscriber segmentation and dynamic PPV pricing

### Step 16: Compliance Documentation
- [ ] Store timestamped documentation: prompt architectures, base models, seeds, fine-tuning datasets
- [ ] Prepare 2257 records (per persona)
- [ ] Ensure bio contains clear AI-generated disclosure
- [ ] Maintain W-9 / W-8BEN records per protected series

---

## Complete Checklist (Print)

### Phase I — Infrastructure & Legal
- [ ] Proton Mail + custom domain
- [ ] Florida Protected Series LLC formed
- [ ] Multilogin + NodeMaven configured
- [ ] KYC identity docs ready for legal representative

### Phase II — Hardware & Software
- [ ] Hardware verified (16 GB+ unified memory)
- [ ] ComfyUI installed with custom nodes
- [ ] Draw Things installed (for speed)
- [ ] OpenRouter API key active
- [ ] Model downloaded and placed in models/checkpoints/

### Phase III — Persona Creation
- [ ] Character Bible written
- [ ] 20–30 test images generated
- [ ] IP-Adapter identity lock applied (strength 0.4–0.5)
- [ ] Likeness collision check passed (<70% match)
- [ ] Anchor LoRA trained on best images

### Phase IIII — Video
- [ ] OpenRouter API tested with Kling 3.0
- [ ] I2V clip generated from anchor image
- [ ] (Optional) Local Wan 2.2 setup

### Phase IV — Platform Launch
- [ ] Fanvue Manager Account KYC completed
- [ ] Secondary AI model account created
- [ ] LLC bank account connected to payout portal
- [ ] Pre-buffered content uploaded (30–45 days)
- [ ] AI-disclosure bio live

### Phase V — Marketing
- [ ] GEO schema markup deployed
- [ ] Social accounts active (IG, X, TikTok)
- [ ] Postiz scheduling configured (3–5 posts/week)
- [ ] DM automation pipeline live (n8n → OpenRouter)
- [ ] CRM connected for subscriber segmentation
- [ ] 2257 documentation filed
- [ ] Revenue monitoring dashboard active

---

## Notes for Tomorrow (and Beyond)

1. **Start simple** — pick ONE image model + ONE video option. Expand later.
2. **Likeness check is non-negotiable** — skip this and platforms will ban you.
3. **3–5 posts/week** — more = algorithm penalty. Quality over volume.
4. **OpenRouter for video** — much easier than local Wan 2.2 setup. Save local GPU for image generation.
5. **GEO > SEO** — build semantic authority for AI model citations, not just search rankings.
6. **60–70% of revenue is DM/PPV** — optimize the conversation funnel, not just the subscription tier.
7. **Data sovereignty** — keep all generation local (Mac Studio), all conversations encrypted, all legal structures in place before monetizing.
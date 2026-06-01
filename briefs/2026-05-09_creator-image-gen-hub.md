---
title: Creator Image-Gen Decision Hub — Launch Blueprint
type: brief
tags: [creator-launch, image-generation, ai-persona, decision-hub, model-selection, workflow, compliance]
keywords: [AI image generation, persona launch, model selection, ComfyUI workflow, LoRA training, platform deployment, beginner guide]
related:
  - @wiki-alias/image-gen-wiki/concepts/model-selection-workflow.md
  - @wiki-alias/image-gen-wiki/concepts/persona-consistency-methods.md
  - @wiki-alias/image-gen-wiki/concepts/reference-plus-lora-stacking.md
  - @wiki-alias/image-gen-wiki/concepts/character-dna-templates.md
  - @wiki-alias/image-gen-wiki/concepts/persona-content-cadence.md
  - @wiki-alias/image-gen-wiki/concepts/persona-legal-landscape.md
  - @wiki-alias/image-gen-wiki/concepts/de-censoring-techniques.md
  - @wiki-alias/image-gen-wiki/entities/models/flux-1-dev.md
  - @wiki-alias/image-gen-wiki/entities/models/pony-v6.md
  - @wiki-alias/image-gen-wiki/entities/models/flux-2-klein.md
  - @wiki-alias/image-gen-wiki/entities/adapters/pulid.md
  - @wiki-alias/image-gen-wiki/entities/persona-ops/sillytavern.md
  - @wiki-alias/image-gen-wiki/entities/persona-ops/fish-speech.md
  - @wiki-alias/image-gen-wiki/entities/persona-ops/n8n.md
  - @wiki-alias/image-gen-wiki/entities/persona-ops/postiz.md
  - @wiki-alias/image-gen-wiki/entities/uis/comfyui.md
  - @wiki-alias/image-gen-wiki/runbooks/day-1-checklist-for-friend.md
  - @wiki-alias/image-gen-wiki/concepts/persona-ops-stack.md
  - @wiki-alias/image-gen-wiki/sources/uncensored-image-generation-survey.md
maturity: draft
created: 2026-05-09
updated: 2026-05-09
processed: 2026-05-21
---

## Target

**Friend — solo creator** who is about to start their first AI image generation setup today. This document gives them everything they need to make informed decisions about models, workflows, hardware, content strategy, and platform deployment — then execute tomorrow.

This bridges the **Image Gen wiki** (technical production) and the **SEO:GEO wiki** (marketing/monetization/platform strategy). Pair with [Creator Launch Decision Hub](@wiki-alias/seo-wiki/briefs/2026-05-09_creator-launch-decision-hub.md) (SEO:GEO) for the full business picture.

---

## 1. MODEL SELECTION — Pick Your Starting Stack

### The Quick Decision

| Your GPU | Go With | Why |
|----------|---------|-----|
| **8 GB VRAM** (RTX 4060, M1/M2 16 GB Mac) | **Pony V6 XL** | Completely uncensored, 8 GB friendly, massive community |
| **12-16 GB VRAM** (RTX 4060 Ti/4070 Ti, M3/M4 MacBook Pro) | **FLUX.1 Dev** (GGUF Q8) | Best photorealism in tier; works with PuLID for face consistency |
| **24+ GB VRAM** (RTX 4090/5090, Mac Studio 64 GB) | **FLUX.2 Klein 9B** + **Wan 2.2 5B** (video) | Frontier quality; native video generation |
| **No GPU** | **OpenRouter API** (Kling 3.0 + FLUX via API) | Pay-per-use; zero setup; ~$0.01-0.10/image |

### Style Alignment

| Content Style | Best Model | Censorship Level | Notes |
|---------------|-----------|------------------|-------|
| **Anime / stylized / hentai** | Pony V6 XL or Illustrious XL | Completely uncensored — ships with no safety filter | Danbooru tag-based prompting |
| **Photorealistic SFW / soft-NSFW** | FLUX.1 Dev | Tier 1-2 (minimal censorship, recoverable) | Best for brand-partnership-quality output |
| **Photorealistic explicit** | FLUX.2 Klein 9B + NSFW LoRA | Tier 3+ — de-censoring techniques needed | See [De-censoring Techniques](@wiki-alias/image-gen-wiki/concepts/de-censoring-techniques.md) |
| **Artistic / fashion / painterly** | FLUX.1 Dev or Z-Image Turbo | Tier 1-2 | DiT architecture excels at composition/lighting |
| **Complex scenes / text in image** | Qwen-Image-2512 | Tier 2 | Native layout understanding; great for multi-element prompts |

### My Recommendation for Day 1

**If your goal is an AI persona:** Start with **FLUX.1 Dev** (photorealistic, works with PuLID for face consistency, widest community support) or **Pony V6 XL** (anime, zero censorship, lower VRAM requirement).

**Do NOT start by downloading 5 models.** Pick one. Generate 20-30 images with it. Learn its prompt conventions. Then expand.

---

## 2. GENERATION PIPELINE — The Technical Stack

### Required Software

| Component | Tool | Cost | Platform |
|-----------|------|------|----------|
| **Image generation UI** | [ComfyUI](@wiki-alias/image-gen-wiki/entities/uis/comfyui.md) | Free, open source | Windows / Linux / macOS |
| **Image generation UI (Mac alt)** | [Draw Things](https://drawthings.ai/) | Free basic / $15/mo Pro | macOS only |
| **Face consistency adapter** | [PuLID](@wiki-alias/image-gen-wiki/entities/adapters/pulid.md) | Free, open source | ComfyUI node |
| **Posting automation** | [Postiz](@wiki-alias/image-gen-wiki/entities/persona-ops/postiz.md) | Free tier / $29/mo | Browser |
| **DM chat brain** | [SillyTavern](@wiki-alias/image-gen-wiki/entities/persona-ops/sillytavern.md) + local LLM | Free | Windows / Linux / Mac |
| **Voice notes** | [Fish-Speech S2 Pro](@wiki-alias/image-gen-wiki/entities/persona-ops/fish-speech.md) | Free, open source | CPU/GPU |
| **Workflow automation** | [n8n](@wiki-alias/image-gen-wiki/entities/persona-ops/n8n.md) | Free (self-hosted) | Node.js |

### Hardware Check — Do This First

```bash
# Windows:
nvidia-smi  # Look for GPU name + "Dedicated GPU Memory"

# macOS:
system_profiler SPDisplaysDataType  # Look for "VRAM (Dynamic)"

# Minimum: 8 GB VRAM (for Pony V6)
# Sweet spot: 12-16 GB VRAM (for FLUX.1 Dev)
# Ideal: 24+ GB VRAM (for FLUX.2 Klein + video models)
```

**No GPU?** Skip local install. Go straight to [OpenRouter](https://openrouter.ai/) and use the API. See [Day 1 Checklist](@wiki-alias/image-gen-wiki/runbooks/day-1-checklist-for-friend.md) §Afternoon for API setup.

### Install ComfyUI (30-60 min)

```bash
cd ~
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt
python main.py  # Launches at http://localhost:8188
```

Then in ComfyUI → **Manager → Install Missing Custom Nodes** → install:
- `ComfyUI-IPAdapter-Plus` (for face adapters)
- `ComfyUI-Impact-Pack` (quality-of-life nodes)

### Download Your Model

| Model | Download Link | File Size | Place In |
|-------|---------------|-----------|----------|
| **Pony V6 XL** | [CivitAI 169278](https://civitai.com/models/169278) or [HF](https://huggingface.co/AstraliteHeart/pony-v6-xl) | ~6.5 GB FP16 | `ComfyUI/models/checkpoints/` |
| **FLUX.1 Dev** | [HF: black-forest-labs/FLUX.1-dev](https://huggingface.co/black-forest-labs/FLUX.1-dev) | ~12 GB FP16 / ~6 GB GGUF Q8 | `ComfyUI/models/checkpoints/` |
| **FLUX.2 Klein 4B** | [HF: black-forest-labs/FLUX.2-Klein-dev](https://huggingface.co/black-forest-labs/FLUX.2-Klein-dev) | ~4 GB | `ComfyUI/models/checkpoints/` |

**First sanity test:** Load model → enter prompt `1girl, standing, simple background, masterpiece, best quality` → Queue Prompt → You should get an image in 5-15 seconds.

---

## 3. PERSONA DEFINITION — Write Your Character Bible

This is the single most important document for your operation. It defines who your AI persona is and keeps them consistent across every image.

### Character DNA Template (Copy & Fill In)

```xml
<character>
  <name>YOUR_PERSONA_NAME</name>
  <trigger>unique_trigger_word</trigger>
  <age>XX</age>
  <ethnicity>...</ethnicity>
  <face>
    Eye color, hair color/style, face shape,
    distinctive features (scar, freckles, etc.)
  </face>
  <body>Height, build, skin tone</body>
  <signature>1-2 distinctive visual traits (accessory, tattoo, etc.)</signature>
  <persona>Personality traits, voice, backstory</persona>
</character>
```

### Key Rules

1. **Trigger word** — a unique word/phrase you put in *every* prompt. This is how the model learns your specific character. Example: `alex_persona`
2. **Signature features** — one or two distinctive physical traits (scar, birthmark, specific hairstyle, accessory). *This dramatically improves AI consistency.*
3. **Novelty** — your persona's face must be unique. Do NOT base it on a specific real celebrity. You will get flagged by likeness detection.
4. **Lock it after verification** — once you've confirmed no real person matches (Phase 5), never change this file.

See [Character DNA Templates](@wiki-alias/image-gen-wiki/concepts/character-dna-templates.md) for full schema and prompt conventions.

---

## 4. FIRST IMAGE GENERATION SESSION

### Prompting Guide

**For Pony V6 (anime/Danbooru style):**
```
YOUR_TRIGGER, score_9, 1girl, solo, standing, simple background,
brown hair, brown eyes, signature_accessory, masterpiece, best quality
```

**For FLUX.1 Dev / Z-Image (photorealistic):**
```
A photorealistic portrait of YOUR_PERSONA_NAME, a 25-year-old woman 
with dark brown eyes, shoulder-length black hair, wearing an oversized 
cream sweater, standing in a cozy room with warm afternoon light. 
Canon DSLR, 85mm lens, shallow depth of field.
```

### Recommended Settings

| Setting | Value | Notes |
|---------|-------|-------|
| **Steps** | 20-30 (FLUX) / 25-35 (Pony/SDXL) | More = more detail, slower |
| **CFG Scale** | 7-8 | Higher = more literal prompt following |
| **Sampler** | euler_ancestral or dpmpp_2m_sde_gpu | Solid defaults |
| **Resolution** | 1024×1024 | Start here; upscale later |
| **Batch size** | 1-2 | Generate 1-2 images per run |

### Session Goal

Generate **20-30 images** with variety:
- Different outfits, poses, lighting, backgrounds
- Different expressions (smiling, neutral, thoughtful)
- Different angles (frontal, 3/4, profile)

**Save everything** to `my_persona/raw_generations/` with sequential filenames.

### Troubleshooting

| Problem | Fix |
|---------|-----|
| **Face inconsistent between images** | Normal at first! Fixed in Step 5 with identity adapters |
| **Extra fingers / deformed hands** | Add `perfect hands, five fingers` to prompt |
| **Blurry / low detail** | Increase steps to 30+; try different sampler |
| **Prompt partially ignored** | Lower CFG to 6; use `(keyword:1.3)` emphasis syntax |
| **Out of memory error** | Reduce to 768×768; or add `--lowvram` launch flag |

---

## 5. FACE CONSISTENCY — The Biggest Quality Leap

Without identity consistency, your persona looks like a different person in every image. This is the step that separates "AI slop" from a credible persona.

### Option A: Identity Adapters (No Training Required — Start Here)

| Adapter | Best For | Strength Setting |
|---------|----------|-----------------|
| **PuLID** (recommended for FLUX) | Photorealistic faces | 0.40-0.50 |
| **IP-Adapter FaceID-Plus-V2** (best for SDXL) | Anime + photo | 0.35-0.50 |
| **InstantID** | Simple setup, color stability | 0.40-0.50 |

**Setup:** Install the ComfyUI node → Download adapter weights → Connect in workflow between model loader and sampler → Upload ONE good reference face photo.

### Option B: Train a Character LoRA (Advanced, Maximum Consistency)

If you want maximum consistency across thousands of images:

1. Select 20-30 of your best images from Phase 4
2. Train a LoRA using:
   - **ai-toolkit** (for FLUX) — Python CLI, YAML config
   - **Kohya ss GUI** (for SDXL/Pony) — graphical interface
3. Upload LoRA to `ComfyUI/models/loras/` → Load at **strength 0.7-0.85**

⚠ **A FLUX LoRA won't work on Pony, and vice versa.** Each base model needs its own LoRA.

See [Persona Consistency Methods](@wiki-alias/image-gen-wiki/concepts/persona-consistency-methods.md) for the full 4-axis consistency framework.

---

## 6. SAFETY, VERIFICATION & COMPLIANCE

### Likeness Collision Check (MANDATORY)

Before posting *any* image publicly, verify your persona doesn't accidentally match a real person.

**Free tools (check all three):**
1. [FaceCheck.ID](https://facecheck.id/) — free tier
2. [AI Face Search](https://aifacesearch.com/) — free
3. [PimEyes](https://pimeyes.com/) — paid, most comprehensive (2.1B face database)

**Protocol:** Upload 10-15 of your best images. If any result shows **≥70% match** to a real person, go back to Phase 3 and redesign your character with different features.

### Platform Compliance

| Risk | Rule |
|------|------|
| **Real person likeness** | Never generate images of identifiable real people without written consent. Platforms use biometric matching (2026 enforcement: [AI Detection & Enforcement 2026](@wiki-alias/seo-wiki/sources/ai-detection-enforcement-2026.md)) |
| **AI disclosure** | All platforms now require `#AI` or similar disclosure tags |
| **Child safety** | Never generate anything remotely close to minors — instant permanent ban + legal liability |
| **Platform-specific rules** | OnlyFans allows AI with disclosure (must match verified human); **Fanvue is explicitly AI-friendly** and recommended for AI personas |

### Content Safety

- Keep verification screenshots (PimEyes/FaceCheck results) as legal defense
- Never use deepfake technology on real individuals
- Familiarize yourself with local laws: UK OSA + DUAA s.138 (Feb 2026), EU AI Act Article 50 (Aug 2026), US 18 USC 2257

See [Persona Legal Landscape](@wiki-alias/image-gen-wiki/concepts/persona-legal-landscape.md) for full jurisdiction breakdown.

---

## 7. PLATFORM DEPLOYMENT — Where to Post

### Platform Decision Matrix

| Platform | Best For | NSFW | AI-Persona Friendly | Fee | Notes |
|----------|----------|------|---------------------|-----|-------|
| **Fanvue** | AI persona monetization | ✅ | ✅ Explicitly embraced | 15-20% | Built-in PPV/DM tipping; dominant for AI personas |
| **Instagram** | SFW discovery & growth | ❌ | ✅ | Free | Reels drive discovery; 9:16 content |
| **TikTok** | Short video discovery | ❌ | ✅ | Free | Algorithm favors consistency; 1-3/day |
| **Reddit** | Niche community building | Partial | ✅ | Free | r/AIInfluencers + genre subs; follow 10:1 rule |
| **OnlyFans** | Traditional human creators | ✅ | ⚠ Restricted | 20% | AI personas risk biometric ban; disclosure required |
| **Patreon** | SFW subscriber base | ❌ | Partial | 10% | No NSFW; photorealistic AI adult banned |

**Beginner recommendation:** Start with **Instagram** (for SFW persona) or **Fanvue** (for adult/NSFW persona). Both have the clearest path to audience.

### Cross-Platform Content Strategy

| Platform | Daily Volume | Content Type | Link Strategy |
|----------|-------------|--------------|---------------|
| **Twitter/X** | 3-10 tweets | SFW teasers, personality, engagement | Bio link only (never direct OF link) |
| **Instagram** | 3-5 posts + 2+ Reels/week | Fully SFW visual portfolio | Bio link |
| **Reddit** | 1-3 posts across subs | Niche SFW content | Bio link only; 10:1 genuine-to-promo ratio |
| **TikTok** | 1 video/day | SFW entertainment, trending sounds | Bio link |
| **Fanvue** | 3-5 posts/week | Core monetization content | Direct link from social funnels |

**Golden rule:** Never put your direct platform link in social posts. Always "link in bio." Twitter's algorithm suppresses external links; Reddit bans premature self-promotion.

**Content mix per platform post:**

| Type | % of Posts | Purpose |
|------|------------|---------|
| SFW teasers | 20-30% | Safe for external platforms; drive traffic |
| NSFW main content | 40-50% | Core subscriber value (gated platforms only) |
| Behind-the-scenes | 10-15% | Builds parasocial connection |
| PPV exclusive | 5-10% | Premium via DM |
| Engagement posts | 5-10% | Polls, Q&A, AMA |

**Cadence:** 3-5 posts/week per platform. Never 3+ days without posting — algorithms forget you and subscribers churn.

---

## 8. GENERATION WORKFLOW — Daily Operations Loop

```
┌─────────────────────────────────────────────────┐
│                                                 │
│  1. CHARACTER DNA                               │
│     Load your <character> XML tags              │
│                                                 │
│  2. PROMPTING                                   │
│     Natural language (FLUX) or Danbooru tags    │
│     (Pony/SDXL) — embed trigger word            │
│                                                 │
│  3. FIRST PASS (1-2 min/image)                  │
│     Generate at base settings                   │
│     Review: face, anatomy, composition          │
│                                                 │
│  4. IDENTITY CHECK (persona builds only)        │
│     Identity adapter @ 0.40-0.55                │
│     OR face-swap pass (FLUX.2 Klein 9B)         │
│                                                 │
│  5. REFINEMENT (optional)                       │
│     img2img denoise 0.15-0.25                   │
│     ColorMatch for skin tone consistency        │
│                                                 │
│  6. REVIEW & SELECT                             │
│     Pick 3-5 best per session                   │
│     Flag weak ones for LoRA retraining          │
│                                                 │
│  7. VARIANT (optional)                          │
│     Same prompt, different outfit/setting       │
│     Builds content library for scheduling       │
│                                                 │
│  8. POST TO PLATFORMS                           │
│     Crop for platform aspect ratios             │
│     Schedule via Postiz or manually upload      │
│                                                 │
└─────────────────────────────────────────────────┘
```

**Realistic output:** 1-2 hours of generation produces enough content for 3-5 posts across platforms for a week.

---

## 9. VIDEO — Adding Motion to Your Persona

Video is a growth accelerator but requires more hardware or API cost.

### Budget Option: OpenRouter API (Any Hardware)

| Model | Type | Cost | Best For |
|-------|------|------|----------|
| **Kling 3.0 Standard** | T2V / I2V | ~$0.15/10s | Short clips, cheapest entry |
| **Kling 3.0 Pro** | I2V | ~$0.30/15s | Face-preserving clips from your best image |
| **Seedance 2.0** | T2V / I2V | ~$0.50/clip | Longer clips (20-30s), native audio |

**Workflow:** Generate your best persona image → Upload to Imgur → Submit as I2V to Kling 3.0 Pro → Get video in 2-5 minutes.

### Local Option (16+ GB GPU)

| Model | VRAM | Notes |
|-------|------|-------|
| **Wan 2.2 5B** (TI2V) | 16 GB | Community NSFW LoRAs available; best local I2V |
| **HunyuanVideo 1.5** | 16-24 GB | Native quality; `nsfwsks` NSFW trigger |
| **CogVideoX 1.5 INT8** | 7-16 GB | Cheapest local option via torchao |

See [Video Identity Inheritance](@wiki-alias/image-gen-wiki/concepts/video-identity-inheritance.md) for the canonical I2V pipeline.

### Recommendation

**Start with OpenRouter API** for video. Save local GPU for image generation where you need volume. Move to local Wan 2.2 when you're generating enough video to justify the VRAM cost.

---

## 10. WHAT TO DO TODAY (Decision Day)

### Right Now ✍

- [ ] **Check your GPU VRAM** (`nvidia-smi` or System Profiler)
- [ ] **Pick your model** using the table in Section 1
- [ ] **Choose your persona name** and check it's available on all platforms (Instagram, Fanvue/OF, Twitter, Reddit)
- [ ] **Define your niche** — what kind of content will you make? (fitness, gaming, cosplay, lifestyle, etc.)
- [ ] **Write your Character DNA** using the template in Section 3
- [ ] **Install ComfyUI** following Section 2 instructions
- [ ] **Download your model** and run the sanity test

### Tonight/Dawn 🌙

- [ ] **Generate first 10 images** — get comfortable with the workflow
- [ ] **Run likeness collision check** on your best 3 images (FaceCheck.ID)
- [ ] **Install PuLID** for face consistency from this point forward
- [ ] **Generate 10 more images** with PuLID enabled at 0.45 strength
- [ ] **Set up a Linktree or Beacons page** for your bio link

### Tomorrow Morning ☀

- [ ] **Create platform accounts** (Instagram + Fanvue or OF depending on content type)
- [ ] **Post 3-5 teasers** to Instagram/Twitter (SFW, driving traffic to your main platform)
- [ ] **Set up Postiz** for scheduling (connect accounts, plan first week)
- [ ] **Generate a week's worth of content** (aim for 5-7 polished images)
- [ ] **Read the marketing playbook:** [@seo-wiki/concepts/first-90-days-playbook.md](@wiki-alias/seo-wiki/concepts/first-90-days-playbook.md)

### Tomorrow Afternoon 🌆

- [ ] **Try OpenRouter video** — Kling 3.0 Standard, generate 2-3 test clips from your best images
- [ ] **Set up SillyTavern** for DM conversations (only needed once people start messaging)
- [ ] **Join relevant communities** — r/AIInfluencers, genre-specific subs, Twitter creator community

---

## 11. COST REALITY CHECK

### Startup Costs (Day 1)

| Item | Cost | Notes |
|------|------|-------|
| **Software** | $0 | ComfyUI, PuLID, Postiz (free tier), SillyTavern, Fish-Speech — all free & open source |
| **Cloud video API** (optional) | ~$0.50-1.00 | 2-3 test clips on Kling 3.0 |
| **Time investment** | 3-5 hours | Install, model download, first generation session |

### Monthly Operating Costs

| Item | Cost | Notes |
|------|------|-------|
| **ComfyUI + models** | $0 | Free and open source |
| **GPU electricity** | $10-30 | If using a local GPU (varies by region) |
| **Postiz Pro** (optional) | $29/mo | For multi-platform scheduling |
| **Cloud video** (if not local) | $20-50 | Depends on volume |
| **Fanvue fee** | 15-20% of gross | Only after you start earning |
| **Traffic/ads** (optional) | $50-200/mo | Only after organic funnel is proven |

### Revenue Expectations (Honest)

| Timeline | Subscribers | Monthly Revenue | Notes |
|----------|-------------|-----------------|-------|
| Days 1-30 | 10-30 | $50-$200 | Soft launch; building base |
| Days 31-60 | 40-80 | $400-$800 | Reddit + PPV + consistent posting kicks in |
| Days 61-90 | 80-150 | $1,000-$2,000 | Established rhythm + content library |
| Month 3-6 | 150-300+ | $2,000-$5,000 | If content cadence and quality hold |

**Key benchmark:** Top 1% of AI persona creators earn ~$18,700/month. Average is much lower. Multi-platform creators earn **$65K/year median** vs. $38K single-platform.

---

## 12. COMMON MISTAKES TO AVOID

| # | Mistake | Why It Fails | Fix |
|---|---------|-------------|-----|
| 1 | Downloading 5+ models on Day 1 | Paralysis, no depth | Pick ONE model. Master it. Expand later. |
| 2 | Skipping the Character Bible | Inconsistent face = uncanny valley = no subscribers | Write it before you generate anything |
| 3 | Using identity adapter at strength >0.6 | Distorts anatomy, looks uncanny | Keep at 0.40-0.50 |
| 4 | Starting with LoRA training | Premature optimization; you need 20+ good images first | Use adapters first, LoRA later |
| 5 | Posting NSFW on Instagram/TikTok/Reddit | Immediate permanent ban | Keep NSFW content on adult platforms only |
| 6 | Skipping the likeness collision check | Platform ban + legal risk | Check every image batch on FaceCheck.ID |
| 7 | Generating 50 images and posting all of them | "AI slop" detection; algorithm penalty | Post 3-5 polished per week |
| 8 | Ignoring platform ToS | Account terminated | Read rules before posting |
| 9 | Trying to automate DMs on Day 1 | Kills parasocial connection; ban risk | Write DMs yourself until you have volume |
| 10 | Expecting revenue in Week 1 | Takes 30-90 days of consistent effort | Set 90-day timeline; be patient |

---

## 13. QUICK REFERENCE — Cross-Wiki Links

### Image Gen Wiki (Technical)

| Topic | Page |
|-------|------|
| Full model selection guide | [Model Selection & Workflow](@wiki-alias/image-gen-wiki/concepts/model-selection-workflow.md) |
| Persona consistency methods | [Consistency Methods](@wiki-alias/image-gen-wiki/concepts/persona-consistency-methods.md) |
| Reference + LoRA stacking recipes | [Stacking Guide](@wiki-alias/image-gen-wiki/concepts/reference-plus-lora-stacking.md) |
| Character DNA template spec | [DNA Templates](@wiki-alias/image-gen-wiki/concepts/character-dna-templates.md) |
| Video identity inheritance (I2V) | [Video Identity](@wiki-alias/image-gen-wiki/concepts/video-identity-inheritance.md) |
| De-censoring techniques by tier | [De-censoring](@wiki-alias/image-gen-wiki/concepts/de-censoring-techniques.md) |
| Hardware/guide (GPU tiers) | [Hardware Guide](@wiki-alias/image-gen-wiki/entities/hardware/gpu-guide.md) |
| ComfyUI setup | [ComfyUI](@wiki-alias/image-gen-wiki/entities/uis/comfyui.md) |
| FLUX.1 model page | [FLUX.1 Dev](@wiki-alias/image-gen-wiki/entities/models/flux-1-dev.md) |
| Pony V6 model page | [Pony V6](@wiki-alias/image-gen-wiki/entities/models/pony-v6.md) |
| PuLID adapter | [PuLID](@wiki-alias/image-gen-wiki/entities/adapters/pulid.md) |
| SillyTavern (DM brain) | [SillyTavern](@wiki-alias/image-gen-wiki/entities/persona-ops/sillytavern.md) |
| Postiz (scheduling) | [Postiz](@wiki-alias/image-gen-wiki/entities/persona-ops/postiz.md) |
| Fish-Speech (voice) | [Fish-Speech](@wiki-alias/image-gen-wiki/entities/persona-ops/fish-speech.md) |
| n8n (automation) | [n8n](@wiki-alias/image-gen-wiki/entities/persona-ops/n8n.md) |
| Day 1 checklist | [Day 1 Checklist](@wiki-alias/image-gen-wiki/runbooks/day-1-checklist-for-friend.md) |
| Full end-to-end runbook | [Runbook](@wiki-alias/image-gen-wiki/briefs/2026-05-07_persona-end-to-end-runbook.md) |

### SEO:GEO Wiki (Marketing/Business)

| Topic | Page |
|-------|------|
| **Full launch decision hub** | [Creator Launch Hub](@wiki-alias/seo-wiki/briefs/2026-05-09_creator-launch-decision-hub.md) — platform choice, pricing strategy, revenue projections, content marketing |
| First 90 days playbook | [90-Day Playbook](@wiki-alias/seo-wiki/concepts/first-90-days-playbook.md) |
| Content strategy | [Content Strategy](@wiki-alias/seo-wiki/concepts/creator-content-strategy.md) |
| Audience growth | [Audience Growth](@wiki-alias/seo-wiki/concepts/creator-audience-growth.md) |
| Retention tactics | [Retention](@wiki-alias/seo-wiki/concepts/creator-retention.md) |
| External promotion | [External Promotion](@wiki-alias/seo-wiki/concepts/creator-external-promotion.md) |
| AI assistance guardrails | [AI Guardrails](@wiki-alias/seo-wiki/concepts/ai-assistance-guardrails.md) |
| GEO (Generative Engine Optimization) | [GEO](@wiki-alias/seo-wiki/concepts/generative-engine-optimization.md) |
| Legal & compliance | [Persona Legal](@wiki-alias/image-gen-wiki/concepts/persona-legal-landscape.md) (image-gen wiki) |
| Monetization models | [Monetization](@wiki-alias/image-gen-wiki/concepts/persona-monetization-models.md) (image-gen wiki) |

---

*Last updated: 2026-05-09 — Created as image-gen counterpart to SEO:GEO Creator Launch Decision Hub.*
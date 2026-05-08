---
title: Complete Beginner's Guide — From Zero to Posting on Your AI Persona
type: brief
target: beginner (no prior image-gen or persona experience)
created: 2026-05-08
updated: 2026-05-08
related:
  - concepts/model-selection-workflow.md
maturity: validated
---

## Target

A complete beginner who has never used an AI image generator, never trained a LoRA, and has never operated an online persona. This guide takes you from bare-metal setup to generating images and posting them on a persona platform — no prior knowledge assumed.

**Companion reading:** [Model Selection & Workflow Builder](wiki/concepts/model-selection-workflow.md) for hardware-specific recommendations.

---

## Summary

Seven phases, roughly 2-4 weeks to a working first persona:

1. **Hardware & software setup** — install ComfyUI, verify GPU works
2. **Choose your model** — match hardware to a starter model
3. **Write your persona spec** — Character DNA template
4. **Generate your first images** — learn prompting basics
5. **Build consistency** — identity adapters, LoRA training (optional but recommended)
6. **Set up your posting pipeline** — Postiz + platform accounts
7. **Post, iterate, and stay safe** — operational hygiene and content cadence

---

## Phase 1 — Hardware & Software Setup

### 1.1 Verify your GPU

**Windows:**
```
nvidia-smi
```
Look for your GPU name and **VRAM** (look for `Dedicated GPU Memory`). You need **8 GB minimum**; 12-16 GB is the sweet spot.

**macOS:**
```
system_profiler SPDisplaysDataType
```
Look for "VRAM (Dynamic)" — you need **16 GB unified memory minimum** (M1/M2) or **36 GB+ recommended** (M3/M4).

### 1.2 Install prerequisites

**Windows (recommended: WSL2)**
```powershell
# In PowerShell as Administrator:
wsl --install
# Restart, then open Ubuntu terminal:
sudo apt update && sudo apt install -y python3-pip python3-venv git
```

**macOS**
```bash
xcode-select --install
brew install python3 git cmake
```

### 1.3 Install ComfyUI (your image generation UI)

ComfyUI is a node-based visual interface — think of it as Photoshop for AI image generation. It's the industry standard for local gen in 2026.

```bash
cd ~
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

# Download a starter model (Pony V6 — see Phase 2 for why):
cd models/checkpoints
# Download from CivitAI or HuggingFace (links in the model page)

# Launch:
python main.py
```

ComfyUI Manager (auto-installs custom nodes):
- In ComfyUI, go to **Manager → Install Missing Custom Nodes**
- Install: `ComfyUI-Manager`, `ComfyUI-Impact-Pack`, `ComfyUI-IPAdapter-Plus`

**Alternative if you're on Mac:** [Draw Things](https://drawthings.ai/) — a native Mac app. Skip ComfyUI if you want the simplest path.

### 1.4 First sanity check

Load a model, enter this prompt, hit **Queue Prompt**:
```
1girl, standing, simple dress, studio lighting, masterpiece, best quality
```
If you get an image back — congratulations, your pipeline works.

**Common first errors:**
- *"Out of memory"* → Your GPU doesn't have enough VRAM. Use a smaller model or add ` --lowvram` / `--medvram` flags.
- *"Model not found"* → Downloaded model isn't in the `checkpoints/` folder. Double-check the path.

---

## Phase 2 — Choose Your First Model

You don't need to use every model. Pick **one** based on your hardware and taste:

### If your GPU has 8-12 GB VRAM

| Model | Style | Where to get it | Notes |
|-------|-------|----------------|-------|
| **Pony V6 XL** | Anime / stylized | [CivitAI 169278](https://civitai.com/models/169278) or [HuggingFace](https://huggingface.co/AstraliteHeart/pony-v6-xl) | Completely uncensored, uses Danbooru tags, 8 GB friendly |
| **FLUX.2 Klein 4B** | Photorealistic | HF: `black-forest-labs/FLUX.2-Klein-dev` | Sub-second, but lower quality. Good for testing. |

### If your GPU has 16+ GB VRAM

| Model | Style | Where to get it | Notes |
|-------|-------|----------------|-------|
| **FLUX.1 Dev** | Photorealistic (best quality in this tier) | HF: `black-forest-labs/FLUX.1-dev` | The gold standard. Needs ~12 GB in FP8 or GGUF Q8. |
| **NoobAI-XL** | Anime / explicit | [CivitAI](https://civitai.com/models/31896) | Community consensus best SDXL anime model for NSFW |
| **Z-Image Turbo** | Photorealistic, sub-second | HF: `Tongyi-MAI/Z-Image-Turbo` | 8-step distilled; great for rapid iteration |

**My recommendation for most beginners:** Start with **Pony V6** for anime/stylized or **FLUX.1 Dev** for photorealistic. These have the most tutorials, community support, and documentation.

### How to download

1. Go to the linked page (CivitAI or HuggingFace)
2. Click **Download** (CivitAI may require login)
3. Place the `.safetensors` file in `ComfyUI/models/checkpoints/`
4. Restart ComfyUI if it was running

---

## Phase 3 — Write Your Persona Spec (Character DNA)

Before generating a single image of your persona, write down **who they are**. This document is your "Character Bible" — reference it every time you generate.

### Template (copy and fill in)

```xml
<character>
  <name>Alex (or any fictional name)</name>
  <trigger>alex_persona</trigger>
  <age>25</age>
  <ethnicity>South Asian</ethnicity>
  <face>
    Dark brown eyes, straight black hair, round face,
    small nose, no facial hair
  </face>
  <hair>Black, shoulder-length, usually tied back</hair>
  <body>5'6", slim, light brown skin</body>
  <signature>small scar on left chin; always wears silver hoop earring</signature>
  <persona>Tech-savvy bookworm; calm and witty; wears oversized sweaters</persona>
</character>
```

**Key rules:**
1. **Trigger word** — a unique word/phrase you put in every prompt. Keeps the persona consistent (e.g., `alex_persona`).
2. **Signature features** — one or two distinctive physical traits (scar, birthmark, hairstyle, accessory). This *greatly* helps AI consistency.
3. **Novelty** — your persona's face should be unique. Don't base it on a specific real celebrity.
4. **Never edit this file after Phase 5** — once you've verified no real person matches, the spec is locked.

Save this as `my_persona/character_bible.md` in a folder you'll use throughout this process.

---

## Phase 4 — Generate Your First Images

### 4.1 Basic prompting

**For Pony V6 (anime/Danbooru style):**
```
alex_persona, score_9, 1girl, solo, standing, simple background, 
brown hair, brown eyes, silver hoop earring, masterpiece, best quality
```

**For FLUX.1 Dev / Z-Image (photorealistic, natural language):**
```
A photorealistic portrait of Alex, a 25-year-old South Asian woman 
with dark brown eyes, shoulder-length black hair, and a small scar 
on her left chin. She's wearing an oversized cream sweater, standing 
in a cozy book-filled room with warm afternoon light. Canon DSLR, 
85mm lens, shallow depth of field.
```

### 4.2 Key settings

| Setting | Recommended | Notes |
|---------|-------------|-------|
| **Steps** | 20-30 (FLUX), 25-35 (Pony/SDXL) | More = more detail, but slower |
| **CFG Scale** | 7-8 | Higher = more literal prompt following |
| **Sampler** | euler_ancestral or dpmpp_2m_sde_gpu | Both are solid defaults |
| **Resolution** | 1024×1024 (SDXL/Pony), 1024×1024 (FLUX) | Start here; upscale later |
| **Batch size** | 1-2 | Generates 1-2 images per run |

### 4.3 First session goals

Generate **20-30 images** using different prompts:
- Different outfits, poses, lighting, backgrounds
- Different expressions (smiling, neutral, thoughtful)
- Different angles (frontal, 3/4, profile)

**Save everything** to `my_persona/raw_generations/` with a sequential filename.

### 4.4 Fixing common problems

| Problem | Fix |
|---------|-----|
| **Face looks different every time** | Normal at first! We fix this in Phase 5 with identity adapters |
| **Extra fingers / deformed hands** | Add `perfect hands, five fingers` to prompt; use a hand-fix LoRA |
| **Blurry / low detail** | Increase steps to 30+; use higher resolution; try a different sampler |
| **Prompt ignored** | Lower CFG to 6; or try "prompt emphasis" with `(keyword:1.3)` syntax |
| **Out of memory** | Reduce resolution to 768×768; restart with `--lowvram` flag |

---

## Phase 5 — Make the Face Consistent (Identity)

This is the **biggest quality leap** you can make. Without it, every image looks like a different person who happens to share similar features.

### 5.1 Identity adapters (no training required)

These are plug-and-play nodes that inject a reference face into every generation:

| Adapter | Best for | How it works |
|---------|----------|--------------|
| **PuLID** (recommended for FLUX) | Photorealistic faces | Upload ONE good reference photo → adapter steers face generation |
| **IP-Adapter FaceID-Plus-V2** (best for SDXL) | Both anime and photo | Upload reference → works at inference time |
| **InstantID** | Simple setup, good colour stability | Upload reference + optional pose image |

**Setup in ComfyUI:**
1. Install the adapter node via ComfyUI Manager
2. Download the adapter weights (check the model page for your UI)
3. In your workflow, add the adapter node and connect it between your model loader and sampler
4. Set adapter **strength to 0.40-0.50** (higher = more face match, but can distort anatomy)

### 5.2 Training a character LoRA (optional, advanced)

If you want **maximum** consistency (and are willing to do ~1 hour of setup), train a LoRA on 20-30 of your best Phase 4 images.

**Tool recommendation:**
- **ai-toolkit** (for FLUX models) — Python CLI, YAML config
- **Kohya ss GUI** (for SDXL/Pony models) — graphical interface

**Simplified steps (ai-toolkit for FLUX):**
```bash
# Install
git clone https://github.com/ostris/ai-toolkit.git
cd ai-toolkit
pip install -r requirements.txt

# Prepare images in:
# toolkit/training/<your_persona>/ (place 20-30 images + caption files)

# Edit config:
# toolkit/default_1536_kohya.yaml — set dataset path, model path

# Train:
accelerate launch toolkit/train_network.py --config config/toolkit/default_1536_kohya.yaml
```

Upload the resulting LoRA `.safetensors` to `ComfyUI/models/loras/` and load it in your workflow at **strength 0.7-0.85**.

**⚠ Important:** You need a separate LoRA for each base model. A FLUX LoRA won't work on Pony, and vice versa.

---

## Phase 6 — Safety & Verification

### 6.1 Likeness collision check

Before you post anything, verify your persona **doesn't look like a real person**. This is both an ethical obligation and a platform requirement.

**Free tools:**
1. **[PimEyes](https://pimeyes.com/)** — paid but most comprehensive (2.1B face database)
2. **[FaceCheck.ID](https://facecheck.id/)** — free tier available
3. **[AI Face Search](https://aifacesearch.com/)** — smaller database, free

**Protocol:** Upload 10-15 of your best generated images to all three tools. If any result shows **≥70% similarity** to a real person, you must go back to Phase 3 and redesign with different features.

### 6.2 Content safety

- Never generate images of **real, identifiable people** without their explicit written consent
- Keep a record of your verification checks (screenshot the PimEyes/FaceCheck results)
- If you're generating adult/explicit content, be aware of legal requirements in your jurisdiction (see [Persona Legal Landscape](wiki/concepts/persona-legal-landscape.md) for US/UK/EU rules)

---

## Phase 7 — Post Your Persona Online

### 7.1 Choose your platform

| Platform | Audience | NSFW | Notes |
|----------|----------|------|-------|
| **Instagram** | General, visual-first | ❌ | Best for SFW persona; Reels drive discovery |
| **TikTok** | General, short video | ❌ | Algorithm favors consistent posting schedule |
| **Fanvue** | Adult/premium | ✅ | Built-in PPV/DM tipping; dominant platform for AI personas |
| **OnlyFans** | Adult/premium | ✅ | Higher margin, more competition |
| **Reddit** (persona subreddits) | Niche communities | ✅ | r/AIInfluencers, genre-specific subs |
| **X/Twitter** | General / tech | Partial | Good for discovery; attach images to tweets |

**Beginner recommendation:** Start with **Instagram** (SFW) or **Fanvue** (if adult content). Both have the clearest path to an audience.

### 7.2 Set up Postiz (posting automation)

[Postiz](https://postiz.com/) is an open-source scheduler that posts to multiple platforms from one dashboard:

1. Sign up at postiz.com (free tier available, $29/mo for full features)
2. Connect your platform accounts (IG, TikTok, Fanvue, etc.)
3. Create a **content calendar** — plan 3-5 posts per week
4. Set AI-assisted auto-generation if desired

**Alternatively**, you can manually upload posts at first and add automation later.

### 7.3 Content cadence

The 2026 consensus (post the "AI slop" algorithmic crackdowns):

- **3-5 posts per week** per platform (not more — algorithms punish volume)
- **Vary angles, outfits, lighting** — don't post the same shot composition repeatedly
- **Tell a story** — each post should advance a mini-narrative (day at the beach, coffee shop study session, etc.)
- **Repurpose:** Turn one high-quality image into 2-3 platform-specific crops (IG square, IG story 9:16, TikTok 9:16)

### 7.4 Adding DMs and voice (advanced)

When your persona starts getting messages:

1. **SillyTavern** — connect a local LLM (Qwen 3, Mistral 3, or Llama 4 — free, NSFW-friendly) to handle DM conversations as your persona's "chat brain"
2. **Fish-Speech S2 Pro** — clone a voice for voice notes (10-30 seconds of reference audio, zero-shot TTS). Free and open-source.
3. **n8n** — self-hosted automation to connect incoming DMs → SillyTavern → Fish-Speech → reply, all automated

This is **not required to start**. Focus on Phase 1-6 first; add these as your audience grows.

---

## Complete Tool Stack Summary

| What | Tool | Cost | Runs On |
|------|------|------|---------|
| Image generation | ComfyUI | Free (open source) | Windows/Linux/Mac |
| Image generation (Mac) | Draw Things | Free (basic) / $15/mo (pro) | macOS |
| Starter model (anime) | Pony V6 | Free download | 8+ GB GPU |
| Starter model (photo) | FLUX.1 Dev | Free download | 16+ GB GPU |
| Face consistency | PuLID or IP-Adapter FaceID | Free (open source nodes) | ComfyUI |
| LoRA training (FLUX) | ai-toolkit | Free (open source) | Python + GPU |
| LoRA training (SDXL) | Kohya ss GUI | Free (open source) | Python + GPU |
| Posting automation | Postiz | Free / $29/mo | Browser |
| Local chat brain | SillyTavern + Qwen 3 | Free | 8+ GB RAM |
| Voice notes | Fish-Speech S2 Pro | Free (open source) | CPU/GPU |
| DM automation | n8n | Free (self-hosted) | Node.js |

---

## Common Beginner Mistakes

1. **Trying to train a LoRA on 5 images** → You need at least 15-20 for a face, 30+ for full-body
2. **Using identity adapter at strength 1.0** → This *breaks* anatomy. Keep it at 0.3-0.5
3. **Generating on an unrelated base model** → Don't generate "anime girl" on a photorealistic base or vice versa
4. **Posting AI slop** → 50 blurry same-face images gets you flagged. Post 3-5 polished ones per week
5. **Skipping the likeness check** → If your "persona" matches a real celebrity, platforms will ban you
6. **Ignoring platform ToS** → Read the rules for each platform before posting, especially around AI-generated and adult content

---

## Video Generation (OpenRouter option)

If you want to generate videos of your persona (NOT just images), use **OpenRouter** — no GPU needed:

| What | How | Cost |
|------|------|------|
| **Text-to-Video** | Kling 3.0 Standard via OpenRouter API | ~$0.15 per 10s clip |
| **Image-to-Video (I2V)** | Upload your Flux master image → Kling 3.0 Pro | ~$0.30 per 15s clip |
| **Long-form (20-30s)** | Seedance 2.0 via OpenRouter | ~$0.50 per clip |
| **Audio-native** | Seedance 2.0 or Veo 3.1 — includes synchronized sound | ~$0.40-$0.50 per clip |

**Why OpenRouter for video:**
- No 16-24 GB GPU needed — runs from any laptop
- Access to closed models (Kling 3.0 Pro has industry-leading I2V consistency)
- Asynchronous API — submit job, get video in 2-5 minutes

**Quick start:** See [OpenRouter Video Models](wiki/entities/models/openrouter-video.md) for API examples + pricing.

**Local backup:** Keep Wan 2.2 + NSFW LoRA for content that APIs reject.

## What to Do Next

1. **Check your VRAM** (`nvidia-smi` or System Profiler)
2. **Install ComfyUI** (or Draw Things if you're on Mac)
3. **Pick a starter model** from the table in Phase 2
4. **Write your Character DNA** using the template in Phase 3
5. **Generate 20-30 test images** and play with prompts
6. **Add PuLID** for face consistency once you have a reference image you like
7. **Run the likeness collision check** before you post anything publicly
8. **Create your platform accounts** and start posting
9. **Try OpenRouter video** — Kling 3.0 Standard, ~$0.15/test clip

Welcome to the world of local AI image generation. Start simple, iterate often, and have fun with it.

---

## Sources

- [Model Selection & Workflow Builder](wiki/concepts/model-selection-workflow.md) — hardware-to-model mapping
- [Persona Consistency Methods](wiki/concepts/persona-consistency-methods.md) — the four axes of consistency
- [Reference + LoRA Stacking](wiki/concepts/reference-plus-lora-stacking.md) — detailed stacking recipes
- [Character DNA Templates](wiki/concepts/character-dna-templates.md) — structured prompting schema
- [Likeness Collision Verification](wiki/concepts/likeness-collision-verification.md) — safety verification protocol
- [Hardware Guide](wiki/entities/hardware/gpu-guide.md) — GPU VRAM tiers and optimization
- [Persona End-to-End Runbook](briefs/2026-05-07_persona-end-to-end-runbook.md) — full 10-phase operator playbook

Companion briefs:
- `persona-consistency.md` — image-stack consistency deep dive
- `video-gen-models.md` — video model comparison
- `ai-account-ops-stack.md` — 7-axis ops architecture
- `case-studies-monetization.md` — monetization case studies
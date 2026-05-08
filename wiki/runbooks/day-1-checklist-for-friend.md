---
title: Day 1 Checklist — Start Your AI Persona Operation
type: brief
target: Friend starting AI persona OF operation (Image + Video + Marketing)
created: 2026-05-08
updated: 2026-05-08
related:
  - concepts/model-selection-workflow.md
  - entities/models/openrouter-video.md
maturity: draft
---

## Target

Your friend, starting tomorrow: set up a full AI persona operation generating images + videos, using this wiki + SEO:GEO marketing wiki.

---

## Summary

Actionable Day 1 checklist combining:
- **Image gen** from `wiki/` + `briefs/beginner-guide-to-persona.md`
- **Video gen** from `wiki/entities/models/openrouter-video.md` (OpenRouter API)
- **Marketing** from `@seo-wiki/` cross-wiki links (SEO:GEO wiki)

---

## Day 1 Morning — Image Generation Setup (2-3 hours)

### Step 1: Check hardware (5 min)
```bash
# Windows:
nvidia-smi  # Look for GPU name + VRAM (need 8 GB min)
# macOS:
system_profiler SPDisplaysDataType  # Look for "VRAM (Dynamic)" (need 16 GB+ unified)
```

**If <8 GB VRAM:** Use cloud APIs (OpenRouter) for everything. Skip local install.

### Step 2: Install ComfyUI (30-60 min)
```bash
# Windows/Linux:
cd ~
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI && pip install -r requirements.txt

# macOS (alternative): Download Draw Things app from https://drawthings.ai/
```

### Step 3: Download first model (15-30 min)
| Hardware | Model | Where |
|-----------|-------|-------|
| 8-12 GB VRAM | Pony V6 XL | [CivitAI 169278](https://civitai.com/models/169278) |
| 16+ GB VRAM | FLUX.1 Dev | HF: `black-forest-labs/FLUX.1-dev` |
| Mac 16-24 GB | FLUX.2 Klein 4B | HF: `black-forest-labs/FLUX.2-Klein-dev` |
| Cloud only (no GPU) | Skip → use OpenRouter | See Afternoon section |

Place `.safetensors` in `ComfyUI/models/checkpoints/`.

### Step 4: First persona image (30-60 min)
1. Write your **Character Bible** (save as `my_persona/character.md`):
   ```
   Name: [chosen fictional name]
   Trigger word: [unique trigger, e.g. "alex_persona"]
   Age: 25, Ethnicity: South Asian
   Face: dark brown eyes, straight black hair, small scar on left chin
   Body: 5'6", slim, light brown skin
   Signature: silver hoop earring, oversized sweaters
   Personality: tech-savvy, calm, witty
   ```

2. Generate 20-30 test images:
   - **Pony V6:** `alex_persona, score_9, 1girl, solo, standing, masterpiece, best quality`
   - **FLUX:** `A photorealistic portrait of Alex, 25yo South Asian woman, dark brown eyes, small scar on left chin, wearing oversized cream sweater, cozy room, warm light`

3. **Likeness check** (before posting): Upload best images to:
   - [PimEyes](https://pimeyes.com/) (paid, best)
   - [FaceCheck.ID](https://facecheck.id/) (free)
   - If ≥70% match to real person → change Character Bible, regenerate

---

## Day 1 Afternoon — Video Generation (1-2 hours)

### Option A: OpenRouter (recommended, no GPU needed)

1. **Get OpenRouter API key:** Sign up at https://openrouter.ai/ → API Keys

2. **Test Kling 3.0 Standard** (cheapest, best I2V consistency):
   ```bash
   # Test text-to-video:
   curl -X POST "https://openrouter.ai/api/v1/videos/generate" \
     -H "Authorization: Bearer $OPENROUTER_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "model": "kuaishou/kling-v3-standard",
       "prompt": "Alex walking through a cozy bookstore, soft afternoon light, shallow depth of field",
       "duration": 10,
       "aspect_ratio": "9:16"
     }'

   # Check job status:
   curl "https://openrouter.ai/api/v1/videos/jobs/{job_id}" \
     -H "Authorization: Bearer $OPENROUTER_API_KEY"
   ```

3. **I2V from your best image** (preserves persona face):
   ```bash
   # Upload master image somewhere public (e.g., imgur), then:
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

**Cost:** ~$0.15 per 10s clip (Standard), ~$0.30 (Pro)

### Option B: Local Wan 2.2 (16+ GB GPU only)

See `wiki/entities/models/wan-2-2.md` + `wiki/concepts/video-identity-inheritance.md`.

**Quick path:** ComfyUI → Load Wan 2.2 5B FP8 → CLIP Vision encoder → I2V from master image.

---

## Day 1 Evening — Marketing Setup (1 hour)

### Step 1: Read SEO:GEO wiki pages (via cross-wiki links)

From **this wiki** (`wiki/concepts/marketing-your-persona.md`), the key pages from SEO:GEO wiki:

| Need | SEO:GEO Wiki Page | Why |
|------|-------------------|-----|
| Content calendar | `@seo-wiki/concepts/content-strategy-local.md` | 3-5 posts/week rhythm |
| Social platforms | `@seo-wiki/entities/platforms/instagram.md`, `@seo-wiki/entities/platforms/tiktok.md` | Platform mechanics |
| AI citations (GEO) | `@seo-wiki/concepts/generative-engine-optimization.md` | Get cited by ChatGPT/Claude/Perplexity |
| First 90 days | `@seo-wiki/concepts/first-90-days-playbook.md` | Week-by-week priority order |

**To read these:** The SEO:GEO wiki lives at `~/Desktop/projects/SEO:GEO B&M Business/wiki/`. Open those paths in any markdown reader.

### Step 2: Choose platform + set up Postiz

| Platform | Best for | Notes |
|----------|----------|-------|
| **Fanvue** | Adult content, monetization | Built-in PPV/DM tipping, dominant for AI personas |
| **Instagram** | SFW persona, discovery | Reels drive discovery, 9:16 aspect ratio |
| **TikTok** | Short video, algorithm boost | 9:16 aspect ratio, 3-5 posts/week |

**Postiz setup:** https://postiz.com/ → Connect accounts → Plan 3-5 posts/week

### Step 3: Content cadence

From `wiki/concepts/persona-content-cadence.md`:
- **3-5 posts/week** (not more — algorithms punish volume)
- **Vary angles, outfits, lighting** — don't repeat same composition
- **Tell a story** — each post advances a mini-narrative
- **Repurpose:** 1 image → IG square + IG Story 9:16 + TikTok 9:16

---

## Day 1 Checklist (print this)

### Morning (Image Gen)
- [ ] Check GPU VRAM (`nvidia-smi` / `system_profiler`)
- [ ] Install ComfyUI (or Draw Things on Mac)
- [ ] Download model (Pony V6 for 8GB, FLUX.1 Dev for 16GB+)
- [ ] Write Character Bible (trigger word, face desc, signature features)
- [ ] Generate 20-30 test images
- [ ] Run likeness collision check (PimEyes/FaceCheck — <70% match)
- [ ] Add PuLID adapter for face consistency (strength 0.4-0.5)

### Afternoon (Video Gen)
- [ ] Get OpenRouter API key (https://openrouter.ai/)
- [ ] Test Kling 3.0 Standard text-to-video ($0.15/10s)
- [ ] Generate I2V clip from best master image (preserves face)
- [ ] (Optional) Try Seedance 2.0 for longer clips (20-30s, native audio)

### Evening (Marketing)
- [ ] Read `@seo-wiki/concepts/first-90-days-playbook.md`
- [ ] Read `@seo-wiki/concepts/generative-engine-optimization.md`
- [ ] Choose platform (Fanvue for adult, IG for SFW)
- [ ] Set up Postiz.com (connect accounts, plan 3-5 posts/week)
- [ ] Draft first 3 post captions (vary angles, tell a story)

---

## Sources

- [Beginner's Guide](briefs/beginner-guide-to-persona.md) — full 7-phase walkthrough
- [OpenRouter Video Models](wiki/entities/models/openrouter-video.md) — API examples + pricing
- [Marketing Your Persona](wiki/concepts/marketing-your-persona.md) — bridge to SEO:GEO wiki
- [Video Identity Inheritance](wiki/concepts/video-identity-inheritance.md) — I2V workflow
- [Persona Content Cadence](wiki/concepts/persona-content-cadence.md) — 3-5 posts/week strategy
- SEO:GEO Wiki (cross-linked): `@seo-wiki/concepts/first-90-days-playbook.md`, `@seo-wiki/concepts/generative-engine-optimization.md`, `@seo-wiki/entities/platforms/instagram.md`, `@seo-wiki/entities/platforms/tiktok.md`

---

## Notes for Tomorrow

1. **Start simple** — don't try every model/video option Day 1. Pick ONE image model + ONE video option.
2. **Likeness check is non-negotiable** — skip this and platforms will ban you.
3. **3-5 posts/week** — more = algorithm penalty. Quality over volume.
4. **OpenRouter for video** — much easier than local Wan 2.2 setup. Save local GPU for image generation.
5. **Read the SEO wiki** — the marketing data there is gold for growing an audience.

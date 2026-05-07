# Deep Research Prompt — Persona Consistency for AI Personas

Run in deep research mode (Exa `deep_researcher_start` or equivalent). Supplement with Brave Search for community discussion, Context7 for tool docs, and Playwright for CivitAI/Hugging Face when tabular data is needed.

---

Comprehensive survey of **techniques for maintaining a consistent synthetic character across hundreds of image and video outputs** as of May 2026. Use case: adult AI personas operating on Fanvue / OnlyFans / NSFW Twitter / Patreon. Hardware-agnostic — cover the full range from 8 GB consumer GPUs to cloud rentals.

## 1. Synthetic face/character generation (creating a new persona from scratch)

- Seed engineering and prompt patterns for inventing a face that does not resemble a real person
- Workflows for bootstrapping a headshot dataset from a single seed image (face mixing, weighted prompts, controlled variation)
- Likeness-collision avoidance — how creators verify a synthetic face is novel
- Tools: ComfyUI workflows, third-party generators, manual processes

## 2. LoRA training for character lock-in

- Trainers: Kohya SS, OneTrainer, ai-toolkit — current versions, what each is best at
- Base model choice: SDXL / Pony V6 / Pony V7 / Illustrious / NoobAI / FLUX dev / FLUX schnell — tradeoffs for character fidelity vs prompt flexibility vs NSFW capability
- Dataset size and quality tradeoffs (10 vs 50 vs 200 images; resolution; captioning style; balanced angles vs face-only)
- Training time and VRAM at each tier (8 / 12 / 24 / 48 GB; cloud)
- LoRA rank / alpha decisions, optimizer choice (AdamW8bit, Prodigy, others)
- DreamBooth vs LoRA vs LoHA vs LoCon vs DoRA — community consensus in 2026

## 3. Reference-based methods (no training required)

- IP-Adapter family (base, plus, FaceID, FaceID-plus, FaceID-plusV2, FaceID-Portrait)
- PuLID, InstantID, ConsistentID, ConsistentChar
- FLUX-specific reference methods (Redux, Reference, FLUX-IPA, PuLID-Flux)
- Video-side reference: Wan 2.2 reference frames, HunyuanVideo character locks
- When reference methods beat a trained LoRA; how creators stack reference + LoRA together

## 4. Multi-angle dataset prep

- Generating turnarounds and body shots from a single seed face
- Outfit variation strategies; consistent lighting and skin tone
- Tools: ComfyUI multi-angle workflows, third-party tools, manual prompting recipes
- Captioning conventions (Danbooru tags vs natural language vs hybrid)

## 5. Carrying consistency into video

- Wan 2.2 reference frame workflow for character lock-in
- HunyuanVideo character LoRA training and reference workflows
- Image-to-video as inheritance of consistency from a still (Wan I2V, Hunyuan I2V, LTX I2V)
- Character LoRA in video models — what's available and what works
- Known limits: face drift over clip length, motion-induced artifacts, expression collapse

## 6. Failure modes (what breaks character consistency)

- Face drift across long generation sessions
- Body inconsistency and outfit drift
- Lighting and skin-tone shifts
- NSFW anatomy degradation under reference methods (known IP-Adapter weakness in explicit content)
- Mitigation patterns the community uses

---

## Output format

- Single markdown file written to `briefs/persona-consistency.md`
- Target length: ~3,500 words
- Structure: 6 numbered sections matching the TOC above
- Every named tool, model, technique, person, or repo cites a source — URL preferred. Primary sources (model cards, GitHub READMEs, official docs) preferred over secondary.
- GitHub repos: include star count and last-commit date when given
- Models: include VRAM tiers, license, censorship status
- Where techniques overlap with video models, cross-reference `briefs/video-gen-models.md` (Brief C) inline
- Style match: depth and citation density of `notes/models-catalog.md`

## Tools to use

1. **Exa** (`deep_researcher_start` + crawling) — primary for deep technical surveys
2. **Brave Search** — community discussion, recent news, Reddit findings
3. **Context7** — tool documentation (Kohya, ai-toolkit, ComfyUI custom nodes)
4. **Playwright** — CivitAI / Hugging Face / GitHub when star counts, download counts, or tabular data are needed

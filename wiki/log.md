# Wiki Log

Append-only chronological operations log. Each entry: date + operation + summary + pages touched.

---

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

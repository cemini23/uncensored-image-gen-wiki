---
title: CivitAI (Model Marketplace)
type: entity
tags: [marketplace, model-hosting, community, civitai, nsfw, lora, checkpoint, ratings, takedown]
keywords: [CivitAI, model marketplace, LoRA hosting, NSFW models, Takedown, SDXL, FLUX, Pony, checkpoint, community]
related:
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/sd3-deprecated.md
  - entities/models/sdxl-fine-tunes.md
  - entities/models/flux.md
  - entities/adapters/pulid.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - concepts/de-censoring-techniques.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/lora-taxonomy.md
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
maturity: validated
created: 2026-05-08
updated: 2026-05-08
---

## Relations

@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@entities/models/pony-v6.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/sd3-deprecated.md
@entities/models/sdxl-fine-tunes.md
@entities/models/flux.md
@entities/adapters/pulid.md
@entities/adapters/flux2-klein-9b-faceswap.md
@concepts/de-censoring-techniques.md
@concepts/censorship-tier-taxonomy.md
@concepts/lora-taxonomy.md

## Raw Concept

CivitAI — the dominant community model marketplace for Stable Diffusion, FLUX, Pony, and other diffusion models. Hosts a mix of SFW and NSFW models, LoRAs, embeddings, and textual inversions. Repository/API at [civitai.com](https://civitai.com). Back-filled from survey data in @sources/uncensored-image-generation-survey.md and @sources/synthetic-character-consistency-survey.md.

## Narrative

### What it is

**CivitAI** is a model-sharing platform that has become the default distribution channel for community-trained LoRAs, model merges, and checkpoints in the Stable Diffusion and FLUX ecosystems. It serves both SFW and NSFW content. As of May 2026, it hosts tens of thousands of models across categories including:

- **Full model checkpoints** (SDXL fine-tunes like Pony V6, Illustrious XL, NoobAI-XL, CyberRealistic)
- **LoRAs** (character, style, concept, de-censoring, face-swap)
- **VAEs, embeddings, hypernetworks**
- **FLUX models and adapters** (Klein distills, PuLID ports, community uncensored merges)
- **Textual inversions and TI embeddings**

### Why it matters for uncensored workflows

CivitAI is where the community ships uncensored-adjacent work:

1. **De-censoring LoRAs** — explicit-anatomy-trained LoRAs that restore NSFW capability to censored or minimal-tier bases. These are the primary mechanism for the LoRA injection de-censoring path described in @concepts/de-censoring-techniques.md.

2. **Face-swap LoRAs** — character-specific identity LoRAs (e.g., BFS LoRA series at `Alissonerdx/BFS-Best-Face-Swap`) that enable the Klein 9B face-swap pipeline described in @entities/adapters/flux2-klein-9b-faceswap.md.

3. **Model merges** — community-created blends like FLUX-UNCENSORED-Merged, Chroma1-HD, SNOFS that combine FLUX.1 Dev's architecture with de-censored weight surgery.

4. **Score-tag tuned models** — SDXL models trained with the Pony score_9 system, enabling exact NSFW compositional control via tag prefixes.

### Takedown enforcement — a critical risk factor

⚠️ **[CONFIRMED]:** CivitAI actively enforces content removal policies that affect uncensored workflows. Key incidents:

- **SD3 / SD3.5 takedown loop** — Stability AI's openrail++ license enforcement led to repeated model removals. See @entities/models/sd3-deprecated.md for the full case study. The canonical example of "takedown enforcement loop" in the 2026 landscape.

- **Moderation churn vs. takedown** — as of May 2026, the framing has shifted. Most model pages on CivitAI for popular uncensored models (Pony V6, Illustrious XL, all SDXL fine-tunes) remain available. The SDXL fine-tune family was reframed from "takedown risk" to "moderation churn" — base-model pages are stable, but specific LoRAs or merges may be flagged and removed without notice.

- **NSFW content policies** — CivitAI has both SFW and NSFW sections. NSFW content requires account verification. Some models are flagged and delisted based on user reports or automated detection; this disproportionately affects newer FLUX-based uncensored merges that haven't built up community defense.

### Navigation and download patterns

**Finding models:**
- CivitAI search is keyword-based with category filters (Checkpoint, LoRA, Textual Inversion, etc.)
- Sort by "Highest Rated" or "Most Downloaded" within your target category
- Check the model description for trigger words, base model compatibility, and recommended sampler settings

**Downloading:**
- Direct download from the model page (requires free CivitAI account)
- Via API: `https://civitai.com/api/v1/models/{id}` returns metadata; download URL is in the `modelVersions[].downloadUrl` field
- Via ComfyUI Manager: built-in CivitAI browser for one-click install into the correct `models/` subdirectory

**Key model IDs (as of May 2026):**
- Pony V6: `civitai.com/models/87854`
- Illustrious XL: listed on CivitAI (check for latest version)
- NoobAI-XL: available on CivitAI
- FLUX.2 Klein 9B: available with community LoRAs
- BFS Face-Swap LoRA: `civitai.com/models/2377248` (Alissonerdx)
- SNOFS (uncensored FLUX LoRA): `civitai.com/models/1972981`

### Licensing on CivitAI

⚠️ **Complexity warning:** CivitAI does not enforce or standardize licensing. Each model may have a different license:

- **CreativeML OpenRAIL-M** (SDXL inheritance) — permits commercial use but prohibits illegal acts
- **CivitAI Community License** — varies per uploader; check the model page
- **Apache 2.0** — rare on CivitAI for full models, but some FLUX derivatives use it
- **No license listed** — default assumption: no commercial use without explicit permission

Always check the license field on the specific model version page. See @concepts/censorship-tier-taxonomy.md for how licensing interacts with de-censoring.

### Alternatives and complements

| Platform | Strengths | Weaknesses |
|----------|-----------|------------|
| **Hugging Face** | Better for base model hosting; standard safetensors; Git-based versioning; stronger license enforcement | Less community curation for LoRAs; NSFW content is restricted |
| **TensorArt** | Asian model ecosystem; some FLUX models available earlier | Smaller community; less mature UI |
| **Direct HF repos** | Developer-friendly; version-controlled; CI/CD integration | Requires git knowledge; no community ratings |

### Workspace TODO

- Track the CivitAI takedown pattern more systematically — log specific removals and reinstatements over time
- Add per-model CivitAI download links to each model entity page
- Monitor whether CivitAI implements EU AI Act Article 50 labeling requirements (effective Aug 2026) and impact on NSFW content
- Evaluate if the platform's ToS changes affect commercial NSFW persona workflows

## Snippets

### API download pattern

```bash
# Example: download a specific model version via API
curl -O -J "https://civitai.com/api/v1/models/{modelId}?token=YOUR_TOKEN"

# Or use the HuggingFace hub CLI for models mirrored to HF:
huggingface-cli download lodestones/Chroma1-HD --local-dir ./models/checkpoints/Chroma1-HD
```

### ComfyUI Manager one-click install

In ComfyUI → Manager → Install → search for model name → Install → restarts ComfyUI with model in correct subdirectory.
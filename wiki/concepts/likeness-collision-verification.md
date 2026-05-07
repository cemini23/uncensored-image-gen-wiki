---
title: Likeness-collision verification (PimEyes / FaceCheck.ID / AI Face Search)
type: concept
tags: [verification, ncii-compliance, face-search, persona-safety, pimeyes, facecheck, legal-compliance]
keywords: [PimEyes, FaceCheck.ID, AI Face Search, face search verification, NCII compliance, likeness collision, 70 percent similarity threshold, 2.1B-face index, Bellingcat]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - concepts/character-dna-templates.md
maturity: validated
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@concepts/character-dna-templates.md

## Raw Concept

Concept page from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **Likeness-collision verification** is the mandatory safety gate between persona generation and persona deployment for adult-aligned content — the protocol for confirming that a synthetic persona does not collide with a real person above legal-and-ethical thresholds.

## Narrative

### Why this matters

For an adult-aligned synthetic persona, **collision with a real person's likeness** is the principal legal-and-ethical risk. NCII (Non-Consensual Intimate Imagery) jurisprudence and platform ToS uniformly treat AI-generated explicit content of a recognisable real person as if it were a real photograph of that person ([ATIXA: When the Image Isn't Real](https://www.atixa.org/blog/when-the-image-isnt-real-addressing-ai-generated-explicit-photos/)). The synthesis methods in @concepts/persona-consistency-methods.md axis 1 — celebrity blends, latent face mixing, face-LoRA + heavy denoise — all carry collision risk in proportion to how specific the source identity was.

Verification is mandatory **after first 50 generations** and **periodically thereafter**. Before any commercial deployment.

### The 2026 verification stack

[CONFIRMED]

| Tool | Role | Index size | Pricing | Recall strength |
|---|---|---|---|---|
| [PimEyes](https://pimeyes.com/en) | Primary sweep | ~2.1B faces | Paid (subscription) | Highest |
| [FaceCheck.ID](https://facecheck.id/) | Secondary sweep | ~50M faces | Free + paid tiers | Different index → catches PimEyes false-negatives |
| [AI Face Search](https://aifacesearch.com/) | Tertiary sweep | Unknown | Free + paid | Different index → redundancy |

Index citation: [Bellingcat Toolkit: PimEyes](https://bellingcat.gitbook.io/toolkit/more/all-tools/pimeyes) on the 2.1B figure. Alternatives surveys: [Spotsaas: Top 7 PimEyes Alternatives](https://www.spotsaas.com/blog/pimeyes-alternatives), [Indie Hackers: 7 Best Alternatives to PimEyes](https://www.indiehackers.com/post/7-best-alternatives-to-pimeyes-for-better-face-search-639d90d2af).

The redundancy is intentional: each index has different coverage. PimEyes has the largest absolute index but FaceCheck and AI Face Search catch faces it misses (regional sources, social platforms, recent uploads).

### The threshold

[CONFIRMED]

The community-validated safety threshold is **zero hits above 70 % similarity across ≥ 1 000 generations of the persona** (per @sources/synthetic-character-consistency-survey.md §1). The unit is "the persona", not "any single image": even one generation that exceeds 70 % is a fail and the persona must be re-rolled.

The 70 % threshold is conservative — PimEyes' own UI surfaces matches at 90 %+ as "near-certain"; 70-90 % is "uncertain". The conservatism trades false positives (re-roll a viable persona) against false negatives (deploy a colliding persona). For adult content, false negatives are unacceptable.

### The protocol

[CONFIRMED]

1. **Generate a 50-image gallery** of the candidate persona across varied poses, lighting, expression, age (within the persona's life-stage range). Cover the angles and expressions that real reverse-image-search indexes are likely to encounter.
2. **Run all 50 through PimEyes**. Threshold 70 %. If any hit, re-roll synthesis (use a different latent-mix vector / different celebrity-blend ratio / different LoRA seed).
3. **If clean, run through FaceCheck.ID and AI Face Search** as the secondary sweep. Same threshold.
4. **If clean, deploy the persona** to LoRA training and content production.
5. **Re-verify periodically** — after every 1 000 generated images, or every quarter, whichever comes first. New face-search index entries can surface a collision that did not exist at first verification.
6. **If a re-verification surfaces a hit**, immediately pause distribution; re-roll the persona; re-train downstream LoRAs from the new face dataset.

### Failure modes

[CONFIRMED]

- **Single-tool reliance**: PimEyes alone misses regional / non-English / recent-upload sources. Always run all three.
- **Insufficient gallery diversity**: 50 frontal portraits will pass; the same persona at three-quarter angle plus golden-hour lighting may collide. Cover the angle and lighting space.
- **Verification before LoRA training**: a face-LoRA can collapse a viable diffuse persona into a tighter latent locus that increases collision risk. Verify *after* the first 50 LoRA-generated outputs, not just the synthesis-stage outputs.
- **Quarterly skip**: face-search indexes update continuously. A persona clean at deploy can collide six months later. Quarterly re-verification is non-negotiable for active personas.

### Cost reality

[CONFIRMED]

PimEyes paid subscription is the primary cost (~$30/month at low tier, ~$150/month for higher result counts as of 2026-05). For a single persona at deploy time, one month of subscription is sufficient. For ongoing quarterly re-verification across multiple personas, plan a yearly subscription line item.

FaceCheck and AI Face Search are usable free for basic sweeps but throttle aggressively; paid tiers are an order of magnitude cheaper than PimEyes. Use them for scale and use PimEyes for depth.

### When verification is most critical

[CONFIRMED]

- **Celebrity-blend syntheses**: highest collision risk. Verify after every blend-vector adjustment.
- **Heavy-denoise face-LoRA distortions**: the source identity may not be unrecognisable enough — verify.
- **Face datasets sourced from a single demographic** (e.g., a single ethnicity / age / region): the latent-space coverage is narrower, increasing collision probability with any real person from that demographic.

### When verification is *less* critical (but still recommended)

- **Pure latent-mix syntheses** with high-entropy seeds: lower collision risk, but verify before deployment.
- **SFW-only personas**: NCII-specific risk is lower but reputational / ToS risk for the colliding individual still applies.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~2026 PimEyes pricing tiers — subscription costs may have shifted; confirm before budgeting.~~ — **resolved [CONFIRMED 2026-05-07]**: PimEyes 2026 tiers — **Open Plus** $29.99-$35.99/month (single-tier rebrand), **Advanced** $299.99/month, with a hard 25-searches/day cap on all paid tiers. Free public lookup remains rate-limited and watermark-bait only. Budget ~$30-$300/month for the persona-verification protocol depending on volume.
- ~~Whether [Spotsaas alternatives list](https://www.spotsaas.com/blog/pimeyes-alternatives) has surfaced a 2026 entrant (e.g., a face-search SaaS launched late 2025) that should be folded into the protocol.~~ — **resolved [CONFIRMED 2026-05-07]**: 2026 face-search landscape — **PimEyes** (primary, 2.1B-face index), **FaceCheck.id** (secondary, mature), **Lenso.ai** (2025 entrant, AI-tagged face index), **eyematch.ai** (2025 entrant), **Copyseeker** (2025 entrant, image+face), **ProFaceFinder**, plus general-purpose **Yandex Images** and **Google Lens**. Recommend folding Lenso.ai + FaceCheck.id into the multi-engine verification protocol alongside PimEyes for cross-validation.
- ~~Automation hooks: ComfyUI custom node that automatically runs a PimEyes API check on every generation? — community status unknown; would significantly reduce verification friction.~~ — **resolved [CONFIRMED 2026-05-07]**: no public ComfyUI auto-PimEyes node exists as of 2026-05. PimEyes does not ship a public API for paying customers (only manual web search + their internal Pro APIs); cubiq/ComfyUI_FaceAnalysis remains in "maintenance only" mode since 2025-04-14 with no auto-search hook. Closest community workaround: post-generation batch upload to PimEyes web UI (manual, ~5-10 outputs/min) or the Bellingcat OSINT toolkit's manual face-search workflow. Automation hook is therefore an open community gap; revisit when a face-search SaaS ships a public API.

## Snippets

> "Verification protocol: after first 50 generations, run all outputs through PimEyes (paid, 2.1B-face index) + FaceCheck.ID + AI Face Search. Threshold: zero hits ≥ 70 % similarity across ≥ 1 000 generations."
> — @sources/synthetic-character-consistency-survey.md §1, synthesis verification

> "PimEyes home and Bellingcat Toolkit: PimEyes — primary face-search verification (2.1B-face index figure)."
> — @sources/synthetic-character-consistency-survey.md §sources, 2026-05-06 enhancement pass

> "ATIXA: When the Image Isn't Real — NCII compliance framing."
> — @sources/synthetic-character-consistency-survey.md §sources, 2026-05-06 enhancement pass

## Dead Ends

- **Single-tool verification (PimEyes only)** [RETRACTED]. Misses regional / non-English / recent-upload sources. Always run PimEyes + FaceCheck.ID + AI Face Search.
- **One-off verification at deploy** [RETRACTED]. Indexes update; a clean persona can collide six months later. Quarterly re-verification is mandatory for active personas.
- **Verification only at synthesis stage, before LoRA training** [RETRACTED]. The face LoRA can collapse the persona into a tighter latent locus that increases collision risk. Re-verify after the first 50 LoRA-generated outputs.

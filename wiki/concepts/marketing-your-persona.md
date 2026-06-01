---
title: Marketing Your Persona — Bridge to SEO/GEO Wiki
type: concept
tags: [marketing, persona, seo, geo, social-media, content-strategy, bridge, cross-wiki]
keywords: [persona marketing, AI influencer marketing, NSFW marketing, social media strategy, content calendar, SEO for AI personas]
related:
  - concepts/persona-ops-stack.md
  - concepts/geo-vs-seo.md
  - concepts/persona-monetization-models.md
  - concepts/persona-content-cadence.md
  - concepts/persona-failure-modes.md
  - sources/virtual-persona-narrative-development-strategy.md
  - entities/persona-ops/postiz.md
  - entities/persona-ops/sillytavern.md
  - entities/personas/aitana-lopez.md
  - sources/persona-ops-stack-2026.md
  - sources/persona-monetization-2026.md
  - entities/models/openrouter-video.md
  - entities/persona-ops/awesome-design-md.md
maturity: validated
created: 2026-05-08
updated: 2026-05-15
---

## Relations

@concepts/persona-ops-stack.md
@concepts/persona-monetization-models.md
@concepts/persona-content-cadence.md
@concepts/persona-failure-modes.md
@entities/persona-ops/postiz.md
@entities/persona-ops/sillytavern.md
@entities/personas/aitana-lopez.md
@sources/persona-ops-stack-2026.md
@sources/persona-monetization-2026.md
@seo-wiki/concepts/first-90-days-playbook.md
@seo-wiki/concepts/generative-engine-optimization.md
@seo-wiki/concepts/content-strategy-local.md
@seo-wiki/entities/platforms/instagram.md
@seo-wiki/entities/platforms/tiktok.md
@entities/models/openrouter-video.md
@sources/virtual-persona-narrative-development-strategy.md

## Raw Concept

This page bridges the image-generation wiki to **`@seo-wiki`** (SEO / GEO / B&M Business wiki), which contains canonical marketing knowledge applicable to persona monetization. The SEO/GEO wiki was built for brick-and-mortar businesses (barbershop running example), but its SEO, social-media, content-strategy, and Generative Engine Optimization (GEO) pages directly apply to promoting an AI persona and its image-generation output.

## Narrative

### Two wikis, one marketing strategy

The image-gen wiki covers *what to generate and how to build a persona*. The SEO/GEO wiki covers *how to get found, how to grow an audience, and how to market effectively*. Your friend needs both.

| Need | Image-gen wiki has | SEO/GEO wiki has |
|------|-------------------|-----------------|
| **Content calendar** | `@concepts/persona-content-cadence.md` — 3-5 posts/week rhythm | `@seo-wiki/concepts/content-strategy-local.md` — strategy, topic clusters |
| **Social media platforms** | General platform notes | `@seo-wiki/entities/platforms/instagram.md`, `@seo-wiki/entities/platforms/tiktok.md`, `@seo-wiki/entities/platforms/facebook.md` — detailed per-platform playbooks |
| **SEO / GEO** | Not covered | `@seo-wiki/concepts/generative-engine-optimization.md` — getting cited by AI engines (ChatGPT, Claude, Perplexity); `@seo-wiki/concepts/local-seo-foundations.md` — ranking fundamentals |
| **Review + reputation** | Not covered | `@seo-wiki/concepts/reviews-reputation-management.md` — acquisition, response, policy boundaries |
| **Website essentials** | Not covered | `@seo-wiki/concepts/website-essentials-local-business.md` — must-have pages, mobile UX, schema |
| **Competitor analysis** | Not covered | `@seo-wiki/concepts/competitor-analysis-local.md` — methodology for capturing competitors' strategies |
| **Schema markup** | Not covered | `@seo-wiki/concepts/schema-markup-local.md` — JSON-LD for getting rich results |

Use `@seo-wiki/` cross-links below (public repo: `cemini23/SEO-GEO-B-M-Wiki`).

### Quick-start: what your friend should read first

**From the image-gen wiki (this wiki):**

1. `@concepts/persona-monetization-models.md` — understand the revenue mechanics
2. `@concepts/persona-content-cadence.md` — the post-AI-slop content rhythm
3. `@entities/personas/aitana-lopez.md` — the canonical case study

**From the SEO/GEO wiki (@seo-wiki/):**

1. `@seo-wiki/concepts/first-90-days-playbook.md` — week-by-week sequencing (built for barbershops but the priority order applies: claim listings → build site → start content → grow reviews → expand)
2. `@seo-wiki/concepts/generative-engine-optimization.md` — critical for AI personas: you want ChatGPT, Claude, and Perplexity to cite your persona when users ask "best AI influencer in [niche]"
3. `@seo-wiki/concepts/content-strategy-local.md` — adapt the topic-cluster strategy to your persona's niche
4. `@seo-wiki/entities/platforms/instagram.md` — IG Reels/Feed/Stories platform mechanics
5. `@seo-wiki/entities/platforms/tiktok.md` — short-video discovery playbook

### Adapting barbershop marketing to persona marketing

The SEO/GEO wiki uses a barbershop as its running example. Here's how to translate:

| Barbershop concept | Persona equivalent |
|-------------------|-------------------|
| "Book an appointment" CTA | "Subscribe on Fanvue" or "DM me on Telegram" CTA |
| Before/after haircut photos | Before/after image generation quality comparisons |
| Customer reviews on GBP | Fanvue subscriber testimonials, Reddit mentions |
| "Best barbershop in [city]" | "Best AI fitness model" or "top synthetic influencer [niche]" |
| Google Business Profile listing | Fanvue profile + Linktree + personal website |
| Local pack rankings | GEO citability: being cited accurately by AI engines |
| NAP consistency (Name/Address/Phone) | Handle consistency across platforms (same @handle everywhere) |

### Marketing tools relevant to persona ops

The SEO/GEO wiki's tool pages that transfer directly:

- **`entities/tools/marketingskills.md`** — Claude Code skill: marketing frameworks (PAS, AIDA) you can use inside this workspace to generate persona marketing copy
- **`entities/tools/geo-seo-claude.md`** — citability scoring for AI engines — use to check if your persona's website/content gets cited correctly by ChatGPT/Claude/Perplexity
- **`entities/tools/postiz.md`** (image-gen wiki) — scheduling/posting tool; pairs with the SEO/GEO wiki's content-strategy and platform pages

### How to access the SEO/GEO wiki from here

The SEO/GEO wiki lives in a separate repo. Your friend should:

1. Open a second session on the `seo-wiki` repository (sibling checkout in your federation layout)
2. Ask: "Read `wiki/concepts/first-90-days-playbook.md` and adapt it for an AI persona in the [fitness/gaming/art/etc.] niche"
3. The SEO/GEO wiki has its own CLAUDE.md schema — Claude Code will follow it

Alternatively, you (the workspace owner) can ingest SEO/GEO wiki pages into this wiki as source pages when the friend needs specific marketing guidance. See `prompts/` for reusable prompt templates.

### Workspace TODO

- Ingest the most-relevant SEO/GEO wiki pages as source pages in this wiki for direct access
- Create a persona-specific content-calendar template adapted from the SEO/GEO wiki's barbershop calendar
- Build a "persona SEO checklist" brief synthesizing GEO + content-strategy + social-media from the sister wiki

## Snippets

### SEO/GEO wiki start-here path

```
1. @seo-wiki/concepts/first-90-days-playbook.md    — priority sequencing
2. @seo-wiki/concepts/local-seo-foundations.md       — conceptual frame
3. @seo-wiki/concepts/generative-engine-optimization.md — AI-engine citability
4. @seo-wiki/concepts/content-strategy-local.md     — topic clusters
5. @seo-wiki/entities/platforms/instagram.md        — IG mechanics
6. @seo-wiki/entities/platforms/tiktok.md           — TikTok mechanics
```

All paths use the `@seo-wiki/` alias prefix (see `CLAUDE.md` → Related Wikis in either wiki).
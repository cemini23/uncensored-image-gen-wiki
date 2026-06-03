---
title: Anti-personalization privacy (cross-image CAP)
type: concept
tags: [privacy, anti-personalization, adversarial, persona-ops, defensive]
keywords: [CAP, cross-image anti-personalization, adversarial noise, DreamBooth defense, published photos, de-identification]
related:
  - sources/arxiv-privacy-cross-image-anti-personalization-2504-12747.md
  - concepts/likeness-collision-verification.md
  - concepts/persona-consistency-methods.md
  - concepts/persona-failure-modes.md
  - concepts/t2i-model-ownership-verification.md
  - sources/arxiv-2605-29809-cert-las-t2i-mov.md
maturity: draft
created: 2026-06-01
updated: 2026-06-03
---

## Relations

@sources/arxiv-privacy-cross-image-anti-personalization-2504-12747.md @concepts/likeness-collision-verification.md @concepts/persona-consistency-methods.md @concepts/persona-failure-modes.md @concepts/t2i-model-ownership-verification.md @sources/arxiv-2605-29809-cert-las-t2i-mov.md

## Raw Concept

Ingest 2026-06-01 from arXiv:2504.12747. Defensive counterpart to persona LoRA training — perturbing public photos so multi-image personalization fails.

## Narrative

**Anti-personalization** adds imperceptible adversarial noise to images before publication so DreamBooth / LoRA trainers cannot learn a stable identity. Image-wise methods miss that personalization is **inherently multi-image**.

**CAP (Cross-image Anti-Personalization)** enforces **style consistency across perturbed images** in the attack, disrupting the cross-image identity signal. Dynamic loss balancing between reconstruction and consistency terms.

### Implications for persona operators

| Role | Effect |
|------|--------|
| **Persona builder** | Scraped reference faces may be CAP-protected → LoRA dataset quality drops |
| **Real-person operator** | Optional self-defense before posting non-persona photos |
| **Likeness hunter** | CAP ≠ invisible — failed LoRA may still look "off" not "blocked" |

Not a build-track tool — no local inference integration. Pairs with @concepts/likeness-collision-verification.md (offensive detection) as publisher-side defense catalog entry.

## Snippets

> "Defending against such threats requires a group-level perspective." [Source: arXiv:2504.12747 §1 via @sources/arxiv-privacy-cross-image-anti-personalization-2504-12747.md]

## Dead Ends

- **Using CAP on persona training sets intentionally** — defeats the purpose of persona consistency workflows.

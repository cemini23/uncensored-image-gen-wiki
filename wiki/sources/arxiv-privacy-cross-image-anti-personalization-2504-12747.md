---
title: "Privacy Protection Against Personalized T2I via Cross-image Consistency (CAP, arXiv:2504.12747)"
type: source
tags: [paper, privacy, anti-personalization, t2i, dreambooth, adversarial]
keywords: [CAP, cross-image anti-personalization, adversarial perturbation, DreamBooth, personalization defense, CelebA-HQ, VGGFace2]
related:
  - concepts/anti-personalization-privacy.md
  - concepts/likeness-collision-verification.md
  - concepts/persona-consistency-methods.md
  - concepts/persona-failure-modes.md
maturity: draft
read_status: read
created: 2026-06-01
updated: 2026-06-01
---

## Relations

@concepts/anti-personalization-privacy.md @concepts/likeness-collision-verification.md @concepts/persona-consistency-methods.md @concepts/persona-failure-modes.md

## Raw Concept

- **Title**: Privacy Protection Against Personalized Text-to-Image Synthesis via Cross-image Consistency Constraints
- **Authors**: Guanyu Wang et al. (Beihang, HUST, ECNU)
- **Type**: ACM ICMR '26 paper — arXiv:2504.12747
- **Location**: `raw-sources/arxiv-2504.12747-privacy-protection-against-personalized-text-to.pdf`
- **Retrieved**: 2026-06-01 (federated daily digest inbox)
- **Read status**: read (abstract + introduction)

## Narrative

Personalization (DreamBooth, Textual Inversion) lets adversaries clone a person's likeness from a few public photos. **Anti-personalization** adds adversarial perturbations to published images so downstream LoRA/DreamBooth training fails. Prior work treats each image independently; **CAP (Cross-image Anti-Personalization)** adds a **group-level consistency loss** so perturbed images share disrupted style coherence, breaking the multi-image identity signal personalization needs.

Key mechanism: reconstruction loss (existing) + **cross-image style consistency** among perturbed images + dynamic ratio balancing across attack iterations. Evaluated vs eight baselines on CelebA-HQ and VGGFace2.

### Workspace relevance

- **Defensive layer** for real-person reference photos before posting — inverse of the persona-ops build track (which *wants* consistent multi-image LoRA datasets). Operators publishing *their own* face on SFW channels may encounter CAP-style noise on scraped source material.
- Pairs with @concepts/likeness-collision-verification.md (detecting unauthorized likeness use) as the **publisher-side** counterpart.

## Snippets

> "We introduce Cross-image Anti-Personalization (CAP), a novel framework that enhances resistance to personalization by enforcing style consistency across perturbed images." [Source: arXiv:2504.12747 abstract]

## Dead Ends

None for research layer — not a generation tool.

---
title: Fanvue (Platform)
type: entity
tags: [platform, marketplace, AI-created, synthetic-media, creator-economy]
keywords: [Fanvue, AI creator, synthetic media, platform, marketplace, $500M, 85% revenue split, Manager Accounts]
related:
  - sources/ai-creator-operations-blueprint.md
  - runbooks/day-1-checklist-for-friend.md
  - sources/ai-persona-launch-strategy-analysis.md
  - runbooks/zimage-setup-runbook.md
  - concepts/persona-ops-workflow.md
  - concepts/geo-vs-seo.md
  - concepts/persona-legal-landscape.md
  - concepts/persona-ops-stack.md
  - "@seo-wiki/entities/platforms/fanvue.md"
  - "@seo-wiki/concepts/synthetic-creator-gtm.md"
  - "@seo-wiki/concepts/creator-marketing-foundations.md"
maturity: validated
created: 2026-05-08
updated: 2026-06-18
read_status: deep-read
provenance:
  stub: false
---

## Relations

@sources/ai-creator-operations-blueprint.md @sources/ai-persona-launch-strategy-analysis.md @concepts/persona-ops-stack.md
@seo-wiki/entities/platforms/fanvue.md
@seo-wiki/concepts/synthetic-creator-gtm.md
@seo-wiki/concepts/creator-marketing-foundations.md

## Raw Concept

Fanvue is the premier platform for 100% AI-generated creators in 2026. Both source documents (Operations Blueprint §2.1, Launch Strategy Analysis §2.3) recommend it as the primary monetization surface for synthetic persona agencies.

## Narrative

### Platform Position

Fanvue is the leading platform for 100% AI-generated synthetic personas:

- **$500M+** in creator payouts (as of 2026)
- **85% revenue split** to creators (≈15% platform fee — matches @0xKiyoro K57 playbook claim [TENTATIVE, single operator thread, 2026-05-22]; survey sources elsewhere cite **20%** commission on subs/tips/PPV → @concepts/persona-monetization-models.md — reconcile against current Fanvue pricing page before relying on either figure)
- Built-in AI analytics, automated voice notes, AI voice calls
- **Open API** → connect n8n/Make.com for webhook-driven DM automation
- **Manager Accounts** → single KYC verification, then create multiple secondary AI model accounts linked to that verified identity

### Manager Accounts (Key for Agencies)

An agency passes KYC verification once through a primary Fanvue account and subsequently creates multiple secondary AI model accounts linked to that single verified identity. This multi-tenant capability eliminates the operational bottleneck of sourcing unique human IDs for every new persona.

> "An agency can pass the intensive KYC verification process once through a primary Fanvue account and subsequently request the creation of multiple secondary AI model accounts linked to that single verified identity." — [Operations Blueprint §2.1](sources/ai-creator-operations-blueprint.md)

### Mandatory Disclosure

- Visual watermark, image caption, or bio statement indicating AI generation
- "Reasonable Person's Test" enforced by 3+ moderation team members per upload
- Bio must contain clear AI-generated disclosure (Phase IV requirement)

### TOS Compliance

- Synthetic media: **Highly favorable** stance
- KYC: Human operator ID required (government-issued + biometric liveness)
- Adult content: **Permitted** (strict 2257 compliance applies)
- Multi-account: **Yes** via Manager Accounts

### Recommended Platform Stack

| Platform | Role | Notes |
|---|---|---|
| **Fanvue** | Primary monetization | Premier for AI personas, Manager Accounts, Open API |
| **Fansly** | Secondary/A/B | AI-friendly alternative |
| **dFans.xyz** | Blockchain alternative | Web3-native, decentralized |
| **White-label** | Full brand ownership | $7K–$20K build, bypass third-party TOS |

### Revenue Context

- AI models contributed **15% of total Fanvue revenue** as early as Nov 2023
- Top AI models earning **$23K+/month**
- Base monthly subscriptions = secondary income; **60–70%** of revenue from DMs + PPV

## Sources

- [Operations Blueprint §2.1](sources/ai-creator-operations-blueprint.md) — Manager Accounts, platform viability matrix
- [Launch Strategy Analysis §2.3](sources/ai-persona-launch-strategy-analysis.md) — Fanvue revenue data, platform diversification
- [Persona Legal Landscape](concepts/persona-legal-landscape.md) — compliance requirements
- [Persona Monetization Models](concepts/persona-monetization-models.md) — revenue mechanics
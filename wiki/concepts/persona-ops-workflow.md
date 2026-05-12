---
title: Persona Operations Workflow
type: concept
tags: [persona-ops, workflow, operations, automation, KYC, compliance, launch-sequence]
keywords: [persona operations, workflow, daily ops, automation, OpenRouter, n8n, CRM, compliance, platform onboarding]
related:
  - sources/ai-creator-operations-blueprint.md
  - entities/models/open-sora.md
  - entities/uis/comfyui.md
  - runbooks/day-1-checklist-for-friend.md
  - sources/ai-content-factory-workflow-design.md
  - sources/ai-persona-launch-strategy-analysis.md
  - runbooks/zimage-setup-runbook.md
  - concepts/persona-ops-stack.md
  - concepts/openrouter-chat-workflow.md
  - concepts/geo-vs-seo.md
  - entities/marketplaces/fanvue.md
  - entities/hardware/mac-studio.md
  - concepts/persona-legal-landscape.md
  - concepts/synthetic-media-corporate-structure.md
  - sources/synthetic-media-ip-financial-roadmap.md
  - sources/mac-studio-ai-content-factory-design.md
  - sources/virtual-persona-narrative-development-strategy.md
  - concepts/persona-audio-stack.md
  - concepts/persona-failure-modes.md
  - concepts/persona-content-cadence.md
  - concepts/persona-monetization-models.md
  - concepts/persona-payment-rails.md
  - entities/personas/aitana-lopez.md
  - sources/persona-monetization-2026.md
maturity: validated
created: 2026-05-08
updated: 2026-05-11
read_status: deep-read
provenance:
  stub: false
---

## Relations

@sources/ai-creator-operations-blueprint.md @sources/ai-persona-launch-strategy-analysis.md @sources/mac-studio-ai-content-factory-design.md @sources/virtual-persona-narrative-development-strategy.md @sources/ai-content-factory-workflow-design.md @sources/synthetic-media-ip-financial-roadmap.md @sources/persona-monetization-2026.md
@runbooks/zimage-setup-runbook.md @runbooks/day-1-checklist-for-friend.md
@concepts/persona-ops-stack.md @concepts/persona-audio-stack.md @concepts/persona-failure-modes.md @concepts/persona-content-cadence.md @concepts/persona-monetization-models.md @concepts/persona-payment-rails.md @concepts/persona-legal-landscape.md
@concepts/openrouter-chat-workflow.md @concepts/geo-vs-seo.md @concepts/synthetic-media-corporate-structure.md
@entities/models/open-sora.md @entities/uis/comfyui.md @entities/marketplaces/fanvue.md @entities/hardware/mac-studio.md @entities/personas/aitana-lopez.md

## Raw Concept

Synthesis of the full operational workflow for launching and managing 100% AI-generated synthetic persona agencies, drawn from the Operations Blueprint and Launch Strategy Analysis source documents.

## Narrative

### Overview

Persona operations follow a **4-phase launch + ongoing-ops lifecycle**: Infrastructure → Semantic Authority → Content Production → Platform Onboarding, then transitioning to steady-state Ongoing Ops. The workflow integrates local generation (Mac Studio), automated conversation management (OpenRouter + n8n), compliant KYC/2257 practices, and GEO-optimized audience building.

Phase mapping to the runbook: see [Z-Image Turbo End-to-End Runbook](runbooks/zimage-setup-runbook.md) for the step-by-step implementation guide. The 10-phase operator playbook in `briefs/2026-05-07_persona-end-to-end-runbook.md` is the integration brief that stitches this workflow to the LoRA-training, identity-adapter, video-carry, and voice-clone layers.

### Phase I: Infrastructure & Isolation

| Component | Tool | Purpose |
|---|---|---|
| Email | Proton Mail + custom domain | Secure, alias-capable |
| Browser isolation | Multilogin | Unique hardware canvases, UA strings per profile |
| Residential proxy | NodeMaven (Estonia) | "Super sticky" sessions (24hr IP persistence), blacklist filtering |
| Legal entity | Florida Protected Series LLC | One master LLC → N protected series (one per persona) |

Every persona action occurs exclusively within its designated Multilogin + NodeMaven profile.

### Phase II: Semantic Authority (GEO)

Before the persona goes live, build a semantic footprint that LLMs will cite:

1. Create structured entity data on high-authority wikis/Fandom pages (S-E-T framework: Structure, Explainability, Trustworthiness)
2. Seed narrative on Reddit, YouTube for unlinked citations
3. Implement schema markup: `Person`, `ProfilePage`, `SocialMediaPosting`, `FAQPage`
4. Geographic anchoring: assign hyper-specific locale with local entity tags
5. See [GEO vs SEO](concepts/geo-vs-seo.md) for full strategy

### Phase III: Content Production Pipeline

**Local Generation (Mac Studio)**:
- Draw Things for speed (20% faster than ComfyUI on Apple Silicon via Metal/MLX)
- ComfyUI for advanced workflows: IP-Adapter, ControlNet, AnimateDiff
- Lock persona identity via Anchor Image + custom LoRA
- Pre-launch buffer: 30–45 days of varied media

**Image Consistency Stack**:
- IP-Adapter: style/subject embedding projection into U-Net cross-attention (strength 0.4–0.5)
- ControlNet: pose/composition locking (OpenPose, Depth, Canny)
- Character DNA: structured `<character>` XML-tag prompting (see [character DNA templates](concepts/character-dna-templates.md))
- Tri-layered injection pipeline (IP-Adapter + PuLID/FaceID + ControlNet) for zero-shot consistency — see [persona consistency methods](concepts/persona-consistency-methods.md)

**Video Pipeline**:
- OpenRouter API: Kling 3.0 (Standard for cost, Pro for I2V quality)
- Local fallback: Wan 2.2 via ComfyUI + AnimateDiff
- Seam stitching: latent chaining for >10s clips (see [seam stitching](concepts/seam-stitching-strategies.md))

### Phase IV: Platform Onboarding

1. Register on Fanvue through Multilogin + NodeMaven profile
2. Human compliance officer completes KYC: government ID + biometric liveness
3. Activate Fanvue Manager Account → link all persona email addresses
4. Connect LLC protected series bank accounts to payout portal
5. Populate profile with pre-buffered content
6. Bio contains mandatory AI generation disclosure

**Alternative platforms**: Fansly (secondary), dFans.xyz (Web3), white-label ($7K–$20K, full brand ownership).

### Phase Timing & Sequencing

Approximate single-operator timeline from cold start to revenue-bearing launch. Phases I + II can overlap (semantic seeding runs in the background while infrastructure is being set up); Phase III blocks on Phase I (need the isolated profile to source training images / build a content buffer that won't cross-contaminate); Phase IV blocks on all prior phases.

| Phase | Duration | Blocks on | Can overlap with |
|---|---|---|---|
| I — Infrastructure & Isolation | 3–7 days | — | II (semantic seeding starts immediately) |
| II — Semantic Authority (GEO) | 30–60 days (rolling) | — | III, IV (continues post-launch) |
| III — Content Production | 30–45 days | I (need isolated profile + LLC) | II |
| IV — Platform Onboarding | 7–14 days | I, III (need buffer of 30+ posts) | end of II |
| **Total time-to-launch** | **~60–90 days** | | |

**Common timeline traps**:
- Skipping Phase II ("we'll do GEO later") — LLM citations take 30–60 days to surface; starting late means the persona launches into a low-discoverability hole.
- Over-investing in Phase III before Phase I is verified — discovering Multilogin / NodeMaven misconfigurations after generating 200 images means re-shooting from a "clean" canvas.
- Phase IV KYC delays — Fanvue manual KYC review can take 5–10 business days; not 24h. Build the slack into the schedule.
- See [persona failure modes](concepts/persona-failure-modes.md) for the full launch-failure catalog.

### Ongoing Daily Operations

**Conversation Automation**:
- n8n/Make.com receives DM → formats JSON → forwards to OpenRouter API
- `openrouter/auto` routing selects most cost-effective LLM per prompt
- System prompt: persona tone + backstory + upsell objective
- Context window: truncate/summarize at token threshold (see [OpenRouter Chat Workflow](concepts/openrouter-chat-workflow.md))

**CRM & Monetization**:
- Tools: Supercreator, Inrō, OnlyMonster
- Tiered funnel: Acquisition → Automated Qualification → Dynamic Pricing/PPV → Churn Mitigation
- Revenue split: 60–70% from DM/PPV; 30–40% from subscriptions
- Postiz for scheduling (3–5 posts/week per platform)

**Dual-Layer Agentic Memory (RAG)**:
- **Hot Path**: In-RAM session state (LangChain RunnableWithMessageHistory) for short-term conversation continuity
- **Cold Path**: Long-term episodic facts extracted post-session → embedded via Gemini Embedding 2 / Cohere / local sentence-transformers → stored in vector DB (ChromaDB/FAISS for prototyping, pgvector/Pinecone/Qdrant for production)
- **Reranking**: Cohere Rerank or Jina Reranker to reduce retrieval noise
- **Temporal Governance**: Zep's Graphiti (timestamped validity windows, bi-temporal supersession) or Mem0 (80% prompt token reduction via memory compression)
- **Schema-Governed Memory**: PostgreSQL stores core persona traits as structured JSON (`persona_id`, `personality_matrix`, `communication_directives`), combined with vector facts in OpenRouter system prompt

See @sources/ai-content-factory-workflow-design.md §7–§8 for the full RAG pipeline architecture.

**ReAct Agentic Orchestration**: Agents use OpenRouter's `/openrouter/agent` SDK for multi-turn reasoning, tool definitions, and dynamic model routing (heavy models for complex reasoning, efficient models for formatting). See @sources/mac-studio-ai-content-factory-design.md §3.

**Voice**: Fish-Speech S2 Pro (open-source zero-shot voice cloning, TTS-Arena2 leader)

### Compliance Checklist (Ongoing)

| Requirement | Action |
|---|---|
| 2257 records | Maintain per-persona: text prompts, model weights, operator's personal records |
| W-9 / W-8BEN | Filed per LLC protected series |
| Florida CST | Applies to customized digital video messaging |
| Platform disclosure | Visual watermark or bio statement on every post |
| Content cadence | 3–5 posts/week (more = algorithm penalty) |
| Likeness verification | PimEyes / FaceCheck.ID before any public posting (<70% match threshold) |

## Snippets

### Revenue Model (from Launch Strategy Analysis)

> "Base monthly subscription fees are merely a secondary income stream. The primary revenue driver—often accounting for 60% to 70% of total income—is generated through direct messaging (DM) interactions and Pay-Per-View (PPV) content sales."

— [Launch Strategy Analysis §2.2](sources/ai-persona-launch-strategy-analysis.md)

### Tiered Subscriber Funnel

1. **Acquisition & Teaser**: Free content on Instagram, X, TikTok; free subscription tier on Fanvue
2. **Automated Qualification**: OpenRouter LLM initiates contact; rapport-building to classify spending propensity
3. **Dynamic Pricing & Upselling**: High-value → premium personalized outputs; low-value → mass-broadcast PPV
4. **Churn Mitigation**: LLM "recovery scripts" leveraging previous conversational contexts
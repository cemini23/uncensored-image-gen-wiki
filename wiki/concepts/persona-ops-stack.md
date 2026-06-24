---
related:
  - sources/persona-ops-stack-2026.md
  - concepts/persona-ops-workflow.md
  - concepts/synthetic-media-ip-valuation.md
  - concepts/synthetic-media-web3-monetization.md
  - sources/persona-monetization-2026.md
  - concepts/persona-monetization-models.md
  - concepts/persona-failure-modes.md
  - concepts/persona-content-cadence.md
  - concepts/persona-consistency-methods.md
  - entities/persona-ops/postiz.md
  - entities/persona-ops/sillytavern.md
  - entities/persona-ops/fish-speech.md
  - entities/persona-ops/n8n.md
  - concepts/persona-legal-landscape.md
  - concepts/persona-payment-rails.md
  - entities/personas/aitana-lopez.md
  - concepts/marketing-your-persona.md
  - concepts/model-selection-workflow.md
  - entities/uis/comfyui.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/cosyvoice2.md
  - entities/persona-ops/delive.md
  - entities/persona-ops/moneyprinter.md
  - entities/persona-ops/personalive.md
  - entities/uis/fooocus.md
  - entities/marketplaces/fanvue.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/federated-daily-research-digest.md
  - concepts/soul-computing-digital-persona.md
  - sources/arxiv-2606-10413-soul-computing-digital-consciousness.md
  - concepts/llm-interaction-style-governance.md
  - sources/arxiv-2606-08172-human-llm-interaction-governance.md
  - concepts/llm-instruction-hierarchy-training.md
  - sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md
  - sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md
  - concepts/chinese-llm-safety-guardrails.md
  - "@seo-wiki/concepts/creator-marketing-foundations.md"
  - "@seo-wiki/concepts/synthetic-creator-gtm.md"
  - sources/arxiv-2606-21710-privacyalign-llm-agents.md
  - concepts/contextual-privacy-alignment-llm-agents.md
  - concepts/domain-sensitive-llm-over-alignment.md
  - sources/arxiv-2606-23375-tf-refusalbench-over-alignment.md
title: "Persona operations stack (architecture overview)"
type: concept
tags: [persona-ops, automation, stack-architecture, multi-account, dm-automation, voice-cloning, orchestration, content-pipelines]
keywords: [persona-ops, scheduling, anti-detect-browsers, residential-proxies, sillytavern, local-llm, voice-cloning, n8n, orchestration, comfyui, fal-ai, replicate, modal, telegram, postiz]
maturity: draft
created: 2026-05-07
updated: 2026-06-24
---

## Relations

@sources/persona-ops-stack-2026.md @sources/persona-monetization-2026.md @concepts/persona-monetization-models.md @concepts/persona-failure-modes.md @concepts/persona-content-cadence.md @concepts/persona-consistency-methods.md @entities/persona-ops/postiz.md @entities/persona-ops/sillytavern.md @entities/persona-ops/fish-speech.md @entities/persona-ops/n8n.md @concepts/persona-legal-landscape.md @concepts/persona-payment-rails.md @entities/personas/aitana-lopez.md
@concepts/marketing-your-persona.md
@concepts/model-selection-workflow.md
@concepts/synthetic-media-ip-valuation.md
@concepts/synthetic-media-web3-monetization.md

@concepts/persona-audio-stack.md
@entities/voice-models/cosyvoice2.md
@entities/persona-ops/delive.md @entities/persona-ops/moneyprinter.md
@entities/persona-ops/personalive.md @entities/uis/fooocus.md
@entities/marketplaces/fanvue.md @concepts/multi-angle-dataset-prep.md @concepts/persona-content-cadence.md
@concepts/federated-daily-research-digest.md
@seo-wiki/concepts/creator-marketing-foundations.md
@seo-wiki/concepts/synthetic-creator-gtm.md

## Raw Concept

Page prompted by Path A step 6 ingest of the persona-ops survey docx (May 2026). Synthesizes the 7-axis architecture of the modal 2026 persona-ops stack into a single reference page. Companion to @concepts/persona-consistency-methods.md (which covers the identity layer); this page covers the operational layer **wrapped around** that identity.

Synthesized from @sources/persona-ops-stack-2026.md.

## Narrative

### The 7 axes

A modern adult AI persona operation is built from 7 distinct tooling layers. Each axis is composable — a Tier 1 operator runs all 7; a Tier 3 operator may run only 1-2 manually:

1. **Posting & Scheduling** — Buffer / Later / Postiz / Hypefury (SFW-clean) or Supercreator / Infloww / Exclu (NSFW-specialized). → @entities/persona-ops/postiz.md
2. **Multi-Account Management** — anti-detect browsers (Multilogin Pro 10 €9/mo, GoLogin $24/mo, Octobrowser €29/mo) + residential proxies (Bright Data, IPRoyal, Apify, Oxylabs). AdsPower deprioritized post-Jan 2025.
3. **DM / Chat Automation** — local LLM stack (Qwen 3 / Mistral 3 / Llama 4) on 24-48 GB VRAM, frontended by SillyTavern (128K context, MiniMax TTS, RAG). Hosted LLMs (GPT-5.4, Gemini 3.1 Pro, Claude 4.6) are NSFW-hostile. → @entities/persona-ops/sillytavern.md
4. **Voice Cloning** — Fish-Speech S2 Pro (TTS-Arena2 leader, 10-30s zero-shot, 50+ emotion tags) for NSFW; ElevenLabs Flash v2.5 dominates SFW (75-150ms latency) but is platform-banned for NSFW use. → @entities/persona-ops/fish-speech.md
5. **Agentic Loops & Orchestration** — n8n (self-hosted, modal choice) / Make.com (Maia AI builder, SaaS) / LangChain / LangGraph / Temporal (Durable Agent Execution) / CrewAI / AutoGen. Enterprise-tier persona-ops budgets are $100K-$300K build + $3.2K-$13K/mo LLM API. → @entities/persona-ops/n8n.md
6. **Triggerable Image & Video Pipelines** — ComfyUI workflow JSONs route to either Vast.ai serverless GPU endpoints or managed APIs: Fal.ai (FLUX.2 Pro $0.05/image, Wan 2.1 $0.05/sec video), Replicate, Modal.
7. **Content-Calendar Automation** — Batch Prompting, Gap Analysis, Trend Expansion. Repurposing: Opus Clip / Vidyo.ai / Orshot. Routing: Airtable/Notion + n8n + Repurpose.io.

### Distribution-channel tooling (supplement to Axis 1)

**Reddit automation** — highest-leverage but most operationally fragile funnel. Tools: **Social-Rise** (rule-validation, ban-shield, proxy-aware, NSFW subreddit discovery), **Postpone** (notification-based posting: mobile alert → human clicks "publish" to bypass API-detection), **Slingshot**, **Conbersa** (multi-account proxy rotation + hardware-fingerprint spoofing). Reddit purges ~100K automated accounts daily; every account needs warming, fresh karma, and proxy isolation. April 2026: community-association auto-bans shut down but report/remove features remain.

**Telegram distribution** — the definitive safe haven for adult AI content. No algorithmic feed filtering; every subscriber receives every broadcast chronologically; open Bot API for deep automation. Tools: **Manychat**, **Botpress**, **UChat**, **Sendpulse** (channel broadcast automation); **InviteMember** (subscription-tier management + payment collection inside chat); **SUCH** (fan-request customer support). Many operators run a Python script on a $5 VPS calling `sendPhoto`/`sendVideo` against the Bot API.

**X/Twitter** — tightened sharply in 2026. April 2026: ~200 accounts/minute purged under new product directives; FaceID biometric verification trap for suspected bots. Surviving tools: **Hypefury** ($29/mo, auto-plug + evergreen recycling), **Typefully** (organic thread-builder), **ShortSync** (video-first distribution bypassing text-bot detection).

**OF/Fanvue creator suites** — **Supercreator** (Izzy AI, AI-assisted chat), **Infloww** (CRM + AI Copilot beta), **Substy** (agency-only, real-time chat distribution), **Botly**, **OnlyMonster**, **Fans-CRM**, **CreatorHero** (revenue dashboards + AI translation). **Scrile Connect** (self-owned subscription site build-service, removing platform-lock). **Exclu** (0% commission direct-to-DM sales via bio links, bypassing OF/Fanvue revenue splits).

### Voice-sync and video-automation tools

- **DeLive** (`XimilalaXiang/DeLive`, Apache-2.0) — system-audio capture + 12 ASR backends for TTS-output-to-text audit trail. → @entities/persona-ops/delive.md
- **MoneyPrinter** (`FujiwaraChoki/MoneyPrinter`, MIT) — MoviePy-based short-form video automation (YouTube Shorts/TikTok). License-corrected from phantom AGPL-3.0. → @entities/persona-ops/moneyprinter.md
- **yt-dlp** (`yt-dlp/yt-dlp`, Unlicense source) — de-facto media extractor for feeding TTS persona-ops training pipelines. Install from Unlicense source tarball only; pre-built binaries statically bundle GPLv3+ code.
- **PersonaLive** (`GVCLab/PersonaLive`) — real-time portrait animation; **Phase-0 CONDITIONAL-GO** (2026-06-05) — Apache-2.0, 12GB streaming, ComfyUI node → @entities/persona-ops/personalive.md

### Operator playbook patterns (K57, @0xKiyoro) [TENTATIVE]

Cross-routed from @osint-wiki/sources/trading-posts-llm-gustafsson-retail-weather-copy-2026-05-22.md Post 3. Treat revenue claims as marketing, not audited fact-checks.

| Stage | Claimed tooling | Wiki mapping |
|-------|-----------------|--------------|
| Face merge | Wavespeed + nano banana (two Pinterest refs) | Cloud face-merge — compare to local Klein BFS / PuLID paths → @concepts/multi-angle-dataset-prep.md |
| Dataset | 70/20/10 golden ratio | → @concepts/multi-angle-dataset-prep.md |
| LoRA train | ~$3 cloud cost claim | Unverified — local Kohya/Musubi on RunPod is the build-track default |
| Video | Wan 2.7 **or** Kling 3.0 **or** ComfyUI | Wan 2.7 = cloud/API tier → @entities/models/openrouter-video.md; local = Wan 2.2 → @entities/models/wan-2-2.md |
| Pre-upload | CapCut metadata scrub | → @concepts/persona-content-cadence.md |
| Monetize | Fanvue funnel | → @entities/marketplaces/fanvue.md |

**GPL reference-only UIs (do not deploy):** Fooocus (`lllyasviel/Fooocus`, GPL-3.0), PhotoGIMP (`Diolinux/PhotoGIMP`, GPL-3.0 GIMP-as-Photoshop layout) — UX pattern theft only → @entities/uis/fooocus.md

### Reference architecture

```
Content Calendar (Airtable/Notion)
     ↓ [trigger]
Orchestration Layer (n8n self-hosted)
     ↓ [LLM script gen]                             ↓ [voice gen]              ↓ [image/video gen]
Local LLM (Qwen 3 / Mistral 3) ── SillyTavern    Fish-Speech S2 Pro          ComfyUI (local OR Fal.ai/Replicate/Modal)
     ↓                                               ↓                          ↓
DMs ← CRM (Supercreator / Infloww)               Voice notes (Fanvue PPV)    Image/video assets
     ↓                                                                          ↓
Anti-detect browser (Multilogin Pro 10) + residential proxy ──── Posting/Scheduling (Postiz / Hypefury / NSFW CRM)
                                                                  ↓
                                                                  Distribution surfaces (Telegram durable; X/Reddit volatile; Fanvue/OF gated)
```

### Strategic shifts (2026)

- **Distribution surface migration**: Reddit (April 2026 crackdown, ~200K accounts purged daily) and X (mass-suspension wave with FaceID biometric verification post-April 2026) drove operators toward Telegram as the durable channel. Fanvue / OnlyFans remain the gated monetization endpoints.
- **NSFW LLM reality**: hosted-LLM NSFW capability is dead. Local Qwen 3 / Mistral 3 / Llama 4 via SillyTavern is the only reliable DM stack.
- **Voice clone open-sourcing**: Fish-Speech S2 Pro and Qwen3-TTS now exceed ElevenLabs on TTS-Arena2 for cloning quality on short reference clips. The NSFW-banned Eleven workflow has been fully replaced.
- **Cost arbitrage via Model Routers**: simple NLP tasks → cheap models (GPT-4o-mini class); complex reasoning → premium (Claude 3.5 Sonnet / GPT-5.4). Reported infrastructure savings 60-90%.

### Tier ladders

| Tier | Stack profile | Monthly cost | Time investment |
|------|---------------|--------------|-----------------|
| Solo / aspirational | One persona, manual posts, no DM automation, ElevenLabs trial | $50-150 | 20-40 hr/week |
| Mid (Tier 2) | One persona, scheduler + local LLM DMs + voice clone + ComfyUI | $200-1,000 | 15-25 hr/week |
| Agency-managed | Roster of 3-10, full n8n orchestration, anti-detect, NSFW CRM | $3,000-13,000 | 0.5-1.5 FTE per persona |
| Enterprise / Tier 1 | $100K-300K build, $3.2K-13K/mo LLM API, multi-modal pipeline | $100K+/yr | 2-5 FTE |

[Source: AI Persona Operations Software Stack.docx Sections 1-7, retrieved 2026-05-06]

### Build-track scope note

Per workspace scope (MEMORY.md): platforms-and-policy detail (specific Fanvue/OF subscription mechanics, current ToS reading, current ban-wave triggers) is curated faithfully but not actionable for the build track. The technical components — local LLM stacks, voice clones, ComfyUI pipelines, n8n flows, anti-detect browser hygiene — are the actionable backbone. Use this stack as the **architectural reference** when planning a build, then go deep into the tool-specific entity pages.

## Snippets

> "n8n is now the modal orchestration layer for persona-ops. Self-hosted deployment with execution-based pricing makes it the dominant choice for technical operators; Make.com targets SaaS users with the Maia AI builder; LangChain/LangGraph, Temporal, CrewAI, AutoGen serve code-first multi-agent builders."
[Source: AI Persona Operations Software Stack.docx Section 5 (retrieved 2026-05-06)]

## Dead Ends

- **Hosted-LLM NSFW DM stack**: GPT-5.4 / Gemini 3.1 Pro / Claude 4.6 universally block NSFW persona DMs. Wasted attempt. Use local Qwen 3 / Mistral 3 / Llama 4 via SillyTavern.
- **AdsPower as default anti-detect browser**: reputational hit Jan 2025; community moved to Multilogin Pro 10 / GoLogin / Octobrowser.
- **Reddit / X as durable distribution**: April 2026 crackdowns gutted both for persona traffic. Telegram is the durable channel.
- **ElevenLabs for NSFW**: platform-banned. Fish-Speech S2 Pro is the open-source replacement.

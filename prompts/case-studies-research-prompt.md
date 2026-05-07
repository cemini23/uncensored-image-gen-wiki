# Deep Research Prompt — AI Persona Case Studies & Monetization

Run in deep research mode (Exa `deep_researcher_start` or equivalent). Supplement with Brave Search for news/interviews, and Playwright for Reddit / Fanvue / public-creator pages.

---

Comprehensive survey of **publicly documented adult AI personas, their monetization, time-investment, failure modes, and the legal/ethical landscape** as of May 2026. Focus: factual, primary-source-cited material. Avoid speculation about specific real creators' incomes unless they have publicly disclosed.

## 1. Public case studies

For each documented AI persona: who created it, when, base technical stack (model / LoRA / video tools when known), platforms operated on, content cadence, publicly disclosed earnings (with date and source), notable press coverage.

Must cover:
- **Aitana Lopez** (The Clueless agency, Rubén Cruz)
- **Emily Pellegrini**
- **Lil Miquela** (for SFW comparison context only — note SFW)
- Any AI personas operating on **Fanvue** with public coverage
- Any AI personas operating on **OnlyFans** with public coverage and AI disclosure
- Documented agency-run rosters (The Clueless, others) and how they package multiple personas

## 2. Top documented Fanvue / OF AI accounts

- Earnings ranges where publicly disclosed (Fanvue's own reporting, creator interviews, journalism)
- Content cadence patterns
- Stack used when known (model, video tools, voice tools, automation)
- Cite all earnings claims with source and date

## 3. Community hubs

- Reddit subs where AI persona operators trade techniques (r/AICreators, r/aiartwork variants, r/AI_creator, r/sdforall, etc.) — current activity level and admin status
- Discord servers (CivitAI, Pony Diffusion community, specific operator collectives)
- Telegram groups
- Twitter / X clusters
- Paid courses and gurus — their claims vs reality

## 4. Failure modes

For each: what specifically triggered the failure, what platform action followed, and how creators have responded.
- Account bans (Instagram, TikTok, Twitter, Fanvue, OF) — known triggers
- Public callouts / doxxing of synthetic-creator operators
- Payment processor freezes
- DMCA / likeness-related complaints
- Tax / business-formation issues

## 5. Payment processors and money flow

- Stripe alternatives that work for AI-generated adult content (CCBill, SegPay, Verotel, Epoch, ePayments, others)
- Crypto rails — which platforms accept
- Regional variation (US vs EU vs UK vs other)
- Bank-level account freezes for adult-creator income — known incidents

## 6. Realistic time-investment per dollar

- Published or interview-disclosed hours-per-week from real operators
- What scales with automation vs what stays manual
- Common cost structures (image gen costs, cloud rental, voice/chat API costs, scheduler costs)
- ROI math from on-the-record creator disclosures

## 7. Ethical and legal landmines

- Likeness consent — was the synthetic face trained on real-person data? (Stable Diffusion training data lawsuits, individual likeness suits)
- Defamation risk if a synthetic persona resembles a real person
- Jurisdictional issues for adult content (US 2257 record-keeping, UK Online Safety Act, EU AI Act, Japan, Australia)
- Age-verification compliance (Fanvue / OF requirements, US state laws)
- Model release ambiguity for fully-synthetic subjects
- Recent lawsuits and regulatory actions (cite case names and dates)

---

## Output format

- Single markdown file written to `briefs/case-studies-monetization.md`
- Target length: ~3,500 words
- Structure: 7 numbered sections matching the TOC above
- Every claim about earnings, cadence, stack, ban, lawsuit, or regulation cites a primary source (interview, press article with byline, court filing, official policy page) with retrieval date
- Flag uncited or rumor-tier claims explicitly as "community report, unverified"
- Avoid identifying private individuals who have not publicly identified themselves as AI-persona operators
- Style match: depth and citation density of `notes/models-catalog.md`

## Tools to use

1. **Exa** — primary deep research, especially for journalism and interviews
2. **Brave News Search** — recent press coverage
3. **Brave Search** — community hubs, Reddit threads
4. **Playwright** — Fanvue creator pages, Reddit threads, primary-source articles

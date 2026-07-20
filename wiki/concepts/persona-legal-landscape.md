---
title: "Persona legal landscape (2257, age verification, OSA, EU AI Act)"
type: concept
tags: [legal, compliance, persona-monetization, 2257, age-verification, deepfake-law, ai-regulation, defamation, right-of-publicity]
keywords: [18-USC-2257, DEFIANCE-Act, Take-It-Down-Act, Florida-HB3, Utah-AI-law, NY-SAFE-for-Kids, UK-Online-Safety-Act, OSA-Section-138, Yoti, Ofcom, EU-AI-Act-Article-50, AI-Act-August-2026, Getty-v-Stability, NYT-v-OpenAI, Vacker-v-ElevenLabs, Lehrman-v-LOVO, Grok-mass-tort, model-release, NCII]
related:
  - sources/persona-monetization-2026.md
  - concepts/persona-ops-workflow.md
  - concepts/synthetic-media-corporate-structure.md
  - concepts/synthetic-media-web3-monetization.md
  - entities/marketplaces/fanvue.md
  - runbooks/day-1-checklist-for-friend.md
  - runbooks/zimage-setup-runbook.md
  - concepts/persona-failure-modes.md
  - concepts/persona-monetization-models.md
  - concepts/persona-payment-rails.md
  - concepts/persona-ops-stack.md
  - concepts/likeness-collision-verification.md
  - entities/voice-models/elevenlabs.md
  - entities/music-models/suno.md
  - entities/music-models/udio.md
  - sources/arxiv-2411-19537-deepfake-generation-detection-survey.md
  - concepts/generative-ai-era-deepfake-landscape.md
  - sources/arxiv-2607-15694-voice-clone-attribution-geometry-floor.md
  - sweeps/2026-07-20-daily.md
maturity: draft
created: 2026-05-07
updated: 2026-07-20
---

## Relations

@sources/persona-monetization-2026.md @concepts/persona-failure-modes.md @concepts/persona-monetization-models.md @concepts/persona-payment-rails.md @concepts/persona-ops-stack.md @concepts/likeness-collision-verification.md
@concepts/synthetic-media-corporate-structure.md
@concepts/synthetic-media-web3-monetization.md
@entities/persona-ops/fish-speech.md
@entities/voice-models/elevenlabs.md @entities/music-models/suno.md @entities/music-models/udio.md

## Raw Concept

Page prompted by Path A step 6 ingest of the persona-monetization survey docx (May 2026). Catalogs the 4 active regulatory regimes that bound the synthetic-creator economy. Per workspace scope (MEMORY.md), platforms-and-policy material is curated faithfully into the research layer but **deprioritized** in the active build track — this is reference, not legal advice. Operators must consult counsel.

Synthesized from @sources/persona-monetization-2026.md.

## Narrative

### 4 active regulatory regimes (May 2026)

| Regime | Jurisdiction | Status | Key risk |
|--------|--------------|--------|----------|
| 18 U.S.C. § 2257 record-keeping | US federal | Active | "Computer-manipulated image of an actual human being" — synthetic personas in legal paradox |
| US state age-verification | FL, UT, LA, NY | Progressively in-force | Fragmented compliance; AI-companion chatbot scope |
| UK Online Safety Act + DUAA s.138 | UK | In force Feb 2026 | Criminalizes non-consensual deepfakes; "just AI" defense removed |
| EU AI Act Article 50 | EU | Strictly enforceable Aug 2026 | Mandatory machine-readable labeling of all AI content |

### 1. 18 U.S.C. § 2257 — the synthetic-persona paradox

US federal record-keeping law for sexually explicit content. Producers must:
- Verify age and identity of all performers via government ID + true name
- Maintain records for inspection
- Statute explicitly covers "any digitally- or computer-manipulated image of an actual human being"

The paradox for fully synthetic personas: how does an operator obtain a model release and government ID for a hallucinated entity? If a synthetic persona's training data inadvertently memorizes and reproduces a real human's face — or if a court rules the output constitutes an "actual human being" — operators face up to **5 years federal prison** for failing to maintain 2257 records.

This ambiguity is one of the primary reasons risk-averse payment processors require backdoor content access (CCBill, etc.) and apply intense scrutiny to adult-AI merchants. → @concepts/persona-payment-rails.md

### 2. US state laws (fragmented age-verification)

- **Florida HB 3**: strict age verification on social media; mandates parental consent for AI companion chatbots
- **Utah, Louisiana**: similar progressing
- **NY SAFE for Kids Act**: age-gating + algorithmic transparency
- **DEFIANCE Act + Take It Down Act** (federal, effective mid-2026): criminal penalties + mandatory platform removal of non-consensual intimate imagery (NCII) and deepfakes

Compliance is fragmented; operators must navigate state-by-state mandates.

### 3. UK Online Safety Act + DUAA s.138

- **UK OSA**: criminalizes sharing non-consensual deepfakes; Ofcom holds platforms legally responsible
- **Section 138 of Data Use and Access Act 2025** (in force February 2026): creates a specific criminal offense for creating "a purported intimate image of an adult without consent". **Crucially, removes the "just AI" defense** — synthetic intimate imagery is criminal regardless of substrate.
- **Ofcom investigation** of OnlyFans's Yoti age-verification mechanics ongoing.

UK is currently the most aggressive jurisdiction on synthetic-NCII enforcement. Operators with UK distribution must assume zero tolerance.

### 4. EU AI Act Article 50

**Strictly enforceable August 2026**. Mandates that providers and deployers ensure all AI-generated or manipulated audio, video, text, and images are clearly labeled in a **machine-readable format**.

Operational impact:
- C2PA Content Credentials become mandatory for EU distribution
- "Deceptive growth" strategies (real-person mimicry, undeclared AI persona) become illegal
- Watermarking + metadata tagging required at the generation pipeline

Combined with TikTok's existing C2PA enforcement, this hard-codes machine-readable AI labeling as the May 2026 baseline.

### Active litigation (training-data + likeness)

- **The New York Times v. Microsoft / OpenAI**: copyrighted-text training data
- **Getty Images v. Stability AI**: copyrighted-image training data
- **Vacker v. ElevenLabs** (settled): right-of-publicity for cloned voice
- **Lehrman v. LOVO**: voice cloning without consent
- **Grok mass tort (Baltimore)**: ~3M sexualized images including ~23K appearing to depict minors — alleging complete absence of guardrails
- **Meete app lawsuit**: student successfully sued for stolen-likeness geofenced ads

For persona operators, the precedent forming is clear: **likeness rights are litigable**, and "I trained on a public dataset" is not a defense. → @concepts/likeness-collision-verification.md

### Japan / Australia / global posture

Direct legislative coverage limited in survey; global platform compliance teams universally adopt strictest standards (EU + UK) to avoid multi-jurisdictional fragmentation. Operators must default to:
- Absolute transparency (clear AI labeling)
- Age-gating regardless of physical location
- No real-person impersonation
- Confirmed-rights or fully synthetic source data for LoRA training and voice cloning

### Compliance posture (research-layer reference)

Build-track operators (per workspace scope, MEMORY.md skip platforms/policy) should treat this as risk-awareness reference, not legal guidance. Key high-leverage hygiene:

- **Likeness similarity check before LoRA training** (PimEyes / FaceCheck) → @concepts/likeness-collision-verification.md
- **Voice clone source audio**: clear rights or fully synthetic
- **C2PA Content Credentials** on all generation outputs
- **AI labeling on all distribution surfaces**
- **No minor-resembling outputs** (zero tolerance, criminal liability)

For any actual deployment, consult counsel familiar with the relevant jurisdictions.

## Snippets

> "18 U.S.C. § 2257 explicitly covers any 'digitally- or computer-manipulated image of an actual human being'. Fully synthetic AI personas create a paradox: how does an operator obtain a model release and government ID for a hallucinated entity? If a synthetic persona's training data inadvertently memorizes and reproduces a real human's face, the operator could face up to 5 years in federal prison for failing to maintain 2257 records."
[Source: AI Personas_ Monetization, Ethics, Law.docx Section 7 (retrieved 2026-05-06), citing law.cornell.edu/uscode/text/18/2257]

> "Section 138 of the Data Use and Access Act 2025 (in force February 2026) creates a specific criminal offense for creating 'a purported intimate image of an adult without consent', removing the defense that the image was 'just AI'."
[Source: AI Personas_ Monetization, Ethics, Law.docx Section 7 (retrieved 2026-05-06), citing qmul.ac.uk/lac/our-legal-blog/2026-blogs]

> "Article 50 of the EU AI Act, which becomes strictly enforceable in August 2026, mandates that providers and deployers ensure all AI-generated or manipulated audio, video, text, and images are clearly labeled in a machine-readable format. This establishes a sweeping legal requirement for absolute transparency, effectively outlawing the 'deceptive' growth strategies previously utilized by early AI influencers."
[Source: AI Personas_ Monetization, Ethics, Law.docx Section 7 (retrieved 2026-05-06), citing truescreen.io/insights/ai-act-article-50]

## Dead Ends

- **"Just AI" defense in UK**: explicitly removed by DUAA s.138 (Feb 2026). Synthetic intimate imagery is criminal regardless of substrate.
- **Deceptive growth (undeclared AI persona) in EU**: outlawed Aug 2026 via AI Act Article 50.
- **Skipping likeness similarity check before LoRA training**: right-of-publicity exposure. Always verify.
- **Minor-resembling outputs**: zero tolerance; immediate criminal exposure. Not negotiable.

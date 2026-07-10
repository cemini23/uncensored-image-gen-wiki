---
title: "Heretic (automatic LLM abliteration CLI)"
type: entity
tags: [training-tool, abliteration, de-censoring, llm, alignment-removal]
keywords: [heretic, p-e-w, abliteration, refusal vector, uncensored LLM, AGPL]
related:
  - concepts/de-censoring-techniques.md
  - concepts/censorship-tier-taxonomy.md
  - entities/models/wan-2-2.md
  - entities/models/flux.md
  - concepts/pragmatic-open-model-adoption.md
  - sweeps/2026-07-10-daily.md
maturity: draft
created: 2026-07-10
updated: 2026-07-10
---

## Relations

@concepts/de-censoring-techniques.md @concepts/censorship-tier-taxonomy.md @entities/models/wan-2-2.md @entities/models/flux.md @concepts/pragmatic-open-model-adoption.md

## Raw Concept

Sweep P4 row (2026-07-10). Repo: `github.com/p-e-w/heretic` — "Fully automatic censorship removal for language models." Referenced in prose across @concepts/de-censoring-techniques.md; this entity page records Phase-0 metadata for the tool itself.

## Narrative

**Heretic** automates **abliteration** on language models: map refusal directions, project them out of attention weights, emit an "uncensored" variant without full retraining. Community also applies the technique to **multimodal text encoders** feeding diffusion models (Wan abliterated TE path in @entities/models/wan-2-2.md).

### Phase-0 audit (2026-07-10)

| Check | Result |
|-------|--------|
| License | **AGPL-3.0** — copyleft; review before commercial persona SaaS bundling |
| Stars | ~26k★ — high community traction |
| Scope | Primarily **LLM** weights; not a ComfyUI node |
| Operator fit | Useful for local DM LLM + optional TE surgery research; not day-1 persona image path |

**Verdict: REFERENCE** for image stack — cite when discussing abliteration; use pre-abliterated Wan/FLUX community checkpoints for production gen. **WATCH** if David needs custom TE surgery on a new base.

## Snippets

> "Fully automatic censorship removal for language models"
[Source: github.com/p-e-w/heretic (retrieved 2026-07-10)]

## Dead Ends

- **Drop-in ComfyUI install** — CLI research tool, not a generation UI plugin.
- **Fish-Speech / voice** — unrelated modality.

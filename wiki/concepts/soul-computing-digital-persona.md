---
title: Soul Computing for digital persona agents
type: concept
tags: [concept, persona-ops, digital-human, consciousness, memory, theoretical]
keywords: [Soul Computing, narrow soul computing, broad soul computing, self-identity, hierarchical memory, digital fragments, intensional core, persona persistence, extensional carrier]
related:
  - sources/arxiv-2606-10413-soul-computing-digital-consciousness.md
  - concepts/persona-ops-stack.md
  - concepts/persona-consistency-methods.md
  - concepts/persona-audio-stack.md
  - sources/persona-ops-stack-2026.md
  - sources/persona-monetization-2026.md
maturity: draft
created: 2026-06-11
updated: 2026-06-11
---

## Relations

@sources/arxiv-2606-10413-soul-computing-digital-consciousness.md @concepts/persona-ops-stack.md @concepts/persona-consistency-methods.md @concepts/persona-audio-stack.md

## Raw Concept

Ingest 2026-06-11 from Soul Computing (arXiv:2606.10413) — theoretical framing for persistent digital persona agents; maps to wiki persona-ops layers.

## Narrative

**Soul Computing** (ZJU, 2026) formalizes the gap between **virtual humans** (functional UI shells) and **agents with continuous self-identity**. For this workspace, the useful slice is architectural — not consciousness claims:

```
Digital fragments (text, AV, behavior metadata)
        ↓
Narrow core (hierarchical memory, stable self-model, personality homeostasis)
        ↓
Broad externalization ← wiki build track lives here
   ├── Visual persona (@concepts/persona-consistency-methods.md)
   ├── Voice (@concepts/persona-audio-stack.md)
   ├── Orchestration (@concepts/persona-ops-stack.md)
   └── Platform presence / monetization
```

### Practical mapping

| Soul Computing layer | Wiki equivalent |
|---------------------|-----------------|
| Text-stream fragments | DM logs, caption corpora, SillyTavern history |
| AV streams | Reference clips for Fish-Speech / LatentSync |
| Behavioral metadata | Posting cadence, platform activity patterns |
| Narrow core | **Not implemented** — would be long-horizon memory + value-stable LLM agent |
| Broad externalization | ComfyUI + n8n + voice/lipsync pipeline |

**Takeaway:** current persona ops are **extensional-heavy** (image/video/voice gen) with **thin intensional core** (RAG + short context). Soul Computing argues monetizable "living" personas need the inverse investment ratio over time — memory/identity infrastructure > single-shot visual quality.

### vs adjacent fields (paper's boundaries)

- **Not** affective computing (emotion recognition only)
- **Not** historical-figure RAG Q&A
- **Not** mortal computation (Friston free-energy agents)

## Snippets

> "The reconstruction of memory … is no mere mass information storage, but the construction of a hierarchical memory system centered on the self."

## Dead Ends

Paper provides no open implementation — do not treat as engineering spec. Consciousness / legal personhood claims out of scope for build-track; use only as persona product strategy vocabulary.

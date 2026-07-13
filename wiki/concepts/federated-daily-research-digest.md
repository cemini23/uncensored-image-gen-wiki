---
related:
  - meta/daily-research-digest-cadence.md
  - concepts/persona-ops-stack.md
  - concepts/persona-audio-stack.md
  - entities/omnivoice.md
  - sweeps/_daily-template.md
  - sweeps/2026-06-01-inbox-triage.md
  - sweeps/2026-06-01-daily.md
  - sweeps/2026-06-02-inbox-triage.md
  - sweeps/2026-06-02-daily.md
  - sources/arxiv-2605-29251-provably-secure-agent-guardrail-routed.md
  - sweeps/2026-06-03-daily.md
  - sweeps/2026-06-04-daily.md
  - sweeps/2026-06-04-inbox-triage.md
  - sweeps/2026-06-05-inbox-triage.md
  - sweeps/2026-06-05-daily.md
  - sweeps/2026-06-06-daily.md
  - sweeps/2026-06-07-daily.md
  - sweeps/2026-06-08-daily.md
  - sweeps/2026-06-10-daily.md
  - sources/arxiv-2606-09701-advgrpo-red-teaming-routed.md
  - sweeps/2026-06-09-daily.md
  - sweeps/2026-06-11-daily.md
  - sweeps/2026-06-12-daily.md
  - sweeps/2026-06-15-daily.md
  - sweeps/2026-06-13-daily.md
  - sweeps/2026-06-14-daily.md
  - sweeps/2026-06-16-daily.md
  - sweeps/2026-06-17-daily.md
  - sweeps/2026-06-18-daily.md
  - sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md
  - sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md
  - sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - sources/arxiv-2606-13768-cineorchestra-entity-centric-cinematic-video.md
  - sources/arxiv-2606-16533-kairos-native-world-model-stack.md
  - sources/arxiv-2606-18702-unitemp-bidirectional-video-generation.md
  - sources/arxiv-2606-19103-productconsistency-product-identity-editing.md
  - sweeps/2026-06-19-daily.md
  - sources/arxiv-2606-17257-reins-video-safety-representation-steering.md
  - sources/arxiv-2606-19271-turboserve-streaming-video-serving.md
  - sweeps/2026-06-20-daily.md
  - sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md
  - sources/arxiv-2606-17999-voidpadding-mdlm-padding.md
  - sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md
  - sweeps/2026-06-21-daily.md
  - sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md
  - sources/arxiv-2606-20506-freestyle-community-lora-mining.md
  - sweeps/2026-06-22-daily.md
  - sources/arxiv-2606-17566-aoizora-topology-aware-dit-parallel.md
  - sources/arxiv-2606-17742-brainworld-fmri-structural-prior.md
  - sources/arxiv-2606-20971-unity-attention-flow-conditioning.md
  - sources/arxiv-2606-21710-privacyalign-llm-agents.md
  - sweeps/2026-06-23-daily.md
  - sweeps/2026-06-24-daily.md
  - sweeps/2026-06-25-daily.md
  - sweeps/2026-06-26-daily.md
  - sweeps/2026-06-27-daily.md
  - sweeps/2026-06-29-daily.md
  - sweeps/2026-06-28-daily.md
  - sweeps/2026-06-30-daily.md
  - sweeps/2026-07-01-daily.md
  - sweeps/2026-07-02-daily.md
  - sweeps/2026-07-04-daily.md
  - sweeps/2026-07-05-daily.md
  - sweeps/2026-07-06-daily.md
  - sweeps/2026-07-07-daily.md
  - sweeps/2026-07-08-daily.md
  - sweeps/2026-07-09-daily.md
  - sweeps/2026-07-10-daily.md
  - entities/custom-nodes/comfyui-mcp.md
  - sweeps/2026-07-11-daily.md
  - sweeps/2026-07-12-daily.md
  - sweeps/2026-07-13-daily.md
title: Federated daily research digest
type: concept
tags: [meta, automation, federation, discovery, k93]
keywords: [daily-research-digest, exa, inbox, sweep, federated, launchagent, discovery-loop]
maturity: validated
created: 2026-06-01
updated: 2026-07-12
cross-wiki-source: "@osint-wiki/concepts/federated-daily-research-digest.md"
---


## Relations

@meta/daily-research-digest-cadence.md @concepts/persona-ops-stack.md @concepts/persona-audio-stack.md @entities/omnivoice.md @sweeps/_daily-template.md

## Raw Concept

K93 cross-wiki brief (`briefs/2026-06-01_k93-imagegen-digest-from-osint.md`) — replicate OSINT's morning discovery loop on the image-gen wiki without Tier-3 autonomous ingest. Canonical spec lives on `@osint-wiki/concepts/federated-daily-research-digest.md`.

## Narrative

### What was installed (2026-06-01)

| Piece | Path |
|-------|------|
| Runner | `scripts/daily_research_digest_run.py` |
| Fetch helper | `scripts/daily_research_fetch.py` |
| Config | `scripts/daily_research_config.yaml` (image-gen topics) |
| Sweep output | `wiki/sweeps/YYYY-MM-DD-daily.md` |
| Cadence doc | `wiki/meta/daily-research-digest-cadence.md` |
| Sweep template | `wiki/sweeps/_daily-template.md` |
| LaunchAgent label | `com.cemini.daily-research-digest.image-gen` @ 08:15 local |
| Wrapper | `~/bin/cemini-daily-research-digest-image-gen` |

Install command (idempotent):

```bash
bash "/Users/claudiobarone/Projects/OSINT WORKSPACE/scripts/federation/daily_digest/install_federated_daily_digest.sh" \
  "/Users/claudiobarone/Projects/Image gen" image-gen
```

Load scheduler (operator, once):

```bash
launchctl load ~/Library/LaunchAgents/com.cemini.daily-research-digest.image-gen.plist
```

Manual run:

```bash
cd "/Users/claudiobarone/Projects/Image gen"
python3 scripts/daily_research_digest_run.py
```

### Operator loop

1. Morning: review `wiki/sweeps/YYYY-MM-DD-daily.md`
2. Drop selected PDFs into `research to be indexed/` or fetch via Exa in Cursor
3. Say **full ingest** in Cursor on this wiki folder — human gates unchanged per CLAUDE.md ingest protocol
4. Weekly: optional Monokern overlay (`monokern_pipeline` in config)

### K93 tool-eval side effect

**OmniVoice (`debpalash/OmniVoice-Studio`) — Reject** on re-eval: weights carry **NOASSERTION / custom commercial** license poison, not Apache-2.0 as K45 briefly assumed. → @entities/omnivoice.md marked dead-end; build-track voice remains Fish-Speech S2 Pro / CosyVoice2 / Qwen3-TTS.

## Snippets

> "Tier 3 autonomous ingest remains NO-GO." [CONFIRMED] @osint-wiki/concepts/cemini-wiki-ingest-workflow.md

> "Each sibling wiki gets a copy of the script bundle under its repo scripts/ plus a wiki-local daily_research_config.yaml with domain active_topics." [Source: @osint-wiki/concepts/federated-daily-research-digest.md (retrieved 2026-06-01)]

## Dead Ends

- **Expecting the digest to write entity pages** — discovery + optional inbox fetch only; Cursor ingest still required.

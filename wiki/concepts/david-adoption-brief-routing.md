---
title: David adoption brief routing — TipDrop shared kit mirror
type: concept
tags: [concept, meta, workflow, briefs, persona-ops, tipdrop]
keywords: [david, tipdrop-workspace-kit, adoption-brief, phase-0, comfyui, fish-speech, ingest]
related:
  - concepts/persona-audio-stack.md
  - concepts/persona-ops-stack.md
  - concepts/stage-aware-lora-distribution-calibrated-selection.md
  - entities/voice-models/speech-swift.md
  - sweeps/2026-07-13-daily.md
  - @osint-wiki/concepts/active-project-research-routing.md
maturity: core
created: 2026-07-12
updated: 2026-07-24
---

## Relations

- @concepts/persona-audio-stack.md — Fish-Speech + LatentSync production stack
- @concepts/persona-ops-stack.md — persona orchestration context
- @concepts/stage-aware-lora-distribution-calibrated-selection.md — DCAL adoption methodology
- @osint-wiki/concepts/active-project-research-routing.md — federation brief-routing canon

## Raw Concept

Operator decision (2026-07-12): David persona **adoption briefs** from image-gen ingests should mirror into the TipDrop shared kit, alongside OSINT tool-eval **David/TipDrop** briefs. Local `briefs/` remains canonical; `tipdrop-workspace-kit/briefs/` is the shared handoff copy.

**Operator clarification (2026-07-24):** Claudio's laptop does **not** run the image/voice gen stack. Full ingest Phase-0 still audits license + size, but **do not clone repos onto this machine**. CONDITIONAL-GO install paths belong in the TipDrop/David brief only (David's host / CUDA RunPod). Weights and code clones stay off the wiki laptop unless the operator explicitly asks.

## Narrative

### What routes

Briefs with a **David install path** for the uncensored persona stack:

- ComfyUI custom nodes (Angelo, MCP, HOMA watch)
- FLUX/Wan LoRA and pose adapters (MatchingPose, DCAL)
- Audio stack decisions (Fish-Speech vs Audex/Qwen3-TTS)
- Inference accelerators / streaming TTS / long-video research sidecars (PSP, Faster IndexTTS, SGF, etc.)

### What does not route

- Operator-only phase-0 audits with no adoption verdict
- Wiki-only reference rows with no David action block
- Briefs destined for `cemini-prod` (xsp/pm lanes — OSINT only)

### What does not land on this laptop

- `git clone` of CONDITIONAL-GO repos under `~/Desktop/projects/` (or anywhere on Claudio's machine)
- Weight / checkpoint downloads for Wan, IndexTTS, SANA, FLUX, etc.
- Local ComfyUI / Fish-Speech / LatentSync runtime setup

### Routing rule

1. Write adoption brief locally: `briefs/YYYY-MM-DD_<slug>-adoption.md`
2. Frontmatter: `target: local-app`, `david: true`, `routing: tipdrop-workspace-kit`, `scp: false`
3. Run: `python3 scripts/route_david_adoption_brief.py`
4. Destination: `../projects/tipdrop-workspace-kit/briefs/<same-stem>-david.md`
5. Commit in **both** repos when the kit checkout exists

Config row: OSINT `scripts/active_project_brief_targets.yaml` → `david-persona-image-gen`.

### Distinction from OSINT David/TipDrop lane

| Lane | Source wiki | Brief home | Content |
|------|-------------|------------|---------|
| **TipDrop product tooling** | OSINT tool-eval ingests | `tipdrop-workspace-kit/briefs/` | MCP, OCR, skills, trading UI |
| **David persona gen stack** | Image-gen ingests | local `briefs/` + kit mirror | ComfyUI, LoRA, Fish-Speech, Wan |

Both land in the same kit `briefs/` folder with `-david` suffix; filenames disambiguate (`k157-…-david` vs `angelo-fourtune-adoption-david`).

## Snippets

> "After writing a David adoption brief, run `python3 scripts/route_david_adoption_brief.py` before closing the ingest session." [Source: operator pivot 2026-07-12]

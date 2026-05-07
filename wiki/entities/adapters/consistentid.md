---
title: ConsistentID
type: entity
tags: [adapter, identity-injection, consistentid, sdxl, tpami-2026]
keywords: [ConsistentID, multi-image identity, fine-grained identity, TPAMI 2026, attribute-decoupled identity, fine-grained ID adapter]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/pulid.md
  - entities/adapters/instantid.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@entities/adapters/ip-adapter.md
@entities/adapters/pulid.md
@entities/adapters/instantid.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md. **ConsistentID** is a TPAMI 2026 publication that competes with PuLID/InstantID specifically on the *fine-grained, multi-image* axis: combining several reference photos into a single fused identity vector that captures more than just the dominant frontal face.

## Narrative

### What it is

**ConsistentID** — fine-grained, multi-image identity-preserving adapter targeting SDXL backbones. Published TPAMI 2026 (preprint earlier on arXiv). The architectural distinction from IP-Adapter FaceID and PuLID is **attribute decoupling**: ConsistentID separates the face into per-region embeddings (eyes, nose, mouth, contour, hair) and combines them via a multi-attention fusion before injection.

The practical effect — claimed in the paper, partially corroborated by community use — is that ConsistentID better preserves *fine-grained* identity attributes (subtle eye shape, lip line, jaw contour) that holistic adapters miss when the reference is small or low-resolution.

### Why creators use it

[TENTATIVE — community use is still building]

- **Multi-image reference** — accepts a small set of reference photos rather than one canonical headshot. The fused identity is more robust to single-image biases (e.g., a single profile with strong shadow).
- **Better fine-detail preservation** on small face regions in the output (e.g. distinctive eye colour with iris flecks, lip-line asymmetry). The attention-decomposed embedding is the mechanism.
- **Composable with ControlNet** — same general slot as IP-Adapter / PuLID; usable in standard ComfyUI workflows once the custom node is installed.

### Limits

[TENTATIVE]

- **Newer than PuLID/InstantID** — less battle-tested; community workflows still consolidating.
- **SDXL only** as of 2026-05 release status. FLUX-native port unknown.
- **NSFW alignment** — same SFW-pretraining caveat as the rest of the family. Expect comparable failure mode on clothed-reference + nude-prompt.
- **Setup complexity** — the multi-image fusion adds a config layer that single-image adapters don't need; less plug-and-play.

### Role in 2026 production stack

[TENTATIVE]

- The community is still triangulating where ConsistentID fits relative to @entities/adapters/pulid.md and @entities/adapters/instantid.md. The likely landing zone is **persona pages where the reference set is multi-source** (e.g. five frames from a Wan 2.2 I2V extraction, or a Mickmumpitz 96-angle subset) — ConsistentID's multi-image fusion is the differentiator.
- For **single-image canonical face**, PuLID II remains higher-fidelity.
- For **landmark + pose-locked portrait**, InstantID + Canny remains the recipe.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- Production-tier viability on a 12-16 GB consumer GPU; community VRAM reports.
- Whether ConsistentID has been integrated into popular ComfyUI workflow templates as of 2026-05 or remains a custom-research node.
- Comparison benchmarks against PuLID II on the same multi-reference dataset — head-to-head needed before recommending as default.
- FLUX port status; if shipped, would change the FLUX adapter landscape.

## Snippets

> "ConsistentID (TPAMI 2026) — Multi-image, fine-grained — TPAMI 2026; new, less battle-tested."
> — @sources/synthetic-character-consistency-survey.md §3, identity-adapter taxonomy

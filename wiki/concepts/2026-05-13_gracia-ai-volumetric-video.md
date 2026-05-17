---
title: gracia.ai — Gaussian Splatting volumetric video
type: concept
tags: [volumetric-video, gaussian-splatting, 3dgs, 4dgs, generative-media, closed-saas, cross-wiki-stub]
keywords: [gracia.ai, gaussian splatting, 3dgs, 4dgs, 4D gaussian splatting, volumetric video, Andrey Volodin, Georgii Vysotskii, Prisma, EWOR, Karl Kani, Quest 3, Pico 4 Ultra, WebGPU, Unity, Unreal, virtual sets, post-production camera control, 50fps slow-motion, 1GB per minute]
related:
  - sources/headsup-3d-gaussian-head.md
  - concepts/video-identity-inheritance.md
maturity: draft
created: 2026-05-15
updated: 2026-05-17
cross-wiki-source: @osint-wiki/sources/eval-github-repos-2026-05-13.md
---

# gracia.ai — Gaussian Splatting volumetric video

## Relations

- @osint-wiki/sources/eval-github-repos-2026-05-13.md  (cross-wiki source)
- @sources/headsup-3d-gaussian-head.md — sibling 3D Gaussian Splatting research (Apple HeadsUp; head-only static reconstruction from multi-view captures)
- @concepts/video-identity-inheritance.md — video/generative-media hub; volumetric video is an adjacent surface

## Raw Concept

Cross-wiki stub routed from `@osint-wiki/sources/eval-github-repos-2026-05-13.md` during the 2026-05-13 14-repo eval (verdict: **REFERENCE-ONLY** — no clean Cemini build-track route). Deepened 2026-05-17 with web research (gracia.ai homepage + TechFundingNews funding coverage) to convert the stub from "one-line cross-route" to a proper landscape page.

## Narrative

### What gracia.ai is

A **closed-SaaS, full-stack 4D Gaussian Splatting (4DGS) infrastructure** for production-grade volumetric video. Founded by Andrey Volodin (CTO, ex-Prisma) and Georgii Vysotskii. The product line covers the capture → cloud-processing → editing → playback pipeline as a single integrated stack, not a model release. [Source: techfundingnews.com/gracia-ai-lands-1-7m-... (retrieved 2026-05-17)]

**4DGS** in gracia's framing extends 3D Gaussian Splatting (3DGS) with a temporal dimension — instead of reconstructing a single static scene from multi-view stills, it reconstructs a *dynamic* scene from multi-view video, so the splat field evolves frame-by-frame. The Karl Kani runway show is cited as "the world's first 4DGS runway experience."

### Pipeline + delivery surfaces

| Stage | Component |
|---|---|
| Capture | Multi-view rig at 50 fps |
| Processing | Cloud-side reconstruction |
| Editing | Studio-grade timeline + camera-control UI |
| Distribution | ~1 GB / minute container |
| Playback | Quest 3 / 3S, Pico 4 Ultra (standalone real-time); WebGPU on Mac + browsers; Unity / Unreal plugins for game-engine integration |

The 50 fps capture rate is positioned as enabling "ultra-smooth slow motion" playback with "minimal artifacts" — typical 4DGS demos at lower frame rates show temporal flicker, so the 50 fps choice is a quality differentiator, not a spec-sheet entry.

### Funding + traction

- **$1.2M** seed round, early 2024
- **$1.7M** follow-on round, December 2025
- Investors include EWOR and (per TechFundingNews) "one of NeRF's original pioneers"
- Customer mentions: Karl Kani (fashion runway), Hollywood productions, European entertainment brands, PortAventura theme park

### Build-track relevance — REFERENCE-ONLY, not a build-track tool

For this wiki's persona/character ops focus, gracia.ai is a **landscape reference** rather than a tool to deploy. The mismatch is structural, not incidental:

1. **Closed SaaS, not local weights.** Not open source — no model release, no self-host path, no LoRA fine-tune surface. Locally-runnable uncensored generative media (the workspace charter) does not intersect gracia's distribution model.
2. **Captured volumetric video, not generated.** Even if gracia were open, the pipeline reconstructs a *real captured scene*, not a generated persona from text or a reference image. The input is a multi-camera capture rig, not a prompt + LoRA + identity adapter. This is structurally adjacent to @sources/headsup-3d-gaussian-head.md (Apple HeadsUp), which has the same capture-rig dependency at the head-reconstruction level.
3. **VR/AR distribution surface, not social-media persona.** The output is Quest / Pico / WebGPU — a volumetric playback target. The persona/character-ops pipeline targets video clips for social distribution (Twitter/X, Instagram, TikTok), which is a different surface entirely.

### Why it still earns a page

Three forward-looking hooks make it worth tracking:

- **Volumetric persona horizon.** If consumer-capture rigs (or feed-forward 3DGS from monocular video) become viable, a persona's appearance could ship as a volumetric asset rather than a series of 2D clips. gracia's existence proves the production-grade end of that pipeline is already commercially deployed.
- **Karl Kani precedent.** "World's first 4DGS runway" is the first widely-publicized commercial 4DGS deployment in fashion. The fashion-runway use case is structurally close to character/persona presentation. Worth watching whether the pipeline gets cheaper / less capture-heavy over the next 12–24 months.
- **Sibling 3DGS research stack.** Apple HeadsUp (@sources/headsup-3d-gaussian-head.md) is the same family of techniques applied to head-only static reconstruction — the research-future bridge from gracia's full-scene 4DGS to single-photo persona 3DGS routes through this kind of feed-forward work.

### What's not covered (deliberately)

- gracia does not publish technical metrics for Gaussian count, training compute, or reconstruction quality on standard benchmarks — none of the press coverage at retrieval time exposed those numbers. The TechFundingNews + homepage coverage is product-shaped, not paper-shaped.
- Pricing is not public. Cost-savings claims in their marketing (e.g. "$50,000–$100,000 per avoided reshoot day", "30–50% character post-budget reduction") are vs. traditional VFX baselines, not vs. AI-video competitors.
- No published license terms for the Unity/Unreal plugins, the WebGPU player, or the captured content. Operator-asset ownership posture is unknown.

## Snippets

> "Footage captured at 50fps can now be played back in ultra-smooth slow motion with minimal artifacts, while preserving fine details. With files averaging 1GB per minute, Gracia is one of the first platforms to make large-scale volumetric video practical across devices."
[Source: gracia.ai homepage via techfundingnews.com (retrieved 2026-05-17)]

> "Gracia offers an end-to-end pipeline covering cloud processing, studio-grade editing, timeline and camera control, and dedicated plugins for Unity and Unreal. The system supports real-time playback on Quest 3/3S and Pico 4 Ultra, with WebGPU-based viewing on Mac and browsers."
[Source: techfundingnews.com/gracia-ai-lands-1-7m-... (retrieved 2026-05-17)]

> "REFERENCE-ONLY — Gaussian Splatting volumetric video. Genuinely interesting tech but no clean Cemini route. Cross-route as brief to image-gen-wiki (primary fit) and 3d-printing-wiki (volumetric-mesh-export angle)."
[Source: @osint-wiki/sources/eval-github-repos-2026-05-13.md (cross-wiki eval verdict)]

## Dead Ends

- **Self-hosting gracia's stack** — not on offer. Closed SaaS; no weights, no local install path, no community fork. Locally-runnable workspace charter rules this out as a build-track adoption.
- **Treating gracia as a clip-generator competitor** — wrong taxonomy. Gracia is a multi-view-capture reconstruction pipeline (real scene in → 4DGS asset out), not a T2V / I2V model (prompt in → clip out). It does not compete with Wan 2.2 / HunyuanVideo / LTX-2 / Seedance and shouldn't be benchmarked against them.

[CONFIRMED 2026-05-17] license posture: closed SaaS, not locally runnable. (Resolves the prior `[NEEDS VERIFICATION 2026-05-15]` tag.)

---
title: "AnyTalk: 3D speech animation for arbitrary characters (arXiv:2608.16143)"
type: source
tags: [paper, lipsync, 3d, blendshape, video-diffusion, watch]
keywords: [AnyTalk, AnyTalkRT, Character-specific Fine-tuning, CsF, blendshape, speech animation, KAIST]
related:
  - entities/lipsync/anytalk.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/liveportrait.md
  - concepts/persona-audio-stack.md
  - concepts/video-identity-inheritance.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-18-daily.md
maturity: draft
read_status: read
created: 2026-08-18
updated: 2026-08-18
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/lipsync/anytalk.md @entities/lipsync/latentsync.md @entities/lipsync/musetalk.md @entities/lipsync/liveportrait.md @concepts/persona-audio-stack.md @concepts/video-identity-inheritance.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-18-daily.md

## Raw Concept

- **Title**: AnyTalk: Speech Animation for Arbitrary Characters Leveraging a Video Generation Model
- **Authors**: Kwan Yun, Serin Yoon, Sunjin Jung, Jung Eun Yoo, Inyup Lee, Junyong Noh (KAIST / Sungshin)
- **Type**: arXiv:2608.16143 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.16143-anytalk-speech-animation-for-arbitrary-character.pdf`
- **URL**: https://arxiv.org/abs/2608.16143
- **Project**: https://serin-yoon.github.io/projects/anytalk/
- **Retrieved**: 2026-08-18
- **Code**: PDF says "The code is publicly available at AnyTalk" but gives **no GitHub URL**. Serin-Yoon user has no matching repo at ingest. Paper license CC-BY-NC-SA 4.0. No SPDX.

## Narrative

KAIST audio-driven **3D** speech animation for arbitrary blendshape characters **without any character animation data**. Existing 3D talking-head methods need paired audio–3D per mesh or force artists to re-rig to a fixed blendshape set. AnyTalk sidesteps that by borrowing a video-diffusion motion prior.

**Character-specific Fine-tuning (CsF)** adapts a pretrained video diffusion model on rendered stills of the 3D character paired with **zeroed audio embeddings** (no-motion). The video prior stays; the identity locks to the mesh. The resulting talking-head video is then **uplifted** to 3D by optimizing blendshape parameters. **AnyTalkRT** distills ~1,600 AnyTalk animations into a feed-forward net: 9.09 ms/frame (110 FPS) vs AnyTalk 3.12 s/frame, with comparable lip-sync (LSE-C 12.19 vs 11.74; LSE-D 2.96 vs 3.24 on one reported table).

This is not LatentSync. LatentSync / MuseTalk operate in 2D latent pixels on a source video or portrait. AnyTalk is a game/VR 3D-rig path. Image-gen production stays Fish-Speech → LatentSync; AnyTalk is the watch if a persona ever needs a real-time 3D mesh.

**Phase-0: WATCH HIGH** lipsync/persona. Project page only. Do not invent a GitHub. Image-gen local wire: none (`deferred`). Routed a game-dev brief for the 3D-character use case.

## Snippets

> "By fine-tuning on rendered images of the 3D character paired with zeroed-out audio embeddings (representing no motion), we eliminate the need for animation data while preserving the motion prior of large-scale video diffusion model."

[Source: arxiv-2608.16143, abstract]

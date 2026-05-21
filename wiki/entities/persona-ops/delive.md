---
title: "DeLive — Apache-2.0 system-audio capture + ASR for persona voice sync"
type: entity
tags: [persona-ops, asr, voice-sync, system-audio, real-time-subtitles, mcp-server, apache-2-0]
keywords: [DeLive, ASR, speech-to-text, system-audio capture, real-time subtitles, MCP server, persona-ops, voice synchronization, TTS audit trail]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/persona-ops/n8n.md
  - concepts/persona-ops-stack.md
maturity: draft
created: 2026-05-21
updated: 2026-05-21
cross-wiki-source: @osint-wiki/sources/multi-wiki-tool-eval-26url-2026-05-19.md
provenance:
  stub: true
  ingested_from:
    - briefs/2026-05-19_k54-tool-eval-imagegen-items.md
    - briefs/2026-05-20_2026-05-20_k55-delive-asr-persona-ops.md
---

## Relations

@concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/persona-ops/n8n.md @concepts/persona-ops-stack.md

## Raw Concept

Cross-wiki tool eval item routed from OSINT K54 + K55 batches. `XimilalaXiang/DeLive` — Apache-2.0 desktop app (TypeScript / Electron / React) capturing local system audio + translating to real-time subtitles via 12 ASR backends + 60+ languages. Adoption candidate for persona-ops voice/TTS synchronization workflows.

## Narrative

### Surface area

- Captures local **system audio** (not microphone — system output stream), enabling non-invasive TTS-output capture
- **12 ASR backends** for speech-to-text across **60+ languages**
- **Real-time subtitle rendering** overlay
- **MCP server + configurable Agent Skill** (disabled by default, Bearer-auth gated) for Claude Code access to transcription contexts

### Persona-ops application

1. **Voice/TTS synchronization** — capturing the system-audio stream from a persona's TTS output → real-time subtitle pipeline → text-form record of what the persona "said" → can be fed back into image-prompts for facial-expression / mouth-shape consistency
2. **Multi-language persona-ops** — 60+ languages means a single persona can run multi-language campaigns with consistent voice while ASR feeds a unified text-form audit trail
3. **Local-first** — system-audio capture happens on the local machine; no cloud round-trip for the ASR step (if a local backend is selected from the 12 available)

### MCP server + Bearer auth

The MCP server pattern is useful as a template for any image-gen tool that wants to expose its capability to Claude Code without giving up token-level auth. Default-disabled + Bearer-token gating is the right posture for surfaces touching sensitive content.

### License

Apache-2.0 — clean for IP-sale-readiness posture. Permissive; commercial modification allowed.

### Open questions

- **Local ASR backend hardware load**: hardware processing and latency implications of executing heavy local ASR models alongside active Electron instances — `[NEEDS VERIFICATION 2026-05-21]`
- **Which of the 12 ASR backends are local vs cloud?** Need to audit before deciding which to use in persona-ops where local-only is preferred — `[NEEDS VERIFICATION 2026-05-21]`

## Dead Ends

None yet — unevaluated beyond K54/K55 tool-eval surface.

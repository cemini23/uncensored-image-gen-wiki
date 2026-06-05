---
title: voicebox — Local-First AI Voice Studio
type: entity
tags: [voice-cloning, tts, mlx, fastapi, mcp-server, rust, mit, persona-ops]
keywords: [voicebox, tts-studio, voice-cloning, mlx-metal, paralinguistic-tags, mcp-server, persona-ops]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
maturity: validated
created: 2026-05-14
updated: 2026-06-05
phase_0_verdict: GO
phase_0_date: 2026-06-05
cross-wiki-source: "@osint-wiki/entities/tools/voicebox.md"
---

## Relations

@osint-wiki/entities/tools/voicebox.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md

## Raw Concept

Phase-0 audit 2026-06-05 — `jamiepine/voicebox`. Cross-wiki stub from K45 v3 eval (Adopt tier).

## Narrative

Local-first AI voice studio: clone, dictate, multi-engine TTS, MCP server. **MIT**, 29.3k★, pushed 2026-04-26. Seven TTS backends; **MLX/Metal** path for Apple Silicon; paralinguistic tags `[laugh]`, `[sigh]`.

### Phase-0 audit [CONFIRMED 2026-06-05]

| Check | Result |
|-------|--------|
| License | MIT |
| Domain fit | Persona-ops voice Layer-1 **alternative** to Fish-Speech for operators who want GUI + MCP |
| NSFW | Local-only — operator-controlled (unlike ElevenLabs) |
| MPS | First-class MLX marketing; desktop app + API |
| Risk | 428 open issues — pin release, don't track rolling main for production |

**Verdict: GO** — experiment alongside Fish-Speech; not an automatic replacement until NSFW voice quality A/B on persona reference clips.

## Snippets

> "The open-source AI voice studio. Clone, dictate, create."

[Source: github.com/jamiepine/voicebox README (retrieved 2026-06-05)]

## Dead Ends

None.

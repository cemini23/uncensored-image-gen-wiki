---
title: ComfyUI-MCP (agent-native ComfyUI control plane)
type: entity
tags: [custom-node, comfyui, mcp, agent, claude-code, workflow]
keywords: [comfyui-mcp, artokun, MCP server, Claude Code plugin, agent skills, Flux, Wan, local-first]
related:
  - entities/uis/comfyui.md
  - concepts/persona-ops-stack.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-07-11-daily.md
maturity: draft
created: 2026-07-11
updated: 2026-07-11
---

## Relations

@entities/uis/comfyui.md @concepts/persona-ops-stack.md @concepts/federated-daily-research-digest.md

## Raw Concept

Phase-0 audit 2026-07-11 on `artokun/comfyui-mcp` [Source: github.com/artokun/comfyui-mcp (retrieved 2026-07-11)].

## Narrative

**ComfyUI-MCP** is a **local-first MCP server + Claude Code plugin** exposing ~108 tools and packaged "skills" for ComfyUI graph authoring (Flux, Wan, Qwen, etc.). MIT license. ~357★; active maintenance (Jul 2026).

| Check | Result |
|-------|--------|
| License | MIT |
| Domain fit | ComfyUI orchestration / agent control plane |
| MPS / CUDA | Delegates to host ComfyUI — no separate GPU path |
| NSFW | Operator-controlled; no platform filter in MCP layer |
| Overlap | ComfyUI Manager + manual JSON — this adds **NL graph edit + agent batching** |

**Phase-0 verdict: WATCH (smoke-test)** — promising for Cursor-driven persona workflow iteration; verify against current ComfyUI + Angelo/Klein node set before relying on production graphs. No model weights shipped.

### Failure modes

- ComfyUI version skew breaks skill templates (fast-moving ecosystem).
- Agent-edited graphs may silently drop identity-adapter nodes — human review required.
- LAN/VPS modes expand attack surface if ComfyUI API exposed.

## Snippets

> "The local-first, agent-native control plane for ComfyUI — MCP server + Claude Code plugin. 108 tools, 29 AI skills (Flux · WAN · LT2.3 · Qwen · Ideogram4 · Krea2)."

[Source: github.com/artokun/comfyui-mcp repo description (retrieved 2026-07-11)]

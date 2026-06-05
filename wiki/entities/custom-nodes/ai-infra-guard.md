---
title: "AI-Infra-Guard (Tencent) — ComfyUI vulnerability detection [image-gen cross-route]"
type: entity
category: tool
tags: [entity, tool, comfyui-security, vulnerability-fingerprinting, defensive-ops, k44, steal-from-doc-level-pending-phase-0]
keywords: [ai-infra-guard, comfyui-vuln-detection, tencent, fingerprint-signatures, apache-2-with-attribution]
related:
  - entities/uis/comfyui.md
  - entities/custom-nodes/impact-pack.md
maturity: validated
created: 2026-05-14
updated: 2026-06-05
phase_0_verdict: STEAL-FROM
phase_0_date: 2026-06-05
cross-wiki-source: "@osint-wiki/sources/eval-tool-evaluation-cemini-multi-wiki-v3-2026-05-14.md"
---

## Relations

- @osint-wiki/sources/eval-tool-evaluation-cemini-multi-wiki-v3-2026-05-14.md — K44 source (doc-level verdict)
- @cybersecurity-wiki/entities/tools/ai-infra-guard.md — Cybersec-side primary entity
- @entities/uis/comfyui.md — the runtime these vulnerability-detection signatures target
- @entities/custom-nodes/impact-pack.md — sibling ComfyUI custom-node entity

## Raw Concept

K44 cross-route from Cybersec to Image-gen: AI-Infra-Guard's **ComfyUI vulnerability detection signatures**. ComfyUI is the dominant local image-gen runtime; this provides defensive-ops capability for exposed-ComfyUI instances. **Apache-2.0 with restrictive attribution clauses, claimed 3,700 stars**. K44 verdict: **Steal-from** (signatures only).

## Narrative

For image-gen-wiki, the relevant subset of AI-Infra-Guard is the ComfyUI-specific detection signatures and fingerprint databases — usable for:
- Auditing self-hosted ComfyUI deployments for known CVEs
- Identifying exposed configuration files in remote ComfyUI hosts (defensive intelligence)

**Caution**: ComfyUI is widely deployed by hobbyists with poor security hygiene; the signatures here apply to public-facing instances. Using detection signatures *against* third-party ComfyUI instances requires authorization (CFAA equivalent considerations). Image-gen-wiki use case is internal: audit your own deployments before exposing them.

See @cybersecurity-wiki/entities/tools/ai-infra-guard.md for full platform scope.

### Phase-0 audit [CONFIRMED 2026-06-05]

Repo: `Tencent/AI-Infra-Guard` — **Apache-2.0**, 3.8k★, pushed 2026-06-05. Documents **ComfyUI** among 100+ AI framework CVE fingerprints.

**Verdict: STEAL-FROM** — run against **operator-owned** ComfyUI instances before any LAN exposure. Not for unauthorized third-party scanning. Retain LICENSE/NOTICE per Apache attribution.

## Dead Ends

Adopting full red-team platform into image-gen build track — scope creep vs ComfyUI generation workflows.

## Snippets

> "Extract vulnerability detection logic specific to ComfyUI deployments."
[Source: @osint-wiki/sources/eval-tool-evaluation-cemini-multi-wiki-v3-2026-05-14.md ¶217]

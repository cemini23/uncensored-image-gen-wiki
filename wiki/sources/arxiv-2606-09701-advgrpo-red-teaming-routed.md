---
title: "AdvGRPO adaptive red teaming — routed (arXiv:2606.09701)"
type: source
tags: [paper, routed, llm-safety, red-team, grpo, cross-wiki]
keywords: [AdvGRPO, attacker-defender co-training, GRPO, GDPO, jailbreak, Microsoft AI Red Team, routed]
related:
  - concepts/grpo-i2v-post-training.md
  - concepts/cross-modal-jailbreak-dsr.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-06-10-daily.md
maturity: draft
read_status: read
created: 2026-06-10
updated: 2026-06-10
---

## Relations

Primary ingest target: `@cybersecurity-wiki/` (LLM red-team / jailbreak co-training). Dedup stub for image-gen daily digest.

## Raw Concept

- **Title**: Learning to Attack and Defend: Adaptive Red Teaming of Language Models via GRPO
- **Authors**: Blake Bullwinkel, Eugenia Kim, Amanda Minnich (Microsoft AI Red Team), Mark Russinovich (Azure)
- **Type**: arXiv:2606.09701
- **Location**: `raw-sources/arxiv-2606.09701-learning-to-attack-and-defend-adaptive-red-teami.pdf`
- **URL**: https://arxiv.org/abs/2606.09701
- **Retrieved**: 2026-06-10
- **Read status**: read (routed — not duplicated in generative-media narrative)

## Narrative

**Routed stub.** **AdvGRPO** — attacker–defender **co-training** with Group Relative Policy Optimization: dense multi-channel rewards (attack A, prompt P, think T, helpfulness H), **GDPO** decoupled advantage normalization, curriculum from single-turn → closed-loop multi-turn → alternating co-training. Produces transferable jailbreaks and stronger defenders vs PPO/DPO baselines (Self-RedTeam, AdvGame).

**Image-gen touchpoint only:** same **GRPO family** as @concepts/grpo-i2v-post-training.md (Wan I2V post-training) — different domain (LLM safety vs video reward). Relevant to operator awareness of adaptive attacks on any LLM prompt layer in persona ops (SillyTavern / captioning / DM bots), not to diffusion weights directly.

Full page belongs in cybersecurity wiki.

## Snippets

> "AI red teaming must continually adapt to evolving attackers and defenders."

> "We introduce AdvGRPO, a co-training framework that makes GRPO viable for joint attacker-defender optimization."

## Dead Ends

Not ingested as generative-media technique — no ComfyUI / Wan / TTS application.

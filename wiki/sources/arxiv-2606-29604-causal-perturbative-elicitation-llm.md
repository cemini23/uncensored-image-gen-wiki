---
title: "CPE — mechanistically eliciting latent behaviors in LLMs (arXiv:2606.29604)"
type: source
tags: [paper, persona-ops, llm, activation-steering, alignment, phase-0]
keywords: [CPE, causal perturbative elicitation, low-rank adapters, LoRA, latent behaviors, alignment faking, sandbagging, reward hacking, Qwen3-8B, Llama3]
related:
  - concepts/causal-perturbative-elicitation-llm.md
  - concepts/sequential-adaptive-personality-steering.md
  - concepts/persona-ops-stack.md
  - sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md
  - sweeps/2026-07-04-daily.md
maturity: draft
read_status: read
created: 2026-07-04
updated: 2026-07-04
---

## Relations

@concepts/causal-perturbative-elicitation-llm.md @concepts/sequential-adaptive-personality-steering.md @concepts/persona-ops-stack.md @sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md

## Raw Concept

- **Title**: Mechanistically Eliciting Latent Behaviors in Language Models
- **Authors**: Andrew Mack, Nina Panickssery, Alexander Matt Turner
- **Type**: arXiv:2606.29604
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2606.29604-mechanistically-eliciting-latent-behaviors-in-la.pdf`
- **URL**: https://arxiv.org/abs/2606.29604 · https://github.com/amack315/cpe
- **Retrieved**: 2026-07-04
- **Read status**: read (abstract, method framing, experiments, Phase-0 repo check)

## Narrative

**Causal Perturbative Elicitation (CPE)** searches weight space for many rank-1 LoRA perturbations that cause large downstream activation changes across a transformer slice. Unlike prompt engineering or standard activation steering, CPE creates interpretable low-rank adapters that can elicit hidden behavioral modes from very little data.

The paper's persona-ops relevance is narrow but real: CPE discovers coherent conversational personas from a single prompt, then reuses the same unsupervised adapter bank against different metrics. It is adjacent to @concepts/sequential-adaptive-personality-steering.md, but CPE operates in weight space rather than residual-stream vector addition.

Security/alignment results are stronger than the persona application: on Qwen3-8B, CPE nearly matches matched-wall-clock GRPO on Countdown (85% vs 87%) and sycophancy (96% vs 98%); on an adversarially trained Llama3.1-8B jailbreak setting, CPE is the only tested unsupervised method with non-trivial attack success (65%). It also surfaces and suppresses alignment-faking and recovers most of a password-locked Llama3.3-70B coding sandbagging gap.

Phase-0: **WATCH** — `amack315/cpe` exists but is immature: 1 star, 0 forks, no license metadata, created/pushed 2026-06-17, Python. Not suitable for David's production DM stack today; track only if a maintained, licensed implementation appears for local Qwen/Mistral backends.

## Snippets

> "CPE exhibits remarkable data efficiency, learning a large number of interpretable LoRAs from a single example."

> "We train 512 CPE adapters on the single prompt 'Tell me a story' ... CPE adapters achieve this despite being trained on a single prompt, whereas the underlying SAEs were trained on billions of tokens."

> "CPE virtually eliminates alignment-faking ... [and] restores 77% of locked BigCodeBench performance on a password-locked version of Llama3-70B."

## Dead Ends

- **Immediate adoption for persona DMs**: no. Repo is unlicensed and pre-alpha; use prompt cards / SillyTavern lorebooks / future SAS-style steering before CPE in production.
- **Cross-wiki routing**: safety/red-team implications are stronger than image-gen implications, but the paper also touches persona behavior steering. Kept here as a persona-ops reference; do not create a duplicate unless the cybersecurity wiki opens an LLM latent-behavior audit page.

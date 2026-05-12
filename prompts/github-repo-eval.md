# GitHub Repo Eval Prompt — Phase-0 Audit for Image-Gen Tools

A reusable prompt template for evaluating a list of GitHub repositories before adopting any of them into the image-gen workspace. Adapted from the Phase-0 audit pattern in `CLAUDE.md` (and the 3D-printing-workspace twin at `../../3d printing/prompts/github-repo-eval.md`).

## How to use

1. Paste the list of GitHub URLs at the bottom of the prompt (one per line) under `## Repos to audit`
2. Send the whole thing to Claude (in this workspace, claude.ai, or DeepSeek)
3. Claude runs the audit per repo and returns structured output
4. For GO / CONDITIONAL-GO repos: save the draft entity page section to `wiki/entities/<category>/<slug>.md` (e.g. `uis/`, `custom-nodes/`, `training-tools/`, `adapters/`, `models/`, `persona-ops/`)
5. NO-GO repos still get logged — paste the verdict block into `wiki/log.md` so future-you doesn't re-evaluate the same dud six months later

## The prompt (copy from here down)

---

You are auditing a list of GitHub repositories for adoption into an **uncensored local image generation** workspace. The workspace is a knowledge hub for a single operator running consumer hardware (RTX 40-class GPU or Apple Silicon M-series) and building toward LoRA-trained personas + ComfyUI/Forge production workflows. Laptop-only — no remote server, no team distribution.

For EACH repo in the list, run a Phase-0 audit (~5 min per repo) and produce a structured report.

### Tools to use (preferred order)

1. `mcp__exa__get_code_context_exa` — primary tool. Pulls README, file structure, recent commits, key files.
2. `mcp__exa__crawling_exa` — fallback for the LICENSE file, model card on HuggingFace, or specific docs pages if `get_code_context_exa` is incomplete.
3. `mcp__brave-search__brave_web_search` — for community signal: search `"<repo name> review"`, `"<repo name> issues"`, `"<repo name> Reddit"`, `"<repo name> ComfyUI"`. Borderline verdicts only — skip for clear GO or NO-GO.
4. `mcp__playwright__browser_navigate` — only when the repo links to a CivitAI / HuggingFace model card that requires login/age-gate to read license + restrictions.

### Audit checklist (run for every repo)

**1. License**

- What is the SPDX identifier? (MIT / Apache-2.0 / BSD / GPL / AGPL / proprietary / unknown)
- **Code vs. weights split**: many image-gen repos ship code under Apache-2.0 / MIT but the model weights ride a non-commercial research license. If the repo is a model release (or training/inference code that bundles weights), check the **weights license** separately — it is the one that governs commercial use, not the code license.
- **Red flag — Stability AI Community License** (any SD3 / SD3.5 derivative): non-commercial below ~$1M annual revenue floor but with attribution + reporting obligations; weight redistribution restricted.
- **Red flag — Black Forest Labs Non-Commercial License** (FLUX.1 Dev family, FLUX.2 Dev / Klein family): personal-use only; commercial use requires paid BFL license. (FLUX.1 Schnell + Chroma1-HD are Apache-2.0 — the safer FLUX-lineage choice.)
- **Red flag — research-only / non-commercial weights** (Kwai Kolors split-license precedent — code Apache-2.0, weights research-only; same pattern hits PuLID, several ByteDance + Tencent + Alibaba releases).
- **Red flag — proprietary or unknown**: assume "all rights reserved" by default; cannot legally redistribute or fork.
- **AGPL**: usually fine for local laptop use; problematic only if the repo runs a hosted inference server you're exposing publicly.

**2. Maturity**

- Star count
- Last commit date (red flag: >6 months stale for ComfyUI custom nodes — the upstream churn cycle is fast; >12 months stale for everything else *unless* feature-complete and stable — note this distinction)
- Open vs closed issue ratio (red flag: many open issues with no maintainer responses, especially "X stopped working on ComfyUI vN" issues)
- Maintainer activity (recent comments in issues / PRs / Discord links)
- Release cadence — is there a tag/release history, or just rolling main?

**3. Domain fit** — does this repo fit one of these slots:

- **Inference UI** — ComfyUI fork, Forge / reForge, A1111 / SD.Next, InvokeAI, Fooocus, SwarmUI, Krita-AI-Diffusion
- **ComfyUI custom node** — extends ComfyUI with new nodes (adapters, post-processing, schedulers, workflow utilities)
- **Training tool / fine-tuning script** — Kohya sd-scripts, kohya_ss GUI, ai-toolkit, OneTrainer, Musubi Tuner, FluxGym, diffusers fine-tune scripts, axolotl-flavored image trainers
- **Identity adapter / consistency tool** — IP-Adapter, PuLID, InstantID, ConsistentID, InfiniteYou, PhotoMaker, FLUX.1 Redux / Kontext, CharaConsist, ASemConsist, BFS LoRA family
- **Model release (image)** — base model or fine-tune: SDXL / Pony / Illustrious / NoobAI / FLUX.1 / FLUX.2 / Z-Image / Qwen-Image / Anima / SANA / Playground / Kolors / ERNIE-Image / PixArt-Σ / Chroma
- **Model release (video)** — Wan, HunyuanVideo, LTX, Mochi, CogVideoX, Seedance, FramePack, AnimateDiff
- **Quantization / optimization tool** — Nunchaku / SVDQuant, bitsandbytes for diffusers, GGUF converters, torchao, TensorRT-LoRA
- **Upscaler / post-processing** — ESRGAN family, SUPIR, Topaz wrapper, face restoration (CodeFormer / GFPGAN), detailers
- **Workflow / orchestration** — n8n flows, ComfyUI API wrappers, batch generators, prompt-management tools
- **Persona-ops tool** — Postiz, SillyTavern, Fish-Speech / F5-TTS / Qwen3-TTS, anti-detect browser scripts, social-post schedulers
- **Marketplace / aggregator tool** — CivitAI scrapers, HF model managers, LoRA library managers, ComfyUI Manager forks
- **De-censoring / abliteration** — abliterated text encoders, SLERP/TIES/DARE merging scripts, LoRA-injection toolkits for safety-bypass
- **Doesn't fit** → NO-GO (note category and skip remaining audit steps)

**4. Failure mode for class** (run the matching one based on §3)

- **Inference UIs**: Hardcoded CUDA assumption (no MPS / no ROCm)? Update cadence vs upstream Diffusers? Plugin-compatibility breakage history (ComfyUI v0.3.x → v0.4.x ate plugins)? Backend-API stability?
- **ComfyUI custom nodes**: Maintained for current ComfyUI release (check last commit vs latest ComfyUI tag)? Depends on a model that's been pulled / unlisted from CivitAI / HF? Pulls in heavy dependencies (transformers, accelerate, xformers, onnxruntime-gpu) that conflict with base ComfyUI venv? Bundles model weights directly (license risk) vs. downloads on first use?
- **Training tools**: Explicit VRAM requirements documented? Apple Silicon (MPS) support — first-class, community-fork, or "won't fix"? Output format compatibility (safetensors vs ckpt; LoRA-A1111 vs LoRA-Kohya vs diffusers LoRA vs PEFT)? Multi-GPU / DeepSpeed / accelerate config required? Resume-from-checkpoint working?
- **Identity adapters / consistency tools**: Which base model is it bound to (SDXL-only / FLUX.1-only / FLUX.2-only / DiT-class)? Does the ported version for newer base models exist, or is the user stuck on the original base? VRAM overhead on top of base model? Pixel-quality drop at high adapter weights?
- **Model releases (image / video)**: Weights license vs code license (re-check §1)? Base model derivative chain (SDXL → Pony → fine-tune-of-fine-tune inherits Stability's terms)? Censorship tier at base (per @concepts/censorship-tier-taxonomy.md)? Risk of takedown if hosted on a moderation-active platform? Architecture compatibility with existing tooling (ComfyUI Day-0 support? Kohya training support? GGUF quants available?)?
- **Quantization / optimization tools**: Which GPU vendors / architectures (INT4 RTX 30/40-series, NVFP4 Blackwell, MPS on Apple Silicon)? Does it support the model class you care about (FLUX, SDXL, Z-Image)? Quality loss at advertised compression ratios?
- **Upscalers / post-processing**: Self-contained vs requires ComfyUI host? GPU vs CPU fallback? Output resolution ceiling? Face restoration vs detail-preservation trade-offs?
- **Workflow / orchestration**: Local-only or requires cloud credentials? Anti-detect / browser-automation pieces — platform-ToS risk (Twitter/X, Instagram, TikTok, Reddit policies)? Account-recovery story if a managed account is banned?
- **Persona-ops tools**: Self-host vs SaaS? Local LLM compatible (Ollama / llama.cpp / vLLM endpoints) or hosted-API-locked? Voice quality on NSFW prompts (hosted TTS APIs increasingly NSFW-hostile in 2026)? Platform-ToS risk for any included automation?
- **Marketplace / aggregator tools**: ToS risk against CivitAI / HF / Reddit (rate-limit scraping, bulk download)? API-key required? Whose API keys does it use (yours, hardcoded, OAuth)?
- **De-censoring / abliteration**: Which base models does it claim to work on? Reproducibility — does the README cite specific abliterated checkpoints on HF, or is it "vibes"? Legal risk for redistribution of de-censored derivatives of restricted base models?

**5. Wiki coverage check** — scan `wiki/entities/<all-subtrees>/*.md` (currently: `uis/`, `custom-nodes/`, `training-tools/`, `adapters/`, `models/`, `persona-ops/`, `personas/`, `marketplaces/`, `hardware/`) for parallel implementations or prior NO-GO rejections of the same tool. Also check `wiki/concepts/*.md` for relevant technique pages that the repo would extend.

### Output format (per repo)

```
=== <repo-owner>/<repo-name> ===
URL: https://github.com/<owner>/<repo>
Code license: <SPDX or "unknown">
Weights license (if model release): <SPDX / custom / N/A>
Last commit: <YYYY-MM-DD>
Stars: <N> | Open issues: <N>
Domain fit: <category from §3, or "doesn't fit">

Failure-mode-for-class check:
- <bullet 1>
- <bullet 2>
- <bullet 3 if relevant>

Wiki coverage: <"no parallel" | "duplicates @path" | "prior NO-GO @path">

Verdict: GO | CONDITIONAL-GO | NO-GO

Reasoning (1-3 sentences): <...>

--- DRAFT ENTITY PAGE (only if GO or CONDITIONAL-GO) ---
File: wiki/entities/<category>/<slug>.md

---
title: <Tool Name>
type: entity
tags: [image-gen, <category-tag>]
keywords: [<3-5 fine-grained search terms>]
related: [<any wiki page that should backlink — leave empty if none>]
maturity: draft
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
---

## Raw Concept
Sourced from Phase-0 GitHub audit on <YYYY-MM-DD>. Repo: https://github.com/<owner>/<repo> @ <commit-sha>.

## Narrative
<2-4 sentence summary: what it does + key strengths + key risks + verdict reasoning + which base model(s) it binds to + Apple Silicon / consumer GPU compatibility note>

## Snippets
[Source: github.com/<owner>/<repo> — README]
> <key README quote, if useful>
```

### Important rules

- **Be skeptical of README claims**: READMEs are marketing. Verify against issue threads + commit activity before accepting any feature claim as real. Especially watch for: claimed Apple Silicon support that turns out to be Issue #N "doesn't work on M3 Max"; claimed FLUX.2 support that turns out to be FLUX.1-only legacy code.
- **Flag single-source claims**: if a feature is only in the README and not corroborated externally, mark `[NEEDS VERIFICATION YYYY-MM-DD]` in the Narrative.
- **Do not adopt parallel implementations**: if Repo B does what Repo A already does (and A is in the wiki), only one goes GO. Justify which. Common collisions: identity-adapter forks (PuLID variants), training-tool wrappers (Kohya GUI forks), ComfyUI custom-node forks of upstream nodes.
- **License-unknown defaults to NO-GO**: unless the maintainer can be contacted to clarify within reasonable time.
- **Weights-license trumps code-license for model releases**: if code is Apache-2.0 but weights are research-only, the verdict for commercial-leaning workflows is CONDITIONAL-GO at best, with the commercial-use restriction called out in the Narrative.
- **NSFW-capability is in scope** — this workspace is explicitly about uncensored generation. Do NOT downgrade a verdict because a tool enables NSFW output. DO call out platform-ToS risk if the tool ships in a workflow that touches social platforms.
- **Cost discipline**: max 2 Exa calls per repo (one `get_code_context_exa`, optional one `crawling_exa` for LICENSE / model card). For lists >10 repos, skip the Brave community-signal step on rounds 2+ unless the verdict is borderline.
- **Order of report**: list all GO repos first, then CONDITIONAL-GO, then NO-GO. Sort within each tier by domain fit + maturity.

### When all repos are processed, end with a summary block

```
=== Summary ===
Total: <N>
GO: <count> — list of names
CONDITIONAL-GO: <count> — list (with the conditions — usually license-driven)
NO-GO: <count> — list (with one-line reason each)
Most interesting finding: <one-sentence note>
License-flag count: <N repos with Stability / BFL / research-only weights>
Apple-Silicon-compatible count: <N of GO/CONDITIONAL-GO that work on MPS without community fork>
```

---

## Repos to audit

(Paste GitHub URLs below, one per line — example format:)

```
https://github.com/example/foo
https://github.com/example/bar
```

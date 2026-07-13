# Image + Voice/Audio Generation Research Workspace — Schema

This file is the **schema**: it tells you (the LLM) how to operate this workspace. Everything else is either a raw source, a wiki page, or a meta file. Read this on every session start. Active workstreams + open decisions live in `ROADMAP.md`, not here.

## Purpose

Local knowledge hub for **uncensored local generative-media** research — image, video, **voice/TTS, lipsync, music, and sound effects** — model cataloging, workflow tooling, and persona/character ops. A librarian that **manages, curates, and applies** that knowledge.

Scope as of 2026-05-13 (expanded from image-only):

- **Image gen** — T2I models, identity adapters, LoRA training, ComfyUI/Forge/A1111 workflows (existing core)
- **Video gen** — Wan / HunyuanVideo / LTX / CogVideoX / Mochi / Seedance; video-LoRA; latent chaining (existing)
- **Voice & audio gen** — TTS / voice cloning (Fish-Speech, CosyVoice, Kokoro, etc.), lipsync (LatentSync, MuseTalk, Wav2Lip), music gen (ACE-Step, MusicGen, Stable Audio Open), foley/SFX (Stable Audio Open, AudioLDM, Tango 2) — **NEW**
- **Persona/character ops** — orchestration (n8n / SillyTavern / Postiz), monetization, payment rails, legal landscape (existing)

Operating verbs:

- **Manage** — inventory raw sources (model cards, GitHub READMEs, CivitAI/HF pages, papers, deep-research outputs, voice-clone repos); track what's been read, extracted, and applied
- **Curate** — pull relevant fragments out of raw sources; structure them as interlinked wiki pages on models, tooling, hardware, techniques, and ops stacks
- **Apply** — route findings to a real workflow:
  - **claude.ai / DeepSeek** — research synthesis, model comparison reasoning, prompt engineering help
  - **ComfyUI / Forge / A1111** — copy-paste prompts, node graphs, LoRA recipes into local inference UIs
  - **Local audio pipeline** — Fish-Speech / CosyVoice / LatentSync / MusicGen / Stable Audio Open run via Python/CLI + ComfyUI audio nodes where available; muxed with FFmpeg under n8n orchestration
  - **Local laptop workflows** — manage LoRA + voice-clone collections, organize generated outputs (image / video / audio), plan persona rollouts

This is a laptop-only workspace. No remote servers, no team distribution. Everything lives on a single laptop.

## Architecture — three layers

1. **Raw sources** — immutable. Canonical archive: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/` via OSINT `archive_raw_to_egress.sh`. Legacy `research to be indexed/processed/` may still hold older docx.
   - PDFs (academic papers on diffusion, segmentation, generation, TTS, vocoders, lipsync)
   - DOCX (deep-research dumps from claude.ai / Gemini / DeepSeek)
   - GitHub repo snapshots (ComfyUI custom nodes, training scripts, LoRA collections, TTS/voice-clone repos, lipsync repos, audio-gen repos)
   - Model cards (Hugging Face, CivitAI) saved as `.md`
   - Reference audio samples (10-30s voice-clone reference clips; not committed)
   - **Drop pattern**: `research to be indexed/` → ingest → archive to egress-fi (local copy removed on success)

2. **The wiki** — LLM-written, human-read. Lives in `wiki/`. Structured pages on models (image / video / voice / lipsync / music / SFX), UIs, custom nodes, hardware, techniques, marketplaces.

3. **The schema** — this file.

Staging/output lives outside the wiki:
- `briefs/` — polished deliverables ready to use elsewhere (gitignored): model comparison tables, setup runbooks, persona consistency playbooks, monetization case studies, audio-pipeline runbooks. Pre-existing briefs from this workspace's LIGHT-mode era live here (5 deep-research outputs).
- `outputs/` — generated images, video, and audio artifacts (gitignored or kept local; not part of the knowledge layer)
- `docs/` — third-party reference docs (e.g. `docs/superpowers/`); read-only, not curated by this workspace
- `research to be indexed/` — transient drop zone for new raw sources (gitignored)
- `LESSONS.md` — meta-lessons about *how we work* (distinct from `wiki/log.md`)
- `hot.md` — ephemeral session-state cache (gitignored)
- `ROADMAP.md` — active workstreams + open decisions (tracked)

The legacy `notes/` folder was deleted 2026-05-11 when its content migrated into `wiki/entities/`. Don't recreate it — write wiki pages directly.

## Folder layout

```
Image gen/
  CLAUDE.md                    # this file — the schema
  LESSONS.md                   # meta-lessons (how we work)
  ROADMAP.md                   # active workstreams + decisions + done log
  hot.md                       # session-state cache (gitignored)
  .env.example                 # env-var template (commit this)
  .env                         # actual keys (gitignored — never commit)
  research to be indexed/      # transient drop zone (gitignored)
    processed/                 # legacy archive of post-ingest docx originals (raw-sources by another name)
  raw-sources/                 # archived raw source corpus (gitignored; new ingests go here)
  briefs/                      # polished deliverables (gitignored)
  outputs/                     # generated images / video / audio / intermediates (local only)
  docs/                        # third-party reference docs (read-only)
  wiki/                        # canonical wiki
    index.md                   # content-oriented catalog of all wiki pages
    log.md                     # append-only chronological operations log
    sources/                   # one page per ingested source
    entities/                  # models, UIs, custom nodes, marketplaces, hardware, accounts/personas
      models/                  # image + video diffusion/DiT models
      voice-models/            # TTS + voice-cloning models (Fish-Speech, CosyVoice, Kokoro, etc.)
      lipsync/                 # audio-driven mouth-movement models (LatentSync, MuseTalk, Wav2Lip)
      music-models/            # text-to-music generators (ACE-Step, MusicGen)
      sfx-models/              # foley / sound-effect / text-to-audio (Stable Audio Open, AudioLDM, Tango 2)
      adapters/ training-tools/ custom-nodes/ uis/ hardware/ marketplaces/ persona-ops/ personas/
    concepts/                  # techniques, methodologies, workflows, ops strategies
    runbooks/                  # practical end-to-end guides (tracked, unlike briefs/)
  scripts/                     # wiki_lint.py, wiki_gap_detect.py, preingest_check.py
  prompts/                     # reusable prompt templates (deep-research-prompt.md, github-repo-eval.md, etc.)
  .claude/                     # Claude Code per-project state (gitignored)
  .playwright-mcp/             # playwright session storage (gitignored)
```

Pages can be nested inside `entities/` when `Domain > Topic > Subtopic` hierarchy is warranted (e.g. `entities/models/pony-v6.md`, `entities/voice-models/cosyvoice2.md`, `entities/lipsync/latentsync.md`, `entities/music-models/musicgen.md`, `entities/uis/comfyui.md`, `entities/custom-nodes/ipadapter-plus.md`, `entities/marketplaces/civitai.md`). `concepts/`, `sources/`, and `runbooks/` are flat by convention.

## Wiki page format

Every wiki page is a markdown file with YAML frontmatter + structured sections.

### Frontmatter (required)

```yaml
---
title: Human-readable page title
type: source | entity | concept | brief
tags: [coarse, category, labels]
keywords: [fine, grained, search, terms]
related:
  - entities/models/pony-v6.md
  - concepts/example-concept.md
maturity: draft | validated | core
created: 2026-05-06
updated: 2026-05-06
---
```

- `type` determines section template
- `maturity`: `draft` → `validated` (cross-referenced + tested in real generation runs) → `core` (battle-tested source of truth). Move up (occasionally down) as evidence warrants
- `related[]` is **bidirectional**: if A lists B, B must list A
- `created` / `updated`: ISO dates; bump `updated` on meaningful body changes

### Body sections (in order, include only what's relevant)

- `## Relations` — inline list of `@path/to/page.md` annotations matching `related:` frontmatter
- `## Raw Concept` — provenance. For source pages: title/author/retrieval-date/filename/URL. For entity/concept pages: what prompted this page, which sources synthesized into it
- `## Narrative` — the body. Prose, tables, structured data, prompt examples, node graphs. Concept pages: synthesized understanding, neutral, well-sourced — opinion belongs in briefs, not concept pages
- `## Snippets` — verbatim quotes / prompt strings / sample workflows / model card excerpts with citations
- `## Dead Ends` (optional) — what was tried + why it failed + what was learned

### Page-type quick reference

- **Source page** (`wiki/sources/<slug>.md`) — one per ingested source. Raw Concept fields: title / author / type / location / retrieved / pages / read-status (skimmed | read | deep-read | unread-stub).
- **Entity page** (`wiki/entities/<category>/<slug>.md`) — image/video models (Pony, Flux, Wan), **voice/TTS models** (Fish-Speech, CosyVoice, Kokoro), **lipsync models** (LatentSync, MuseTalk, Wav2Lip), **music-gen models** (ACE-Step, MusicGen), **SFX/foley models** (Stable Audio Open, AudioLDM, Tango 2), UIs (ComfyUI, Forge), custom nodes, hardware (GPUs, quantization formats), marketplaces (CivitAI, Hugging Face), accounts/personas (one page per persona being managed). Raw Concept: what prompted the page + which sources synthesize into it.
- **Concept page** (`wiki/concepts/<slug>.md`) — techniques (LoRA training, ControlNet, IP-Adapter, voice cloning, lipsync pipelines), workflows (img2img loops, upscaling pipelines, audio-pipeline mux), de-censoring techniques, persona-consistency methods, monetization strategies. Raw Concept: the question or topic the page answers.
- **Brief page** (`briefs/<YYYY-MM-DD>_<slug>.md`) — deliverable. Body sections: `## Target` (claude.ai | DeepSeek | ComfyUI | local-app) / `## Summary` / `## Body` / `## Sources`.

## Cross-link + citation conventions

**Cross-links** (`@path` syntax):
- Use `@path/to/page.md` inline (no leading slash, relative to `wiki/`)
- Bidirectional: A → B and B → A both required
- Stub pages preferred over orphan mentions: if a topic comes up without a page, create a stub

**Citation tags**:
- Source page: `[Source: filename.pdf p.5]`
- External URL: `[Source: https://... (retrieved YYYY-MM-DD)]`
- GitHub repo: `[Source: github.com/owner/repo @ <sha>]`
- CivitAI / HF model card: `[Source: civitai.com/models/12345 (retrieved YYYY-MM-DD)]`
- Multiple: `[Sources: filename.pdf p.5, github.com/foo/bar]`

**Claim confidence tags**:
- `[CONFIRMED]` — ≥2 independent sources, OR personally tested (generated successfully on my hardware)
- `[TENTATIVE]` — single source or untested
- `[NEEDS VERIFICATION YYYY-MM-DD]` — plausible but untested. **Always include the date** so staleness can be flagged
- `[RETRACTED]` — previously believed, now disproven (model deprecated, new version supersedes, etc.). Keep in place with a note; don't delete

## Related Wikis

When a query needs data from another wiki, reference it using the `@wiki-alias/path/to/page.md` syntax. The LLM resolves these by reading the other wiki's files directly.

Paths below are relative to this CLAUDE.md file's directory. Resolve `../` against this file's location to get the absolute path.

| Alias | Path | Description |
|-------|------|-------------|
| `osint-wiki` | `../../OSINT WORKSPACE/wiki/` | Financial research, quant finance, prediction markets, CeminiSuite, RL for trading |
| `gambling-wiki` | `../Gambling wiki/wiki/` | Sports betting, casino, poker, DFS, best ball |
| `image-gen-wiki` | `wiki/` | Uncensored local generative media — image, video, **voice/TTS, lipsync, music, SFX** — model cataloging, ComfyUI, LoRA, persona/character ops. (Workspace dir name + alias retained for backwards-compatibility; scope expanded 2026-05-13 to cover voice/audio gen.) |
| `seo-wiki` | `../SEO:GEO B&M Business/wiki/` | Local SEO, GBP optimization, GEO/AEO, web design, social media, creator marketing |
| `3d-printing-wiki` | `../3d printing/wiki/` | FDM/FFF printing, Bambu, materials, slicers, print farms, store ops |
| `cybersecurity-wiki` | `../Cybersecurity wiki/wiki/` | Cybersecurity research — offensive security, defensive operations, certifications, threat actors. Shared territory: deepfakes + adversarial-image attacks when those surfaces appear in pentest scope |

### Cross-wiki link syntax

- Use `@wiki-alias/path/to/page.md` for cross-wiki references (e.g., `@seo-wiki/concepts/geo-aeo.md`)
- Bidirectional: if Image Gen page A references SEO wiki page B, add a matching `@image-gen-wiki/...` backlink on page B
- When creating a stub in another wiki, note the cross-wiki dependency in `## Relations`

### Using federation wikis for unified search

`cemini-librarian` kb-server **decommissioned 2026-06**. Query wikis via local Read/grep; see `@osint-wiki/meta/librarian-decommission-2026-06-14.md`.

## Operations

### Ingest (adding a new source)

1. New source dropped into `research to be indexed/`
2. **Run `python3 scripts/preingest_check.py`** — detects duplicates by sha256 / arXiv / DOI / URL / filename / title against the existing `wiki/sources/` index. Verdicts: `DUPLICATE` (do not ingest without deciding to supersede / fold / re-download), `LIKELY` (human review), `NEW` (proceed)
3. Read the source (or relevant sections for long PDFs / repo READMEs / model cards)
4. **Discuss key takeaways with the user before writing**
4b. **Cross-wiki routing check** — before writing pages, evaluate whether the source contains off-topic content more relevant to another wiki (@osint-wiki, @seo-wiki, or @3d-printing-wiki). If so:
   - Call `python3 "../../OSINT WORKSPACE/scripts/cross_wiki_route.py"` (from this repo) to create a stub page or brief in the correct wiki, piping content via stdin — requires the private `osint-wiki` checkout as a sibling directory
   - Use `--type page` for substantive material, `--type brief` for tangential material
   - **When in doubt, prefer a brief over a stub** — briefs are cheaper and don't create maintenance burden in the target wiki
5. Create `wiki/sources/<slug>.md` — frontmatter + Raw Concept + short Narrative
6. Identify entities + concepts the source touches. For each:
   - If page exists: update it, add `related:` backlink, bump `updated:`
   - If no page: create a stub. Real content accumulates over subsequent ingests
7. Update `wiki/index.md` — add rows for new pages
8. Append to `wiki/log.md`: `## [YYYY-MM-DD] ingest | <source title>` with bullets of what changed
9. **Archive raw to egress-fi**: `bash "../../OSINT WORKSPACE/scripts/archive_raw_to_egress.sh" --wiki-id image-gen "research to be indexed/<filename>"` — update source page `Location`
10. Update `ROADMAP.md` if the ingest opens new follow-ups; stage briefs in `briefs/` if the ingest produced something actionable
11. A single ingest must touch 3-15 pages. If it touches 0 new pages, ask whether the source is worth ingesting

### Query (answering a question)

1. Read `wiki/index.md` first to locate relevant pages
2. Read those pages; follow `@relations` where useful
3. Synthesize the answer with inline citations to source pages and raw sources
4. **OOD signal**: if the wiki doesn't contain a real answer, say so explicitly. Don't fabricate from tangential matches. Offer to ingest sources that would fill the gap
5. **File answers back**: if the query produced a valuable synthesis, file it as a new concept page or brief. Don't let insights die in chat
6. Append a query entry to `log.md` if substantive

### Lint (periodic health check)

Run `python3 scripts/wiki_lint.py` on demand. Mechanical checks:

- **Orphans** — pages with zero inbound `related:` references
- **Bidirectional gaps** — A lists B as related but B doesn't list A
- **Dangling links** — `related:` paths that don't resolve
- **Cited-unread stubs** — source pages with `read_status=unread-stub` and ≥1 inbound edge
- **Frontmatter quality** — missing `type`/`maturity`/mismatched `updated`
- **Stale `[NEEDS VERIFICATION YYYY-MM-DD]` tags** (≥7 days old by default)

Human/LLM judgment still needed for:
- **Contradictions** — two pages making incompatible claims (e.g. "Pony V6 is censored at base" vs "Pony V6 is uncensored at base"). Flag with `[NEEDS VERIFICATION]` and note on both pages
- **Stale claims** — superseded by newer model versions / fine-tunes. Move to `[RETRACTED]` with pointer

### Gap detection

Run `python3 scripts/wiki_gap_detect.py` on demand. Surfaces:

- **Type A** — Cited-unread stubs (≥2 inbound + `read_status=unread-stub`); proposes Exa query
- **Type D** — Stale `[NEEDS VERIFICATION YYYY-MM-DD]` (≥7d old)
- **Type E** — Thin concept pages (`## Narrative` <100 words)

Tier 1 is descriptive only — produces a candidate list, doesn't fetch via Exa. The user picks; the LLM executes.

## External research — MCP tools

When the wiki + raw sources can't answer, or when verifying an unverified URL:

| Tool | When to use |
|------|-------------|
| `mcp__brave-search__brave_web_search` | Quick targeted lookup — fact-check, find a primary source URL, find recent forum discussions |
| `mcp__brave-search__brave_news_search` | Recent news on model releases, regulatory changes, marketplace policy shifts |
| `mcp__exa__web_search_exa` | Higher-signal web search for technical content (papers, model cards) |
| `mcp__exa__crawling_exa` | Pull clean LLM-friendly content from a known URL — turns `[Source: https://...]` into verifiable text for `## Snippets` |
| `mcp__exa__get_code_context_exa` | GitHub repo context — README, structure, key files. Primary tool for repo evaluation. |
| `mcp__exa__deep_researcher_start` / `_check` | Async multi-step research — novel concept-page bootstrapping, model-landscape surveys |
| `mcp__plugin_context7_context7__resolve-library-id` + `query-docs` | Up-to-date docs for ComfyUI, Diffusers, HuggingFace transformers, training libs (Kohya, sd-scripts) |
| `mcp__playwright__browser_navigate` (+ snapshot, click, etc.) | Interactive browsing of CivitAI, Hugging Face, GitHub, ComfyUI Manager — required for model pages, gallery scraping, login-gated content |

**Workflow integration**:
- **Ingest**: when a source cites a URL, prefer `crawling_exa` to pull cited page directly into `## Snippets`
- **Query (OOD)**: before declaring a wiki gap, run `web_search_exa` or Brave. If results converge, ingest the best 1-2 hits as new source pages
- **GitHub-repo eval**: `get_code_context_exa` + Phase-0 audit pattern (below) — see also `prompts/github-repo-eval.md`
- **Model discovery**: Playwright is often required because CivitAI gates content behind login + age confirmation

Cost discipline: Exa is a paid API. Default `numResults: 3-5` for routine queries; `deep_researcher_*` reserved for genuine multi-source synthesis.

## Distribution rules

Material ready to leave the wiki goes through `briefs/` first:

- **→ claude.ai** — copy the relevant brief body into a Claude conversation for research synthesis, prompt help, business decisions
- **→ DeepSeek** — same pattern, via DeepSeek API or web UI (see `.env.example` for `DEEPSEEK_API_KEY`)
- **→ ComfyUI / Forge / A1111** — paste workflow JSONs, prompts, LoRA recipes from `## Snippets` into the local UI. Manual transfer.
- **→ Audio pipeline (Fish-Speech / CosyVoice / LatentSync / MusicGen / Stable Audio Open)** — copy CLI commands, Python snippets, n8n flow JSONs from `## Snippets` into the local audio pipeline (run via venv/conda + FFmpeg post-mux). ComfyUI audio nodes where mature, external CLI otherwise.
- **→ David / TipDrop shared kit** — persona adoption briefs mirror to `../projects/tipdrop-workspace-kit/briefs/*-david.md` via `python3 scripts/route_david_adoption_brief.py` (see @concepts/david-adoption-brief-routing.md)
- **→ outputs/** — generated images, video, and audio stay local, gitignored

No remote server, no scp, no team distribution. Everything stays on this laptop.

## Working method

- Search the wiki first. Raw sources second. External sources last (via MCP)
- Prefer paraphrase + cite over raw quote. Quotes go in `## Snippets` with full citation
- When stress-testing a claim, actively look for disconfirming evidence (e.g. "Flux is uncensorable" — find threads where someone de-censored it)
- Flag single-source claims explicitly
- File insights into wiki pages or briefs before they disappear from chat
- For commercial decisions (model licensing, marketplace rev share, persona platform choice), be extra rigorous about provenance — wrong calls cost real money

## Phase-0 audit pattern (before adopting an external tool)

Before adopting an image/video/audio-gen tool, custom node, training script, or model into the workflow, run a Phase-0 source audit (~30 min). See `prompts/github-repo-eval.md` for the reusable prompt.

Domain-specific failure modes to check:

- **Inference UIs (ComfyUI, Forge, A1111, InvokeAI)**: hardcoded backend assumption (only CUDA / no MPS)? Update cadence (does it track upstream Diffusers)? Plugin compatibility breakage history?
- **Custom nodes (ComfyUI ecosystem)**: maintained for current ComfyUI release? Depends on a model that's been pulled from CivitAI / HF? Pulls in heavy dependencies (transformers, accelerate) that conflict with base install?
- **Training tools (Kohya, sd-scripts, diffusers fine-tune scripts)**: VRAM requirements explicit? Apple Silicon support? Output format compatibility (safetensors vs ckpt vs LoRA-A1111 vs LoRA-Kohya)?
- **Models (CivitAI / HF)**: license terms (commercial use, derivative works, NSFW restrictions)? Base model derivative chain (SDXL → Pony → fine-tune-of-fine-tune may inherit Stability's non-commercial clause)? Risk of takedown if hosted on a moderation-active platform?
- **LoRA collections / aggregators**: who owns the rights? Can downstream use redistribute? CivitAI ToS vs author's stated license?
- **Persona/account ops tools**: platform ToS risk (does this violate Twitter/X / Instagram / TikTok policy)? Self-host vs SaaS? Account-recovery story if banned?
- **Voice / TTS models** (Fish-Speech, CosyVoice, Kokoro, F5-TTS, MaskGCT, Chatterbox, XTTS, IndexTTS, Dia): code-license vs weights-license split (common pattern: MIT code + non-commercial or OpenRAIL weights)? Zero-shot vs few-shot vs fine-tune-only cloning? Reference-audio length requirement (3s / 10-30s / longer)? Emotion-tag / prosody-control surface? Streaming-capable for low-latency DM voice notes? VRAM (8 / 16 / 24+ GB) and Apple Silicon MPS viability? NSFW posture (operator-controlled vs platform-banned like ElevenLabs)? Right-of-publicity risk if reference audio not operator-owned (Vacker v ElevenLabs precedent)?
- **Lipsync models** (LatentSync, MuseTalk, Wav2Lip, SadTalker, LivePortrait, VideoReTalking, GeneFace++): real-time vs batch posture (FPS on consumer GPU)? Face-detection dependency (InsightFace / dlib / OpenMMLab) — install-stack heaviness? Output resolution + sharpness vs sync accuracy tradeoff? Identity drift across frames? FLUX/Wan/HunyuanVideo source compat?
- **Music gen models** (ACE-Step, MusicGen, Stable Audio Open, Suno cloud, Udio cloud): clip-length cap (10s / 30s / 47s / full-song)? Lyrics-conditioned vs instrumental-only? Royalty-free output license? Cloud-only ToS NSFW posture (Suno/Udio restricted)? Melody-conditioning support?
- **SFX / foley models** (Stable Audio Open, AudioLDM, Tango 2, Audio-Omni, Bark): text-to-audio vs video-to-audio? Coverage breadth (ambient / impact / speech-like / music)? Sample rate + clip-length limits?

## Session-start ritual

On every new session, **before any other work**:

### 0. Resume from hot.md

Read `hot.md` (gitignored session-state cache). Report in one line:

> "Resuming from <last position>. Workspace idle. Next: your direction."

If `hot.md` is missing (first run, deleted), say:

> "No `hot.md` found — fresh session. Want me to rebuild session state from `wiki/log.md` + `ROADMAP.md`?"

At session end, rewrite `hot.md` with updated position, open decisions, pending actions.

### 1. Inbox check

```bash
ls -1 "research to be indexed/" 2>/dev/null | grep -v '^\.' | grep -v '^processed$'
```

If items exist that the user hasn't asked you to address, mention briefly: "Btw, you have N items in `research to be indexed/`. Want me to triage them?"

### 2. (Future ritual hooks land here.)

Keep each check under 60 seconds.

## Related — environment + secrets

- **DeepSeek API**: optional; for AI-assisted research synthesis. Get a key at https://platform.deepseek.com/, put it in `.env` as `DEEPSEEK_API_KEY=`. Never commit `.env`. See `.env.example` for the template.
- **Brave Search API** / **Exa API**: optional (the MCPs work better with their own keys; alternatively, claude.ai's web tools are a fallback). Same `.env` pattern.

If you fork/clone this workspace to another machine: copy `.env.example` to `.env` and fill in your own keys. Never reuse anyone else's keys.

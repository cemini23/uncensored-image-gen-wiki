# Image Generation Research Workspace — Schema

This file is the **schema**: it tells you (the LLM) how to operate this workspace. Everything else is either a raw source, a wiki page, or a meta file. Read this on every session start. Active workstreams + open decisions live in `ROADMAP.md`, not here.

## Purpose

Local knowledge hub for **uncensored local image generation** research, model cataloging, workflow tooling, and persona/character ops — a librarian that **manages, curates, and applies** that knowledge.

- **Manage** — inventory raw sources (model cards, GitHub READMEs, CivitAI pages, papers, deep-research outputs); track what's been read, extracted, and applied
- **Curate** — pull relevant fragments out of raw sources; structure them as interlinked wiki pages on models, tooling, hardware, techniques, and ops stacks
- **Apply** — route findings to a real workflow:
  - **claude.ai / DeepSeek** — research synthesis, model comparison reasoning, prompt engineering help
  - **ComfyUI / Forge / A1111** — copy-paste prompts, node graphs, LoRA recipes into local inference UIs
  - **Local laptop workflows** — manage LoRA collections, organize generated outputs, plan persona rollouts

This is a laptop-only workspace. No remote servers, no team distribution. Everything lives on a single laptop.

## Architecture — three layers

1. **Raw sources** — immutable. You read them, never modify them. Live locally in `raw-sources/` (gitignored — too large/copyrighted to track) and the existing `research to be indexed/processed/` archive (legacy convention; same role as `raw-sources/`).
   - PDFs (academic papers on diffusion, segmentation, generation)
   - DOCX (deep-research dumps from claude.ai / Gemini / DeepSeek)
   - GitHub repo snapshots (ComfyUI custom nodes, training scripts, LoRA collections)
   - Model cards (Hugging Face, CivitAI) saved as `.md`
   - **Drop pattern**: drop new sources into `research to be indexed/` (transient drop zone). Ingest pipeline reads + synthesizes, then archive to `raw-sources/` (or leave in `research to be indexed/processed/` per legacy convention).

2. **The wiki** — LLM-written, human-read. Lives in `wiki/`. Structured pages on models, UIs, custom nodes, hardware, techniques, marketplaces.

3. **The schema** — this file.

Staging/output lives outside the wiki:
- `briefs/` — polished deliverables ready to use elsewhere (gitignored): model comparison tables, setup runbooks, persona consistency playbooks, monetization case studies. Pre-existing briefs from this workspace's LIGHT-mode era live here (5 deep-research outputs).
- `notes/` — legacy working-notes layer from LIGHT-mode era; contents to be migrated into `wiki/entities/` over time. Don't add new notes here — write wiki pages instead.
- `outputs/` — generated images and intermediate artifacts (gitignored or kept local; not part of the knowledge layer)
- `docs/` — third-party reference docs (e.g. `docs/superpowers/`); read-only, not curated by this workspace
- `research to be indexed/` — transient drop zone for new raw sources (gitignored)
- `LESSONS.md` — meta-lessons about *how we work* (distinct from `wiki/log.md`)
- `hot.md` — ephemeral session-state cache (gitignored)
- `ROADMAP.md` — active workstreams + open decisions (tracked)

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
  notes/                       # legacy LIGHT-mode notes (migration to wiki/ pending)
  outputs/                     # generated images / intermediates (local only)
  docs/                        # third-party reference docs (read-only)
  wiki/                        # canonical wiki
    index.md                   # content-oriented catalog of all wiki pages
    log.md                     # append-only chronological operations log
    sources/                   # one page per ingested source
    entities/                  # models, UIs, custom nodes, marketplaces, hardware, accounts/personas
    concepts/                  # techniques, methodologies, workflows, ops strategies
  scripts/                     # wiki_lint.py, wiki_gap_detect.py, preingest_check.py
  prompts/                     # reusable prompt templates (deep-research-prompt.md, github-repo-eval.md, etc.)
  .claude/                     # Claude Code per-project state (gitignored)
  .playwright-mcp/             # playwright session storage (gitignored)
```

Pages can be nested inside `entities/` when `Domain > Topic > Subtopic` hierarchy is warranted (e.g. `entities/models/pony-v6.md`, `entities/uis/comfyui.md`, `entities/custom-nodes/ipadapter-plus.md`, `entities/marketplaces/civitai.md`). `concepts/` and `sources/` are flat by convention.

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
- **Entity page** (`wiki/entities/<category>/<slug>.md`) — models (Pony, Flux, SDXL fine-tunes), UIs (ComfyUI, Forge), custom nodes, hardware (GPUs, quantization formats), marketplaces (CivitAI, Hugging Face), accounts/personas (one page per persona being managed). Raw Concept: what prompted the page + which sources synthesize into it.
- **Concept page** (`wiki/concepts/<slug>.md`) — techniques (LoRA training, ControlNet, IP-Adapter), workflows (img2img loops, upscaling pipelines), de-censoring techniques, persona-consistency methods, monetization strategies. Raw Concept: the question or topic the page answers.
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

| Alias | Path | Description |
|-------|------|-------------|
| `seo-wiki` | `/Users/claudiobarone/Desktop/projects/SEO:GEO B&M Business/wiki/` | SEO, local search (GEO), GEO/AEO, web design, social media marketing |
| `osint-wiki` | `/Users/claudiobarone/Desktop/OSINT WORKSPACE/wiki/` | OSINT and financial research (includes conductor/librarian service) |

### Cross-wiki link syntax

- Use `@wiki-alias/path/to/page.md` for cross-wiki references (e.g., `@seo-wiki/concepts/geo-aeo.md`)
- Bidirectional: if Image Gen page A references SEO wiki page B, add a matching `@image-gen-wiki/...` backlink on page B
- When creating a stub in another wiki, note the cross-wiki dependency in `## Relations`

### Using the OSINT conductor/librarian for unified search

The OSINT workspace includes a **conductor** (MCP server that routes queries) + **librarian** (kb-server that serves wikis). To query across all three wikis:
1. Sync all wikis to the librarian: `rsync -avz wiki/ cemini-librarian:/opt/cemini-wiki/image-gen-wiki/wiki/`
2. Run `kb ingest` on the librarian to reindex
3. Use `conductor_query` tool (exposed via OSINT's `conductor/mcp_server.py`) to query across all wikis

## Operations

### Ingest (adding a new source)

1. New source dropped into `research to be indexed/`
2. **Run `python3 scripts/preingest_check.py`** — detects duplicates by sha256 / arXiv / DOI / URL / filename / title against the existing `wiki/sources/` index. Verdicts: `DUPLICATE` (do not ingest without deciding to supersede / fold / re-download), `LIKELY` (human review), `NEW` (proceed)
3. Read the source (or relevant sections for long PDFs / repo READMEs / model cards)
4. **Discuss key takeaways with the user before writing**
5. Create `wiki/sources/<slug>.md` — frontmatter + Raw Concept + short Narrative
6. Identify entities + concepts the source touches. For each:
   - If page exists: update it, add `related:` backlink, bump `updated:`
   - If no page: create a stub. Real content accumulates over subsequent ingests
7. Update `wiki/index.md` — add rows for new pages
8. Append to `wiki/log.md`: `## [YYYY-MM-DD] ingest | <source title>` with bullets of what changed
9. **Move raw source to `raw-sources/`**: `mv "research to be indexed/<filename>" raw-sources/`. Verify with `ls raw-sources/<filename>`
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
- **→ outputs/** — generated images stay local, gitignored

No remote server, no scp, no team distribution. Everything stays on this laptop.

## Working method

- Search the wiki first. Raw sources second. External sources last (via MCP)
- Prefer paraphrase + cite over raw quote. Quotes go in `## Snippets` with full citation
- When stress-testing a claim, actively look for disconfirming evidence (e.g. "Flux is uncensorable" — find threads where someone de-censored it)
- Flag single-source claims explicitly
- File insights into wiki pages or briefs before they disappear from chat
- For commercial decisions (model licensing, marketplace rev share, persona platform choice), be extra rigorous about provenance — wrong calls cost real money

## Phase-0 audit pattern (before adopting an external tool)

Before adopting an image-gen tool, custom node, training script, or model into the workflow, run a Phase-0 source audit (~30 min). See `prompts/github-repo-eval.md` for the reusable prompt.

Domain-specific failure modes to check:

- **Inference UIs (ComfyUI, Forge, A1111, InvokeAI)**: hardcoded backend assumption (only CUDA / no MPS)? Update cadence (does it track upstream Diffusers)? Plugin compatibility breakage history?
- **Custom nodes (ComfyUI ecosystem)**: maintained for current ComfyUI release? Depends on a model that's been pulled from CivitAI / HF? Pulls in heavy dependencies (transformers, accelerate) that conflict with base install?
- **Training tools (Kohya, sd-scripts, diffusers fine-tune scripts)**: VRAM requirements explicit? Apple Silicon support? Output format compatibility (safetensors vs ckpt vs LoRA-A1111 vs LoRA-Kohya)?
- **Models (CivitAI / HF)**: license terms (commercial use, derivative works, NSFW restrictions)? Base model derivative chain (SDXL → Pony → fine-tune-of-fine-tune may inherit Stability's non-commercial clause)? Risk of takedown if hosted on a moderation-active platform?
- **LoRA collections / aggregators**: who owns the rights? Can downstream use redistribute? CivitAI ToS vs author's stated license?
- **Persona/account ops tools**: platform ToS risk (does this violate Twitter/X / Instagram / TikTok policy)? Self-host vs SaaS? Account-recovery story if banned?

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

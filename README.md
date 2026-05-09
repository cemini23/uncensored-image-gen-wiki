# Uncensored Image Gen Wiki

A research wiki for **uncensored local image generation** — model catalogs, persona-consistency methods, video generation, training tools, and AI persona operations stacks. Curated as of **May 2026**.

The wiki is structured for an LLM-driven librarian workflow (Claude Code, Codex, Gemini CLI, etc.) but is fully readable as plain Markdown. Every page is interlinked, citation-tagged, and built to be lint-checked.

## What's inside

| Domain | Coverage |
|---|---|
| **Foundation models** | FLUX.1 / FLUX.2 family, Pony V6 / V7, Illustrious XL, NoobAI XL, Z-Image Turbo, Qwen-Image, ERNIE-Image, Kwai Kolors, Anima, Playground v3, PixArt-Σ, SDXL fine-tunes, Chroma1-HD |
| **Video models** | Wan 2.2, HunyuanVideo 1.5, LTX-2, Mochi 1, CogVideoX 1.5, Seedance 2 |
| **Identity adapters** | IP-Adapter family, PuLID / PuLID-Flux II, InstantID, ConsistentID, InfiniteYou, PhotoMaker V2, CharaConsist, FLUX.1 Redux, FLUX.1 Kontext, FLUX.2 Klein 9B face-swap |
| **Training tools** | Kohya sd-scripts, Kohya SS GUI, ai-toolkit (Ostris), OneTrainer, FluxGym, Musubi Tuner |
| **Concepts** | 5-tier censorship taxonomy, de-censoring techniques, LoRA / LoCon / LoHA / LoKr / DoRA taxonomy, persona consistency methods, character-DNA prompt templates, likeness-collision verification, reference + LoRA stacking, multi-angle dataset prep, video identity inheritance, seam-stitching strategies |

## Architecture — three layers

1. **Raw sources** (`raw-sources/`, gitignored) — immutable inputs: deep-research dumps, model cards, papers, GitHub READMEs.
2. **The wiki** (`wiki/`) — LLM-written, human-read. Source pages, entity pages (models, adapters, training tools), concept pages.
3. **The schema** (`CLAUDE.md`) — operational instructions for the LLM agent maintaining the wiki.

## Layout

```
.
├── CLAUDE.md            # schema — read on every session start
├── LESSONS.md           # meta-lessons about how the workspace works
├── ROADMAP.md           # active workstreams + done log
├── README.md            # this file
├── hot.md               # session-state cache (gitignored)
├── LICENSE              # MIT
├── .gitignore
├── .env.example         # template for optional API keys (DeepSeek, Brave, Exa, CivitAI, HF)
├── .obsidian/           # Obsidian vault config (templates, CSS snippets, workspace layout)
├── wiki/
│   ├── index.md         # content-oriented catalog of all wiki pages
│   ├── log.md           # append-only chronological operations log
│   ├── dashboard.md     # Dataview-powered dashboard page
│   ├── sources/         # one page per ingested source
│   ├── entities/        # domain-organized: models/, adapters/, training-tools/, uis/,
│   │                    #   marketplaces/, hardware/, persona-ops/, personas/
│   ├── concepts/        # techniques, methodologies, workflows, ops strategies
│   └── runbooks/        # beginner-to-intermediate task guides
├── briefs/              # polished deliverables (gitignored)
├── docs/                # third-party reference docs (read-only)
├── notes/               # legacy LIGHT-mode notes (migration to wiki/ pending)
├── prompts/             # reusable research prompts (deep-research, case-studies, etc.)
├── scripts/             # wiki lint, gap detection, ingest dedup, pre-commit hook, wiki sync
└── raw-sources/         # gitignored — raw research inputs (papers, model cards, repo dumps)
```

## Wiki page format

Every wiki page is a Markdown file with YAML frontmatter and structured sections. See `CLAUDE.md` for the full schema.

```yaml
---
title: Human-readable title
type: source | entity | concept | brief
tags: [coarse, category, labels]
keywords: [fine, grained, search, terms]
related:
  - entities/models/flux-1-dev.md
  - concepts/de-censoring-techniques.md
maturity: draft | validated | core
created: 2026-05-06
updated: 2026-05-07
---
```

Body sections: `## Relations` (mirrors `related:`), `## Raw Concept` (provenance), `## Narrative` (the body), `## Snippets` (verbatim quotes with citations), `## Dead Ends` (optional — what was tried and didn't work).

### Citation tags

- `[Source: filename.pdf p.5]` — internal source page
- `[Source: https://... (retrieved YYYY-MM-DD)]` — external URL
- `[Source: github.com/owner/repo @ <sha>]` — GitHub repo
- `[CONFIRMED]` — ≥2 independent sources or personally tested
- `[TENTATIVE]` — single source or untested
- `[NEEDS VERIFICATION YYYY-MM-DD]` — plausible but untested
- `[RETRACTED]` — previously believed, now disproven

### Bidirectional links

Pages link via `@path/to/page.md` syntax (relative to `wiki/`). If page A lists B in `related:`, B must list A. The lint script (`scripts/wiki_lint.py`) enforces this.

### Cross-wiki links

This wiki interconnects with two sister wikis via `@wiki-alias/path/to/page.md` syntax:

| Alias | Wiki | Purpose |
|---|---|---|
| `@seo-wiki` | SEO / GEO / B&M Business | Marketing, social media, content strategy, GEO |
| `@osint-wiki` | OSINT Workspace | Financial research, conductor/librarian service |

The lint script validates cross-wiki references against the target wiki's filesystem.

## Operations

### Ingest a new source

```bash
# 1. Drop the source file into research to be indexed/
# 2. Check for duplicates against existing sources/
python3 scripts/preingest_check.py

# 3. Read, synthesize, and create wiki pages (LLM-driven)
# 4. Move raw source to raw-sources/
mv "research to be indexed/<filename>" raw-sources/

# 5. Append to wiki/log.md and update wiki/index.md
```

### Query the wiki

Read `wiki/index.md` first to locate relevant pages, follow `@path` cross-links, synthesize with inline citations to source pages and raw sources.

### Lint

```bash
python3 scripts/wiki_lint.py        # orphans, bidirectional gaps, dangling links
python3 scripts/wiki_gap_detect.py  # unread stubs, stale verification tags, thin concept pages
```

## Getting started

```bash
git clone https://github.com/<your-username>/uncensored-image-gen-wiki.git
cd uncensored-image-gen-wiki

# Optional: set up API keys for MCP-driven research tools
cp .env.example .env
# Then fill in keys — never commit .env (it's gitignored)

# Browse the wiki — start at:
open wiki/index.md
```

### Obsidian vault setup (recommended)

For the best experience with cross-links, templates, and CSS styling:

```bash
chmod +x obsidian-setup.sh
./obsidian-setup.sh
```

This script:
- Creates a persistent symlink (`~/ImageGenWiki` → `wiki/`) so Obsidian can open the vault directly
- Installs Python dependencies needed by the lint scripts
- Generates a tuned `.obsidian/workspace.json` with sidebar panels (graph, backlinks, tag pane, outline)
- Creates a desktop launcher (macOS / Linux)

After running the script, open Obsidian → **Open Vault** → select `~/ImageGenWiki`. Then install the recommended community plugins:

| Plugin | Purpose |
|---|---|
| **Templater** | Auto-generates pages from `.obsidian/templates/` |
| **Dataview** | Powers `wiki/dashboard.md` queries |
| **Calendar** | Optional — timeline view |
| **Excalidraw** | Optional — diagrams in concept pages |

Enable CSS snippets in Settings → Appearance for citation badge and cross-link styling (`.obsidian/snippets/cross-links-and-citations.css`).

The wiki is plain Markdown — works in any editor or static-site generator (MkDocs, Quartz) too.

## Scope and posture

This wiki documents publicly available open-weight image and video generation models and the techniques creators apply to them. Coverage is **research-oriented**: model architectures, license terms, hardware tiers, training recipes, alignment-removal techniques, persona-consistency methods. The wiki does **not** distribute model weights, NSFW content, or platform-bypass tooling — only references where information lives in upstream model cards, papers, and community posts.

Adult AI persona operations are documented as a research domain (per `MEMORY.md` scope: "adult AI personas track; hardware-agnostic; skip platforms/policy"). The wiki cites public press coverage, model cards, and community guides without identifying private creators.

## License

MIT — see `LICENSE`.

The wiki content is heavily citation-backed; original source material remains under its respective upstream license. Direct quotes appear in `## Snippets` blocks with full citation. Extracts under fair use; redistribution of upstream papers / model cards / repositories happens via the original source URLs only.

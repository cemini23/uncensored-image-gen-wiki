# Lessons

A running log of lessons learned while managing this workspace. Each entry is dated and kept short. Write an entry when an assumption broke, a workflow changed, or something surprising came up — not for every session.

Newest entries on top.

---

## [2026-05-06] LIGHT → HEAVY upgrade was mostly drop-in once the OSINT/3D-printing template existed

Upgrading this workspace from LIGHT mode (notes/ + briefs/ only) to HEAVY mode (wiki/ + scripts/ + prompts/ + ROADMAP/LESSONS/hot) required:
- ~80% structural reuse from the 3D-printing template (folder layout, frontmatter schema, @path conventions, citation tags, lint-script port-in-place)
- ~20% domain rewrite (Purpose, Architecture, MCP table, Phase-0 failure modes, distribution targets, entity categories)

Cuts: no remote server / kb-server sync, no Tier-2 arXiv sweep, no cross-team distribution. Adds: image-gen-specific entity categories (models/UIs/custom-nodes/personas), Playwright as a primary tool (CivitAI/HF gating), license-chain awareness (SDXL → Pony → fine-tune lineage often inherits Stability's non-commercial clause).

The lint scripts (`wiki_lint.py`, `wiki_gap_detect.py`, `preingest_check.py`) ported verbatim — they validate structural conventions identical across all three wikis.

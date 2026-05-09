---
title: Character DNA templates (XML-tag prompting)
type: concept
tags: [prompting, character-dna, xml-tags, structured-prompt, persona-prompting, identity-anchor]
keywords: [Character DNA, XML tag prompting, structured prompt, Identity Anchor, persona prompt, trigger token, Danbooru tag chain, T5 natural-language prompt]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/two-pass-generation-workflow.md
  - concepts/persona-consistency-methods.md
  - concepts/likeness-collision-verification.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/multi-angle-dataset-prep.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
maturity: validated
created: 2026-05-06
updated: 2026-05-07
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@concepts/likeness-collision-verification.md
@concepts/reference-plus-lora-stacking.md
@concepts/multi-angle-dataset-prep.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@concepts/prompt-engineering-uncensored.md
@concepts/two-pass-generation-workflow.md
@entities/persona-ops/sillytavern.md

## Raw Concept

Concept page from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **Character DNA templates** are the most-cited 2026 prompt-engineering technique for persona-consistency *without* a trained LoRA — a structured tag schema that pins identity attributes deterministically across generations.

## Narrative

### What "Character DNA" actually means

A **Character DNA template** is a deterministic, ordered, named-attribute specification of a persona. The 2026 form ([Medium: Prompt Engineering Basics 2026](https://medium.com/@mjgmario/prompt-engineering-basics-2026-93aba4dc32b1)) uses **XML-style tags** to scope each attribute group, e.g.:

```
<character>
  <identity>persona_name="keira1234"</identity>
  <face>
    <eyes>almond, pale green, light hazel flecks</eyes>
    <nose>narrow, slight upturn at tip</nose>
    <mouth>full lips, asymmetric smile</mouth>
    <jaw>oval, soft</jaw>
  </face>
  <hair>shoulder-length wavy auburn, parted left</hair>
  <skin>fair, light freckles across nose bridge</skin>
  <body>5'7", slim athletic, narrow shoulders</body>
</character>
<scene>
  ... (separate scene description, separable from identity)
</scene>
```

The structural separation between `<character>` and `<scene>` is the key design choice: scene varies prompt-to-prompt, character does not. The **trigger token** (`keira1234`) is the global anchor for character LoRA hookup if one exists; otherwise the structured tags carry full weight.

### The Identity Anchor system

[James Palm: 2026 Character Consistency Guide](https://james-palm.medium.com/how-to-keep-your-character-consistent-across-5-different-ai-video-clips-the-2026-guide-nobodys-bd39a5234ecf) formalises the structural separation as the **Identity Anchor**: a versioned text block that is copy-pasted *unchanged* across every generation in the persona's content set. Variation only enters via the scene block. Identity drift is impossible if the anchor doesn't change.

This is the no-LoRA equivalent of seed pinning: deterministic identity carried in text rather than in latent state.

### Per-base captioning conventions (training time)

[CONFIRMED]

For *training* a character LoRA, the captioning convention is base-specific:

- **SDXL / Pony / Illustrious / NoobAI** — Danbooru-style tag chains. The `[trigger]` token (e.g., `zk_persona_v1`) is the only globally unique identifier; always first. Pony specifically requires `score_9, score_8_up, source_<medium>` rating prefixes ([Pony V6 model card](https://civitai.com/models/257749)).
- **FLUX / Z-Image / Qwen-Image** — 1-3-sentence natural language. Trigger is best embedded as a fictional name ("a young woman named keira1234"). The T5 encoder rewards specificity (lighting, framing, mood) over keyword density.
- **Hybrid (NoobAI XL specifically)** — `[trigger], 1girl, blue eyes, parted lips. natural light from window, three-quarter view portrait.` — half tags for compositional control, half NL for atmosphere ([sanj.dev guide](https://sanj.dev/post/train-stable-diffusion-lora-self-portraits)).

### Per-base prompt conventions (inference time)

[CONFIRMED]

The Character DNA template is the *training* convention; inference prompts mirror it:

- **SDXL/Pony/Illustrious/NoobAI**: tag-chain Character DNA. `[trigger], 1girl, almond eyes, pale green eyes, hazel flecks, narrow nose, full lips, asymmetric smile, oval jaw, shoulder-length wavy auburn hair, fair skin, light freckles, slim athletic body, [scene].`
- **FLUX / Z-Image / Qwen-Image**: natural-language prose. `Keira1234 is a young woman with almond, pale green eyes flecked with hazel; a narrow nose; full lips with an asymmetric smile; an oval jaw; shoulder-length wavy auburn hair parted on the left; fair, lightly-freckled skin; and a slim athletic build. [Scene description.]`
- **Hybrid (NoobAI XL)**: tag-prefix for compositional anchor, NL-suffix for atmosphere.

The XML structure is for *human readability* — the model only sees the rendered string. But maintaining the XML structure in the source-of-truth ensures every generation gets exactly the same character section.

### Failure modes

[CONFIRMED]

- **Tag drift between sessions**: if a creator hand-types the prompt each time instead of copy-pasting from a versioned anchor, attribute order and exact token wording will drift. Mitigation: maintain the anchor as a wildcards file or ComfyUI text-load node, never typed.
- **Scene-section bleed**: long scene descriptions can crowd the character section in the model's attention budget. Mitigation: keep scene under ~30 tokens for SDXL, ~50 tokens for FLUX/T5; offload composition to ControlNet if more scene specificity is needed.
- **Trigger collision**: re-using a non-unique trigger like "girl1" causes ambiguous LoRA hooks across multiple personas. Mitigation: use entropy-rich triggers (`zk_keira_v3_2026`, hash of name+date).
- **Pony score-prefix omission**: missing `score_9` on Pony-base inference produces visibly worse results. Easy mistake to make on a non-Pony day. Mitigation: keep base-specific prefixes in the wildcards file alongside the Character DNA.

### When Character DNA matters most

[CONFIRMED]

- **Pre-LoRA prototyping**: the cheapest test of "is this persona viable on this base" before committing to LoRA training cost.
- **Cross-base persona ports**: when migrating a persona from FLUX to Pony or vice versa, the Character DNA is the source-of-truth; the rendered prompt is the per-base translation.
- **No-LoRA budgets**: 8 GB VRAM users without cloud access — Character DNA + adapter is the workable path before LoRA training becomes feasible.

## Snippets

> "Genuinely new citations introduced from the Synthetic Character Consistency Survey: Medium: Prompt Engineering Basics 2026 — Character DNA / XML-tag prompt structure."
> — @sources/synthetic-character-consistency-survey.md §sources, 2026-05-06 enhancement pass

> "Identity Anchor system — versioned text block copy-pasted unchanged across every generation; variation only in the scene block."
> — paraphrased from [James Palm: 2026 Character Consistency Guide](https://james-palm.medium.com/how-to-keep-your-character-consistent-across-5-different-ai-video-clips-the-2026-guide-nobodys-bd39a5234ecf)

> "SDXL/Pony/Illustrious/NoobAI: Danbooru-style tag chains. The [trigger] token is the only globally unique identifier; always first. FLUX/Z-Image/Qwen: 1–3-sentence natural language. Trigger is best embedded as a fictional name."
> — @sources/synthetic-character-consistency-survey.md §4, captioning conventions

## Dead Ends

- **Hand-typing the prompt every generation** [RETRACTED]. Drift between sessions is inevitable. Always copy-paste from a versioned anchor file.
- **Generic triggers like "girl1"** [RETRACTED]. Collide with other personas in the same workflow. Use entropy-rich triggers (`zk_<name>_v<n>_<date>`).
- **Long scene descriptions on SDXL** [RETRACTED for character work]. Scene crowds the character section in the attention budget. Offload to ControlNet if scene specificity matters.

# Deep Research Prompt — Operations Stack for AI Personas

Run in deep research mode (Exa `deep_researcher_start` or equivalent). Supplement with Brave Search for tool reviews, Context7 for tool docs, and Playwright for vendor sites.

---

Comprehensive survey of the **software stack used to operate adult AI personas at scale** as of May 2026. Covers scheduling, multi-account management, DM/chat automation, voice cloning, agentic loops, triggerable image/video pipelines, and content-calendar tooling.

## 1. Posting & scheduling

- General-purpose social schedulers: Buffer, Later, Hypefury, Postiz, Publer — features and AI-content posture
- OF / Fanvue / Patreon-specific schedulers — what each automates and what still requires manual touch
- Reddit auto-posters and the bot/bans landscape on adult subs
- Twitter/X scheduling for adult creators (which tools survive moderation)
- Telegram channel posting bots

## 2. Multi-account management

- Tools and patterns for running >1 persona without account-linking issues (browser fingerprinting, IP separation, payment-method separation)
- Anti-detect browsers (Multilogin, Adspower, GoLogin, Octobrowser) — current state and pricing
- Proxy/residential IP services
- Risk patterns — what causes accidental linking and bans

## 3. DM / chat automation

- Persona chatbot stacks: local LLMs with persona system prompts (Llama 3.x, Qwen 3, Mistral) vs hosted (Claude, GPT-5, Gemini)
- Persona-specialized services (CrushOn AI, Janitor AI, Chub.ai, Character.AI) — API access, customization
- Open-source frameworks: SillyTavern, LM Studio, Ollama as a chat backend
- OF/Fanvue chat automation — tools that integrate with platform DMs (legitimate vs gray-zone)
- Content moderation considerations (avoiding age-related conversations, scam detection)
- Voice memo replies (TTS pipelines feeding into DM responses)

## 4. Voice cloning

- ElevenLabs (commercial, current pricing, NSFW posture)
- OpenVoice (open source, MIT)
- XTTS / Coqui TTS — current state given Coqui's shutdown
- F5-TTS, MaskGCT, Spark-TTS — newer open alternatives
- Quality tiers, training data needs (zero-shot vs few-shot vs fine-tune), licensing
- Common workflows for voice memos and synced video voiceover

## 5. Agentic loops & orchestration

- n8n, Make.com, Zapier — strengths and limits for AI persona workflows
- Custom Python orchestration (LangChain, LlamaIndex, CrewAI, AutoGen)
- Claude Code, GPT-5 with tool use, or Gemini as a content operator
- Common architectures (event-driven vs scheduled batch vs human-in-loop)
- Cost reality — agentic loops can be expensive; how operators manage spend

## 6. Triggerable image / video pipelines

- ComfyUI in API mode (queue prompt via REST)
- ComfyUI-to-Discord/Telegram/Slack bots
- Headless render farms (managed: Replicate, Fal, Modal; self-hosted: vast.ai with custom Docker)
- Webhook patterns for "agent decides → renderer renders → poster posts"

## 7. Content-calendar automation

- Generating prompt sets in bulk (LLM-driven prompt expansion)
- Theme rotation and seasonal content
- A/B testing posts (engagement-based prompt selection)
- Repurposing single generations across platforms (image → IG, GIF → Twitter, clip → TikTok)

---

## Output format

- Single markdown file written to `briefs/ai-account-ops-stack.md`
- Target length: ~3,500 words
- Structure: 7 numbered sections matching the TOC above
- Every named tool, service, or framework cites a source — URL preferred
- Pricing and tier info should cite vendor pricing pages (with retrieval date)
- Where image/video pipelines connect to persona consistency or video models, cross-reference `briefs/persona-consistency.md` (Brief B) and `briefs/video-gen-models.md` (Brief C) inline
- Style match: depth and citation density of `notes/models-catalog.md`

## Tools to use

1. **Exa** — primary deep research
2. **Brave Search** — tool reviews, comparisons, recent pricing changes
3. **Context7** — tool documentation (n8n, ComfyUI API, LangChain, CrewAI, etc.)
4. **Playwright** — vendor pricing pages, anti-detect browser comparisons

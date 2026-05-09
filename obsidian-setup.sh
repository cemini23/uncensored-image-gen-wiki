#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────
# obsidian-setup.sh
#
# One-shot setup for the Image Generation Research Workspace in Obsidian.
# Clone the repo, run this script, open in Obsidian — you're live.
#
# What it does:
#   1. Validates prerequisites (Obsidian, Python 3, git)
#   2. Fixes git line-ending noise (.gitattributes if missing)
#   3. Creates a persistent symlink so Obsidian vault → wiki/
#   4. Installs / upgrades Python lint/dependency tools for wiki scripts
#   5. Generates a .obsidian/workspace.json tuned for this vault
#   6. Creates a desktop launcher (macOS / Linux)
#   7. Prints next-step instructions for manual plugin install
#
# Usage:
#   chmod +x obsidian-setup.sh && ./obsidian-setup.sh
#
# Flags:
#   --vault-name NAME    Override the vault symlink folder name (default: ImageGenWiki)
#   --obsidian-path PATH Override the Obsidian binary path (auto-detected)
#   --no-launcher        Skip desktop launcher creation
#   --help               Show this help
# ─────────────────────────────────────────────────────────────────────
set -euo pipefail

# ── Defaults ──────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT_NAME="${VAULT_NAME:-ImageGenWiki}"
SKIP_LAUNCHER=false
OBSIDIAN_PATH=""

# ── Arg parsing ───────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --vault-name)  VAULT_NAME="$2"; shift 2 ;;
    --obsidian-path) OBSIDIAN_PATH="$2"; shift 2 ;;
    --no-launcher) SKIP_LAUNCHER=true; shift ;;
    --help)
      sed -n '3,14p' "$0" | sed 's/^# \?//'
      exit 0 ;;
    *) echo "Unknown flag: $1"; exit 1 ;;
  esac
done

# ── Colours ───────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

info()  { printf "${CYAN}▸${RESET} %s\n" "$*"; }
ok()    { printf "${GREEN}✔${RESET} %s\n" "$*"; }
warn()  { printf "${YELLOW}⚠${RESET} %s\n" "$*"; }
err()   { printf "${RED}✘${RESET} %s\n" "$*"; }
header(){ printf "\n${BOLD}── %s ──${RESET}\n" "$*"; }

# ── 1. Prerequisites ─────────────────────────────────────────────────
header "Checking prerequisites"

# Obsidian
if [[ -z "$OBSIDIAN_PATH" ]]; then
  POSSIBLE=(
    "/Applications/Obsidian.app/Contents/MacOS/Obsidian"
    "/Applications/Obsidian Canary.app/Contents/MacOS/Obsidian"
    "/snap/bin/obsidian"
    "$(which obsidian 2>/dev/null || true)"
  )
  for p in "${POSSIBLE[@]}"; do
    if [[ -x "$p" || -L "$p" ]]; then
      OBSIDIAN_PATH="$p"
      break
    fi
  done
fi

if [[ -x "$OBSIDIAN_PATH" ]]; then
  ok "Obsidian found: $OBSIDIAN_PATH"
else
  warn "Obsidian binary not found. Install from https://obsidian.md"
  OBSIDIAN_PATH=""
fi

# Python 3
if command -v python3 &>/dev/null; then
  PY_VER=$(python3 --version 2>&1)
  ok "Python 3: $PY_VER"
else
  err "python3 not found — wiki lint/gap scripts need it."
  err "Install: https://python.org/downloads"
  PYTHON_OK=false
fi

# git
if command -v git &>/dev/null; then
  ok "git: $(git --version | head -1)"
else
  err "git not found — needed for repo operations."
fi

# ── 2. Git line-ending guard ─────────────────────────────────────────
header "Configuring git for clean vault files"

if [[ ! -f "$SCRIPT_DIR/.gitattributes" ]]; then
  cat > "$SCRIPT_DIR/.gitattributes" <<'EOF'
# Prevent CRLF noise in Obsidian markdown files
*.md    text eol=lf
*.yaml  text eol=lf
*.yml   text eol=lf
*.json  text eol=lf
*.css   text eol=lf
EOF
  ok "Created .gitattributes (LF line endings forced)"
else
  ok ".gitattributes already present"
fi

# ── 3. Vault symlink ─────────────────────────────────────────────────
header "Setting up vault symlink"

VAULT_LINK="$HOME/$VAULT_NAME"

if [[ -L "$VAULT_LINK" ]]; then
  LINK_TARGET=$(readlink "$VAULT_LINK")
  if [[ "$LINK_TARGET" == "$SCRIPT_DIR/wiki" ]]; then
    ok "Symlink already correct: $VAULT_LINK → wiki/"
  else
    warn "Symlink exists but points elsewhere: $LINK_TARGET"
    info "Removing and recreating…"
    rm "$VAULT_LINK"
    ln -s "$SCRIPT_DIR/wiki" "$VAULT_LINK"
    ok "Recreated: $VAULT_LINK → wiki/"
  fi
elif [[ -d "$VAULT_LINK" ]]; then
  err "$VAULT_LINK is a real directory, not a symlink."
  err "Rename or remove it, then re-run this script."
  exit 1
else
  ln -s "$SCRIPT_DIR/wiki" "$VAULT_LINK"
  ok "Created: $VAULT_LINK → wiki/"
fi

info "In Obsidian: Open vault → select $VAULT_LINK (or $SCRIPT_DIR/wiki directly)"

# ── 4. Python dev environment for wiki scripts ───────────────────────
header "Setting up Python tools for wiki linting"

if command -v python3 &>/dev/null; then
  # Ensure pip-installed deps for wiki scripts
  if python3 -c "import yaml" 2>/dev/null; then
    ok "PyYAML available"
  else
    info "Installing PyYAML (needed by wiki_lint.py / wiki_gap_detect.py)…"
    python3 -m pip install --quiet pyyaml 2>&1 | tail -1 || warn "pip install failed — install manually: pip3 install pyyaml"
  fi
fi

# ── 5. Obsidian workspace config (tuned for this vault) ──────────────
header "Generating Obsidian workspace preset"

WORKSPACE_JSON="$SCRIPT_DIR/.obsidian/workspace.json"

cat > "$WORKSPACE_JSON" <<'EOF'
{
  "active": "Image Gen Research Hub",
  "lastUpdate": "__TIMESTAMP__",
  "mainView": { "mode": "source", "pinned": true },
  "leftRibbon": [
    { "id": "file-explorer", "type": "file-explorer", "name": "File Explorer" },
    { "id": "switcher",      "type": "switcher",       "name": "Quick Switcher" },
    { "id": "graph",         "type": "graph",          "name": "Graph View" },
    { "id": "backlink",      "type": "backlink",       "name": "Backlinks" },
    { "id": "outgoing-link", "type": "outgoing-link",  "name": "Outgoing Links" },
    { "id": "tag-pane",      "type": "tag-pane",       "name": "Tag Pane" },
    { "id": "outline",       "type": "outline",        "name": "Outline" }
  ],
  "rightRibbon": [
    { "id": "daily-notes", "type": "daily-notes", "name": "Daily Notes" },
    { "id": "help",        "type": "help",         "name": "Help" }
  ],
  "leftSplitPercent": 0.15,
  "rightSplitPercent": 0.2,
  "leftRibbonCollapsed": false,
  "rightRibbonCollapsed": true
}
EOF
# Stamp timestamp
if command -v python3 &>/dev/null; then
  TIMESTAMP=$(python3 -c "from datetime import datetime; print(datetime.utcnow().isoformat(timespec='seconds') + 'Z')")
  sed -i.bak "s/__TIMESTAMP__/$TIMESTAMP/" "$WORKSPACE_JSON" 2>/dev/null || true
  rm -f "$WORKSPACE_JSON.bak" 2>/dev/null || true
fi
ok "Workspace config written to .obsidian/workspace.json"

# ── 6. Desktop launcher ──────────────────────────────────────────────
if [[ "$SKIP_LAUNCHER" == "false" ]]; then
  header "Creating desktop launcher"

  DESKTOP_ENTRY=""

  # macOS
  if [[ "$OSTYPE" == "darwin"* && -n "$OBSIDIAN_PATH" ]]; then
    LAUNCHER="$HOME/Applications/Image Gen Wiki.app"
    mkdir -p "$(dirname "$LAUNCHER")"
    # Create a tiny shell wrapper so the vault opens directly
    cat > "$LAUNCHER.sh" <<LAUNCHER_EOF
#!/bin/bash
open -a "Obsidian" "$SCRIPT_DIR/wiki"
LAUNCHER_EOF
    chmod +x "$LAUNCHER.sh"
    # Wrap in a .app using Platypus-style approach (simple open command)
    # Fallback: just give them a usable script
    ok "Created launcher script: $LAUNCHER.sh"
    DESKTOP_ENTRY="$LAUNCHER.sh"
  fi

  # Linux / generic .desktop
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    DESKTOP_FILE="$HOME/.local/share/applications/imagegen-wiki-obsidian.desktop"
    ICON="obsidian"
    if command -v convert &>/dev/null && [[ -f "$SCRIPT_DIR/wiki/dashboard.md" ]]; then
      # Try to grab an icon (optional)
      true
    fi
    cat > "$DESKTOP_FILE" <<DESKTOP_EOF
[Desktop Entry]
Name=Image Gen Wiki (Obsidian)
Comment=Image Generation Research Vault
Exec=${OBSIDIAN_PATH:-obsidian} "$SCRIPT_DIR/wiki"
Icon=${ICON:-obsidian}
Terminal=false
Type=Application
Categories=Office;Knowledge;
Path=$SCRIPT_DIR/wiki
DESKTOP_EOF
    chmod +x "$DESKTOP_FILE"
    ok "Created .desktop entry: $DESKTOP_FILE"
    DESKTOP_ENTRY="$DESKTOP_FILE"
  fi

  if [[ -z "$DESKTOP_ENTRY" ]]; then
    if [[ -z "$OBSIDIAN_PATH" ]]; then
      warn "Could not auto-detect Obsidian — no launcher created."
    fi
  fi
else
  info "Launcher creation skipped (--no-launcher)"
fi

# ── 7. Summary & next steps ─────────────────────────────────────────
header "Setup complete! Next steps:"

printf "\n"
printf "  ${GREEN}1${RESET} Open Obsidian → ${BOLD}Open Vault${RESET} → navigate to:\n"
printf "     ${CYAN}${VAULT_LINK}${RESET}\n\n"

printf "  ${GREEN}2${RESET} Install required plugins (Community Plugins):\n"
printf "     • ${BOLD}Templater${RESET}  — auto-generates pages from .obsidian/templates/\n"
printf "     • ${BOLD}Dataview${RESET}   — powers wiki/dashboard.md queries\n"
printf "     • ${BOLD}Calendar${RESET}   — optional, nice for timeline view\n"
printf "     • ${BOLD}Excalidraw${RESET} — optional, for diagrams in concept pages\n\n"
printf "     In Obsidian: Settings → Community Plugins → Browse → search & enable\n\n"

printf "  ${GREEN}3${RESET} Enable CSS snippets:\n"
printf "     Settings → Appearance → CSS Snippets → turn ON\n"
printf "     (${CYAN}.obsidian/snippets/cross-links-and-citations.css${RESET})\n\n"

printf "  ${GREEN}4${RESET} Configure Templater:\n"
printf "     Settings → Templater → Template folder: ${CYAN}.obsidian/templates/${RESET}\n"
printf "     Enable 'Run Templater on new file creation'\n\n"

printf "  ${GREEN}5${RESET} Verify lint scripts work:\n"
printf "     ${CYAN}python3 scripts/wiki_lint.py${RESET}\n"
printf "     ${CYAN}python3 scripts/wiki_gap_detect.py${RESET}\n\n"

printf "  ${GREEN}6${RESET} Key vault structure:\n"
printf "     ${CYAN}wiki/index.md${RESET}              — master catalog (start here)\n"
printf "     ${CYAN}wiki/log.md${RESET}                 — chronological operations log\n"
printf "     ${CYAN}wiki/runbooks/${RESET}             — setup runbooks\n"
printf "     ${CYAN}wiki/concepts/${RESET}             — techniques, workflows\n"
printf "     ${CYAN}wiki/entities/ ${RESET}            — models, UIs, tools, hardware\n"
printf "     ${CYAN}briefs/${RESET}                    — polished deliverables\n"
printf "     ${CYAN}.obsidian/templates/${RESET}       — Templater templates\n"
printf "     ${CYAN}.obsidian/snippets/${RESET}        — CSS styling\n\n"

printf "${BOLD}Happy researching.${RESET}\n\n"
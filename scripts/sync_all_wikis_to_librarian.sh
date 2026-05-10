#!/usr/bin/env bash
# sync_all_wikis_to_librarian.sh
#
# Sync all three wikis to cemini-librarian for unified kb_search.
# Requires: SSH access to cemini-librarian, kb-server running on librarian.
#
# Usage:
#   - Manual:  ./scripts/sync_all_wikis_to_librarian.sh
#   - Cron:  0 * * * * $HOME/Desktop/projects/Image\ gen/scripts/sync_all_wikis_to_librarian.sh
#
# Wiki aliases (must match CLAUDE.md "Related Wikis" section):
#   image-gen-wiki  -> $HOME/Desktop/projects/Image gen/wiki/
#   seo-wiki        -> $HOME/Desktop/projects/SEO:GEO B&M Business/wiki/
#   osint-wiki      -> $HOME/Desktop/OSINT WORKSPACE/wiki/
#
# Exit codes:
#   0 — success (all rsyncs + kb ingest succeeded)
#   1 — rsync failed
#   2 — kb ingest failed
#   3 — workspace dir missing

set -uo pipefail

LIBRARIAN_HOST="cemini-librarian"
LIBRARIAN_BASE="/opt/cemini-wiki"
LOGFILE="$HOME/Library/Logs/cemini-all-wikis-sync.log"

# Wiki definitions: alias -> local_path
declare -A WIKI_PATHS=(
  ["image-gen-wiki"]="$HOME/Desktop/projects/Image gen/wiki"
  ["seo-wiki"]="$HOME/Desktop/projects/SEO:GEO B&M Business/wiki"
  ["osint-wiki"]="$HOME/Desktop/OSINT WORKSPACE/wiki"
)

# Ensure log dir exists
mkdir -p "$(dirname "$LOGFILE")"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOGFILE"
}

# Track success
ALL_OK=true
TOTAL_CHANGED=0

for alias in "${!WIKI_PATHS[@]}"; do
  LOCAL="${WIKI_PATHS[$alias]}"
  REMOTE="$LIBRARIAN_BASE/$alias/wiki/"

  if [[ ! -d "$LOCAL" ]]; then
    log "ERROR: local wiki not found at $LOCAL — skipping"
    ALL_OK=false
    continue
  fi

  log "rsync starting: $alias ($LOCAL) → $LIBRARIAN_HOST:$REMOTE"

  rsync_output=$(rsync -avz --delete \
    --exclude '.DS_Store' \
    --exclude '.obsidian' \
    --exclude '.smart-env' \
    "$LOCAL/" "$LIBRARIAN_HOST:$REMOTE" 2>&1)
  rsync_exit=$?

  if [[ $rsync_exit -ne 0 ]]; then
    log "ERROR: rsync failed for $alias with exit $rsync_exit"
    log "rsync output: $rsync_output"
    ALL_OK=false
    continue
  fi

  files_changed=$(echo "$rsync_output" | grep -cE '^[a-z]' || true)
  log "rsync OK for $alias ($files_changed file paths in output)"
  TOTAL_CHANGED=$((TOTAL_CHANGED + files_changed))
done

# Skip kb ingest if zero meaningful changes
if [[ $TOTAL_CHANGED -le 3 ]]; then
  log "no wiki changes detected (total changed files: $TOTAL_CHANGED), skipping kb ingest"
  exit 0
fi

# Step 2: post-rsync kb-server reindex on librarian
log "kb ingest triggering on $LIBRARIAN_HOST for all wikis"
kb_output=$(ssh "$LIBRARIAN_HOST" \
  "kb ingest $LIBRARIAN_BASE/image-gen-wiki/wiki/; \
   kb ingest $LIBRARIAN_BASE/seo-wiki/wiki/; \
   kb ingest $LIBRARIAN_BASE/osint-wiki/wiki/" 2>&1)
kb_exit=$?

if [[ $kb_exit -ne 0 ]]; then
  log "ERROR: kb ingest failed with exit $kb_exit"
  log "kb output: $kb_output"
  exit 2
fi

log "kb ingest OK: $kb_output"
exit 0

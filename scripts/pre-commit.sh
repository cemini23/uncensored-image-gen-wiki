#!/usr/bin/env bash
# Pre-commit hook for Image Gen wiki workspace.
# Run from repo root: cp scripts/pre-commit.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
# Or: git config core.hooksPath scripts/

set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
SCRIPTS="$REPO_ROOT/scripts"

# Color helpers
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "🔍 Running pre-commit checks..."

# --- 1. If any wiki/ files changed, run wiki_lint.py ---
WIKI_CHANGED=$(git diff --cached --name-only --diff-filter=ACM | grep -c "^wiki/" || true)
if [ "$WIKI_CHANGED" -gt 0 ]; then
    echo -e "${YELLOW}Wiki files changed ($WIKI_CHANGED). Running wiki_lint.py...${NC}"
    if ! python3 "$SCRIPTS/wiki_lint.py"; then
        echo -e "${RED}❌ wiki_lint.py found issues. Commit blocked.${NC}"
        echo "   Fix the above, or bypass with: git commit --no-verify"
        exit 1
    fi
    echo -e "${GREEN}✅ wiki_lint.py passed.${NC}"
else
    echo -e "${GREEN}⏭  No wiki changes — skipping wiki_lint.py${NC}"
fi

# --- 2. If anything landed in research to be indexed/, run preingest_check.py ---
INBOX_CHANGED=$(git diff --cached --name-only --diff-filter=ACM | grep -c "^research to be indexed/" || true)
if [ "$INBOX_CHANGED" -gt 0 ]; then
    echo -e "${YELLOW}Inbox files changed ($INBOX_CHANGED). Running preingest_check.py...${NC}"
    if ! python3 "$SCRIPTS/preingest_check.py"; then
        echo -e "${RED}❌ preingest_check.py found duplicates. Review before committing.${NC}"
        echo "   Bypass with: git commit --no-verify"
        exit 1
    fi
    echo -e "${GREEN}✅ preingest_check.py passed.${NC}"
else
    echo -e "${GREEN}⏭  No inbox changes — skipping preingest_check.py${NC}"
fi

# --- 3. Python syntax check on scripts/ if scripts changed ---
SCRIPTS_CHANGED=$(git diff --cached --name-only --diff-filter=ACM | grep -c "^scripts/" || true)
if [ "$SCRIPTS_CHANGED" -gt 0 ]; then
    echo -e "${YELLOW}Script files changed ($SCRIPTS_CHANGED). Syntax-checking...${NC}"
    for f in $(git diff --cached --name-only --diff-filter=ACM | grep "^scripts/"); do
        if [[ "$f" == *.py ]]; then
            if ! python3 -m py_compile "$REPO_ROOT/$f"; then
                echo -e "${RED}❌ Syntax error in $f${NC}"
                exit 1
            fi
        fi
    done
    echo -e "${GREEN}✅ All scripts syntax OK.${NC}"
fi

echo ""
echo -e "${GREEN}🎉 All pre-commit checks passed.${NC}"
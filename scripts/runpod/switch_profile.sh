#!/bin/bash
set -euo pipefail

# Usage: switch_profile.sh A|B|C
# A -> nsfw, B -> general, C -> edit

if [ $# -ne 1 ]; then
    echo "Usage: $0 A|B|C"
    exit 1
fi

PROFILE="$1"
mkdir -p /workspace/bin
ACTIVE_PROFILE_FILE="/workspace/bin/active-profile"
PROFILE_ENV_FILE="/workspace/bin/profile.env"

case "$PROFILE" in
    A)
        PROFILE_NAME="nsfw"
        NSFW_MODE=1
        LORA_ROOT="/workspace/ComfyUI/models/loras/nsfw"
        ;;
    B)
        PROFILE_NAME="general"
        NSFW_MODE=0
        LORA_ROOT="/workspace/ComfyUI/models/loras/general"
        ;;
    C)
        PROFILE_NAME="edit"
        NSFW_MODE=0
        LORA_ROOT="/workspace/ComfyUI/models/loras/general"
        ;;
    *)
        echo "Invalid profile: $PROFILE (use A, B, or C)"
        exit 1
        ;;
esac

tmp_env=$(mktemp)
cat > "$tmp_env" << EOF
NSFW_MODE=$NSFW_MODE
LORA_ROOT=$LORA_ROOT
PROFILE=$PROFILE_NAME
EOF
mv "$tmp_env" "$PROFILE_ENV_FILE"
echo "$PROFILE" > "$ACTIVE_PROFILE_FILE"

echo "Switched to Profile $PROFILE ($PROFILE_NAME)"
echo "NSFW_MODE=$NSFW_MODE"
echo "LORA_ROOT=$LORA_ROOT"
echo ""
echo "=== Reminder ==="
echo "1. Restart ComfyUI for the profile change to take effect"
echo "2. Call POST /free before starting audio workloads"
echo "3. Do NOT start Fish-Speech while ComfyUI holds Wan/FLUX weights (VRAM conflict)"
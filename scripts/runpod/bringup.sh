#!/bin/bash
set -euo pipefail

# Idempotent bootstrap helper intended to run ON THE POD with volume at /workspace.
# Does not embed secrets. Operator should export HF_HOME=/workspace/hf-cache before first run.

# Require /workspace writable
test -w /workspace || { echo "/workspace not writable"; exit 1; }

# Sentinel file for volume identity (reject empty files)
if [ ! -s /workspace/.volume-id ]; then
    if command -v uuidgen >/dev/null 2>&1; then
        uuidgen > /workspace/.volume-id
    else
        python3 -c "import uuid; print(uuid.uuid4())" > /workspace/.volume-id
    fi
    test -s /workspace/.volume-id || { echo "failed to write .volume-id"; exit 1; }
    echo "Created /workspace/.volume-id"
fi

# ComfyUI root. Healthcheck is written against this path on first run.
COMFYUI_ROOT="${COMFYUI_ROOT:-/workspace/ComfyUI}"

# Directory tree
mkdir -p "$COMFYUI_ROOT/custom_nodes"
mkdir -p "$COMFYUI_ROOT/models/loras/nsfw"
mkdir -p "$COMFYUI_ROOT/models/loras/general"
mkdir -p "$COMFYUI_ROOT/models/text_encoders/raw"
mkdir -p "$COMFYUI_ROOT/models/text_encoders/decensored"
mkdir -p /workspace/workflows/nsfw
mkdir -p /workspace/workflows/general
mkdir -p /workspace/workflows/edit
mkdir -p /workspace/workflows/video
mkdir -p /workspace/workflows/train
mkdir -p /workspace/audio-pipeline/models
mkdir -p /workspace/audio-pipeline/ref
mkdir -p /workspace/audio-pipeline/work
mkdir -p /workspace/audio-pipeline/out
mkdir -p /workspace/datasets
mkdir -p /workspace/outputs
mkdir -p /workspace/bin
mkdir -p /workspace/hf-cache

# ComfyUI root. Healthcheck is written against this path on first run.
COMFYUI_ROOT="${COMFYUI_ROOT:-/workspace/ComfyUI}"

# Export note: operator should set HF_HOME=/workspace/hf-cache
# export HF_HOME=/workspace/hf-cache

# Clone missing custom nodes (skip if dir exists)
NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager.git"
    "https://github.com/city96/ComfyUI-GGUF.git"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git"
    "https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git"
)

for repo in "${NODES[@]}"; do
    node_name=$(basename "$repo" .git)
    target="$COMFYUI_ROOT/custom_nodes/$node_name"
    if [ -d "$target" ] && [ ! -d "$target/.git" ]; then
        echo "Removing incomplete clone: $node_name"
        rm -rf "$target"
    fi
    if [ ! -d "$target/.git" ]; then
        echo "Cloning $node_name..."
        git clone --depth 1 "$repo" "$target"
    else
        echo "Skipping $node_name (already exists)"
    fi
done

# Write healthcheck.sh only if missing
HEALTHCHECK="/workspace/bin/healthcheck.sh"
if [ ! -f "$HEALTHCHECK" ]; then
    cat > "$HEALTHCHECK" << EOF
#!/bin/bash
set -euo pipefail
test -s /workspace/.volume-id || { echo "volume sentinel missing"; exit 1; }
curl -sf http://127.0.0.1:8188/system_stats >/dev/null || { echo "ComfyUI down"; exit 1; }
test -d ${COMFYUI_ROOT}/custom_nodes/ComfyUI-Manager || { echo "Manager missing"; exit 1; }
if ! used=\$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | head -1); then
  echo "nvidia-smi failed"; exit 1
fi
test -n "\$used" || { echo "nvidia-smi returned empty"; exit 1; }
if [ "\$used" -ge 3000 ]; then echo "WARN: GPU not idle (>3GB used) before audio stage"; fi
avail_kb=\$(df -Pk /workspace | awk 'NR==2 {print \$4}')
test -n "\$avail_kb" || { echo "df failed"; exit 1; }
# 5 GiB free floor (1K blocks)
test "\$avail_kb" -ge 5242880 || { echo "disk low (\${avail_kb} KB free)"; exit 1; }
command -v ffmpeg >/dev/null || { echo "ffmpeg missing"; exit 1; }
if [ -x /workspace/audio-pipeline/.venv-fish/bin/python ]; then
  /workspace/audio-pipeline/.venv-fish/bin/python -c "import torch; assert torch.cuda.is_available()" || echo "WARN: Fish venv CUDA"
else
  echo "WARN: Fish venv not bootstrapped"
fi
echo "OK"
EOF
    chmod +x "$HEALTHCHECK"
    echo "Created $HEALTHCHECK"
fi

# Write lockfile.json stub only if missing
LOCKFILE="/workspace/lockfile.json"
if [ ! -f "$LOCKFILE" ]; then
    cat > "$LOCKFILE" << 'EOF'
{
  "comfyui": "unpinned",
  "nodes": [],
  "note": "pin SHAs after first green bring-up"
}
EOF
    echo "Created $LOCKFILE"
fi

# Print next steps
cat << 'NEXT'

=== Next steps ===
1. Reboot ComfyUI (or start it if not running): listen 0.0.0.0
2. Run healthcheck:   bash /workspace/bin/healthcheck.sh
3. Download models with huggingface-cli. Tokens stay in the environment (HF_TOKEN, CIVITAI_API_TOKEN). Do not paste tokens into this script.
   export HF_HOME=/workspace/hf-cache
4. For audio: create venvs under /workspace/audio-pipeline/.venv-fish, .venv-latentsync
   and pip install from respective requirements.txt
NEXT
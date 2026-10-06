#!/bin/bash
set -eu
if ! command -v npx > /dev/null 2>&1; then
    echo "npx saknas; installera Node.js innan Codex-skills installeras." >&2
    exit 1
fi
if [ -d ~/.agents/skills/tailscale ]; then
    echo "Update Tailscale"
    npx --yes skills update tailscale
else
    echo "Add Tailscale"
    npx --yes skills add tailscale/tailscale-skill --skill tailscale --global --agent universal --yes
fi
if [ -d ~/.agents/skills/archify ]; then
    echo "Update archify"
    npx --yes skills update archify
else
    echo "Add archify"
    npx --yes skills add tt-a1i/archify --skill archify --global  --agent universal --copy --yes
fi
if [ -d ~/.agents/skills/gh-axi ]; then
    echo "Update skill pack"
    npx --yes skills update --project --yes
else
    echo "Add skill pack"
    npx --yes skills add https://skills.sh/p/YX1apvHeaqycBTps --agent universal --yes
fi

#!/bin/bash
set -eu
if ! command -v npx > /dev/null 2>&1;then
    echo "npx saknas; installera Node.js innan Codex-skills installeras." >&2
    exit 1
fi
if [ -d ~/.agents/skills/tailscale ];then
    npx --yes skills update tailscale
else
    npx --yes skills add tailscale/tailscale-skill --skill tailscale --global --agent universal --yes
fi
if [ -d ~/.agents/skills/archify ];then
    npx --yes skills update archify
else
    npx --yes skills add tt-a1i/archify --skill archify --global  --agent universal --copy --yes
fi
if [ -d ~/.agents/skills/gh-axi ];then
    npx --yes skills update --project --yes
else
    npx --yes skills add https://skills.sh/p/YX1apvHeaqycBTps --agent universal --yes
fi

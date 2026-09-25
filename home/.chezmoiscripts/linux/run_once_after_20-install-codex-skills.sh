#!/bin/bash

set -eu

if ! command -v npx >/dev/null 2>&1; then
	echo "npx saknas; installera Node.js innan Codex-skills installeras." >&2
	exit 1
fi

# Global skills
npx --yes skills add tailscale/tailscale-skill --skill tailscale --global --agent universal --yes

# Project Skills
if [ -f "/home/bogge/.local/share/chezmoi/.agents/skills/gh-axi/SKILL.md" ]; then
	npx --yes skills update --project --yes
else
	npx --yes skills add https://skills.sh/p/YX1apvHeaqycBTps --agent universal --yes
fi

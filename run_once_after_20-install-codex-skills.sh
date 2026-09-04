#!/bin/bash

set -eu

if ! command -v npx >/dev/null 2>&1; then
  echo "npx saknas; installera Node.js innan Codex-skills installeras." >&2
  exit 1
fi

npx --yes skills add https://github.com/tailscale/tailscale-skill \
  --global \
  --agent codex \
  --skill tailscale \
  --yes

#!/bin/bash

set -eu

if ! command -v npx >/dev/null 2>&1; then
  echo "npx saknas; hoppar över uppdatering av Codex-skills." >&2
  exit 0
fi

npx --yes skills update --global --yes

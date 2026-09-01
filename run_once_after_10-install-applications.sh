#!/bin/bash

set -eu

if ! command -v omarchy >/dev/null 2>&1; then
  echo "Omarchy saknas; hoppar över installation av Omarchy-applikationer." >&2
  exit 0
fi

omarchy pkg add bitwarden bitwarden-cli steam

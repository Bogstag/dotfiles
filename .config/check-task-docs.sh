#!/usr/bin/env bash
set -euo pipefail

generated=$(mktemp)
trap 'rm -f "$generated"' EXIT

cp README.md "$generated"
mise generate task-docs --output "$generated" --style detailed --inject

if ! cmp -s README.md "$generated"; then
    printf 'README.md is out of date; run mise run render:tasks to update it.\n' >&2
    diff -u README.md "$generated" || true
    exit 1
fi

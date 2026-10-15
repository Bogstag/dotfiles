#!/usr/bin/env python3
"""Compare hk's file selection with the known gaps in its coverage baseline."""

import argparse
import json
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
BASELINE = ROOT/"tests/hk-coverage-baseline.json"
GENERAL_STEPS = {
    "hk-coverage",
    "hk_test",
    "trailing-whitespace",
    "newlines",
    "check_executables_have_shebangs",
    "check_shebang_scripts_are_executable",
    "editorconfig-checker",
    "betterleaks",
}
SPECIFIC_STEPS = {
    "pkl",
    "pkl-format",
    "tombi",
    "tombi-format",
    "ryl",
    "ryl-markdown",
    "shellharden",
    "shellcheck",
    "shfmt",
    "mise",
    "mise-generate-task-docs",
}


def git_files():
    output = subprocess.check_output(["git", "ls-files", "--stage", "-z"], cwd=ROOT)
    for entry in output.split(b"\0"):
        if not entry:
            continue
        metadata, path = entry.split(b"\t", 1)
        yield metadata.split(b" ", 1)[0].decode(), path.decode("utf-8", "surrogateescape")


def planned_steps(path):
    result = subprocess.run(
        ["hk", "check", "--plan", "--json", "--", path],
        cwd=ROOT,
        capture_output=True,
        text=True,
        check=True,
    )
    start = result.stdout.find("{")
    if start < 0:
        raise ValueError(f"hk returned no JSON plan for {path}")
    plan = json.loads(result.stdout[start:])
    return {step["name"] for step in plan["steps"] if step["status"] == "included"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--report", action="store_true", help="list every known coverage gap")
    args = parser.parse_args()

    baseline = json.loads(BASELINE.read_text(encoding="utf-8"))
    expected = {kind: set(baseline[kind]) for kind in ("general_only", "no_steps", "symlinks")}
    current = {kind: set() for kind in expected}
    counts = Counter()
    tracked = set()

    for mode, path in git_files():
        tracked.add(path)
        if mode == "120000":
            current["symlinks"].add(path)
            continue
        if mode not in {"100644", "100755"}:
            raise ValueError(f"unsupported Git file mode {mode}: {path}")

        steps = planned_steps(path) - {"hk-coverage"}
        unknown = steps - GENERAL_STEPS - SPECIFIC_STEPS
        if unknown:
            raise ValueError(f"classify new hk steps {sorted(unknown)} for {path}")
        if not steps:
            current["no_steps"].add(path)
        elif not steps.intersection(SPECIFIC_STEPS):
            current["general_only"].add(path)
        else:
            counts["specific_checked"] += 1

    for kind in current:
        counts[kind] = len(current[kind])
    print(
        "hk plan coverage: "
        f"{counts['specific_checked']} with specific checks, "
        f"{counts['general_only']} with general checks only, "
        f"{counts['no_steps']} without steps, "
        f"{counts['symlinks']} symlinks"
    )

    failed = False
    for kind, label in (
        ("general_only", "No specific check"),
        ("no_steps", "No hk step"),
        ("symlinks", "Symlink contents not checked"),
    ):
        new = current[kind] - expected[kind]
        stale = {
            path
            for path in expected[kind] - current[kind]
            if path in tracked or not (ROOT / path).exists()
        }
        if new or stale:
            failed = True
        if args.report or new or stale:
            print(f"{label}:")
            shown = current[kind] if args.report else new
            for path in sorted(shown):
                marker = "NEW " if path in new else "    "
                print(f"  {marker}{path}")
            for path in sorted(stale):
                print(f"  STALE {path}")

    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())

# Dotfiles repository instructions

This is Bogstag's public dotfiles repository. It is managed with chezmoi and is
used primarily on Omarchy Linux. Keep this file concise and update it when an
important repository convention changes.

## Safety and privacy

- Never commit passwords, tokens, private keys, recovery codes, authentication
  URLs, device identities, or other secrets.
- Bitwarden is the intended secret store. Chezmoi may retrieve secrets through
  templates, but rendered secrets must never be written to this repository.
- Treat Syncthing identities and configuration, Obsidian vaults, Tailscale state,
  application sessions, caches, and account data as local machine data.
- Do not inspect or modify `~/Sync`, `~/SyncB`, Obsidian vault contents, or
  Syncthing configuration unless the user explicitly requests it.
- This repository is public. Review staged changes for sensitive information
  before every commit.

## Repository conventions

- The chezmoi source directory is this Git repository. Resolve it with
  `chezmoi source-path` instead of assuming a fixed path.
- `README.md` contains user-facing setup and maintenance instructions.
- `run_once_after_10-install-applications.sh` installs Linux applications and
  enables safe, reproducible user services.
- Omarchy and Hyprland configuration is Linux-specific and must remain excluded
  on other operating systems through `.chezmoiignore`.
- Starship configuration should remain cross-platform and fast to initialize.
- Windows 11 support may be added later. Prefer Scoop for packages and use
  winget only when Scoop is unsuitable, such as for some .NET SDK installations.
- Keep machine enrollment and interactive authentication manual. In particular,
  do not automate Tailscale login or store its state in chezmoi.

## Working method

1. Inspect `git status`, relevant source files, and the rendered chezmoi diff
   before editing.
2. Preserve unrelated user changes. Do not reset or discard them.
3. Edit source-state files, not rendered files in the home directory, unless the
   user explicitly wants to test a local change first.
4. Validate shell scripts with `bash -n`, Git changes with `git diff --check`,
   and configuration with the relevant application validator when available.
5. Review `chezmoi diff` before applying changes. Avoid running an altered
   `run_once_` script merely to preview it.
6. Show the user the result and let them test visible desktop or shell changes
   before committing when practical.
7. Do not push to GitHub without explicit user approval.

## Codex sandbox on Omarchy 4

- System files owned by root may appear as `nobody:nobody` inside the Codex
  sandbox. Do not diagnose incorrect ownership from that sandbox-only view.
- Use a normal `git push`. If sandbox networking or SSH blocks it, report the
  sandbox limitation and let the user push locally; do not bypass the system
  SSH configuration with `ssh -F /dev/null`.

## Current managed scope

- Starship prompt configuration, including Tokyo Night styling.
- Omarchy/Hyprland monitor configuration.
- Linux application bootstrap for Bitwarden, Steam, Syncthing, Tailscale, and
  Visual Studio Code.
- Creation of `~/Sync` and activation of the Syncthing user service. Folder and
  device pairing remain manual.

Use the Omarchy-specific Codex skill whenever changing Omarchy, Hyprland,
terminal, display, bar, theme, or related desktop configuration.

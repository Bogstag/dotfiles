# dotfiles

Personal dotfiles for Omarchy, managed with [chezmoi](https://www.chezmoi.io/).

## Bootstrap

```sh
chezmoi init --apply Bogstag
```

Secrets are retrieved from Bitwarden at apply time and are never committed in plaintext.

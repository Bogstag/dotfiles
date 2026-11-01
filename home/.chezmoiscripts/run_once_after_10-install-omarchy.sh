#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu
if ! command -v omarchy > /dev/null 2>&1; then
    echo "Omarchy saknas; hoppar över installation av Omarchy-applikationer." >&2
    exit 0
fi

# Syncthing
if [[ ! -d "${HOME}/Sync" ]]; then
    echo "Creating Sync directory"
    mkdir -p "${HOME}/Sync"
fi
if ! (systemctl is-enabled --quiet syncthing.service --user); then
    echo "Enable Syncthing service"
    systemctl --user enable --now syncthing.service
fi

# Tailscale
if ! (command omarchy-installed-service-tailscale); then
    echo "Installing Tailscale service"
    omarchy-install-service-tailscale
fi

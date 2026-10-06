#!/bin/bash
set -eu
if ! command -v omarchy > /dev/null 2>&1;then
    echo "Omarchy saknas; hoppar över installation av Omarchy-applikationer." >&2
    exit 0
fi
if [ ! -d "$HOME/Sync" ];then
    mkdir -p "$HOME/Sync"
fi
if ! (systemctl is-enabled --quiet syncthing.service --user);then
    systemctl --user enable --now syncthing.service
fi
if command omarchy-installed-service-tailscale;then
    echo "Tailscale service installed"
else
    omarchy-install-service-tailscale
fi

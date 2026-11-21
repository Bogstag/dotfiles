#!/usr/bin/env bash
#MISE description="uv installs package"
#MISE tags=["install", "uv", "pip"]
#MISE tools={uv="latest"}
#USAGE arg "<action>" help="<action> to take" default="uninstall" {
#USAGE   choices "install" "uninstall"
#USAGE }
#USAGE arg "<package>" help="Apply <action> to pkg"
#USAGE flag "-s --system" help="Installs pkg in system Python env"

set -e

uv pip "${usage_action?}" "${usage_system:-false}" "${usage_package:?}"

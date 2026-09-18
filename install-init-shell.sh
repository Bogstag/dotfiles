#!/bin/sh

# FIXME inline install.sh here instead of using curl | sh
# FIXME consider using packages to install chezmoi on deb and rpm-based systems

set -e

cd "$HOME"

is_command() {
	type "${1}" >/dev/null 2>&1
}

if [ "$LOGNAME" != "" ]; then
	localuser="$LOGNAME"
elif [ "$USER" != "" ]; then
	localuser="$USER"
elif [ "$USERNAME" != "" ]; then
	localuser="$USERNAME"
elif is_command whoami; then
	localuser="$(whoami)"
elif is_command logname; then
	localuser="$(logname)"
else
	printf "unable to determine localuser" 1>&2
	exit 1
fi

chezmoi=chezmoi
if is_command chezmoi; then
	chezmoi --version
elif is_command "${HOME}/.local/bin/chezmoi"; then
	chezmoi="${HOME}/.local/bin/chezmoi"
elif is_command "${HOME}/bin/chezmoi"; then
	chezmoi="${HOME}/bin/chezmoi"
elif is_command curl; then
	sh -c "$(curl -fsSL https://get.chezmoi.io/lb)"
	chezmoi="$HOME/.local/bin/chezmoi"
elif is_command wget; then
	sh -c "$(wget -qO- https://get.chezmoi.io/lb)"
	chezmoi="$HOME/.local/bin/chezmoi"
else
	echo "unable to install chezmoi" 1>&2
	exit 1
fi

"$chezmoi" init --apply Bogstag

shell="$(awk -F : "\$1 == \"${localuser}\" { print \$7 }" /etc/passwd)"
exec "$shell"

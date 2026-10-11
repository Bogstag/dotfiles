#!/bin/bash
# shellcheck disable=SC2317

# Script to add locales de_DE and en_US to Raspberry Pi OS (Bookworm)

# Ensure script is run without sudo to avoid permission issues
if [ "$(id -u)" = "0" ]; then
    echo "Please do not run this script with sudo. Exiting."
    exit 1
fi

echo "Please do not run this script. Dont know if it works"
exit 0

# Add German and US English locales
echo "Generating en_GB.UTF-8 en_US.UTF-8 sv_SE.UTF-8 locales..."
sudo locale-gen en_GB.UTF-8 en_US.UTF-8 sv_SE.UTF-8

# Write desired locales directly to /etc/locale.conf
echo "Setting locale in /etc/locale.conf..."
sudo bash -c 'cat > /etc/locale.conf <<EOF
# Do not set overrides everything below!
# LC_ALL

# Primary language is British English.
# First fallback to Swedish, second fallback to generic English.
LANGUAGE=en_GB:sv:en

# Global default fallback for everything else
LANG=en_GB.UTF-8
# LC_MESSAGES inherits from LANG
# LC_CTYPE inherits from LANG

# Sorting (Swedish: Z, Å, Ä, Ö)
LC_COLLATE=sv_SE.UTF-8

# Swedish regional formats
LC_ADDRESS=sv_SE.UTF-8
LC_IDENTIFICATION=sv_SE.UTF-8
LC_MEASUREMENT=sv_SE.UTF-8
LC_MONETARY=sv_SE.UTF-8
LC_NAME=sv_SE.UTF-8
LC_NUMERIC=sv_SE.UTF-8
LC_PAPER=sv_SE.UTF-8
LC_TELEPHONE=sv_SE.UTF-8
LC_TIME=sv_SE.UTF-8
EOF'

echo "The system will now reboot to apply changes."

# Reboot the system to apply changes
sudo reboot

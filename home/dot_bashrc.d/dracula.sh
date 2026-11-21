#!/usr/bin/env bash
# @file  dracula.sh
# @brief Holds the color codes for eze dracula theme.
# @description
#  EZA_COLORS is an environment variable that customizes file, metadata, and UI colors in eza,
#  (falling back to EXA_COLORS and overriding LS_COLORS and theme.yml).
#  It uses colon-separated key=value pairs with semicolon-delimited ANSI codes or reset.
#  It is the dracula theme.
#
# @see It get sourced in [.bashrc](~/.bashrc)
# @see [eza-community/eza_colors.5.md](https://github.com/eza-community/eza/blob/main/man/eza_colors.5.md)
# @see [Dracula Theme for eza](https://draculatheme.com/eza)
# @noargs
# ---------------------
# eza universal Dracula
# ---------------------
export EZA_COLORS="\
uu=36:\
uR=31:\
un=35:\
gu=37:\
da=2;34:\
ur=34:\
uw=95:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:\
xx=95:"

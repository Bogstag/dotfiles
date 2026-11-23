# Starship

Cross-Shell prompt

[Starship Configuration](https://starship.rs/config/)

Cleaning up starship.toml and moving it here.

## Current Prompt

This is how my current prompt is structured.

```sh
 starship explain
Here's a breakdown of your prompt:
" " (<1ms)        -  A character (usually an arrow) beside where the text is entered in your terminal
" ~ " (3ms)         -  The current working directory
" 󰣇 " (9ms)         -  The current operating system
" 󱆃 " (<1ms)        -  The currently used shell indicator
"  13:57 " (<1ms)  -  The current local time

# Complete structure
╭─ $shell  $os  $directory  $git_branch  $nodejs  $mise  $jobs  $cmd_duration  $time 
╰─

# Continuation Prompt
" "
```

## Colours

```sh
# Shell:        [╭─](fg:#9a348e bg:#2b2d36)\   # First on first line (to the left)
# Os:           [](fg:#9a348e bg:#da627d)\
# Directory     [](fg:#da627d bg:#bd93f9)\
# Git:          [](fg:#bd93f9 bg:#86bbd8)\
# Lang:         [](fg:#86bbd8 bg:#ff79c6)\
# mise:         [](fg:#ff79c6 bg:#06969a)\
# Jobs:         [](fg:#06969a bg:#33658a)\
# Cmd Duration: [](fg:#33658a bg:#fca17d)\
# Time:         [](fg:#fca17d bg:#50fa7b)\     # Last on first line (to the right)
# Line Break:   [](fg:#50fa7b bg:#2b2d36)\
# Character:    [╰─](fg:#9a348e bg:#2b2d36)\    # First on second line
```

### Random colours

I dont know why, but i found them in starship.toml.

```sh
# #da627d
# #fca17d
# #86bbd8
# #ff79c6
# #06969a
# #33658a
# #bd93f9
# #50fa7b
# #644ac9
```

## Nerd Fonts

[Useful Nerd Fonts](https://www.nerdfonts.com/cheat-sheet) and normal characters.

```sh
# Normal characters
#   «‹«‹»›»› ╌╍┅╺╸╺╾╼╾╼┉┈┄­  ─╶╶╴—‐―‑– ▁▂▃▄▅▆▇█ ▉▊▋▌▍▍▎▏▐ ░▒▓ ␩␨␧
#   ┌─┐  ┎┒    ╭╮           ╒═╕
#   │ │┍┑┖┚┏┓╔╗╰╯ ├─┴─┼─┬─┤ ╘═╛╓╖ ╲ ╱ ▛▜
#   └─┘┕┙  ┗┛╚╝                ╙╜  ╳  ▌▐
#                                 ╱ ╲ ▙▟
#           | ═ ║
# nf-extra
#        
#
# Fun from nf-fa, nf-md
#   󱎃   󰯉  ⬬ 󰳳
#
# nf-md-format-align     | nf-fa-align
#   󰉣 󰉡 󰉢 󰉠 󰉣󰉢 󰉣󰉡󰉢 󰉢󰉠󰉣 󰉠󰉠󰉠 |         
#
# nf-ple shapes
#                        
#
# nf-ple flame | pixel | ice
#              |                |          |
#
# nf-ple honey | lego
#                |            
#
# nf-ple
#   
```

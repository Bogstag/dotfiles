# fig

fig is a FIGlet wrapper, with some functionallity added.

FIGlet stands for "Frank, Ian and Glenn's LETters".

FIGlet prints its input using  large  characters a.k.a FIGcharacters. Made  up  of  ordinary  screen  characters a.k.a sub-characters.

Source: [figlet.org](https://www.figlet.org/), [cmatsuoka/figlet (github)](https://github.com/cmatsuoka/figlet), [The TOIlet project](http://caca.zoy.org/wiki/toilet)
Everything you ever whanted to know aout FIGlets: [figfont.txt](https://github.com/cmatsuoka/figlet/blob/master/figfont.txt)

## Command

```sh
Version: 2.2.5, date: 31 May 2012

Usage: figlet [ -cklnoprstvxDELNRSWX ] [ -d fontdirectory ]
              [ -f fontfile ] [ -m smushmode ] [ -w outputwidth ]
              [ -C controlfile ] [ -I infocode ] [ message ]

# Big letter is usally inverse to small letter
[ -cklnoprstvxDELNRSWX ]
  -A                # Read input from stdin
  -k                # Kerning (default for most fonts).
  -o                # No smushing (overlap only).
  -s,S              # Smushing, Force smushing
  -v                # Prints version
  -h                # Print help
  # Controls outputwidth
  -t                # Sets the outputwidth to the terminal width.
  -w                # Output width (default 80)
  -W                # No width handling (no smushing, no kerning).
  # Controls how FIGlet handles newlines.
  -p                # Puts FIGlet into paragraph mode
  -n                # (default) every newline is a line break.
  # Handle the justification of FIGlet output.
  -c                # Center justification.
  -l                # Left justification
  -r                # Right justification.
  -x                # Default justification.
  # Controls whether FIGlet prints left-to-right or right-to-left.
  -L                # Selects left-to-right printing.
  -R                # Selects right-to-left printing.
  -X                # Default text direction
[ -d fontdir ]      # Font directory path.
[ -f fontfile ]     # Font name (without .flf/.tlf suffix).
[ -m layoutmode ]   # Specifies an explicit layoutmode between 1 and 63.
[ -w outputwidth ]  # (default: 80) The screen width FIGlet assumes.
[ -C Controlfile ]  # Control file (.flc) for character mapping.
[ -I Infocode ]     # Display info (0=usage, 1=version, 2=fontdir, 3=font, 4=width, 5=formats)
[ -D Deutsch On ]   # Switches to the German (ISO 646-DE) character set.
[ -E Deutsch Off ]  # Turns off -D processing.
[ message ]         # Message to display in FIGlets
```

## Files and Font Formats

| Name | Ext | Format |
| ------------------- | ------- | --------------------- |
| FIGlet font file | `*.flf` | `flf2` FIGfont V2 |
| FIGlet control file | `*.flc` | |
| TOIlet | `*.tlf` | `tlf2` |

## Software

The current version of FIGlet is 2.2.5 (May 2012)
When using figlet raw, tou can write and end/exit with `EOF` or `CTRL + D`

### Scripts

#### figlist

Script that lists available fonts and control files.
Usage: `figlist [ -d directory ]`

#### showfigfonts

Script that gives a sample of each available font.
Usage: `showfigfonts [ -d directory ] [ word ]`

#### chkfont

Checks figlet 2.0/2.1 font files for format errors.
Usage: chkfont fontfile

It gives a lot of errors, but the FIGlet works.

#### figmagic

Enable the file command to report on FIGlet fonts and controlfiles.

## Thanks to Figlet

```txt
 _____ _____ _____ __      __       _____ _____ _____
|   __|     |   __|  |____|  |_    |   __|  _  |     | This FIGlet FAQ is
|   __|-   -|  |  |  | - _|   _|   |   __|     |  |  | posted once a month
|__|  |_____|_____|__|____|__|     |__|  |__|__|__  _| on figlet@figlet.org
  info@figlet.org        http://www.figlet.org/   |__|   [FIGlet FAQ v0.91]

===========================================================================
The latest version of FIGlet is 2.2.5 and can be downloaded from
ftp://ftp.figlet.org/pub/figlet/program
===========================================================================
```

## Other fun things

### Chess

```chess
     _ _                          __                 __           __
    | U |_      || _     _  _   _/ _||()_|| _ _  _  / _|   _ ||  |o )
    |   /o\\VV7 | ]o\ |U(c'/o\ /o\ ]| ]//| Xo(c'(c' | ]o\|/ \| ]  //
    |_n_\_/ VV  L|\_/ \_X_)\(  \(L| L|L\\Ln\(\_)\_) L|\_/L_n|L|
==================================================================()============

             On White square             On Black square
             White       Black           White       Black

Pawn          P           O               p           o
Rook          R           T               r           t
Knight        C           V               c           v
Bishop        B           N               b           n
King          K           L               k           l
Queen         Q           W               q           w
Empty sq.     (           )

Whole line    Y           y     .............................(empty squares)
Pieces line   A           a
Pawns line    Z           z

Numbering :  1 2 3 4 5 6 7 8  for the corresponding numbers
                    0         for the letters line

For a complete board, type in :
  08a7z6y5Y4y3Y2Z1A (with numbering)
  azyYyYZA (without !)

If you really don't like the '#' character for black squares, just pipe the
 Figlet output to 'tr'. The ':' character gives good results...

   `echo 08a7z6y5Y4y3Y2Z1A | figlet -f eftichess | tr # :`
   Whis worked for me: `echo 08a7z6y5Y4y3Y2Z1A | figlet -f eftichess`



The original chess board looks like that !

                  _        _        _        __       __       _
        /\       |_)      /        | \      |_       |_       /        |_|
       /--\      |_)      \_       |_/      |__      |        \_?      | |

  _           #########         #########         #########         #########
 (_)   [`'`'] ##\`.'/##  ':v:`  ##/\:/\##  |:+:|  ##':v:`##  \`.'/  ##[`'`']#
 (_)    |::|  ##(o:o)##  (o:0)  #/(o:o)\#  (o:o)  ##(o:0)##  (o:o)  ###|::|##
        |::|  ###\:/:\#   (:)   ###(:)###   (:)   ###(:)###   \:/:\ ###|::|##
              ####"####         #########         #########    "    #########
  __ #########    _    #########    _    #########    _    #########    _
   / ###(:)###   (:)   ###(:)###   (:)   ###(:)###   (:)   ###(:)###   (:)
  /  ###|:|###   |:|   ###|:|###   |:|   ###|:|###   |:|   ###|:|###   |:|
     ###|:|###   |:|   ###|:|###   |:|   ###|:|###   |:|   ###|:|###   |:|
     #########         #########         #########         #########
              #########         #########         #########         #########
  /           #########         #########         #########         #########
 (_)          #########         #########         #########         #########
              #########         #########         #########         #########
              #########         #########         #########         #########
  _  #########         #########         #########         #########
 |_  #########         #########         #########         #########
  _) #########         #########         #########         #########
     #########         #########         #########         #########
     #########         #########         #########         #########
   .          #########         #########         #########         #########
  /|          #########         #########         #########         #########
 '-|          #########         #########         #########         #########
              #########         #########         #########         #########
              #########         #########         #########         #########
  _  #########         #########         #########         #########
  _) #########         #########         #########         #########
  _) #########         #########         #########         #########
     #########         #########         #########         #########
     #########         #########         #########         #########
  _      _    #########    _    #########    _    #########    _    #########
   )    (_)   ###(_)###   (_)   ###(_)###   (_)   ###(_)###   (_)   ###(_)###
  /_    | |   ###| |###   | |   ###| |###   | |   ###| |###   | |   ###| |###
        |_|   ###|_|###   |_|   ###|_|###   |_|   ###|_|###   |_|   ###|_|###
              #########         #########         #########         #########
     #########         #########   ___   #########         #########
  /| ##[`'`']#  \`~'/  ##'\v/`##  /\*/\  ##|`+'|##  '\v/`  ##\`~'/##  [`'`']
   | ###|  |##  (o o)  ##(o 0)## /(o o)\ ##(o o)##  (o 0)  ##(o o)##   |  |
     ###|__|##   \ / \ ###(_)###   (_)   ###(_)###   (_)   ###\ / \#   |__|
     #########    "    #########         #########         ####"####

```

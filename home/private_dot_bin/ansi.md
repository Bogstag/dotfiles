# ANSI Code Generator

Source: [fidian/ansi](https://github.com/fidian/ansi)

This bash script will generate the proper ANSI escape sequences to move the cursor around the screen, make text bold, add colors and do much more.

## Scripting

Leverage `ansi` as a Bash library, you gain access to the following functions.

### Display Manipulation

- `ansi::insertChars` - Inserts blanks at the cursor, shifting the line right. Optional argument for the number of characters.
- `ansi::eraseDisplay` - Optional argument where `0` is below, `1` is above, `2` is all, and `3` is saved.
- `ansi::eraseLine` - Erase within a line. Optional argument where `0` is right, `1` is left, and `2` is all.
- `ansi::insertLines` - Inserts lines at the cursor. Optional argument for the number of lines.
- `ansi::deleteLines` - Optional argument for the number of lines.
- `ansi::deleteChars` - Optional argument for the number of characters.
- `ansi::scrollUp` - Optional argument for the number of lines.
- `ansi::scrollDown` - Optional argument for the number of lines.
- `ansi::eraseChars` - Optional argument for the number of characters.
- `ansi::repeat` - Optional argument for the number of times to repeat the preceding character.

### Cursor

- `ansi::saveCursor` - Saves the cursor position.
- `ansi::restoreCursor` - Restores the cursor position.
- `ansi::hideCursor` - Makes the cursor invisible.
- `ansi::showCursor` - Restores the normal cursor to the screen.
- Moves the cursor
  - `ansi::up` - Optional argument for the number of lines.
  - `ansi::down` - Optional argument for the number of lines.
  - `ansi::forward` - Optional argument for the number of characters.
  - `ansi::backward` - Optional argument for the number of characters.
  - `ansi::nextLine` - Optional argument for the number of lines.
  - `ansi::previousLine` - Optional argument for the number of lines.
  - `ansi::column` - Optional argument for which column.
  - `ansi::position` - Optional argument for the rows and columns in the format `R,C`. Both the row and the column are also optional.
  - `ansi::tabForward` - Optional argument for the number of tab stops.
  - `ansi::tabBackward` - Optional argument for the number of tab stops.
  - `ansi::columnRelative` - Optional argument for the number of columns.
  - `ansi::line` - Optional argument for the line number.
  - `ansi::lineRelative` - Optional argument for the number of lines.

### Text Attributes

All will automatically reset, unless `--no-reset`

- `ansi::bold` and `ansi::faint` can be reset with `ansi::normal`
- `ansi::italic` and `ansi::fraktur` can be reset with `ansi::plain`
- `ansi::underline` and `ansi::double-underline` are reset with `ansi::noUnderline`
- `ansi::blink` and `ansi::rapidBlink` are reset with `ansi::noBlink`
- `ansi::inverse` is removed with `ansi::noInverse`
- `ansi::invisible` is changed back with `ansi::visible`
- `ansi::strike` is reset with `ansi::noStrike`
- `ansi::frame` and `ansi::encircle` are reset with `ansi::noBorder`
- `ansi::overline` is removed with `ansi::noOverline`
- `ansi::font` Optional argument is 0-9, 0 = default font
- `ansi::resetIdeogram` removes all below
  - `ansi::ideogramRight`, `ansi::ideogramLeft`
  - `ansi::ideogramRightDouble`, `ansi::ideogramLeftDouble`
  - `ansi::ideogramStress`

### Foreground Text

All will automatically reset, unless `--no-reset`

- `ansi::black` and `ansi::blackIntense`
- `ansi::red` and `ansi::redIntense`
- `ansi::green` and `ansi::greenIntense`
- `ansi::yellow` and `ansi::yellowIntense`
- `ansi::blue` and `ansi::blueIntense`
- `ansi::magenta` and `ansi::magentaIntense`
- `ansi::cyan` and `ansi::cyanIntense`
- `ansi::white` and `ansi::whiteIntense`
- `ansi::color` - Required is 0-255 (color code).
- `ansi::rgb` - Three required 0-255 (red, green and blue color codes).

### Background Text

All will automatically reset, unless `--no-reset`

- `ansi::bgBlack` and `ansi::bgBlackIntense`
- `ansi::bgRed` and `ansi::bgRedIntense`
- `ansi::bgGreen` and `ansi::bgGreenIntense`
- `ansi::bgYellow` and `ansi::bgYellowIntense`
- `ansi::bgBlue` and `ansi::bgBlueIntense`
- `ansi::bgMagenta` and `ansi::bgMagentaIntense`
- `ansi::bgCyan` and `ansi::bgCyanIntense`
- `ansi::bgWhite` and `ansi::bgWhiteIntense`
- `ansi::bgColor` - Required is 0-255 (color code).
- `ansi::bgRgb` - Three required 0-255 (red, green and blue color codes).

### Reset Text

Stop `--no-reset`.

- `ansi::resetAttributes` - Reset all attributes
- `ansi::resetForeground` - Reset the foreground to default
- `ansi::resetBackground` - Reset the background to default
- `ansi::resetColor` - Reset all color-related settings
- `ansi::resetFont` - Reset the font to the primary font

### Reporting

- `ansi::report`
  - Writes a query to stderr (file descriptor 2)
  - Listens for information from stdin (file descriptor 0)
  - Returns the result through the environment variable `ANSI_REPORT`.
- `ansi::reportPosition` - ROW,COL
- `ansi::reportWindowState` - "open" or "iconified"
- `ansi::reportWindowPosition` - X,Y
- `ansi::reportWindowPixels` - HEIGHT,WIDTH
- `ansi::reportWindowChars` - ROWS,COLS
- `ansi::reportScreenChars` - ROWS,COLS (this is for the entire screen)
- `ansi::reportIcon`
- `ansi::reportTitle`

### Miscellaneous

- `ansi::colorTable` - Display a color table.
- `ansi::colorCodes` - Show all of the 256 color codes.
- `ansi::icon` - Set the icon. Optional argument of the icon to set.
- `ansi::title` - Set the title of the terminal. Optional argument of the title to set as a single argument, use "".
- `ansi::bell` - Send the bell character to the terminal. The terminal may beep, ding, or produce no sound.
- `ansi::reset` - Reset all colors, clear the screen, show the cursor and move to 1,1.
- `ansi::colorCodes` - Show a table of the available color codes.
- `ansi::colorCodePatch` - Helper function to show a patch of color. Internal use only.
- `ansi::colorTable` - Show a table of the different standard colors, text attributes, and similar things.
- `ansi::colorTableLine` - Helper function to show a line of colors.
- `ansi::isAnsiSupported` - Returns true (0) when ANSI is supported. Tries checking using tools, falls back to querying the terminal.
- `ansi::showHelp` - Shows the help for the `ansi` command.
- `ansi` - The mother

## CLI

All options must be placed first.

`ansi \[OPTIONS\] \[TEXT TO DISPLAY\]`

A good start is `--color-table` or `--color-codes`.

Most of these options will automatically reset to normal text unless `--no-reset` is used.

### CLI Options

Only the long and short version of options.

- `--insert-chars[=N]`, `--ich[=N]` - Insert blanks at cursor, shifting the line right.
- `--erase-display[=N]`, `--ed[=N]` - Erase in display. 0=below, 1=above, 2=all, 3=saved.
- `--erase-lines[=N]`, `--el[=N]` - Erase in line. 0=right, 1=left, 2=all.
- `--insert-lines[=N]`,`--il[=N]`
- `--delete-lines[=N]`, `--dl[=N]`
- `--delete-chars[=N]`, `--dch[=N]`
- `--scroll-up[=N]`, `--su[=N]`
- `--scroll-down[=N]`, `--sd[=N]`
- `--erase-chars[=N]`, `--ech[=N]`
- `--repeat[=N]`, `--rep[=N]` - Repeat preceding character N times.
- `--up[=N]`, `--cuu[=N]`
- `--down[=N]`, `--cud[=N]`
- `--forward[=N]`, `--cuf[=N]`
- `--backward[=N]`, `--cub[=N]`
- `--next-line[=N]`, `--cnl[=N]`
- `--previous-line[=N]`, `--cpl[=N]`
- `--column[=N]`, `--cha[=N]`
- `--position[=[ROW],[COL]]`, `--cup[=[ROW],[COL]]`
- `--tab-forward[=N]` - Move forward N tab stops.
- `--tab-backward[=N]` - Move backward N tab stops.
- `--column-relative[=N]`, `--hpr[=N]`
- `--line[=N]`, `--vpa[=N]`
- `--line-relative[=N]`, `--vpr[=N]`
- `--save-cursor` - Saves the cursor position. By default, this will restore the cursor after writing text to the terminal unless you use `--no-restore`.
- `--restore-cursor` - This just restores the cursor position. Normally this executes at the end when you use `--save-cursor`.
- `--hide-cursor` - This also will show the cursor at the end unless you use `--no-restore`.
- `--show-cursor`
- `--bold` and `--faint` can be reset with `--normal`
- `--italic` and `--fraktur` can be reset with `--plain`
- `--underline` and `--double-underline` are reset with `--no-underline`
- `--blink` and `--rapid-blink` are reset with `--no-blink`
- `--inverse` is removed with `--no-inverse`
- `--invisible` is changed back with `--visible`
- `--strike` is reset with `--no-strike`
- `--frame` and `--encircle` are reset with `--no-border`
- `--overline` is removed with `--no-overline`
- `--ideogram-right`, `--ideogram-right-double`, `--ideogram-left`, `--ideogram-left-double`, and `--ideogram-stress` are all removed with `--reset-ideogram`
- `--font=NUM` sets the font. `NUM` must be a single digit from 0 through 9. Font 0 is the default font.
- `--black` and `--black-intense`
- `--red` and `--red-intense`
- `--green` and `--green-intense`
- `--yellow` and `--yellow-intense`
- `--blue` and `--blue-intense`
- `--magenta` and `--magenta-intense`
- `--cyan` and `--cyan-intense`
- `--white` and `--white-intense`
- `--color=CODE` lets you use one of 256 codes - preview the codes using `--color-codes`
- `--rgb=R,G,B` sets a specific color
- `--bg-black` and `--bg-black-intense`
- `--bg-red` and `--bg-red-intense`
- `--bg-green` and `--bg-green-intense`
- `--bg-yellow` and `--bg-yellow-intense`
- `--bg-blue` and `--bg-blue-intense`
- `--bg-magenta` and `--bg-magenta-intense`
- `--bg-cyan` and `--bg-cyan-intense`
- `--bg-white` and `--bg-white-intense`
- `--bg-color=CODE` lets you use one of 256 codes - preview the codes using `--color-codes`
- `--bg-rgb=R,G,B` sets a specific color
- `--reset-attrib`
- `--reset-foreground`
- `--reset-background`
- `--reset-color`
- `--reset-font`
- `--report-position` - ROW,COL
- `--report-window-state` - "open" or "iconified"
- `--report-window-position` - X,Y
- `--report-window-pixels` - HEIGHT,WIDTH
- `--report-window-chars` - ROWS,COLS
- `--report-screen-chars` - ROWS,COLS (this is for the entire screen)
- `--report-icon`
- `--report-title`
- `--color-table` - Display a color table.
- `--color-codes` - Show all of the 256 color codes.
- `--icon=NAME` - Set the icon.
- `--title=TITLE` - Set the title of the terminal.
- `--no-restore` - Do not issue reset codes when changing colors and saving the cursor.
- `--no-newline`, `-n` - Do not add a newline at the end.
- `--bell` - Add the terminal's bell sequence to the output.
- `--reset` - Reset all colors, clear the screen, show the cursor, restore the primary font, and move to 1,1.

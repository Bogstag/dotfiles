# Windows in Hyperland

Source: [Hyperland Wiki/Windows Rules](https://wiki.hypr.land/configuring/core/rules/window-rules/)

## Window Rules

```lua
hl.window_rule({
    name? = string,
    match = {
        prop = some_prop_value,
    },
    effect = some_effect_value,
})
```

## hyprctl

Explore windows and current things on your display.

```bash
# Lists current windows
hyprctl clients
# Gets active workspace
hyprctl activeworkspace
# Add tag to not current window.
hyprctl dispatch 'hl.dsp.window.tag({ tag = "+code", window = "class:Celluloid" })'
# Remove tag from current window.
hyprctl dispatch 'hl.dsp.window.tag({ tag = "-code" })'
# Toggle the tag of current window.
hyprctl dispatch 'hl.dsp.window.tag({ tag = "code" })'
```

### Noteworthy and Named rules

Effects are processed top to bottom.

Only named rules can be dynamically changed, enabled, or disabled.

### Props

<details>
The supported fields for the `match` table are:

| Prop                      | Description                               |
| ------------------------- | ----------------------------------------- |
| class                     | `RegEx` matching `class`.                 |
| content                   | Content matching none, photo, video, game |
| focus                     | Currently focused window                  |
| fullscreen                | Fullscreen windows                        |
| fullscreen_state_client   | Windows matching `fullscreenstate`.       |
| fullscreen_state_internal | Windows matching `fullscreenstate`.       |
| float                     | Floating windows                          |
| group                     | Grouped windows                           |
| initial_class             | `RegEx` matching `initialClass`           |
| initial_title             | `RegEx` matching `initialTitle`           |
| modal                     | Modal windows                             |
| pin                       | Pins the non floating window.             |
| tag                       | Windows with matching `tag`.              |
| title                     | `RegEx` matching `title`.                 |
| workspace                 | Windows on matching workspace.            |
| xdg_tag                   | Match a window by xdgTag                  |
| xwayland                  | Xwayland windows, just is?                |

`fullscreenstate` is one of: `0` - none, `1` - maximize, `2` - fullscreen, `3` - maximize and fullscreen
</details>

### Effects

#### Static effects

<details>
Static effects are evaluated once when the window is opened and never again.

| Effect           | Description                                                               |
| ---------------- | ------------------------------------------------------------------------- |
| center           | Floating window will center it on the monitor.                            |
| content          | Sets content type: `none`, `photo`, `video`, or `game`                    |
| float            | Floats a window                                                           |
| fullscreen       | Fullscreens a window                                                      |
| fullscreen_state | Sets the `fullscreenstate`, se above.                                     |
| group            | Sets window group properties.                                             |
| maximize         | Maximizes a window.                                                       |
| monitor          | Window opens on monitor (e.g., `"1"`, `"DP-1"`). or suffixed: `" silent"` |
| move             | Moves a floating window to the given monitor-local coordinates.           |
| no_close_for     | Makes the window uncloseable with `killactive` for x ms on open.          |
| no_initial_focus | Disables the initial focus to the window                                  |
| pin              | Pins the floating window.                                                 |
| pseudo           | Pseudotiles a window                                                      |
| scrolling_width  | Set column width for window when using the scrolling layout               |
| size             | Resizes a floating window.                                                |
| suppress_event   | Ignores specific events.                                                  |
| tile             | Tiles a window.                                                           |
| workspace        | Workspace a window should open or `"unset"` or suffixed: `" silent"`      |

Event is one or more of (separated with space): `"fullscreen" "maximize" "activate" "activatefocus" "fullscreenoutput" "x11configurerequest"`
</details>

##### `group` Effect options

| Group      | Description                                                   |
| ---------- | ------------------------------------------------------------- |
| `barred`   | Do not automatically group into the focused unlocked group.   |
| `deny`     | Do not allow the window to be toggled as or added to a group. |
| `invade`   | Force open window in the locked group.                        |
| `lock`     | `always` - Lock the group. Combine with `"set"` or `"new"`.   |
| `new`      | Shorthand for `"barred set"`.                                 |
| `override` | [other options] - Override other `group` rules.               |
| `set`      | `always` - Open window as a group.                            |
| `unset`    | Clear all `group` rules.                                      |

#### Position and size Expressions

| Desc            | Width     | Height    |
| --------------- | --------- | --------- |
| monitor size    | monitor_w | monitor_h |
| window position | window_x  | window_y  |
| window size     | window_w  | window_h  |
| cursor position | cursor_x  | cursor_y  |

#### Dynamic effects

<details>
<summary>Examples</summary>
Dynamic effects are re-evaluated every time a property changes.
All dynamic effects can be set with [`set_prop()`](https://wiki.hypr.land/configuring/core/dispatchers/#set_prop).

| Effect               | Description                                                                          |
| -------------------- | ------------------------------------------------------------------------------------ |
| allows_input         | Forces an Xwayland window to receive input.                                          |
| animation            | Forces an animation onto a window with an optional style.                            |
| border_color         | Sets the window's border to a color or gradient.                                     |
| border_size          | Sets the border size.                                                                |
| confine_pointer      | Locks the mouse cursor to the window.                                                |
| dim_around           | Dims everything around the window. Meant for floating windows.                       |
| decorate             | Whether to draw window decorations. Default: `true`                                  |
| focus_on_activate    | Whether Hyprland should focus an app that requests to be focused.                    |
| idle_inhibit         | Sets an idle inhibit rule. One of `none`, `always`, `focus`, `fullscreen`            |
| immediate            | Forces the window to allow tearing.                                                  |
| keep_aspect_ratio    | Forces aspect ratio when resizing with the mouse.                                    |
| max_size             | Sets the maximum size for floating windows.                                          |
| min_size             | Sets the minimum size for floating windows.                                          |
| nearest_neighbor     | Forces nearest-neighbor filtering.                                                   |
| no_anim              | Disables animations for the window.                                                  |
| no_auto_hdr          | Disables AutoHDR for the window.                                                     |
| no_blur              | Disables blur for the window.                                                        |
| no_dim               | Disables window dimming for the window.                                              |
| no_focus             | Disables focus to the window.                                                        |
| no_follow_mouse      | Prevents the window from being focused when `input.follow_mouse=1` is set.           |
| no_glow              | Disables glow for the window.                                                        |
| no_max_size          | Removes max size limitations.                                                        |
| no_screen_share      | Hides from screen sharing by drawing black rectangles in their place.                |
| no_shadow            | Disables shadows for the window.                                                     |
| no_shortcuts_inhibit | Disallows the app from inhibiting your shortcuts.                                    |
| no_vrr               | Disables VRR for the window when `misc.vrr` is set to `2` or `3`.                    |
| no_wobble            | Disables wobble for the window.                                                      |
| no_xdg_drags         | If true, will disable XDG-driven drags of window.                                    |
| opacity              | Additional opacity multiplier.                                                       |
| opaque               | Set decoration.active/inactive/fullscreen_opacity to `1`. Just do it!                |
| force_rgbx           | Disables the window's own transparency.                                              |
| persistent_size      | For floating windows, internally store their size.                                   |
| render_unfocused     | Forces the window to act as rendered when it's not visible.                          |
| rounding             | Forces X pixels of rounding.                                                         |
| rounding_power       | Overrides the rounding power for the window.                                         |
| scroll_mouse         | Force to override `input.scroll_factor`                                              |
| scroll_touchpad      | Force to override `input.touchpad.scroll_factor`                                     |
| stay_focused         | Force focus on the window as long as it's visible.                                   |
| sync_fullscreen      | Whether the fullscreen mode should always be the same as the one sent to the window. |
| tag                  | Applies a tag. Prefix `+` is set / `-` to unset.                                     |
| tonemap              | Tonemapping behavior: `on` (Default), `off`, `clamp` luminance, `limited`.           |
| xray                 | Sets blur xray mode for the window.                                                  |

</details>

#### Tags

Dynamic tags have a suffix of `*`.
Add static tag with `hl.dsp.window.tag`, dynamic tag with window rule `tag`.

#### Examples in Lua

<details>

```lua
local myRule = hl.window_rule({
  name        = "my-rule",
  match       = { class = "kitty" },
  border_size = 5,
})

myRule:set_enabled(false)  -- disable
myRule:set_enabled(true)   -- re-enable
myRule:is_enabled()        -- query status

-- Single color
border_color = "rgb(FF0000)"
-- Gradient
border_color = { colors = { "rgba(33ccffee)", "rgba(00  `taff99ee)" }, angle = 45 }

-- Set size to x = 800, y = 600
size = { 800, 600 }

-- Move window center to the cursor position
move = { "cursor_x - (window_w _0.5)", "cursor_y - (window_h_ 0.5)" }

-- Align window with the left monitor border and 17 pixels below monitor center
move = { "window_w * 0.5", "(monitor_h / 2) + 17" }

-- Set windiw suze to the half monitor resolution
size = { "monitor_w _0.5", "monitor_h_ 0.5" }

-- Set max_size as half of the monitor width and height
max_size = { "monitor_w*0.5", "monitor_h*0.5" }

-- Move kitty to 100 100 and add an anim style (named rule)
hl.window_rule({
  name      = "move-kitty",
  match     = { class = "kitty" },
  move      = {100, 100},
  animation = "popin",
})

-- Disable blur for firefox
hl.window_rule({ match = { class = "firefox" }, no_blur = true })

-- Move kitty to the center of the cursor
hl.window_rule({
  match = { class = "kitty" },
  move  = {"cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)"},
})

-- Set border color to red if window is fullscreen
hl.window_rule({
  match        = { fullscreen = true },
  border_color = "rgb(FF0000) rgb(880808)",
})

-- Set border color to yellow when title contains Hyprland
hl.window_rule({
  match        = { title = ".*Hyprland.*" },
  border_color = "rgb(FFFF00)",
})

-- Set opacity to 1.0 active, 0.5 inactive and 0.8 fullscreen for kitty
hl.window_rule({
  match   = { class = "kitty" },
  opacity = "1.0 override 0.5 override 0.8 override",
})

-- Set rounding to 10 for kitty
hl.window_rule({ match = { class = "kitty" }, rounding = 10 })

-- Fix pinentry losing focus
hl.window_rule({
  match        = { class = "(pinentry-)(.*)" },
  stay_focused = true,
})

-- Non-floating window have `opacity 0.8`, floating have `0.5`.
hl.window_rule({ match = { float = true },    opacity = "0.5 override 0.5 override" })
hl.window_rule({ match = { class = "kitty" }, opacity = "0.8 override 0.8 override" })
```

</details>

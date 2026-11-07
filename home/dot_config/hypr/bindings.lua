-- Source: file:///home/bogge/.config/hypr/bindings.lua
-- Extend: file:///usr/share/omarchy/default/hypr/bindings/applications.lua
-- Extend: file:///usr/share/omarchy/default/hypr/bindings/clipboard.lua
-- Extend: file:///usr/share/omarchy/default/hypr/bindings/media.lua
-- Extend: file:///usr/share/omarchy/default/hypr/bindings/tiling.lua
-- Extend: file:///usr/share/omarchy/default/hypr/bindings/utilities.lua
-- Extend: file:///usr/share/omarchy/default/hypr/bindings/voxtype.lua
-- Add new bindings or unbind defaults before replacing them.
-- ("hyprctl reload" to activate settings after changes)
-- Keep only your personal keybinding overrides here.
--
--
--
--#region >>> me:managed >>>
--
-- How can i press grave on swedish keyboard?
-- This is how you Toggle Quake console: SUPER + SHIFT + grave
-- And to Move window to Quake console is: SUPER + SHIFT + SHIFT + grave
-- Anyways it is impossible with out rebinding some keys. You dont really need to unbind the standard.
--
hl.unbind("SUPER + grave")
o.bind("SUPER + code:49", "Toggle Quake console", hl.dsp.workspace.toggle_special("qconsole"))
--
hl.unbind("SUPER + SHIFT + grave")
o.bind("SUPER + SHIFT + code:49", "Move window to Quake console",
    hl.dsp.window.move({ workspace = "special:qconsole", follow = false }))
--
-- Open the installed ChatGPT desktop app instead of the default web app.
hl.unbind("SUPER + SHIFT + A")
o.bind("SUPER + SHIFT + A", "ChatGPT app", { launch = "chatgpt" })
--
-- Open Omafile more windows like binding
o.bind("SUPER + E", "Omafile", "omarchy-shell shell toggle xyzlab.omafile '{}'")
--
-- Rebind the new file to the default keybinding, so when im pressing wrong combo it still works.
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager Omafile", "omarchy-shell shell toggle xyzlab.omafile '{}'")
--
--
o.bind("SUPER + SHIFT + K", "Quick Reference", "omarchy-shell shell toggle ggregoro.quick-reference")
--
--#endregion <<< me:managed <<<
--
--
--

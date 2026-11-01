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
--#region MARK: >>> me:managed >>>
--
--
-- Open the installed ChatGPT desktop app instead of the default web app.
hl.unbind("SUPER + SHIFT + A")
o.bind("SUPER + SHIFT + A", "ChatGPT app", { launch = "chatgpt" })
--
--
-- Open Omafile more windows like
o.bind("SUPER + E", "Omafile", "omarchy-shell shell toggle xyzlab.omafile '{}'")
--
-- Rebind the new file to the default keybinding, so when im pressing wrong combo it still works.
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager Omafile", "omarchy-shell shell toggle xyzlab.omafile '{}'")
--
--
--#endregion <<< me:managed <<<
--
--
--

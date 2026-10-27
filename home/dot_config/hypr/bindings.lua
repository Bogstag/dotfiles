-- Source: file:///home/bogge/.config/hypr/bindings.lua
-- Keep only your personal keybinding overrides here. Add new bindings or unbind defaults before replacing them.
-- To disable all preinstalled app/webapp bindings, set: omarchy_preinstalled_bindings = false
-- See current bindings and descriptions: omarchy menu keybindings --print
-- To disable every Omarchy default binding, set this in ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add only the bindings you want below: omarchy_default_bindings = false
--
--
--
-- >>> me:managed >>> ("hyprctl reload" to activate settings after changes)
-- Open the installed ChatGPT desktop app instead of the default web app.
hl.unbind("SUPER + SHIFT + A")
o.bind("SUPER + SHIFT + A", "ChatGPT app", { launch = "chatgpt" })
-- <<< me:managed <<<
--
--
--
-- >>> omanta-switch managed block, do not edit by hand >>>
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + ALT + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", "omanta-launch")
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", "omanta-launch-cwd")
o.window("^omanta-picker$", {
	float = true,
	center = true,
	tag = "-default-opacity",
	opacity = "1 override 1 override 1 override",
})
-- <<< omanta-switch managed block <<<
--
-- >>> nav-guide managed >>>
-- [nav-guide-keybind]
-- Enhanced Super+K window for Omarchy
hl.unbind("SUPER + K")
o.bind("SUPER + K", "Super+K Alternative", "omarchy-shell nav-guide toggle")
-- Preserve the classic keybindings menu on a dedicated fallback shortcut
o.bind("SUPER + SHIFT + K", "Classic Keybindings Menu", "omarchy-menu-keybindings")
-- [/nav-guide-keybind]
-- <<< nav-guide managed <<<

-- Source: file:///home/bogge/.config/hypr/hyprland.lua
-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")
-- Load Omarchy defaults.
require("default.hypr.omarchy")
--
-- Put your personal overrides in these files. They're loaded after Omarchy's defaults.
require("hypr.monitors") -- file:///home/bogge/.config/hypr/monitors.lua
require("hypr.input") -- file:///home/bogge/.config/hypr/input.lua
require("hypr.bindings") -- file:///home/bogge/.config/hypr/bindings.lua
require("hypr.looknfeel") -- file:///home/bogge/.config/hypr/looknfeel.lua
require("hypr.autostart") -- file:///home/bogge/.config/hypr/autostart.lua
--
-- Toggle config flags dynamically.
require("default.hypr.toggles")
--
--
--
-- >>> me:managed >>>
--
-- <<< me:managed <<<
--
--
--

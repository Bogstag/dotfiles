-- Source: file:///home/bogge/.config/hypr/hyprland.lua
-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")
-- Load Omarchy defaults.
require("default.hypr.omarchy")
--
-- Put your personal overrides in these files. They're loaded after Omarchy's defaults.
--require("hypr.monitors")  -- file:///home/bogge/.config/hypr/monitors.lua -- hyprmoncfg this not needed
require("hypr.input")     -- file:///home/bogge/.config/hypr/input.lua
require("hypr.bindings")  -- file:///home/bogge/.config/hypr/bindings.lua
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
-- >>> hyprmoncfg:managed >>>
-- Added by hyprmoncfg: its generated monitor rules load last, so nothing before this can override the applied layout.
do
    local path = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr/hyprmoncfg-monitors.lua"; local file =
        io.open(path, "r"); if file then
        file:close(); dofile(path)
    end
end
-- <<< hyprmoncfg:managed <<<

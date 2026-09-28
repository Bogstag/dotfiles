-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Centered layout: DP-2 (external, 1920x1080, scale 1) above eDP-2 (laptop, 1920x1080, scale 1.25, offset x=192)
hl.monitor({ output = "DP-2", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-2", mode = "1920x1080@60", position = "192x1080", scale = 1.25 })

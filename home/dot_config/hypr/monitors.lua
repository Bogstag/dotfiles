-- Source: file:///home/bogge/.config/hypr/monitors.lua
-- See: https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors: hyprctl monitors all
--
local omarchy_gdk_scale = 2
local omarchy_monitor_scale = "auto"
--
hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
--
--
-- DP-4 (external) Centered layout above eDP-2
hl.monitor({
	output = "DP-4",
	mode = "1920x1080@60",
	position = "auto-center-up",
	scale = omarchy_monitor_scale,
	vrr = 0,
	cm = "auto",
	sdr_min_luminance = 0.2,
	sdr_max_luminance = 80,
})
-- DP-4 (external) not all availableModes:
-- - 1920x1080@60.00Hz
-- - 1920x1080@59.94Hz
-- - 1920x1080@50.00Hz
-- - 1920x1080@23.98Hz
--
--
-- eDP-2 (internal) pos 0 (if needed offset x=192, scale 1.25)
hl.monitor({
	output = "eDP-2",
	mode = "1920x1080@60",
	position = "0x0",
	scale = omarchy_monitor_scale,
	vrr = 0,
	cm = "auto",
	sdr_min_luminance = 0.2,
	sdr_max_luminance = 80,
})
-- eDP-2 (laptop) all availableModes:
-- - 1920x1080@144.00Hz
-- - 1920x1080@60.00Hz
--

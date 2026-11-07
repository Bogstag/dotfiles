-- Source: file:///home/bogge/.config/hypr/monitors.lua
-- See: https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors: hyprctl monitors all
--
--
hl.env("GDK_SCALE", "1")
--
--
-- DP-4 (external) Centered layout above eDP-2
hl.monitor({
	output = "DP-4",
	mode = "1920x1080@60",
	position = "auto-center-up",
	scale = 1,
	vrr = false,
	cm = "auto"
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
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1.5,
	vrr = false,
	cm = "auto"
})
-- eDP-2 (laptop) all availableModes:
-- - 1920x1080@144.00Hz
-- - 1920x1080@60.00Hz
--

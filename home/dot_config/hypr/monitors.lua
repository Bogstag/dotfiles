-- Source: file:///home/bogge/.config/hypr/monitors.lua
-- See: https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors: hyprctl monitors all

hl.monitor({
	output = "desc:Eizo Nanao Corporation FG2421 20707093",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
	vrr = 0,
	cm = "auto",
	sdr_min_luminance = 0.2,
	sdr_max_luminance = 80,
})

hl.monitor({
	output = "desc:Najing CEC Panda FPD Technology CO. ltd 0x004D",
	mode = "1920x1080@60",
	position = "192x1080",
	scale = 1,
	vrr = 1,
	cm = "auto",
	sdr_min_luminance = 0.2,
	sdr_max_luminance = 80,
})

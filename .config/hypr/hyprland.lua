--    ██ ██████  ██    ██ ██    ██ ███    ██ ███████
--    ██ ██   ██ ██    ██  ██  ██  ████   ██ ██
--    ██ ██████  ██    ██   ████   ██ ██  ██ █████
--    ██ ██   ██  ██  ██     ██    ██  ██ ██ ██
--    ██ ██   ██   ████      ██    ██   ████ ███████

-- https://irvyne.com/
-- https://github.com/iirvyne/dotfiles/

-- https://wiki.hypr.land/
require("conf/animations")
require("conf/keybinds")
require("conf/monitors")
require("conf/theme")
require("conf/windowrules")

local scrPath = "/home/irvyne/.config/hypr/scripts"

--     █████  ██    ██ ████████  ██████  ███████ ████████  █████  ██████  ████████
--    ██   ██ ██    ██    ██    ██    ██ ██         ██    ██   ██ ██   ██    ██
--    ███████ ██    ██    ██    ██    ██ ███████    ██    ███████ ██████     ██
--    ██   ██ ██    ██    ██    ██    ██      ██    ██    ██   ██ ██   ██    ██
--    ██   ██  ██████     ██     ██████  ███████    ██    ██   ██ ██   ██    ██

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	-- scripts
	hl.exec_cmd("~/.config/eww/scripts/start.sh")
	hl.exec_cmd("~/.config/eww/scripts/cava-eww.sh")
	hl.exec_cmd("~/.config/eww/scripts/workspace.sh")
	hl.exec_cmd("cava -p ~/.config/cava/config-eww")

	-- daemons
	hl.exec_cmd("eww open taskbar")
	hl.exec_cmd("dunst")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("aww img ~/.config/hypr/assets/wallpaper.gif")

	-- other
	hl.exec_cmd(scrPath .. "/resetxdgportal.sh")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd(scrPath .. "/polkitdeauth.sh")
	hl.exec_cmd("sudo mount /dev/sdb1 /mnt/4tb")
	hl.exec_cmd("sudo macchanger -r eno2")
end)
-------------------------------
--    ██    ██  █████  ██████  ██  █████  ██████  ██      ███████ ███████
--    ██    ██ ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██      ██
--    ██    ██ ███████ ██████  ██ ███████ ██████  ██      █████   ███████
--     ██  ██  ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██           ██
--      ████   ██   ██ ██   ██ ██ ██   ██ ██████  ███████ ███████ ███████

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("GBM_BACKEND", "native")
hl.env("VDPAU_DRIVER", "radeonsi")

--    ██ ███    ██ ██████  ██    ██ ████████
--    ██ ████   ██ ██   ██ ██    ██    ██
--    ██ ██ ██  ██ ██████  ██    ██    ██
--    ██ ██  ██ ██ ██      ██    ██    ██
--    ██ ██   ████ ██       ██████     ██

-- https://wiki.hypr.land/Configuring/Basics/Variables/#input/
hl.config({
	input = {
		kb_layout = "us,no",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		force_no_accel = 1,

		sensitivity = 0,
	},
})

--    ██       █████  ██    ██  ██████  ██    ██ ████████
--    ██      ██   ██  ██  ██  ██    ██ ██    ██    ██
--    ██      ███████   ████   ██    ██ ██    ██    ██
--    ██      ██   ██    ██    ██    ██ ██    ██    ██
--    ███████ ██   ██    ██     ██████   ██████     ██
--
--
-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
	dwindle = {
		preserve_split = true,
		smart_split = false,
		smart_resizing = false,
		force_split = 0,
		split_bias = 1,
	},
})

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
	master = {
		new_status = "master",
	},
})

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

--    ███    ███ ██ ███████  ██████
--    ████  ████ ██ ██      ██
--    ██ ████ ██ ██ ███████ ██
--    ██  ██  ██ ██      ██ ██
--    ██      ██ ██ ███████  ██████

-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc/
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		vrr = 0,
		disable_splash_rendering = true,
	},
})

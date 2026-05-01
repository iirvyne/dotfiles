--
-- irvyne
--

require("conf/keybinds")
require("conf/monitors")
--require("conf/theme")
require("conf/windowrules")


local scrPath = "/home/irvyne/.config/hypr/scripts"
local conPath = "/home/irvyne/.config/hypr/conf"


--
-- autostart
--

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
	hl.exec_cmd("aww-daemon")
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

--
-- enviornment variables
--

hl.env("PATH", "$PATH:$srcPath")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("GDK_SCALE", "1")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("MESA_VK_DEVICE_SELECT", "1002:7480")
hl.env("MESA_VK_DEVICE_SELECT", "1002:7480")

hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("GBM_BACKEND", "native")
hl.env("VDPAU_DRIVER", "radeonsi")

--
-- input
--

hl.config({
	input = {
		kb_layout = "us,no",
		follow_mouse = 1,
		sensitivity = 0,
		force_no_accel = 1,
		numlock_by_default = 1,
	},
})

--
-- layouts
--

hl.config({
	dwindle = {
		--pseudotile = "yes",
		preserve_split = true,
		smart_split = false,
		smart_resizing = no,
		force_split = 0,
		split_bias = 1,
	},

	master = {
		new_status = "master",
	},
})

--
-- misc
--

hl.config({
	misc = {
		vrr = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		force_default_wallpaper = 0,
	},
})

--
-- sources
--
--require(conPath .. "/keybinds.lua")
--require(conPath .. "/monitors.lua")
--require(conPath .. "/theme.lua")
--require(conPath .. "/windowrules.lua")




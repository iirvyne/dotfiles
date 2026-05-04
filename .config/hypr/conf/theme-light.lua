--     █████  ██    ██ ████████  ██████      ███████ ████████  █████  ██████  ████████
--    ██   ██ ██    ██    ██    ██    ██     ██         ██    ██   ██ ██   ██    ██
--    ███████ ██    ██    ██    ██    ██     ███████    ██    ███████ ██████     ██
--    ██   ██ ██    ██    ██    ██    ██          ██    ██    ██   ██ ██   ██    ██
--    ██   ██  ██████     ██     ██████      ███████    ██    ██   ██ ██   ██    ██

-- https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	-- cursor
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
	hl.exec_cmd("gsettings set org.gnome.desktop.inferface cursor-theme 'Bibata-Modern-Ice'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")
	-- font
	hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Monocrarft' 10'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name 'Monocraft 10'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name 'Monocraft 9'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting 'full'")
	-- theme
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'irvyne-light'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dracula'")
end)

--    ████████ ██   ██ ███████ ███    ███ ███████
--       ██    ██   ██ ██      ████  ████ ██
--       ██    ███████ █████   ██ ████ ██ █████
--       ██    ██   ██ ██      ██  ██  ██ ██
--       ██    ██   ██ ███████ ██      ██ ███████

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
	general = {
		gaps_in = 8,
		gaps_out = 16,
		border_size = 2,
		layout = dwindle,
		resize_on_border = true,

		col = {
			active_border = { colors = { "rgba(e8c9ccff)", "rgba(d9aeb5ff)" }, angle = 45 },
			inactive_border = { colors = { "rgba(f5d8c8ff)", "rgba(c2a38fff)" } },
		},

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#snap
		snap = {
			enabled = true,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = false,
			respect_gaps = false,
		},
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#group
	group = {
		col = {
			border_active = { colors = { "rgba(e8c9ccff)", "rgba(d9aeb5ff)" }, angle = 45 },
			border_inactive = { colors = { "rgba(c2a38fff)", "rgba(7a7099ff)" }, angle = 45 },
		},
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
	decoration = {
		rounding = 16,
		rounding_power = 2,
		active_opacity = 0.90,
		inactive_opacity = 0.75,
		fullscreen_opacity = 1.00,
		dim_special = 0.4,

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
		blur = {
			enabled = true,
			size = 2,
			passes = 4,
			special = true,
		},

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#shadow
		shadow = {
			enabled = true,
			range = 2,
			render_power = 3,
			color = "rgba(d9aeb5ff)",
			color_inactive = "rgba(c2a38fff)",
		},
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
	animations = {
		enabled = true,
	},
})

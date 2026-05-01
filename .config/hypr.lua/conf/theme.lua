--
-- auto start
--

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
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-Mocha'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Wallbash-Gtk'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dracula'")
end)

--
-- theme
--

hl.config({
	general = {
		gaps_in = 8,
		gaps_out = 16,
		border_size = 2,
		layout = dwindle,
		resize_on_border = true,

		col = {
			active_border = { colors = { "rgba(ae7b8bff)", "rgba(573d45ff)" }, angle = 45 },
			inacitve_border = { colors = { "rgba(7a7099ff)", "rgba(695f86ff)" }, angle = 45 },
		},

		snap = {
			enabled = true,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = false,
			respect_gaps = false,
		},
	},

	group = {
		col = {
			border_active = { colors = { "rgba(ae7b8bff)", "rgba(453137ff)" }, angle = 45 },
			border_inactive = { colors = { "rgba(7a7099ff)", "rgba(695f86ff)" }, angle = 45 },
		},
	},

	decoration = {
		rounding = 16,
		active_opacity = 0.90,
		inactive_opacity = 0.75,
		fullscreen_opacity = 1.00,
		dim_special = 0.4,

		blur = {
			enabled = true,
			size = 2,
			passes = 4,
			special = true,
		},

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = { colors = { "rgba(996575ff)", "rgba(8F5C6Cff)" }, angle = 45 },
			color_inactive = { colors = { "rgba(524a68ff)", "rgba(3a354bff)" }, angle = 45 },
		},
	},

	animations = {
		enabled = true,
	},
})

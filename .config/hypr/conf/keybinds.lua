--    ██   ██ ███████ ██    ██ ██████  ██ ███    ██ ██████  ███████
--    ██  ██  ██       ██  ██  ██   ██ ██ ████   ██ ██   ██ ██
--    █████   █████     ████   ██████  ██ ██ ██  ██ ██   ██ ███████
--    ██  ██  ██         ██    ██   ██ ██ ██  ██ ██ ██   ██      ██
--    ██   ██ ███████    ██    ██████  ██ ██   ████ ██████  ███████

-- https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"
local scrPath = "~/.config/hypr/scripts/"

--     █████  ██████  ██████  ███████
--    ██   ██ ██   ██ ██   ██ ██
--    ███████ ██████  ██████  ███████
--    ██   ██ ██      ██           ██
--    ██   ██ ██      ██      ███████

local term = "kitty"
local file = "thunar"
local editor = "kitty nvim"
local browser = "firefox"

--     █████  ██████  ██████      ██   ██ ███████ ██    ██ ███████
--    ██   ██ ██   ██ ██   ██     ██  ██  ██       ██  ██  ██
--    ███████ ██████  ██████      █████   █████     ████   ███████
--    ██   ██ ██      ██          ██  ██  ██         ██         ██
--    ██   ██ ██      ██          ██   ██ ███████    ██    ███████

-- Reload wallpaper
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(scrPath .. "/wallpaper.sh"))
-- Launch terminal
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(term))
-- Launch text editor
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
-- Launch cava
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd(term .. " cava"))
-- Start eww script
hl.bind(mainMod .. " + CTRL + SHIFT + C", function()
	hl.dispatch(hl.dsp.exec_cmd("~/.config/eww/scripts/start.sh"))
	hl.dispatch(hl.dsp.exec_cmd("~/.config/eww/scripts/cava.sh"))
end)
-- Launch file manager
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file))
-- Launch browser
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
-- Launch system monitor
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(term .. " btop"))
-- Launch rofi
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), { release = true })

--     █████  ██    ██ ██████  ██  ██████       ██████  ██████  ███    ██ ████████ ██████   ██████  ██
--    ██   ██ ██    ██ ██   ██ ██ ██    ██     ██      ██    ██ ████   ██    ██    ██   ██ ██    ██ ██
--    ███████ ██    ██ ██   ██ ██ ██    ██     ██      ██    ██ ██ ██  ██    ██    ██████  ██    ██ ██
--    ██   ██ ██    ██ ██   ██ ██ ██    ██     ██      ██    ██ ██  ██ ██    ██    ██   ██ ██    ██ ██
--    ██   ██  ██████  ██████  ██  ██████       ██████  ██████  ██   ████    ██    ██   ██  ██████  ███████

-- Volume decrease
hl.bind("F11", hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o d"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o d"), { repeating = true })
-- Volume increase
hl.bind("F12", hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o i"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o i"), { repeating = true })

-- Volume toggle mute
hl.bind("F10", hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"))
-- Microphone toggle mute
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -i m"))

--    ██████  ██████  ██  ██████  ██   ██ ████████ ███    ██ ███████ ███████ ███████
--    ██   ██ ██   ██ ██ ██       ██   ██    ██    ████   ██ ██      ██      ██
--    ██████  ██████  ██ ██   ███ ███████    ██    ██ ██  ██ █████   ███████ ███████
--    ██   ██ ██   ██ ██ ██    ██ ██   ██    ██    ██  ██ ██ ██           ██      ██
--    ██████  ██   ██ ██  ██████  ██   ██    ██    ██   ████ ███████ ███████ ███████

-- Brightness decrase
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scrPath .. "/brightnesscontrol.sh d"))
-- Brightness increase
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scrPath .. "/brightnesscontrol.sh i"))

--    ███    ███ ███████ ██████  ██  █████       ██████  ██████  ███    ██ ████████ ██████   ██████  ██
--    ████  ████ ██      ██   ██ ██ ██   ██     ██      ██    ██ ████   ██    ██    ██   ██ ██    ██ ██
--    ██ ████ ██ █████   ██   ██ ██ ███████     ██      ██    ██ ██ ██  ██    ██    ██████  ██    ██ ██
--    ██  ██  ██ ██      ██   ██ ██ ██   ██     ██      ██    ██ ██  ██ ██    ██    ██   ██ ██    ██ ██
--    ██      ██ ███████ ██████  ██ ██   ██      ██████  ██████  ██   ████    ██    ██   ██  ██████  ███████

-- Media previous
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
-- Media next
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

-- Media toggle pause
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

--    ██     ██  ██████  ██████  ██   ██ ███████ ██████   █████   ██████ ███████
--    ██     ██ ██    ██ ██   ██ ██  ██  ██      ██   ██ ██   ██ ██      ██
--    ██  █  ██ ██    ██ ██████  █████   ███████ ██████  ███████ ██      █████
--    ██ ███ ██ ██    ██ ██   ██ ██  ██       ██ ██      ██   ██ ██      ██
--     ███ ███   ██████  ██   ██ ██   ██ ███████ ██      ██   ██  ██████ ███████

-- Workspace movement
for i = 1, 10 do
	local key = i % 10
	-- Move window to workspace silently
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
	-- Move window to workspace
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	-- Move to workspace
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move window to relative workspace
-- Arrow keys
hl.bind(mainMod .. " + CTRL + ALT + Right", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + ALT + Left", hl.dsp.window.move({ workspace = "e-1" }))
-- Vim
hl.bind(mainMod .. " + CTRL + ALT + L", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + ALT + H", hl.dsp.window.move({ workspace = "e-1" }))

-- Scroll through  workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

--    ██     ██ ██ ███    ██ ██████   ██████  ██     ██
--    ██     ██ ██ ████   ██ ██   ██ ██    ██ ██     ██
--    ██  █  ██ ██ ██ ██  ██ ██   ██ ██    ██ ██  █  ██
--    ██ ███ ██ ██ ██  ██ ██ ██   ██ ██    ██ ██ ███ ██
--     ███ ███  ██ ██   ████ ██████   ██████   ███ ███

-- Close focused window
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + F4", hl.dsp.exec_cmd(scrPath .. "/dontkillsteam.sh"))
-- Launch logout menu
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd(scrPath .. "/logoutlaunch.sh"))
hl.bind(mainMod .. " + Backspace", hl.dsp.exec_cmd(scrPath .. "/logoutlaunch.sh"))

-- Copy a Hex colour to clipboard
hl.bind(mainMod .. "+ SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))

-- Toggle focused window split
hl.bind(mainMod .. "+ R", hl.dsp.layout("togglesplit"))
-- Toggle floating
hl.bind(mainMod .. "+ W", hl.dsp.window.float({ action = "toggle" }))
-- Toggle group
hl.bind(mainMod .. " + G", hl.dsp.group.toggle({}))
-- Toggle fullscreen
hl.bind(mainMod .. " + Return", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- Toggle pin on focused window
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(scrPath .. "/windowpin.sh"))
-- Toggle waybar
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("eww close taskbar || eww open taskbar"))

-- Resize windows [arrows]
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })

-- Resize windows [vim]
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })

-- Mouse resize/drag focused window
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Z/X to resize/drag focused window
hl.bind(mainMod .. " + Z", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + X", hl.dsp.window.resize(), { mouse = true })

--    ███    ███  ██████  ██    ██ ███████ ███    ███ ███████ ███    ██ ████████ ███████
--    ████  ████ ██    ██ ██    ██ ██      ████  ████ ██      ████   ██    ██    ██
--    ██ ████ ██ ██    ██ ██    ██ █████   ██ ████ ██ █████   ██ ██  ██    ██    ███████
--    ██  ██  ██ ██    ██  ██  ██  ██      ██  ██  ██ ██      ██  ██ ██    ██         ██
--    ██      ██  ██████    ████   ███████ ██      ██ ███████ ██   ████    ██    ███████

-- Group cycling
hl.bind(mainMod .. " + CTRL + A", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + D", hl.dsp.group.next())

-- Move focus [arrow keys]
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))

-- Move focus [vim keys]
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move active window around current workspace [arrows]
hl.bind(mainMod .. " + SHIFT + CTRL + LEFT", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + CTRL + DOWN", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + CTRL + UP", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + CTRL + RIGHT", hl.dsp.window.move({ direction = "right" }))

-- Move current window around current worksapce [vim]
hl.bind(mainMod .. " + SHIFT + CTRL + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + CTRL + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + CTRL + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + CTRL + L", hl.dsp.window.move({ direction = "right" }))

-- Swap curent window around current worksapce [arrows]
hl.bind(mainMod .. " + CTRL + LEFT", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + DOWN", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + UP", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + RIGHT", hl.dsp.window.swap({ direction = "right" }))

-- Swap curent window around current worksapce [vim]
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.swap({ direction = "right" }))

--     ██████ ██    ██ ███████ ████████  ██████  ███    ███
--    ██      ██    ██ ██         ██    ██    ██ ████  ████
--    ██      ██    ██ ███████    ██    ██    ██ ██ ████ ██
--    ██      ██    ██      ██    ██    ██    ██ ██  ██  ██
--     ██████  ██████  ███████    ██     ██████  ██      ██

-- Partial screenshot capture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(scrPath .. "/screenshot.sh s"))
-- Partial frozen screenshot capture
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd(scrPath .. "/screenshot.sh sf"))
-- Monitor screnshot capture
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd(scrPath .. "/screenshot.sh m"))
-- All monitors screenshot capture
hl.bind("Print", hl.dsp.exec_cmd(scrPath .. "/screenshot.sh p"))

-- Disable hypr effects
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd(scrPath .. "/gamemode.sh"))

-- Launch clipboard history
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/cliphist.sh c"))
-- Launch clipboard manager
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/cliphist.sh"))
-- Switch keyboard layout
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(scrPath .. "/keyboardswitch.sh"))
-- Launch keyboard hints
hl.bind(mainMod .. " + Slash", hl.dsp.exec_cmd("pkill -x rofi ||" .. scrPath .. "/keybinds_hint.sh c"))

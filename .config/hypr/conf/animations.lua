--     █████  ███    ██ ██ ███    ███  █████  ████████ ██  ██████  ███    ██ ███████
--    ██   ██ ████   ██ ██ ████  ████ ██   ██    ██    ██ ██    ██ ████   ██ ██
--    ███████ ██ ██  ██ ██ ██ ████ ██ ███████    ██    ██ ██    ██ ██ ██  ██ ███████
--    ██   ██ ██  ██ ██ ██ ██  ██  ██ ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
--    ██   ██ ██   ████ ██ ██      ██ ██   ██    ██    ██  ██████  ██   ████ ███████

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

--     ██████ ██    ██ ██████  ██    ██ ███████ ███████
--    ██      ██    ██ ██   ██ ██    ██ ██      ██
--    ██      ██    ██ ██████  ██    ██ █████   ███████
--    ██      ██    ██ ██   ██  ██  ██  ██           ██
--     ██████  ██████  ██   ██   ████   ███████ ███████

hl.curve("easeOutQuint", {
	type = "bezier",
	points = {
		{ 0.25, 1 },
		{ 0.33, 1 },
	},
})

hl.curve("easeInOutCubic", {
	type = "bezier",
	points = {
		{ 0.65, 0.05 },
		{ 0.33, 1 },
	},
})

hl.curve("linear", {
	type = "bezier",
	points = {
		{ 0, 0 },
		{ 1, 1 },
	},
})

hl.curve("almostLinear", {
	type = "bezier",
	points = {
		{ 0.5, 0.5 },
		{ 0.75, 1 },
	},
})

hl.curve("quick", {
	type = "bezier",
	points = {
		{ 0.15, 0 },
		{ 0.1, 1 },
	},
})

hl.curve("wind", {
	type = "bezier",
	points = {
		{ 0.05, 0.9 },
		{ 0.1, 1.03 },
	},
})

hl.curve("windIn", {
	type = "bezier",
	points = {
		{ 0.1, 1.1 },
		{ 0.1, 1 },
	},
})

hl.curve("windOut", {
	type = "bezier",
	points = {
		{ 0.3, -0.3 },
		{ 0, 1 },
	},
})

hl.curve("snowIn", {
	type = "bezier",
	points = {
		{ 0.4, 0 },
		{ 0.2, 1 },
	},
})

hl.curve("snowOut", {
	type = "bezier",
	points = {
		{ 0.3, 0 },
		{ 0.7, 1 },
	},
})

hl.curve("snowEase", {
	type = "bezier",
	points = {
		{ 0.25, 0.1 },
		{ 0.25, 1 },
	},
})

--    ███████ ██████  ██████  ██ ███    ██  ██████  ███████
--    ██      ██   ██ ██   ██ ██ ████   ██ ██       ██
--    ███████ ██████  ██████  ██ ██ ██  ██ ██   ███ ███████
--         ██ ██      ██   ██ ██ ██  ██ ██ ██    ██      ██
--    ███████ ██      ██   ██ ██ ██   ████  ██████  ███████

hl.curve("easy", {
	type = "spring",
	mass = 1,
	stiffness = 71.2633,
	dampening = 15.8273644,
})

--     █████  ███    ██ ██ ███    ███  █████  ████████ ██  ██████  ███    ██ ███████
--    ██   ██ ████   ██ ██ ████  ████ ██   ██    ██    ██ ██    ██ ████   ██ ██
--    ███████ ██ ██  ██ ██ ██ ████ ██ ███████    ██    ██ ██    ██ ██ ██  ██ ███████
--    ██   ██ ██  ██ ██ ██ ██  ██  ██ ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
--    ██   ██ ██   ████ ██ ██      ██ ██   ██    ██    ██  ██████  ██   ████ ███████

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 7,
	bezier = "default",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 6,
	bezier = "easeOutQuint",
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 5,
	spring = "easy",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 5,
	bezier = "snowIn",
	style = "popin 87%",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 2.5,
	bezier = "snowOut",
	style = "popin 87%",
})

hl.animation({
	leaf = "fadeIn",
	enabled = true,
	speed = 1.75,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "fadeOut",
	enabled = true,
	speed = 1.5,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 3,
	bezier = "snowEase",
})

hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
})

hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
	style = "fade",
})

hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 1.5,
	bezier = "linear",
	style = "fade",
})

hl.animation({
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 1.75,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 1.5,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	bezier = "wind",
	style = "slide",
})

hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 6,
	bezier = "wind",
	style = "slide",
})

hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 3,
	bezier = "wind",
	style = "slide",
})

hl.animation({
	leaf = "zoomFactor",
	enabled = true,
	speed = 7,
	bezier = "still",
})

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.font = wezterm.font("InputMonoCompressed Nerd Font", { italic = true })
-- config.font = wezterm.font_with_fallback("Operator Mono SSm Lig Medium")
config.font_rules = {
	-- normal-intensity-and-not-italic
	{
		intensity = "Normal",
		italic = false,
		font = wezterm.font("InputMonoCompressed Nerd Font", {
			weight = "Regular",
			stretch = "ExtraCondensed",
			style = "Italic",
		}),
	},

	-- normal-intensity-and-italic
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font("MonoLisa Trial", {
			weight = "Regular",
			stretch = "Normal",
			style = "Italic",
		}),
	},

	-- For Bold-but-not-italic text, use this relatively bold font, and override
	-- its color to a tomato-red color to make bold text really stand out.
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font(
			"InputMonoCompressed Nerd Font",
			{ weight = "ExtraBold", stretch = "ExtraCondensed", style = "Italic" }
		),
	},

	-- Bold-and-italic
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("MonoLisa Trial", {
			weight = "Bold",
			stretch = "Normal",
			style = "Italic",
		}),
	},

	-- half-intensity-and-not-italic
	{
		intensity = "Half",
		italic = false,
		font = wezterm.font(
			"InputMonoCompressed Nerd Font",
			{ weight = 250, stretch = "ExtraCondensed", style = "Italic" }
		),
	},

	-- half-intensity-and-italic (half-bright or dim); use a lighter weight font
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font("MonoLisa Trial", {
			weight = "Light",
			stretch = "Normal",
			style = "Italic",
		}),
	},
}

config.font_size = 10.6
config.cell_width = 1.1
config.line_height = 1.4

config.colors = {
	foreground = "#CDD6F4",
	background = "black",

	ansi = {
		"#45475A",
		"#F38BA8",
		"#A6E3A1",
		"#F9E2AF",
		"#89B4FA",
		"#F5C2E7",
		"#94E2D5",
		"#CDD6F4",
	},
}

config.enable_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 3,
	bottom = 0,
}

-- config.enable_wayland = true

return config

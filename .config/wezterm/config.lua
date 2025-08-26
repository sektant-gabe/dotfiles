local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	font_size = 20,
	font = wezterm.font("CaskaydiaMono Nerd Font", { weight = "Regular" }),
	enable_tab_bar = false,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 0,
	},
}
return config

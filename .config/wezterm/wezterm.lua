local wezterm = require("wezterm")
local config = require("config")

config.keys = {
	-- This will create a new split and run the `top` program inside it
	{
		key = "0",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Left",
			command = { args = { "top" } },
			size = { Percent = 70 },
		}),
	},
}

return config

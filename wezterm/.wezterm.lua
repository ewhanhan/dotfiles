local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		italic = false,
	},
})

config.font_rules = {
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font_with_fallback({
			{
				family = "JetBrains Mono",
				style = "Normal",
			},
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font_with_fallback({
			{
				family = "JetBrains Mono",
				italic = false,
			},
		}),
	},
}

config.font_size = 14.0
config.line_height = 1.15
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = "24px",
	right = "24px",
	top = "0.5cell",
	bottom = "0.5cell",
}
config.hide_tab_bar_if_only_one_tab = true

config.leader = {
	key = "w",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}
config.keys = {
	{
		key = "|",
		mods = "LEADER",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = act.SendKey({
			key = "a",
			mods = "CTRL",
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = act.DisableDefaultAssignment,
	},
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({
			confirm = false,
		}),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.ClearScrollback("ScrollbackOnly"),
	},
	-- Clears the scrollback and viewport leaving the prompt line the new first line.
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.ClearScrollback("ScrollbackAndViewport"),
	},
	{
		mods = "CMD",
		key = "Backspace",
		action = act.SendKey({
			mods = "CTRL",
			key = "u",
		}),
	},
	{
		mods = "OPT",
		key = "LeftArrow",
		action = act.SendKey({
			mods = "ALT",
			key = "b",
		}),
	},
	{
		mods = "OPT",
		key = "RightArrow",
		action = act.SendKey({
			mods = "ALT",
			key = "f",
		}),
	},
	{
		mods = "CMD",
		key = "LeftArrow",
		action = act.SendKey({
			mods = "CTRL",
			key = "a",
		}),
	},
	{
		mods = "CMD",
		key = "RightArrow",
		action = act.SendKey({
			mods = "CTRL",
			key = "e",
		}),
	},
}

return config

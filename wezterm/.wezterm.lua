local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
config.term = "wezterm"

config.default_prog = {
	"/bin/zsh",
	"--login",
	"-c",
	[[
		if command -v tmux >/dev/null 2>&1; then
			tmux attach || tmux new;
		else
			exec zsh;
		fi
	]],
}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = "12px",
	right = "12px",
	top = "12px",
	bottom = "12px",
}

config.font_size = 14
config.line_height = 1.2
config.font = wezterm.font("JetBrains Mono")

config.keys = {
	{ key = "a", mods = "CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "K", mods = "CTRL|SHIFT", action = act.ClearScrollback("ScrollbackAndViewport") },
	{ mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
	{ mods = "OPT", key = "LeftArrow", action = act.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = act.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "c" }),
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "x" }),
		}),
	},
	{
		key = "d",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "a", mods = "CTRL" }),
			act.SendKey({ key = "-" }),
		}),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = "a", mods = "CTRL" }),
			act.SendKey({ key = "\\" }),
		}),
	},
	{
		key = "/",
		mods = "CTRL",
		action = act.Search({ CaseInSensitiveString = "" }),
	},
	-- Tmux-aware navigation
	{
		key = "1",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "1" }) }),
	},
	{
		key = "2",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "2" }) }),
	},
	{
		key = "3",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "3" }) }),
	},
	{
		key = "4",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "4" }) }),
	},
	{
		key = "5",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "5" }) }),
	},
	{
		key = "6",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "6" }) }),
	},
	{
		key = "7",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "7" }) }),
	},
	{
		key = "8",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "8" }) }),
	},
	{
		key = "9",
		mods = "CMD",
		action = act.Multiple({ act.SendKey({ key = "a", mods = "CTRL" }), act.SendKey({ key = "9" }) }),
	},
}

wezterm.add_to_config_reload_watch_list(wezterm.config_file)

return config

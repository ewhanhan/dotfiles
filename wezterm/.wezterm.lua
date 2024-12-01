local wezterm = require("wezterm")
local act = wezterm.action
local on_mac = wezterm.target_triple == "aarch64-apple-darwin"
local config = {}

config.term = "wezterm"

if wezterm.config_builder then
	config = wezterm.config_builder()
end

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
config.max_fps = 120
config.native_macos_fullscreen_mode = true
config.cell_width = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = "12px",
	right = "12px",
	top = "12px",
	bottom = "12px",
}
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
	saturation = 0.6,
	brightness = 0.6,
}

config.font_size = on_mac and 14 or 20
config.line_height = on_mac and 1.2 or 1.25
config.font = wezterm.font("Hasklug Nerd Font Mono", { weight = "Medium" })
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font("Hasklug Nerd Font Mono", { weight = "DemiBold" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("Hasklug Nerd Font Mono", { weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		font = wezterm.font("JetBrainsMono Nerd Font", { style = "Italic" }),
	},
}

config.keys = {
	{ key = "\\", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "a", mods = "CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "w", mods = "CMD", action = act.DisableDefaultAssignment },
	{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "K", mods = "CTRL|SHIFT", action = act.ClearScrollback("ScrollbackOnly") },
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
}

return config

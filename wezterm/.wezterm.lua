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
		key = "n",
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
}

local function is_shell(foreground_process_name)
	local shell_names = { "bash", "zsh", "fish", "sh", "ksh", "dash" }
	local process = string.match(foreground_process_name, "[^/\\]+$") or foreground_process_name
	for _, shell in ipairs(shell_names) do
		if process == shell then
			return true
		end
	end
	return false
end

wezterm.on("open-uri", function(window, pane, uri)
	local editor = "nvim"

	if uri:find("^file:") == 1 and not pane:is_alt_screen_active() then
		-- We're processing an hyperlink and the uri format should be: file://[HOSTNAME]/PATH[#linenr]
		-- Also the pane is not in an alternate screen (an editor, less, etc)
		local url = wezterm.url.parse(uri)
		if is_shell(pane:get_foreground_process_name()) then
			-- A shell has been detected. Wezterm can check the file type directly
			-- figure out what kind of file we're dealing with
			local success, stdout, _ = wezterm.run_child_process({
				"file",
				"--brief",
				"--mime-type",
				url.file_path,
			})
			if success then
				if stdout:find("directory") then
					pane:send_text(wezterm.shell_join_args({ "cd", url.file_path }) .. "\r")
					pane:send_text(wezterm.shell_join_args({
						"ls",
						"-a",
						"-p",
						"--group-directories-first",
					}) .. "\r")
					return false
				end

				if stdout:find("text") then
					if url.fragment then
						pane:send_text(wezterm.shell_join_args({
							editor,
							"+" .. url.fragment,
							url.file_path,
						}) .. "\r")
					else
						pane:send_text(wezterm.shell_join_args({ editor, url.file_path }) .. "\r")
					end
					return false
				end
			end
		else
			-- No shell detected, we're probably connected with SSH, use fallback command
			local edit_cmd = url.fragment and editor .. " +" .. url.fragment .. ' "$_f"' or editor .. ' "$_f"'
			local cmd = '_f="'
				.. url.file_path
				.. '"; { test -d "$_f" && { cd "$_f" ; ls -a -p --hyperlink --group-directories-first; }; } '
				.. '|| { test "$(file --brief --mime-type "$_f" | cut -d/ -f1 || true)" = "text" && '
				.. edit_cmd
				.. "; }; echo"
			pane:send_text(cmd .. "\r")
			return false
		end
	end

	-- without a return value, we allow default actions
end)

return config

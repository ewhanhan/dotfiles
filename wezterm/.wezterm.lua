local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font =
    wezterm.font_with_fallback(
      {
        { family = "JetBrains Mono", italic = false }
      }
    )

config.font_rules = {
  {
    intensity = "Normal",
    italic = true,
    font = wezterm.font_with_fallback(
      {
        { family = "JetBrains Mono", style = "Normal" }
      }
    )
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font_with_fallback(
      {
        { family = "JetBrains Mono", italic = false }
      }
    )
  }
}

config.font_size = 14.0
config.line_height = 1.15
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
  left = "24px",
  right = "24px",
  top = "0.5cell",
  bottom = "0.5cell"
}
config.hide_tab_bar_if_only_one_tab = true

return config

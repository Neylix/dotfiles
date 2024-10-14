-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'OneHalfDark'

config.color_scheme = "Breeze (Gogh)"
config.font = wezterm.font "Hack Nerd Font Mono"
config.font_size = 10.0
config.enable_tab_bar = false
config.enable_kitty_keyboard = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.initial_rows = 48
config.initial_cols = 160

-- and finally, return the configuration to wezterm
return config

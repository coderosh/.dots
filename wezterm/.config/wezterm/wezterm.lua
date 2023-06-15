-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.color_scheme = 'tokyonight_night'
config.enable_tab_bar = false
config.font = wezterm.font { family = "FiraCode Nerd Font" }
config.font_size = 14
config.window_background_opacity = 0.9


return config


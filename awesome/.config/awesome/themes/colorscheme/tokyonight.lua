local night = {
  black = "#1a1b26",
  red = "#f7768e",
  green = "#9ece6a",
  yellow = "#e0af68",
  blue = "#7aa2f7",
  magenta = "#bb9af7",
  cyan = "#7dcfff",
  white = "#a9b1d6",
  gray = "#343b58",
}

local tokyonight = {}

function tokyonight.night(theme)
  theme.widget_bg = night.gray .. "bb"
  theme.widget_bg_radius = 2
  theme.widget_bg_margin = 4

  theme.bg_normal = night.black .. "aa"
  theme.bg_focus = night.blue
  theme.bg_urgent = night.red
  theme.bg_systray = theme.widget_bg
  theme.border_focus = night.blue
  theme.border_color_normal = night.black
  theme.border_color_marked = night.red
  theme.bg_minimize = "#00000000"
  theme.fg_normal = "#bfbfbf"
  theme.fg_focus = "#ffffff"
  theme.fg_urgent = "#ffffff"
  theme.fg_minimize = "#ffffff"

  -- for widgets
  theme.bat_color = night.green
  theme.bat_red_color = night.red
  theme.vol_color = night.yellow
  theme.vol_mute_color = night.yellow .. "aa"
  theme.brightness_color = night.magenta
  theme.datetime_color = night.cyan
end

return tokyonight

local main = {
  base = "#191724",
  red = "#eb6f92",
  green = "#31748f",
  yellow = "#f6c177",
  blue = "#9ccfd8",
  pink = "#ebbcba",
  purple = "#c4a7e7",
  gray = "#342259",
}

local rosepine = {}

function rosepine.main(theme)
  theme.widget_bg = main.gray

  theme.bg_normal = main.base .. "bb"
  theme.bg_focus = main.purple
  theme.bg_urgent = main.red
  theme.bg_systray = theme.widget_bg
  theme.border_focus = main.purple
  theme.border_color_normal = main.base
  theme.border_color_marked = main.red
  theme.bg_minimize = "#00000000"
  theme.fg_normal = "#bfbfbf"
  theme.fg_focus = "#ffffff"
  theme.fg_urgent = "#ffffff"
  theme.fg_minimize = "#ffffff"

  -- for widgets
  theme.bat_color = main.blue
  theme.bat_red_color = main.red
  theme.vol_color = main.yellow
  theme.vol_mute_color = main.yellow .. "aa"
  theme.mic_color = main.pink
  theme.mic_mute_color = main.pink .. "aa"
  theme.brightness_color = main.purple
  theme.datetime_color = main.blue
  theme.network_color = main.blue
  theme.network_color_nocon = main.blue .. "aa"
end

return rosepine

local function create_colorscheme(theme, black, white, gray, red, green, blue, yellow, magenta, cyan)
  theme.widget_bg = gray

  theme.bg_normal = black .. "bb"
  theme.bg_focus = blue
  theme.bg_urgent = red
  theme.bg_systray = theme.widget_bg
  theme.border_focus = blue
  theme.border_color_normal = black
  theme.border_color_marked = red
  theme.bg_minimize = "#00000000"
  theme.fg_normal = "#bfbfbf"
  theme.fg_focus = white
  theme.fg_urgent = white
  theme.fg_minimize = white

  -- for widgets
  theme.bat_color = blue
  theme.bat_red_color = red
  theme.vol_color = yellow
  theme.vol_mute_color = yellow .. "aa"
  theme.mic_color = green
  theme.mic_mute_color = green .. "aa"
  theme.brightness_color = magenta
  theme.datetime_color = cyan
  theme.network_color = cyan
  theme.network_color_nocon = cyan .. "aa"

  return theme
end

return create_colorscheme

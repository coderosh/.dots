local create_colorscheme = require("themes.colorscheme.create_colorscheme")

local night = {
  black = "#1a1b26",
  red = "#f7768e",
  green = "#9ece6a",
  yellow = "#e0af68",
  blue = "#7aa2f7",
  magenta = "#bb9af7",
  cyan = "#7dcfff",
  gray = "#343b58",
  white = "#ffffff",
}

local tokyonight = {}

function tokyonight.night(theme)
  return create_colorscheme(
    theme,
    night.black,
    night.white,
    night.gray,
    night.red,
    night.green,
    night.blue,
    night.yellow,
    night.magenta,
    night.cyan
  )
end

return tokyonight

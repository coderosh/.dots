local create_colorscheme = require("themes.colorscheme.create_colorscheme")

local mocha = {
  black = "#1e1e2e",
  red = "#f38ba8",
  green = "#a6e3a1",
  yellow = "#f9e2af",
  blue = "#89b4fa",
  magenta = "#f5c2e7",
  cyan = "#94e2d5",
  gray = "#313244",
  white = "#ffffff",
}

local catppuccin = {}

function catppuccin.mocha(theme)
  return create_colorscheme(
    theme,
    mocha.black,
    mocha.white,
    mocha.gray,
    mocha.red,
    mocha.green,
    mocha.blue,
    mocha.yellow,
    mocha.magenta,
    mocha.cyan
  )
end

return catppuccin

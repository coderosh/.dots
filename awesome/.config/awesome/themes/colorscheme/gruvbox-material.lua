local create_colorscheme = require("themes.colorscheme.create_colorscheme")

local hard_dark = {
  base = "#141617",
  red = "#ea6962",
  green = "#a9b665", -- not a rosepine color but looks nice
  yellow = "#d7a657",
  blue = "#7daea3",
  pink = "#ddc7a1",
  purple = "#d3869b",
  gray = "#504945",
  white = "#ffffff",
}

local gruvbox_material = {}

function gruvbox_material.hard_dark(theme)
  create_colorscheme(
    theme,
    hard_dark.base,
    hard_dark.white,
    hard_dark.gray,
    hard_dark.red,
    hard_dark.green,
    hard_dark.blue,
    hard_dark.yellow,
    hard_dark.pink,
    hard_dark.purple
  )

  theme.border_focus = hard_dark.purple
  theme.bg_focus = hard_dark.purple

  return theme
end

return gruvbox_material

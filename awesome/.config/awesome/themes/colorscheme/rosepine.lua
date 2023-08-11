local create_colorscheme = require("themes.colorscheme.create_colorscheme")

local main = {
  base = "#191724",
  red = "#eb6f92",
  green = "#4cc48f", -- not a rosepine color but looks nice
  yellow = "#f6c177",
  blue = "#9ccfd8",
  pink = "#ebbcba",
  purple = "#c4a7e7",
  gray = "#342259",
  white = "#ffffff",
}

local rosepine = {}

function rosepine.main(theme)
  create_colorscheme(
    theme,
    main.base,
    main.white,
    main.gray,
    main.red,
    main.green,
    main.blue,
    main.yellow,
    main.pink,
    main.purple
  )

  theme.border_focus = main.purple
  theme.bg_focus = main.purple

  return theme
end

return rosepine

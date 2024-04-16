local create_colorscheme = require("themes.colorscheme.create_colorscheme")

local main = {
  base = "#3B4252",
  red = "#BF616A",
  green = "#A3BE8C", -- not a rosepine color but looks nice
  yellow = "#EBCB8B",
  blue = "#5E81AC",
  pink = "#B48EAD",
  purple = "#81A1C1",
  gray = "#2E3440",
  white = "#ECEFF4",
}

local nord = {}

function nord.main(theme)
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

return nord

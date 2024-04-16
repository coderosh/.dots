local rosepine = require("themes.colorscheme.rosepine")
local tokyonight = require("themes.colorscheme.tokyonight")
local catppuccin = require("themes.colorscheme.catppuccin")
local nord = require("themes.colorscheme.nord")

local colorschemes = {
  tokyonight_night = tokyonight.night,
  rosepine_main = rosepine.main,
  catppuccin_mocha = catppuccin.mocha,
  nord = nord.main,
}

local colorscheme = colorschemes.tokyonight_night

return {
  colorscheme = colorscheme,
  colorschemes = colorschemes,
}

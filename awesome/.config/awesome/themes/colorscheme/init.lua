local rosepine = require("themes.colorscheme.rosepine")
local tokyonight = require("themes.colorscheme.tokyonight")
local catppuccin = require("themes.colorscheme.catppuccin")
local gruvbox_material = require("themes.colorscheme.gruvbox-material")
local nord = require("themes.colorscheme.nord")

local colorschemes = {
  nord = nord.main,
  rosepine_main = rosepine.main,
  tokyonight_night = tokyonight.night,
  catppuccin_mocha = catppuccin.mocha,
  gruvbox_material_hard_dark = gruvbox_material.hard_dark,
}

local colorscheme = colorschemes.catppuccin_mocha

return {
  colorscheme = colorscheme,
  colorschemes = colorschemes,
}

local rosepine = require("themes.colorscheme.rosepine")
local tokyonight = require("themes.colorscheme.tokyonight")

local colorschemes = {
    tokyonight_night = tokyonight.night,
    rosepine_main = rosepine.main
}

local colorscheme = colorschemes.tokyonight_night

return {
    colorscheme = colorscheme,
    colorschemes = colorschemes
}

local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  config = function()
    local tokyonight = require("tokyonight")
    require("tokyonight").setup({
      style = "night",
      enable = true,
    })
    tokyonight.load()
  end,
}

return M

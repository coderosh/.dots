local M = {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("alpha").setup(require("alpha.themes.dashboard").config)
  end,
}

return M

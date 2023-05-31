local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  config = function()
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}

return M

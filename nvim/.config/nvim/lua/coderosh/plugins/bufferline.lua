local M = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        tab_size = 22,
        indicator = {
          style = "underline",
        },
      },
    })
  end,
  event = "VeryLazy",
}

return M

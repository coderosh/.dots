local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  main = "ibl",
  config = function()
    local ibl = require("ibl")

    ibl.setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
    })
  end,
}

return M

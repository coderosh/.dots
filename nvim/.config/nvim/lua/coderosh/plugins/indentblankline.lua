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
      scope = {
        show_start = false,
        show_end = false,
      },
    })
  end,
}

return M

local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
    })
  end,
}

return M

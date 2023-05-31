local M = {
  "echasnovski/mini.pairs",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("mini.pairs").setup()
  end,
}

return M

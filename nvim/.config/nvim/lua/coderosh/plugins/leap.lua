local M = {
  "ggandor/leap.nvim",
  config = function()
    require("leap").add_default_mappings()
  end,
  event = "VeryLazy",
  dependencies = { "tpope/vim-repeat" },
}

return M

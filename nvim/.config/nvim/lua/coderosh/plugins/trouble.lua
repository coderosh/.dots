local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- opts = { use_diagnostic_signs = true },
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>tr",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    },
    {
      "<leader>tR",
      "<cmd>Trouble diagnostics toggle<cr>",
    },
  },
}

return M

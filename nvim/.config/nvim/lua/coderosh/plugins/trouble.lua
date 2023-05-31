local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { use_diagnostic_signs = true },
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>tr", "<cmd>TroubleToggle document_diagnostics<cr>" },
    { "<leader>tR", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
  },
}

return M

return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = "VeryLazy",
  opts = {
    settings = {
      separate_diagnostic_server = false,
    },
  },
}

local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "glepnir/lspsaga.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
    "folke/neodev.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
      },
    })

    require("neodev").setup()

    local lsputils = require("coderosh.plugins.lsp.utils")

    lsputils.mason_install({
      lsp = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
      },
      null_ls = {
        "prettierd",
        "stylua",
        "eslint_d",
      },
    })

    lsputils.setup({ keymaps = lsputils.keymaps })
  end,
}

return M

local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "glepnir/lspsaga.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
    "folke/lazydev.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
      },
      ui = {
        code_action = "",
      },
    })

    require("lazydev").setup()

    local lsputils = require("coderosh.plugins.lsp.utils")

    lsputils.mason_install({
      lsp = {
        -- "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_language_server",
        "eslint",
      },
      null_ls = {
        "prettierd",
        "stylua",
      },
    })

    lsputils.setup({ keymaps = lsputils.keymaps })
  end,
}

return M

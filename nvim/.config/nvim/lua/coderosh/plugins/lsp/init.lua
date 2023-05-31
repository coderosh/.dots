local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "glepnir/lspsaga.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
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

    local function keymaps(bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<cr>", opts)
      vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
      -- vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<cr>", opts)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

      vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
      vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
      vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
      vim.keymap.set("n", "<leader>ff", lsputils.format, opts)
    end

    lsputils.setup({ keymaps = keymaps })
  end,
}

return M

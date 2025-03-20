local lsp_utils = require("coderosh.util.lsp")

return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    { "folke/lazydev.nvim", opts = {} }
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local blink = require("blink.cmp")

    local capabilities = blink.get_lsp_capabilities()
    local on_attach = function (_, bufnr)
      lsp_utils.keymaps(bufnr)
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities
        })
      end
    })
  end
}

local M = {}

function M.mason_install(opts)
  require("mason").setup()

  local mason_lspconfig = require("mason-lspconfig")
  local mason_null_ls = require("mason-null-ls")

  mason_lspconfig.setup({
    ensure_installed = opts.lsp,
  })

  mason_null_ls.setup({
    ensure_installed = opts.null_ls,
    handlers = {},
  })

  require("null-ls").setup({})
end

function M.keymaps(bufnr)
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
  vim.keymap.set("n", "<leader>ff", M.format, opts)
end

function M.setup(opts)
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")

  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
  local lsp_attach = function(_, bufnr)
    opts.keymaps(bufnr)
  end

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })
    end,
  })
end

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/format.lua
function M.format()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local have_nls = package.loaded["null-ls"]
    and (#require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0)

  vim.lsp.buf.format(vim.tbl_deep_extend("force", {
    bufnr = buf,
    filter = function(c)
      if have_nls then
        return c.name == "null-ls"
      end
      return c.name ~= "null-ls"
    end,
  }, {}))
end

return M

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
    automatic_installation = true,
  })

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  local null_ls = require("null-ls")
  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = augroup })
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          group = augroup,
          callback = function()
            M.format()
          end,
        })
      end
    end,
  })
end

function M.keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<cr>", opts)
  vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
  vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  -- vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<cr>", opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "<leader>ff", M.format, opts)
  vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>hi", M.toggle_inlayhints, opts)
end

function M.setup(opts)
  local lspconfig = require("lspconfig")
  local util = require("lspconfig.util")
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

  lspconfig.rust_analyzer.setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    settings = {
      rust_analyzer = {
        cargo = {
          allFeatures = true,
        },
        diagnostics = {
          enable = true,
        },
      },
    },
  })

  local eslint_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
  lspconfig.eslint.setup({
    on_attach = function(_, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
        group = eslint_lsp,
      })
    end,
    capabilities = lsp_capabilities,
    settings = {
      codeAction = {
        showDocumentation = {
          enable = true,
        },
      },
      codeActionOnSave = {
        enable = true,
        mode = "all",
      },
      format = true,
    },
  })

  lspconfig.gopls.setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        gofumpt = true,
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  })
end

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/format.lua
function M.format(buf)
  if not buf then
    buf = vim.api.nvim_get_current_buf()
  end

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

vim.g.inlay_hints_visible = false
function M.toggle_inlayhints()
  if vim.lsp.inlay_hint then
    vim.g.inlay_hints_visible = not vim.g.inlay_hints_visible
    vim.lsp.inlay_hint.enable(vim.g.inlay_hints_visible)
  end
end

return M

local border = {
  "╭",
  "─",
  "╮",
  "│",
  "╯",
  "─",
  "╰",
  "│",
}

local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",

    -- snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  event = "VeryLazy",
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- <C-y>
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<Tab>"] = cmp.mapping(function(fallback)
            local status_ok, luasnip = pcall(require, "luasnip")
            if status_ok and luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            local status_ok, luasnip = pcall(require, "luasnip")
            if status_ok and luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" })
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "vim-dadbod-completion", priority = 700 },
        { name = "path", priority = 500 },
        { name = "buffer", priority = 100 },
        { name = "luasnip", priority = 50 },
      }),
      completion = {
        completeopt = "menu,menuone",
      },
      window = {
        completion = {
          winhighlight = "CursorLine:PmenuSel,Search:None",
          scrollbar = false,
          border = border,
        },
        documentation = {
          border = border,
          winhighlight = "Normal:CmpDoc",
        },
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        expandable_indicator = true,
        format = lspkind.cmp_format({
          maxwidth = 20,
          ellipsis_char = "...",
          mode = "symbol_text",
        }),
      },
    })
  end,
}

return M

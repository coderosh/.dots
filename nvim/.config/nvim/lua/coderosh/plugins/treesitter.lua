local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

function M.config()
  ---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "javascript",
      "typescript",
      "rust",
      "go",
      "html",
      "css",
      "python",
      "bash",
      "markdown",
      "markdown_inline",
    },
    ignore_install = {},

    autotag = {
      enable = true,
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
      enable = true,
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",

          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",

          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",

          ["au"] = "@call.outer",
          ["iu"] = "@call.inner",
        },
      },
      move = {
        enable = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]l"] = "@loop.outer",
          ["]a"] = "@parameter.inner",
          ["]u"] = "@call.inner",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
          ["]L"] = "@loop.outer",
          ["]A"] = "@parameter.inner",
          ["]U"] = "@call.inner",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[l"] = "@loop.outer",
          ["[a"] = "@parameter.inner",
          ["[u"] = "@call.inner",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
          ["[L"] = "@loop.outer",
          ["[A"] = "@parameter.inner",
          ["[U"] = "@call.inner",
        },
      },
    },
  })
end

return M

local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  event = "VeryLazy",
}

function M.config()
  require("telescope").setup({
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
    },
    -- defaults = {
    --   layout_strategy = "horizontal",
    --   layout_config = {
    --     horizontal = {
    --       prompt_position = "top",
    --     },
    --   },
    --   sorting_strategy = "ascending",
    -- },
  })

  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "<leader>fp", builtin.find_files, {})
  vim.keymap.set("n", "<leader>fo", function()
    builtin.find_files({ hidden = true })
  end, {})
  vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
  vim.keymap.set("n", "<leader>fr", builtin.live_grep, {})
  vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})
  vim.keymap.set("n", "<leader>fa", builtin.lsp_references, {})
  vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
end

return M

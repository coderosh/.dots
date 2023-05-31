local M = {
  'Wansmer/treesj',
  requires = { 'nvim-treesitter' },
  event = "BufReadPost"
}

function M.config()
  require("treesj").setup {
    use_default_keymaps = false,
  }

  vim.keymap.set("n", "<leader>m", ":TSJToggle<CR>")
end

return M

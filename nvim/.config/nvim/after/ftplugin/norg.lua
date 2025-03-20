local opt = vim.opt

opt.conceallevel = 2
-- opt.concealcursor = "n"

vim.keymap.set("n", "<leader>tc", ":Neorg toggle-concealer<CR>")
vim.keymap.set("n", "<leader>ff", "gg=G''")

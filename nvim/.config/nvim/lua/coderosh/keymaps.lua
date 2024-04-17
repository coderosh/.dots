local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "|", ":sp<CR>")
keymap.set("n", "\\", ":vsp<CR>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<TAB>", ":bn<CR>")
keymap.set("n", "<S-TAB>", ":bp<CR>")

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

keymap.set("n", "<leader>w", ":w<CR>")

keymap.set("x", "<leader>p", '"_dP')

keymap.set("n", "<leader>fi", ":!tmux neww tsessionizer<CR>")

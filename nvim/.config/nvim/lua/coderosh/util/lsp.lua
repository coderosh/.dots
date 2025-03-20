local M = {}

function M.keymaps(bufnr)
	local opts = { noremap = false, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<cr>", opts)
	vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
	vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, opts)
end

return M

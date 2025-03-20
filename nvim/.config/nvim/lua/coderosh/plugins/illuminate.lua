return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local illuminate = require("illuminate")
		illuminate.configure()

		vim.keymap.set("n", "<leader>j", function()
			illuminate.goto_next_reference(false)
		end)
		vim.keymap.set("n", "<leader>k", function()
			illuminate.goto_prev_reference(false)
		end)
	end,
}

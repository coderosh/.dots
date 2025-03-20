local tools = require("coderosh.util.tools")

return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		formatters_by_ft = tools.formatters,
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format()
			end,
		},
	},
}

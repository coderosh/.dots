local M = {
	"xiyaowong/transparent.nvim",
	event = "VeryLazy",
}

function M.config()
	require("transparent").setup({
		groups = {
			"Normal",
			"NormalNC",
			"Comment",
			"Constant",
			"Special",
			"Identifier",
			"Statement",
			"PreProc",
			"Type",
			"Underlined",
			"Todo",
			"String",
			"Function",
			"Conditional",
			"Repeat",
			"Operator",
			"Structure",
			"LineNr",
			"NonText",
			"SignColumn",
			"CursorLineNr",
			"EndOfBuffer",
		},
		extra_groups = {
			"NeotreeNormal",
			"NeotreeNormalNC",
		}, -- table: additional groups that should be cleared
		exclude_groups = {}, -- table: groups you don't want to clear
	})
end

return M

return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	version = "v0.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = {
			enabled = true,
		},
		keymap = {
			preset = "enter",
		},
		completion = {
			menu = {
				border = "single",
				scrollbar = false,
			},
			documentation = {
				window = {
					border = "single",
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}

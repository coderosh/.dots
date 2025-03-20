local opt = vim.opt

opt.number = true
opt.numberwidth = 4
opt.relativenumber = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true

opt.wrap = false

opt.cmdheight = 1
opt.showmode = false

opt.background = "dark"

opt.clipboard = "unnamedplus"

opt.backspace = "indent,eol,start"

opt.completeopt = "menu,menuone"

opt.cursorline = true
opt.signcolumn = "yes"
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.termguicolors = true

opt.scrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.exrc = true

opt.formatexpr = "v:lua.require'conform'.formatexpr()"

opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
	opt.foldexpr = "v:lua.require'coderosh.util.fold'.foldexpr()"
	opt.foldmethod = "expr"
	opt.foldtext = ""
else
	opt.foldmethod = "indent"
	opt.foldtext = "v:lua.require'coderosh.util.fold'.foldtext()"
end

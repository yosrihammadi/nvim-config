vim.opt.termguicolors = true
vim.cmd([[colorscheme rose-pine]])

require("bufferline").setup({
	options = {
		show_icon = false,
		show_tab_indicators = false,
		diagnostics = "nvim_lsp",
	},
})

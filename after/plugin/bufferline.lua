vim.opt.termguicolors = true
vim.cmd([[colorscheme rose-pine]])

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
	},
})

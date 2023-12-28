require("yosri")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"windwp/nvim-ts-autotag",
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"ThePrimeagen/harpoon",
	{ "rose-pine/neovim", name = "rose-pine" },
	"mbbill/undotree",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	"jose-elias-alvarez/null-ls.nvim",
	"MunifTanjim/eslint.nvim",
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	"norcalli/nvim-colorizer.lua",
	"morhetz/gruvbox",
	"lewis6991/gitsigns.nvim",
	{
		"stevearc/conform.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end)
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	{
		"terrortylor/nvim-comment",
		lazy = false,
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	"machakann/vim-highlightedyank",
	"christoomey/vim-tmux-navigator",
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = true,
  -- stylua: ignore
  keys = {
    { "<leader>tn", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "<leader>tp", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		priority = 1000,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	"f-person/git-blame.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
})

require("luasnip.loaders.from_vscode").lazy_load()

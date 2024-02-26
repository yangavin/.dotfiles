-- For all plugins requiring little to no config
return {
	{
		"projekt0n/github-nvim-theme",
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
			transparent = true,
		},
		config = function(_, opts)
			require("github-theme").setup({
				options = opts,
			})
			vim.cmd("colorscheme github_dark_default")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
}

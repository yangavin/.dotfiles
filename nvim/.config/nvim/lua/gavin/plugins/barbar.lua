return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({})

		local map = vim.keymap.set
		local opts = { silent = true }

		opts.desc = "Close buffer"
		map("n", "<A-w>", ":BufferClose<CR>", opts)

		opts.desc = "Left buffer"
		map("n", "<S-C-h>", ":BufferPrevious<CR>", opts)
		opts.desc = "Right buffer"
		map("n", "<S-C-l>", ":BufferNext<CR>", opts)

		opts.desc = "Move tab left"
		map("n", "<S-C-p>", ":BufferMovePrevious<CR>", opts)
		opts.desc = "Move tab right"
		map("n", "<S-C-n>", ":BufferMoveNext<CR>", opts)

		opts.desc = "First tab"
		map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
		opts.desc = "Second tab"
		map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
		opts.desc = "Third tab"
		map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
		opts.desc = "Fourth tab"
		map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
		opts.desc = "Fifth tab"
		map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
		opts.desc = "Sixth tab"
		map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
	end,
}

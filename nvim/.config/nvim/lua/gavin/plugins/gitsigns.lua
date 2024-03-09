return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Restore hunks
				map("n", "<leader>hr", gs.reset_hunk)
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>hR", gs.reset_buffer)

				-- Preview hunk diffs
				map("n", "<leader>hp", gs.preview_hunk)

				-- Blame preview
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
			end,
		})
	end,
}

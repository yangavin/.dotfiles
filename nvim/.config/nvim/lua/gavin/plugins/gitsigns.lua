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
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Hunk" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })

				-- Preview hunk diffs
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })

				-- Blame preview
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame Preview" })
			end,
		})
	end,
}

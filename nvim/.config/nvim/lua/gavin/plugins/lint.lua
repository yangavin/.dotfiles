return {
	"mfussenegger/nvim-lint",
	opts = {
		sh = { "shellcheck" },
	},
	config = function(_, opts)
		local lint = require("lint")

		lint.linters_by_ft = opts

		vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "CursorHold" }, {
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", lint.try_lint)
	end,
}

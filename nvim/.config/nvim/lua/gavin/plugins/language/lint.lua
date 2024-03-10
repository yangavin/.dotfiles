return {
	"mfussenegger/nvim-lint",
	opts = {
		sh = { "shellcheck" },
	},
	config = function(_, opts)
		local lint = require("lint")

		lint.linters_by_ft = opts

		vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}

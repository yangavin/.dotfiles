return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					-- Respect .gitignore except for .env and show hidden files
					find_command = {
						"/bin/sh",
						"-c",
						"fd --hidden --type f && fd --hidden --no-ignore .env",
					},
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-f>", builtin.find_files, {})

		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, {})

		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, {})

		vim.keymap.set("n", "<leader>d", builtin.diagnostics, {})
	end,
}

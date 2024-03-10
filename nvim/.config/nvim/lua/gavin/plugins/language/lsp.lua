return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"folke/neoconf.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("neoconf").setup({})
			require("neodev").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					-- Automatically setup installed LSPs with completion capabilities
					function(server)
						require("lspconfig")[server].setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,
				},
			})

			-- Prolog LSP
			require("lspconfig").prolog_ls.setup({})
			vim.cmd("autocmd BufNewFile,BufRead *.pl set filetype=prolog") -- read pl files as prolog not perl

			-- Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = {
						buffer = ev.buf,
					}
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

					opts.desc = "Rename"
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

					opts.desc = "Code action"
					vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)

					opts.desc = "LSP Format"
					vim.keymap.set("n", "<leader>F", function()
						vim.lsp.buf.format({
							async = true,
						})
					end, opts)
				end,
			})
		end,
	},
}

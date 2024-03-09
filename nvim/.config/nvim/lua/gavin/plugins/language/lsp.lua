return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/nvim-cmp" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					-- Automatically setup installed LSPs with completion capabilities
					function(server)
						require("lspconfig")[server].setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,

					-- Lua has a special setup for neovim configs
					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
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
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({
							async = true,
						})
					end, opts)
				end,
			})
		end,
	},
}

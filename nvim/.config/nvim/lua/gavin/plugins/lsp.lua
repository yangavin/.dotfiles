return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/nvim-cmp" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html",
					"emmet_language_server",
					"cssls",
					"tsserver",
					"eslint",
					"pyright",
					"jdtls",
				},
				automatic_installation = true,
				handlers = {
					function(server)
						require("lspconfig")[server].setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,
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
			require("lspconfig").prolog_ls.setup({})
			vim.cmd("autocmd BufNewFile,BufRead *.pl set filetype=prolog") -- read pl files as prolog not perl
		end,
	},
}

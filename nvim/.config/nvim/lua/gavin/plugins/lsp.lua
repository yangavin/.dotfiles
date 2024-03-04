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
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					-- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
					-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources(
					{ {
						name = "nvim_lsp",
					}, {
						name = "luasnip",
					} },
					{ {
						name = "buffer",
					} }
				),
			})

			-- Set configuration for specific filetype.
			-- cmp.setup.filetype('gitcommit', {
			--     sources = cmp.config.sources({{
			--         name = 'git'
			--     } -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			--     }, {{
			--         name = 'buffer'
			--     }})
			-- })

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { {
					name = "buffer",
				} },
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ {
					name = "path",
				} }, { {
					name = "cmdline",
				} }),
			})
		end,
	},
}

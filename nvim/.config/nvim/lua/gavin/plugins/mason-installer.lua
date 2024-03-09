return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			-- Language Servers
			"lua_ls",
			"html",
			"emmet_language_server",
			"cssls",
			"tsserver",
			"eslint",
			"json-lsp",
			"pyright",
			"jdtls",
			"clangd",
			"astro",
			"bashls",

			-- Linters
			"shellcheck",

			-- Formatters
			"prettierd",
			"black",
			"stylua",
			"shfmt",
		},
	},
}

local map = vim.keymap.set
-- Easily source configuration
map("n", "<leader><leader>", ":luafile $MYVIMRC<CR>")

-- Move between buffers
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Keep cursor centered
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- My quirky keymap for end of line :P
map("i", "<S-CR>", "<End>")

-- Stupid <C-c> doesn't trigger InsertLeave
map("i", "<C-c>", "<Esc>")

-- LSP
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

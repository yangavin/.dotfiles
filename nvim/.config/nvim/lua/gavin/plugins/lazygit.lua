return {
	"kdheepak/lazygit.nvim",
	config = function()
		vim.keymap.set("n", "<leader>l", ":LazyGit<CR>", { desc = "LazyGit" })
	end,
}

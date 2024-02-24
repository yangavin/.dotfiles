local map = vim.keymap.set
-- Easily source configuration
map("n", "<leader><leader>", ":so<CR>")

-- Project view
map("n", "<leader>pv", ":Ex<CR>")

-- Keep cursor centered
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

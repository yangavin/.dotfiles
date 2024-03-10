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

-- Copy to clipboard
map("n", "<leader>yy", '"+yy')
map("v", "<leader>y", '"+y')

-- Paste from clipboard
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')

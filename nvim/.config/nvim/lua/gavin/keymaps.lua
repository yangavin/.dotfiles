local map = vim.keymap.set

-- Move between buffers
map("n", "<C-h>", "<C-w>h", { desc = "Move to the left buffer" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the right buffer" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the bottom buffer" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the top buffer" })

-- Keep cursor centered
map("n", "<C-u>", "<C-u>zz", { desc = "Page Up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Page Down" })

-- My quirky keymap for end of line :P
map("i", "<S-CR>", "<End>")

-- Stupid <C-c> doesn't trigger InsertLeave
map("i", "<C-c>", "<Esc>")

-- Copy to clipboard
map("n", "<leader>yy", '"+yy', { desc = "Copy to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- Paste from clipboard
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })

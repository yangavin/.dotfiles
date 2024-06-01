-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Keep cursor centered
map("n", "<C-u>", "<C-u>zz", { desc = "Page Up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Page Down" })

-- My quirky keymap for end of line :P
map("i", "<S-CR>", "<End>")

-- Stupid <C-c> doesn't trigger InsertLeave
map("i", "<C-c>", "<C-[>", { remap = true })
-- Copy to clipboard
map("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- Paste from clipboard
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Remove default <C-l> that quits terminal mode
vim.keymap.del("t", "<C-l>")
map("t", "<C-[>", "<C-\\><C-n>")

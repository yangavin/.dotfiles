-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 8
opt.number = true
opt.relativenumber = true

-- Disable cursorline
vim.opt.cursorline = false

-- Unset yank to clipboard
vim.opt.clipboard = ""

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.scrolloff = 8
opt.number = true
opt.relativenumber = true

-- Shift related options
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 50 })
	end,
})

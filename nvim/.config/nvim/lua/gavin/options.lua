vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.scrolloff = 8
opt.number = true
opt.relativenumber = true

-- Shift related options
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Set updatetime for linting
opt.updatetime = 1000

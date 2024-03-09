-- Making sure the leader is picked up by lazy mappings
vim.g.mapleader = " "

-- Initializing lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({{
    import = "gavin.plugins"
}, {
    import = "gavin.plugins.language"
}}, {
    change_detection = {
        notify = false
    },
    colorscheme = {"github-theme"}
})

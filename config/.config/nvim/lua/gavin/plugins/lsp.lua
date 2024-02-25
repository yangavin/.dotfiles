return {{
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"},
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"html", "cssls", "tsserver", "eslint", "pyright", "jdtls"},
            automatic_installation = true,
            handlers = {function(server)
                require("lspconfig")[server].setup({})
            end}
        })
    end
}}

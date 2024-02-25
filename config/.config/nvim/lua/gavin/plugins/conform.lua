return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = {"stylua"},
            python = {"black"},
            html = {"prettier"},
            css = {"prettier"},
            javascript = {"prettier"},
            javascriptreact = {"prettier"},
            typescript = {"prettier"},
            typescriptreact = {"prettier"},
            json = {"prettier"},
            markdown = {"prettier"},
            yaml = {"prettier"}
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true
        }
    }
}

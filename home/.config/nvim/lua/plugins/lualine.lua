return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, 2, {
      function()
        if vim.g.copilot_enabled then
          return require("lazyvim.config").icons.kinds.Copilot
        end
        return ""
      end,
      color = LazyVim.ui.fg("Special"),
    })
  end,
}

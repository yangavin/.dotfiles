return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_enabled = true
    vim.keymap.set("n", "<C-g>", function()
      if vim.g.copilot_enabled then
        vim.cmd("Copilot disable")
        vim.g.copilot_enabled = false
        return
      end
      vim.cmd("Copilot enable")
      vim.g.copilot_enabled = true
    end)
  end,
}

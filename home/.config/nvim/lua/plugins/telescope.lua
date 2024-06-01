return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        -- Respect .gitignore except for .env and show hidden files
        find_command = {
          "/bin/sh",
          "-c",
          "fd --hidden --type f && fd --hidden --no-ignore '^\\.env'",
        },
      },
    },
  },
  keys = {
    { "<leader><space>", ":Telescope find_files<CR>", desc = "Find Files (Root Dir)" },
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files (Root Dir)" },
  },
}

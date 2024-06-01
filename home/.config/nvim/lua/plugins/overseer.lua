return {
  "stevearc/overseer.nvim",
  config = function()
    local overseer = require("overseer")
    overseer.setup({
      task_launcher = {
        bindings = {
          i = {
            ["<C-c>"] = false,
          },
        },
      },
      task_editor = {
        bindings = {
          i = {
            ["<C-c>"] = false,
          },
        },
      },
    })
    local files = require("overseer.files")
    overseer.register_template({
      name = "Shell Scripts",
      generator = function(opts, cb)
        local scripts = vim.tbl_filter(function(filename)
          return filename:match("%.sh$")
        end, files.list_files(opts.dir))
        local ret = {}
        for _, filename in ipairs(scripts) do
          table.insert(ret, {
            name = filename,
            params = {
              args = { optional = true, type = "list", delimiter = " " },
            },
            builder = function(params)
              return {
                cmd = { files.join(opts.dir, filename) },
                args = params.args,
              }
            end,
          })
        end

        cb(ret)
      end,
    })
    vim.keymap.set("n", "<leader>oo", ":OverseerToggle<CR>", { desc = "Toggle Overseer" })
    vim.keymap.set("n", "<leader>oi", ":OverseerInfo<CR>", { desc = "Overseer Info" })
    vim.keymap.set("n", "<leader>or", ":OverseerRun<CR>", { desc = "Run Template" })
    vim.keymap.set("n", "<leader>os", ":OverseerSaveBundle<CR>", { desc = "Save Current Tasks" })
    vim.keymap.set("n", "<leader>ol", ":OverseerLoadBundle<CR>", { desc = "Load a Task Bundle" })
    vim.keymap.set("n", "<leader>od", ":OverseerDeleteBundle<CR>", { desc = "Delete a Task Bundle" })
    vim.keymap.set("n", "<leader>oc", ":OverseerRunCmd<CR>", { desc = "Run Shell Command" })
    vim.keymap.set("n", "<leader>ob", ":OverseerBuild<CR>", { desc = "Build Task From Scratch" })
    vim.keymap.set("n", "<leader>oq", ":OverseerQuickAction<CR>", { desc = "Action on Last Task" })
    vim.keymap.set("n", "<leader>oa", ":OverseerTaskAction<CR>", { desc = "Action on a Task" })
  end,
}

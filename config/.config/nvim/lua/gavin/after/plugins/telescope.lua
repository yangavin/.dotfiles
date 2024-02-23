require('telescope').setup{
		pickers = {
			find_files = {hidden = true}
	}
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-f>', builtin.find_files, {})


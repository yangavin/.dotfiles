return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		extensions = { "lazy", "mason", "neo-tree" },
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}

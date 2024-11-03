return {
	{
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup({
				terminals = {
					type_opts = {
						float = {
							relative = "editor",
							row = 0.1,
							col = 0.1,
							width = 0.8,
							height = 0.8,
							border = "single",
						},
						horizontal = {
							location = "rightbelow",
						},
						vertical = {
							location = "rightbelow",
						},
					},
					mappings = {
						toggle = "<leader>t", -- Cambia esto a tu mapeo preferido
					},
				},
			})
		end,
	},
}

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettier" },
				css = { "prettier" },
				-- python = { "isort", "black" },
				-- java = {}
			},
			formatters = {
				-- Python
				black = {
					prepend_args = {
						"--fast",
						"--line-length",
						"80",
					},
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 5000,
				lsp_format = "fallback",
			},
		})
		-- Formatea automáticamente al guardar
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				require("conform").format({ async = true })
			end,
		})
	end,
}

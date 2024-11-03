return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- feed luasnip suggestions to cmp
			"saadparwaiz1/cmp_luasnip",
			-- provide vscode like snippets to cmp
			"rafamadriz/friendly-snippets",
		},
	},
	-- cmp-nvim-lsp provides language specific completion suggestions to nvim-cmp
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	-- nvim-cmp provides auto completion and auto completion dropdown ui
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- buffer based completion options
			"hrsh7th/cmp-buffer",
			-- path based completion options
			"hrsh7th/cmp-path",
		},
		config = function()
			local kind_icons = {
				Namespace = "󰌗",
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰆧",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈚",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰊄",
				Table = "",
				Object = "󰅩",
				Tag = "",
				Array = "[]",
				Boolean = "",
				Number = "",
				Null = "󰟢",
				Supermaven = "",
				String = "󰉿",
				Calendar = "",
				Watch = "󰥔",
				Package = "",
				Copilot = "",
				Codeium = "",
				TabNine = "",
				BladeNav = "",
			}
			-- Gain access to the functions of the cmp plugin
			local cmp = require("cmp")
			-- Gain access to the function of the luasnip plugin
			local luasnip = require("luasnip")

			-- Lazily load the vscode like snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- All the cmp setup function to configure our completion experience
			cmp.setup({
				-- How should completion options be displayed to us?
				completion = {
					-- menu: display options in a menu
					-- menuone: automatically select the first option of the menu
					-- preview: automatically display the completion candiate as you navigate the menu
					-- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
					competeopt = "menu,menuone,preview,noselect",
				},
				-- setup snippet support based on the active lsp and the current text of the file
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				-- setup how we interact with completion menus and options
				mapping = cmp.mapping.preset.insert({
					-- previous suggestion
					["<C-k>"] = cmp.mapping.select_prev_item(),
					-- next suggestion
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- show completion suggestions
					["<C-Space"] = cmp.mapping.complete(),
					-- close completion window
					["<C-e>"] = cmp.mapping.abort(),
					-- confirm completion, only when you explicitly selected an option
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							require("luasnip").jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- Where and how should cmp rank and find completions
				-- Order matters, cmp will provide lsp suggestions above all else
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),

				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
			})
		end,
	},
}

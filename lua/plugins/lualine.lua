return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
        local custom_lsp = {
            function()
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return "No LSP"
                end
                local client_names = ""
                for _, client in pairs(clients) do
                    if client_names == "" then
                        client_names = client.name
                    else
                        client_names = client_names .. ", " .. client.name
                    end
                end
                return "  " .. client_names -- Adding an icon before the LSP names
            end,
            color = { fg = "#7287fd" }, -- Customize colors here
        }

        require("lualine").setup({
            options = {
                theme = "catppuccin",
                -- theme = "onedark",
                section_separators = "",
                component_separators = "",
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    { "filename", file_status = true },
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        symbols = {
                            error = " ", -- Icon for errors
                            warn = " ", -- Icon for warnings
                            info = " ", -- Icon for info
                            hint = " ", -- Icon for hints
                        },
                        diagnostics_color = {
                            error = { fg = "#ff6c6b" },
                            warn = { fg = "#ecd07b" },
                            info = { fg = "#7abe64" },
                            hint = { fg = "#dc789f" },
                        },
                    },
                    -- custom_lsp, -- Add custom LSP module here
                },
                lualine_x = {
                    custom_lsp,
                    "filetype",
                },
                lualine_y = {},
                lualine_z = { "location", "progress" }, -- Moved progress and location to the rightmost section
            },
        })
    end,
}

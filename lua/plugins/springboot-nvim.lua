return {
    "elmcgill/springboot-nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-jdtls"
    },
    config = function()
        -- Solo carga `springboot-nvim` si se detecta un archivo específico de Spring Boot
        local function is_spring_boot_project()
            return vim.fn.glob("**/src/main/resources/application.*") ~= ""
        end

        if is_spring_boot_project() then
            local springboot_nvim = require("springboot-nvim")
            springboot_nvim.setup({})

            -- Configura las teclas solo si es un proyecto de Spring Boot
            vim.keymap.set('n', '<leader>Jr', springboot_nvim.boot_run, {desc = "[J]ava [R]un Spring Boot"})
            vim.keymap.set('n', '<leader>Jc', springboot_nvim.generate_class, {desc = "[J]ava Create [C]lass"})
            vim.keymap.set('n', '<leader>Ji', springboot_nvim.generate_interface, {desc = "[J]ava Create [I]nterface"})
            vim.keymap.set('n', '<leader>Je', springboot_nvim.generate_enum, {desc = "[J]ava Create [E]num"})
        end
    end
}

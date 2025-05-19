local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Installer
        { "williamboman/mason.nvim", config=true },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "pyright", "jdtls" },
            automatic_enable = false,
            -- automatic_installation = true,
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for _, server_name in ipairs(require("mason-lspconfig").get_installed_servers()) do
                local opts = {
                        capabilities = capabilities,
                }

                if server_name == "cssls" then
                        opts.settings = {
                                css = { validate = true },
                                scss = { validate = true },
                        }

                elseif server_name == "lua_ls" then
                        opts.settings = {
                                Lua = {
                                        diagnostics = {
                                                globals = { "vim" },
                                        },
                                },
                        }
                end

                lspconfig[server_name].setup(opts)
        end
    end,
}

return { M }

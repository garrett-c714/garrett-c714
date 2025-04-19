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
            ensure_installed = { "lua_ls", "ts_ls", "pyright" },
            automatic_installation = true,
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Change setups here
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.pyright.setup({
            capabilities = capabilities,
        })
    end,
}

return { M }

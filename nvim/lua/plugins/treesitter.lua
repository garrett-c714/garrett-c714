local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "javascript", "typescript" },
            highlight = {
                enable = true,
            },
        }
    end,
}

return { M }


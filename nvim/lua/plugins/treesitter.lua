local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "javascript", "typescript", "tsx", "css", "scss", "python", "java", "http", "markdown", "c_sharp", "go" },
            -- http required for rest.nvim

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = { "markdown" }
            },
            indent = {
                enable = true,
            },
        }
    end,
}

return { M }

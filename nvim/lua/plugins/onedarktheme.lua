local M = {
    "navarasu/onedark.nvim",
    config = function()
        require('onedark').setup({
            style = 'dark',
            transparent = true,
        })

        vim.cmd("colorscheme onedark")
    end,
}

return { M }

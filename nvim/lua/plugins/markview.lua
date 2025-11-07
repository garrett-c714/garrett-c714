local M = {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49,
    config = function()
        require("markview").setup({
            preview = {
                enable = false,
            }
        })
    end
}

--return {}
return { M }

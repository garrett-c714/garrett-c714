local M = {
    "vhyrro/luarocks.nvim",
    name="luarocks",
    lazy = false,
    priority = 1000,
    opts = {
        rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
}

return {}
--return { M }

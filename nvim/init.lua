vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Automatically Change Working Dir When Opening Directories
vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
                local arg = vim.fn.argv(0)
                if vim.fn.isdirectory(arg) == 1 then
                        vim.cmd('cd ' .. arg)
                end
        end
})

-- Locally Change Working Dir When Opening Files
--[[
vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
                vim.cmd("lcd %:p:h")
        end
})
]]

-- Load Lua Files

-- General Settings
require('settings')

-- Packages
require("config.lazy")

-- Keymaps
require("config.keymaps")


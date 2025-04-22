vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load Lua Files

-- General Settings
require('settings')

-- Packages
require("config.lazy")

-- Keymaps
-- broken, find & fix binding for hover
-- require("config.keymaps")

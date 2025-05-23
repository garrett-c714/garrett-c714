local M = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        harpoon:setup({
            settings = {
                save_on_toggle = false,
                save_on_change = false,
            }
        })

    end
}

return { M }

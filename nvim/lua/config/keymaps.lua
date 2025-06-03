-- General
vim.keymap.set("n", "<leader>z", function()
    vim.wo.foldcolumn = (vim.wo.foldcolumn == "1") and "0" or "1"
end, { desc = "Toggle fold gutter" })

-- LSPConfig
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>p", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end
})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>hu", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hd", function()
    local pins = harpoon:list()
    local current_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":p")
    for _, item in ipairs(pins.items) do
        local item_path = vim.fn.fnamemodify(item.value, ":p")
        if item_path == current_path then
            pins:remove()
            vim.api.nvim_echo({{"Removed from Harpoon pins", "Normal"}}, false, {})
            return
        end
    end
end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-h>g", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-h>j", function() harpoon:list():next() end)

-- MarkdownPreview
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set("n", "<localleader>t", "<Plug>MarkdownPreviewToggle")
    end
})

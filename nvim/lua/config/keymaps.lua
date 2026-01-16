-- General

vim.keymap.set("n", "<leader>z", function()
    vim.wo.foldcolumn = (vim.wo.foldcolumn == "1") and "0" or "1"
end, { desc = "Toggle fold gutter" })

vim.keymap.set("n", "<leader>-", "<cmd>Ex<CR>", { desc = "Explore directory at buffer" })

vim.keymap.set("n", "<A-k>", "<cmd>m.-2<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", "<cmd>m.+1<CR>", { desc = "Move line down" })


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
        vim.keymap.set("n", "<leader>=", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end
})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Telescope colorscheme picker" })

-- Grapple
vim.keymap.set("n", "<leader>gu", "<cmd>Grapple toggle_tags<CR>", { desc = "Show Grapple UI" })
vim.keymap.set("n", "<leader>gt", "<cmd>Grapple toggle<CR>", { desc = "Grapple file" })

vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<CR>")


-- Harpoon
--[[
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
vim.keymap.set("n", "<leader>he", function()
    local pins = harpoon:list()
    for _, item in ipairs(pins.items) do
        pins:remove()
    end
    vim.api.nvim_echo({{"Done.", "Normal"}}, false, {})
end,  { desc = "Empty Harpoon pins" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-h>g", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-h>j", function() harpoon:list():next() end)
]]--

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- markdown-preview
        vim.keymap.set("n", "<localleader>t", "<Plug>MarkdownPreviewToggle")

        -- markview
        vim.keymap.set("n", "<localleader>s", "<cmd>Markview splitToggle<CR>", { desc = "Toggle Markview split preview pane" })
        vim.keymap.set("n", "<localleader>v", "<cmd>Markview toggle<CR>", { desc = "Toggle in-place Markview preview" })
    end
})

-- rest
vim.api.nvim_create_autocmd("FileType", {
    pattern = "http",
    callback = function()
        vim.keymap.set("n", "<localleader>r", "<cmd>Rest run<CR>", { desc = "Run REST request in cursor region" })
        vim.keymap.set("n", "<localleader>e", "<cmd>Rest env select<CR>", { desc = "Select env file for variables" })
    end
})


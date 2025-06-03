vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamedplus'
vim.diagnostic.config({
        virtual_text = true,
})

-- Code Folding --
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

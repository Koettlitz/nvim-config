vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.g.mapleader = " "
vim.diagnostic.config ({
    virtual_text = true,
    signs = true,
    underline = true,
})
require('keymaps')
require("config.lazy")

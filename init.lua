vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.g.mapleader = " "
require('keymaps')
require("config.lazy")
require('rust.colorscheme').apply()

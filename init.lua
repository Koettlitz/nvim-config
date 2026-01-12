vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.g.mapleader = " "
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
  desc = "Go to defintion"
})
vim.keymap.set(
  "n",
  "<leader>/",
  "<Plug>(comment_toggle_linewise_current)",
  { desc = "Toggle comment" }
)
vim.keymap.set(
  "v",
  "<leader>/",
  "<Plug>(comment_toggle_linewise_visual)",
  { desc = "Toggle comment" }
)
require("config.lazy")

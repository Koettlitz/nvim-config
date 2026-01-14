vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true })
vim.keymap.set('n', '<ESC>', function()
  if vim.v.hlsearch == 1 then
    vim.cmd('nohlsearch')
  end
  return vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
end, { expr = true, noremap = true, silent = true })
vim.keymap.set('n', '<C-o>', '<C-o>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-i>', '<C-i>zz', { noremap = true, silent = true })

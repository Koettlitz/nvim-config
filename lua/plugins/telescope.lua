return {
  'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    telescope.setup{
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
      },
    }

    -- Keymaps go here or in a separate keymap file
    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }

    -- Common pickers
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = "LSP references" })
  end
}

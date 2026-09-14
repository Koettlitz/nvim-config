vim.keymap.set(
  'n',
  '<C-h>',
  function()
    vim.diagnostic.open_float(nil, { scope = "cursor" })
  end,
  { desc = "Show diagnostic under cursor" }
)
return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_linters = {
      rust = {},
      lua = { 'lua_language_server' },
    }

    vim.g.ale_rust_analyzer_config = {
      ['rust-analyzer'] = {
        check = {
          command = 'clippy',
        },
      },
    }
  end
}

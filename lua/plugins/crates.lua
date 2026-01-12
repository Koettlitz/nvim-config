return {
  'saecki/crates.nvim',
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  tag = 'stable',
  config = function()
    require("crates").setup {
      completion = {
        cmp = {
            enabled = true,
        },
      },
    }
  end,
}

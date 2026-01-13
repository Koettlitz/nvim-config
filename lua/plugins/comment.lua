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

return {
  "numToStr/Comment.nvim",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = false,
      },
    },
  },
  opts = {
    -- ❌ disable Comment.nvim default keymaps
    mappings = {
      basic = false,
      extra = false,
    },

    -- ✅ context-aware commentstring via Treesitter
    pre_hook = function(ctx)
      local U = require("Comment.utils")

      local location
      if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils")
          .get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils")
          .get_visual_start_location()
      end

      return require("ts_context_commentstring.internal")
        .calculate_commentstring({
          key = ctx.ctype == U.ctype.line
              and "__default"
              or "__multiline",
          location = location,
        })
    end,
  },
}

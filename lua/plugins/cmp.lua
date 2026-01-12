return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function(_, opts)
    local cmp = require("cmp")
    cmp.setup(opts) -- Globally defaults

    local luasnip = require("luasnip")
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-d>"] = cmp.mapping(function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })

    cmp.setup.filetype("rust", { -- Specific setup for Rust files
      window = {
        completion = cmp.config.window.bordered({
          max_width = 16,
        }),
        documentation = cmp.config.window.bordered({
          min_width = 80,
          zindex = 50,
        }),
      },
      formatting = { -- Limit width of completion suggestions to leave room for the doc window
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          local max = 32
          if vim_item.menu and #vim_item.menu > max then
            vim_item.menu = vim_item.menu:sub(1, max - 1) .. "…"
          end
          return vim_item
        end,
      },
    })

    cmp.setup.filetype("toml", {
      sources = cmp.config.sources({
        { name = "crates" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end
}

return {
  {
    name = "rust-colorscheme-overrides",
    -- This line has no effect as I understood it, but has to be there to prevent Neovim or Lazy or something from complaining
    dir = vim.fn.stdpath("config"),

    -- Ensure it runs after themes
    priority = 1000,

    config = function()
      local function apply_rust_hl()
        -- struct
        vim.api.nvim_set_hl(0, "@lsp.type.struct.rust", { fg = "#0ba306", bold = true })
        --[[ vim.api.nvim_set_hl(0, "@type.rust", { fg = "#0ba306", bold = true }) ]]

        -- trait
        vim.api.nvim_set_hl(0, "@lsp.type.derive.rust", { fg = "#506fff", bold = true })
        vim.api.nvim_set_hl(0, "@lsp.type.interface.rust", { fg = "#506fff", bold = true })

        -- enum
        vim.api.nvim_set_hl(0, "@lsp.type.enum.rust", { fg = "#a06440", bold = true })
        vim.api.nvim_set_hl(0, "@lsp.type.enumMember.rust", { fg = "#a06fc8", bold = true })

        -- string
        --[[ vim.api.nvim_set_hl(0, "@string.rust", { fg = "#28ff80" }) ]]
        vim.api.nvim_set_hl(0, "@lsp.type.string.rust", { fg = "#96ffc8" })
        vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier.rust", { fg = "#00ff80", bold = true })

        -- keyword
        vim.api.nvim_set_hl(0, "@keyword.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.repeat.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@lsp.type.keyword.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.import.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.type.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.function.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.modifier.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword.rust", { fg = "#f99818", bold = true })
        vim.api.nvim_set_hl(0, "@type.builtin.rust", { fg = "#f99818", bold = true })

        -- function
        vim.api.nvim_set_hl(0, "@lsp.type.method.rust", { fg = "#ffff96" })
        vim.api.nvim_set_hl(0, "@lsp.type.function.rust", { fg = "#ffff96" })
        vim.api.nvim_set_hl(0, "@function.rust", { fg = "#ffff96" })
        vim.api.nvim_set_hl(0, "@function.call.rust", { fg = "#ffff96" })

        -- macro
        vim.api.nvim_set_hl(0, "@lsp.type.macro.rust", { fg = "#40bcde", bold = true })

        -- field
        vim.api.nvim_set_hl(0, "@lsp.type.property.rust", { fg = "#ffffff" })

        -- variable
        vim.api.nvim_set_hl(0, "@lsp.type.variable.rust", { fg = "#dedede" })
        vim.api.nvim_set_hl(0, "@lsp.type.parameter.rust", { fg = "#dedede" })

        -- const
        vim.api.nvim_set_hl(0, "@lsp.type.const.rust", { fg = "#c8bcff", italic = true })

        -- #[attribute]
        vim.api.nvim_set_hl(0, "@lsp.type.decorator.rust", { fg = "#bcde40" })
        vim.api.nvim_set_hl(0, "@lsp.type.attributeBracket.rust", { fg = "#bcde40" })

        -- generics
        vim.api.nvim_set_hl(0, "@lsp.type.typeParameter.rust", { fg = "#9680b4" })

        -- type alias
        vim.api.nvim_set_hl(0, "@lsp.type.typeAlias.rust", { fg = "#9680b4" })

        -- lifetime
        vim.api.nvim_set_hl(0, "@lsp.type.lifetime.rust", { fg = "#40dede" })
      end
      apply_rust_hl()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = apply_rust_hl,
      })
    end,
  },
}

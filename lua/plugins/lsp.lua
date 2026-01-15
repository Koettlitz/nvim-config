vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
    vim.defer_fn(function ()
        local keys = vim.api.nvim_replace_termcodes("8<C-e>", true, false, true)
        vim.api.nvim_feedkeys(keys, 'n', false)
    end, 64)
end, {
  desc = "Go to defintion"
})
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ async = false })
        return
      end
    end
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("rust_analyzer", {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", ".git" },
        capabilities = capabilities,
      })

      vim.lsp.enable("rust_analyzer")
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "<C-q>", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP: Rename symbol" })
        end,
      })
    end,
  },
}

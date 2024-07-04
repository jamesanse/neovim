return {
 {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          cmd = {"/Applications/Xcode.app/Content/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"}
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup {}
      lspconfig.sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })
      vim.keymap.set('n', "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

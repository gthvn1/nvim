local plugins = {
  {
    "tpope/vim-fugitive",
    config = function ()
      vim.keymap.set(
        'n',
        '<leader>gg',
        '<Cmd>Git grep <cword><cr>', {silent = true})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "ocamllsp",
        "clangd",
      }
    }
  }
}

return plugins

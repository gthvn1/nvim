local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('ChrisWellsWood/roc.vim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('BurntSushi/ripgrep')
Plug('nvim-treesitter/nvim-treesitter', { ['tag'] = '0.1.6' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('folke/tokyonight.nvim')
Plug('williamboman/mason.nvim')
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

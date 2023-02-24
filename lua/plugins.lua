return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    use { 'dnlhc/glance.nvim' }       -- Pretty window for previewing LSP locations in
                                      -- one place
    use { 'dracula/vim' }             -- color theme
    use { 'rose-pine/neovim' }        -- color theme
    use { 'ldelossa/nvim-ide' }       -- complete IDE for Neovim
    use { 'lewis6991/gitsigns.nvim'}  -- Better git integration
    use { 'tpope/vim-fugitive' }      -- call arbitrary Git command
    use { 'nvim-telescope/telescope.nvim',
           tag = '0.1.1',
           requires = { {'nvim-lua/plenary.nvim'} } }
    use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
          }
}
end)


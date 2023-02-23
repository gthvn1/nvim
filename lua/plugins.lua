return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    use { 'williamboman/mason.nvim' } -- easy install & manage LSP servers, DAP servers
                          -- linters and formatters
    use { 'dnlhc/glance.nvim' }       -- Pretty window for previewing LSP locations in
                          -- one place
    use { 'dracula/vim' }             -- theme
    use { 'ldelossa/nvim-ide' }       -- complete IDE for Neovim
    use { 'lewis6991/gitsigns.nvim'}  -- Better git integration
    use { 'rose-pine/neovim' }        -- rosé pine theme
    use { 'nvim-telescope/telescope.nvim',
           tag = '0.1.1',
           requires = { {'nvim-lua/plenary.nvim'} } }
end)


return {
    -- colorscheme
    { 'dracula/vim' },
    { 'rmehri01/onenord.nvim' },
    { 'rose-pine/neovim' },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("catppuccin").setup({
                integrations = {
                    alpha = true,
                    gitsigns = true,
                    nvimtree = true,
                    notify = true,
                    treesitter = true,
                    which_key = true,
                },
            })

            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    },
}

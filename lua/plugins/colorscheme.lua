return {
    -- colorscheme
    { 'dracula/vim' },
    { 'rmehri01/onenord.nvim' },
    {
         'rose-pine/neovim',
         lazy = false,
         priority = 1000,
         config = function ()
             vim.cmd([[colorscheme rose-pine-moon]])
         end,
    }
}

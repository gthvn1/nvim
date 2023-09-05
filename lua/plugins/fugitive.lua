return {
    'tpope/vim-fugitive',
    config = function ()
        vim.keymap.set('n','<leader>gg', '<Cmd>Git grep <cword><cr>', {silent = true})
    end,
}

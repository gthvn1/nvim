return {
        'nvim-telescope/telescope.nvim',
        dependencies = {
                'nvim-lua/plenary.nvim',
        },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
            vim.keymap.set('n', '<leader>ft', builtin.tags, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end,
}

return {
        'nvim-telescope/telescope.nvim',
        dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons',
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    build = "make",
                    config = function()
                        require("telescope").load_extension("fzf")
                    end,
                },
        },
        keys = {
            { '<leader><space>', "<cmd>Telescope buffers<cr>", desc = "List open buffers"},
            { '<leader>ff'     , "<cmd>Telescope find_files<cr>", desc = "Find files" }, 
            { '<leader>fg'     , "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
            { '<leader>fs'     , "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbol"},
            { '<leader>ft'     , "<cmd>Telescope tags<cr>", desc = "tags"},
        },
        config = function ()
            require('telescope').setup({
                pickers = {
                    find_files = {
                        theme = "dropdown",
                    },
                },
            })
        end,
}

local vim = vim
local Plug = vim.fn['plug#']

vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = ' '


-- Plugins
require('plugins')

-- Starting plugins. 
-- TODO: check why some plugins need this
require('lualine').setup()
require('mason').setup()

-- Mappings
-- Telescop 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Set colorsheme. Need plugins
vim.opt.termguicolors = true
vim.cmd 'colorscheme tokyonight'

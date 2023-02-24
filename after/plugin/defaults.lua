local vg = vim.g
vg.mapleader = ' '         -- Map leader to space

local vc = vim.cmd
vc('colorscheme dracula')     -- Setup colorscheme
--vc('colorscheme rose-pine')

local vo = vim.opt
-- display line number and relative line number
vo.number         = true
vo.relativenumber = true

-- highlight when searching and enable increment search
vo.hlsearch  = true
vo.incsearch = true

-- Manage tabs as 4 spaces
vo.tabstop     = 4
vo.softtabstop = 4
vo.shiftwidth  = 4
vo.expandtab   = true

vo.termguicolors = true

-- When go down always have several lines visible from the bottom unless
-- you are at the end of the file of course...
vo.scrolloff = 5

local vk = vim.keymap
vk.set('n', '<leader>ff', ':Telescope find_files <cr>'          , {})
vk.set('n', '<leader>fg', ':Telescope live_grep <cr>'           , {})
vk.set('n', '<leader><leader>', ':Telescope buffers <cr>'       , {})
vk.set('n', '<leader>fh', ':Telescope help_tags <cr>'           , {})
vk.set('n', '<leader>ls', ':Telescope lsp_document_symbols <cr>', {})
vk.set('n', '<leader>gs', ':Git grep <cword> <cr>'              , {})

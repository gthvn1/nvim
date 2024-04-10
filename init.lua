local vim = vim

-- When go down always have several lines visible from the bottom unless
-- you are at the end of the file of course...
vim.opt.scrolloff = 5

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '

-- Plugins
require('plugins')

-- Starting plugins. 
-- TODO: check why some plugins need this
require('lualine').setup()
require('mason').setup()

-- LSP
local lspconfig = require('lspconfig')
lspconfig.zls.setup {}

-- Mappings
-- Telescope
local builtin = require('telescope.builtin')
local km = vim.keymap
km.set('n', '<leader>ff', builtin.find_files, {})
km.set('n', '<leader>fg', builtin.live_grep, {})
km.set('n', '<leader>fb', builtin.buffers, {})
km.set('n', '<leader>fh', builtin.help_tags, {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    km.set('n', 'gD', vim.lsp.buf.declaration, opts)
    km.set('n', 'gd', vim.lsp.buf.definition, opts)
    km.set('n', 'K', vim.lsp.buf.hover, opts)
    km.set('n', 'gi', vim.lsp.buf.implementation, opts)
    km.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    km.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    km.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    km.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    km.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    km.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    km.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    km.set('n', 'gr', vim.lsp.buf.references, opts)
    km.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Set colorsheme. Need plugin tokyonight
vim.opt.termguicolors = true
vim.cmd 'colorscheme tokyonight'

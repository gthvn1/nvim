return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
      { '<leader>nf', '<Cmd>NvimTreeFindFile<cr>', desc = "NvimTree Find file" },
      { '<leader>nt', '<Cmd>NvimTreeToggle<cr>', desc = "Toggle NvimTree" };
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    require("nvim-tree").setup {}
  end,
}

# Configuration

- [NvChad](https://nvchad.com/) is using lazy.vim that we already used in
our previous setup. So it is intresting to use it now. To get the new
configuration you just need to copy **nvchad/custom**. All others files and
directories are not used any more. All customization with **NvChad** is done
into the **custom** dir.

- Some usefull links:
    - [Turn VIM into a full featured IDE with only one command](https://www.youtube.com/watch?v=Mtgo-nP_r8Y&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf)

# Old configuration with lazy.vim

- Configuration is done using [lazy.vim](https://github.com/folke/lazy.nvim).

- If you need to backup an old config you can do:
```sh
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

# Plugins

Here is the list of plugins that I'm using.

## Colors
- [Dracula](https://github.com/dracula/vim)
- [OneNord](https://github.com/rmehri01/onenord.nvim)
- [Rosé](https://github.com/rose-pine/neovim)

## Utils
- [Alpha-nvim](https://github.com/goolord/alpha-nvim)
- [Dressing](https://github.com/stevearc/dressing.nvim)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [LazyGit](https://github.com/kdheepak/lazygit.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
  - [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
  - [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Navigator](https://github.com/ray-x/navigator.lua)
- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Vim-illuminate](https://github.com/RRethy/vim-illuminate)

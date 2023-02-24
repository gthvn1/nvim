# My neovim configuration

- Plugins are managed using [Packer](https://github.com/wbthomason/packer.nvim).
    - To install it:
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Hierarchy

- I put the setup in the *init.lua* file.
- To add a plugin I add it to *lua/plugins.lua*. Setup of plugins is done in
the *init.lua* file

## Plugins

- [Dracula](https://github.com/dracula/vim)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Glance](https://github.com/DNLHC/glance.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Nvim-ide](https://github.com/ldelossa/nvim-ide)
- [Rosé](https://github.com/rose-pine/neovim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

## Cleanup

- If you want to cleanup the installation you need to remove:
    - **$HOME/.cache/nvim**
    - **$HOME/.local/share/nvim/**
- Location can be customized using `XDG_CONFIG_HOME`.

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

- [dracula](https://github.com/dracula/vim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [glance](https://github.com/DNLHC/glance.nvim)
- [mason](https://github.com/williamboman/mason.nvim)
- [nvim-ide](https://github.com/ldelossa/nvim-ide)
- [rosé](https://github.com/rose-pine/neovim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

## Cleanup

- If you want to cleanup the installation you need to remove:
    - **$HOME/.cache/nvim**
    - **$HOME/.local/share/nvim/**
- Location can be customized using `XDG_CONFIG_HOME`.

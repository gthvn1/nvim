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
- Configurations like colorscheme, keymap, soft tabs and Co are done in
  *after/plugin/defaults*

## Plugins

- [Dracula](https://github.com/dracula/vim)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Glance](https://github.com/DNLHC/glance.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
  - With the installation of *lsp-zero* this plugin is required and installed by *lsp-zero*.
- [Nvim-ide](https://github.com/ldelossa/nvim-ide)
- [OneNord](https://github.com/rmehri01/onenord.nvim)
- [Rosé](https://github.com/rose-pine/neovim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

## Tips

- To setup packer and close once all operations are completed you can:
    - `nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'`
- We modify *plugins.lua* to be a Lua module. It is a common approach in Lua to create
  a dictionnary *M* for [module](http://lua-users.org/wiki/ModuleDefinition).
  It is simple, relies on no external code, avoids global and has few pitfalls. 

## Cleanup

- If you want to cleanup the installation you need to remove:
    - **$HOME/.cache/nvim**
    - **$HOME/.local/share/nvim/**
- Location can be customized using `XDG_CONFIG_HOME`.

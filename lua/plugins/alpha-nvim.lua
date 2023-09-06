return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = function ()
        local dashboard = require("alpha.themes.startify")
        local logo = [[
      ___           ___           ___           ___           ___     
     /\  \         /\  \         /\__\         /\__\         /\__\    
    /::\  \        \:\  \       /:/  /        /:/  /        /::|  |   
   /:/\:\  \        \:\  \     /:/__/        /:/  /        /:|:|  |   
  /:/  \:\  \       /::\  \   /::\  \ ___   /:/__/  ___   /:/|:|  |__ 
 /:/__/_\:\__\     /:/\:\__\ /:/\:\  /\__\  |:|  | /\__\ /:/ |:| /\__\
 \:\  /\ \/__/    /:/  \/__/ \/__\:\/:/  /  |:|  |/:/  / \/__|:|/:/  /
  \:\ \:\__\     /:/  /           \::/  /   |:|__/:/  /      |:/:/  / 
   \:\/:/  /     \/__/            /:/  /     \::::/__/       |::/  /  
    \::/  /                      /:/  /       ~~~~           /:/  /   
     \/__/                       \/__/                       \/__/    
]]
        dashboard.section.header.val = vim.split(logo, "\n")
    end,
    config = function ()
        require('alpha').setup(require('alpha.themes.startify').config)
    end
}

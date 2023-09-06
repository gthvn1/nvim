local opt = vim.opt

-- bootstrap lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

opt.rtp:prepend(lazypath)

-- --------------------------------------------------------------------
-- Custom vim options

-- Use relative and normal number together
opt.number = true
opt.relativenumber = true

-- Manage 4 spaces for tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- highlight cursor line
opt.cursorline = true

-- When go down always have several lines visible from the bottom unless
-- you are at the end of the file of course...
opt.scrolloff = 5

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

-- Load lazy.vim
require("lazy").setup("plugins")

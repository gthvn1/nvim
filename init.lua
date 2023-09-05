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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local opt = vim.opt

opt.rtp:prepend(lazypath)

opt.number = true
opt.relativenumber = true

opt.tabstop = 4      -- 4 spaces for tabs
opt.shiftwidth = 4   -- 4 spaces for indent with
opt.expandtab = true -- expand tab to spaces

opt.cursorline = true -- highlight cursor line

require("lazy").setup("plugins")

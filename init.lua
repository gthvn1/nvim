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

-- --------------------------------------------------------------------
-- Keymap
local km = vim.keymap

km.set("n", "<leader><up>"   , "<C-w><up>"   , { desc = "Go up" })
km.set("n", "<leader><down>" , "<C-w><down>" , { desc = "Go down" })
km.set("n", "<leader><left>" , "<C-w><left>" , { desc = "Go left" })
km.set("n", "<leader><right>", "<C-w><right>", { desc = "Go right" })

km.set("n", "<leader>sv", "<C-w>v"        , { desc = "Split vertically" })
km.set("n", "<leader>sh", "<C-w>s"        , { desc = "Split horizontally" })
km.set("n", "<leader>se", "<C-w>="        , { desc = "Make splits equal size" })
km.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })
km.set("n", "<leader>so", "<cmd>only<CR>" , { desc = "Close all splits but current" })

km.set("n", "<leader>to", "<cmd>tabnew<CR>"  , { desc = "Open new tab" })
km.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
km.set("n", "<leader>tn", "<cmd>tabn<CR>"    , { desc = "Go to next tab" })
km.set("n", "<leader>tp", "<cmd>tabp<CR>"    , { desc = "Go to previous tab" })
km.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Load lazy.vim
require("lazy").setup("plugins")

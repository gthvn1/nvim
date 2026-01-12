-- ===============================
-- Plugin manager: lazy.nvim
-- ===============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"lewis6991/gitsigns.nvim",
})


-- ===============================
-- LSP Configuration
-- ===============================
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Rust
vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {},
	},
})
vim.lsp.enable("rust_analyzer")

-- OCaml
vim.lsp.config("ocamllsp", {
	capabilities = capabilities,
	settings = {},
})
vim.lsp.enable("ocamllsp")

-- Lua
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("lua_ls")

-- Python (Ruff)
vim.lsp.config('ruff', {
  init_options = {
    settings = {
      -- Ruff language server settings go here
    }
  }
})
vim.lsp.enable('ruff')

-- ===============================
-- Completion setup (nvim-cmp)
-- ===============================
local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = {
		{ name = "nvim_lsp" }, -- LSP completions
		{ name = "nvim_lua" }, -- Neovim Lua API completions
		{ name = "buffer" },   -- Words from buffer
		{ name = "path" },     -- file path
	},
})

-- ===============================
-- General
-- ===============================
vim.o.tabstop = 4	-- Use 4 spaces to display tabs, it only affects how tabs are displayed
-- If we want soft tabs (so tabs as space) we need to use vim.o.expandtab = true
vim.o.list = true	-- show invisible caracters

vim.opt.signcolumn = "yes:2" -- keep space for signs, LSP diags

vim.o.scrolloff = 5

vim.o.guifont = "FiraCode Nerd Font:h11"

-- ===============================
-- Keymaps
-- ===============================
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>f", ":Ex<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":b<CR>", { noremap = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true})
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true})
vim.keymap.set("n", "s", vim.lsp.buf.document_symbol, { noremap = true})
vim.keymap.set("n", "E", vim.diagnostic.open_float, { noremap = true})


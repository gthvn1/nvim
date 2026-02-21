-- ===============================
-- Plugin manager: lazy.nvim
-- ===============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
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
	"neovim/nvim-lspconfig", -- LSP
	"hrsh7th/nvim-cmp", -- completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"SmiteshP/nvim-navic", -- Display context of the function we are looking
	"ellisonleao/gruvbox.nvim", -- gruvbox theme
	"oskarnurm/koda.nvim", -- theme
	"lucasadelino/conifer.nvim", -- theme
	"lewis6991/gitsigns.nvim", -- Git signs
	"Vigemus/iron.nvim", -- repl
	{ -- fuzzy finder
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
})

-- ===============================
-- LSP Configuration
-- ===============================
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

-- Go
vim.lsp.config("gopls", {
	on_attach = function(client, bufnr)
		if client.name == "gopls" then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})
vim.lsp.enable("gopls")

-- Rust
vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {},
	},
})
vim.lsp.enable("rust_analyzer")

-- OCaml
vim.lsp.config("ocamllsp", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {},
})
vim.lsp.enable("ocamllsp")

-- Lua
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
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
vim.lsp.config("ruff", {
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		settings = {
			-- Ruff language server settings go here
		},
	},
})
vim.lsp.enable("ruff")

-- Elixir
vim.lsp.config("elixirls", {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "elixir-ls" },
	init_options = {
		settings = {
			elixirLS = {
				dialyzerEnabled = true, -- enable Dialyzer
				fetchDeps = false, -- disable auto fetching deps
			},
		},
	},
})
vim.lsp.enable("elixirls")

-- To install julia stuff, in a julia repl do:
--   using Pkg
--   Pkg.activate()
--
--   Pkg.add("LanguageServer")
--   Pkg.add("SymbolServer")
--   Pkg.add("StaticLint")
--   Pkg.add("JuliaFormatter")
vim.lsp.config("julials", {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			pcall(function()
				require("nvim-navic").attach(client, bufnr)
			end)
		end

		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
vim.lsp.enable("julials")

-- ===============================
-- Iron (REPL) setup
-- ===============================
local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.setup({
	config = {
		scratch_repl = true,
		repl_definition = {
			ocaml = {
				command = { "utop" },
				block_dividers = { "(* %% *)" },
				format = function(lines)
					-- Add ;; to the last line if missing
					if #lines > 0 then
						local last = lines[#lines]

						if not last:match(";;%s*$") then
							lines[#lines] = last .. ";;"
						end
					end

					table.insert(lines, "")

					return lines
				end,
			},
		},
		-- set the file type of the newly created repl to ft
		-- bufnr is the buffer id of the REPL and ft is the filetype of the
		-- language being used for the REPL.
		repl_filetype = function(bufnr, ft)
			return ft
			-- or return a string name such as the following
			-- return "iron"
		end,
		-- Send selections to the DAP repl if an nvim-dap session is running.
		dap_integration = true,
		-- How the repl window will be displayed
		-- See below for more information
		repl_open_cmd = view.bottom(40),

		-- repl_open_cmd can also be an array-style table so that multiple
		-- repl_open_commands can be given.
		-- When repl_open_cmd is given as a table, the first command given will
		-- be the command that `IronRepl` initially toggles.
		-- Moreover, when repl_open_cmd is a table, each key will automatically
		-- be available as a keymap (see `keymaps` below) with the names
		-- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
		-- For example,
		--
		-- repl_open_cmd = {
		--   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
		--   view.split.rightbelow("%25")  -- cmd_2: open a repl below
		-- }
	},
	-- Iron doesn't set keymaps by default anymore.
	-- You can set them here or manually add keymaps to the functions in iron.core
	keymaps = {
		toggle_repl = "<space>rr", -- toggles the repl open and closed.
		-- If repl_open_command is a table as above, then the following keymaps are
		-- available
		-- toggle_repl_with_cmd_1 = "<space>rv",
		-- toggle_repl_with_cmd_2 = "<space>rh",
		restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
		send_motion = "<space>sc",
		visual_send = "<space>sc",
		send_file = "<space>sf",
		send_line = "<space>sl",
		send_paragraph = "<space>sp",
		send_until_cursor = "<space>su",
		send_mark = "<space>sm",
		send_code_block = "<space>sb",
		send_code_block_and_move = "<space>sn",
		mark_motion = "<space>mc",
		mark_visual = "<space>mc",
		remove_mark = "<space>md",
		cr = "<space>s<cr>",
		interrupt = "<space>s<space>",
		exit = "<space>sq",
		clear = "<space>cl",
	},
	-- If the highlight is on, you can change how it looks
	-- For the available options, check nvim_set_hl
	highlight = {
		italic = true,
	},
	ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
})

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")

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
		{ name = "buffer" }, -- Words from buffer
		{ name = "path" }, -- file path
	},
})

-- ===============================
-- Line setup
-- ===============================
require("lualine").setup({
	sections = {
		lualine_c = {
			{
				"navic",
				-- Component specific options
				color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
				-- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
				-- Setting it to "static" will perform a adjustment once when the component is being setup. This should
				--   be enough when the lualine section isn't changing colors based on the mode.
				-- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
				--   the current section.
				navic_opts = nil, -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
			},
		},
	},
	options = {
		theme = "auto",
		transparent = true,
	},
})

-- ===============================
-- General
-- ===============================

pcall(vim.cmd("colorscheme conifer-lunar"))

vim.o.tabstop = 4 -- Use 4 spaces to display tabs, it only affects how tabs are displayed
-- If we want soft tabs (so tabs as space) we need to use vim.o.expandtab = true
vim.o.list = true -- show invisible caracters

vim.opt.signcolumn = "yes:2" -- keep space for signs, LSP diags

vim.o.scrolloff = 5

vim.o.guifont = "CodeNewRoman Nerd Font:h11"

-- ===============================
-- Keymaps
-- ===============================
vim.g.mapleader = " "

local telescope = require("telescope.builtin")

-- Allow to quit terminal mode using ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

vim.keymap.set("n", "<leader>f", telescope.find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", telescope.buffers, { noremap = true })
vim.keymap.set("n", "<leader>s", telescope.lsp_document_symbols, { noremap = true })
vim.keymap.set("n", "<leader>/", telescope.live_grep, { noremap = true })
vim.keymap.set("n", "gd", telescope.lsp_definitions, { noremap = true, silent = true })
--vim.keymap.set("n", "E", telescope.diagnostics, { noremap = true})
vim.keymap.set("n", "E", vim.diagnostic.open_float, { noremap = true })
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true})
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true})

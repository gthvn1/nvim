return {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
     use_diagnostic_signs = true,
 },
 keys = {
     { "<leader>xx", function() require("trouble").open() end, desc = "open trouble" },
     { "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, desc = "open workspace diags" },
     { "<leader>xd", function() require("trouble").open("document_diagnostics") end, desc = "open doc diags" },
     { "<leader>xq", function() require("trouble").open("quickfix") end, desc = "open quickfix" },
     { "<leader>xl", function() require("trouble").open("loclist") end, desc = "open localist" },
     { "gR", function() require("trouble").open("lsp_references") end, desc = "open lsp refs" },
 },
}

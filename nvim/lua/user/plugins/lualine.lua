require("lualine").setup({
    options = {
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            "mode",
        },
        lualine_b = {
            "branch",
            {
                "diff",
                symbols = { added = " ", modified = " ", removed = " " },
            },
            function()
                return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or "")
            end,
            { "diagnostics", sources = { "nvim_diagnostic" } },
        },
        lualine_c = {
            "filename",
        },
        lualine_x = {
            {
                require("lazy.status").updates,
                cond = require("lazy.status").has_updates,
                color = { fg = "#ff9e64" },
            },
        },
        lualine_y = {
            "filetype",
            "encoding",
            "fileformat",
            '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
        },
        lualine_z = {
            "searchcount",
            "selectioncount",
            "location",
            "progress",
        },
    },
})
-- Status line
-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	lazy = false,
-- 	dependencies = {
-- 		"arkav/lualine-lsp-progress",
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	opts = {
-- 		options = {
-- 		},
-- 	},
-- }

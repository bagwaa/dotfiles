local null_ls = require("null-ls")

local function in_tests_dir()
    local path = vim.api.nvim_buf_get_name(0)
    return string.match(path, "tests/")
end

null_ls.setup({
    sources = {
        -- apply globally
        null_ls.builtins.completion.spell,

        -- apply only on lua files
        null_ls.builtins.formatting.stylua.with({
            filetypes = { "lua" },
        }),

        -- apply only on blade files
        null_ls.builtins.formatting.blade_formatter.with({
            filetypes = { "blade" },
        }),

        -- apply only on javascript files
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { "javascript", "typescript", "json", "vue", "yaml", "html" },
        }),

        -- apply only on php files outside of tests directory
        null_ls.builtins.diagnostics.phpstan.with({
            filetypes = { "php" },
            condition = function()
                return not in_tests_dir()
            end,
        }),

        -- apply only on php files outside of tests directory
        null_ls.builtins.formatting.pint.with({
            filetypes = { "php" },
            condition = function()
                return not in_tests_dir()
            end,
        }),
    },
})

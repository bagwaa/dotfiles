require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier", } },
        vue = { { "prettierd", "prettier", } },
        -- vue = { "rustywind" },
        php = { { "pint" } },
        -- format the order of tailwind classes
        -- blade = { "rustywind" },
    },
    format_on_save = {
        timeout_ms = 2500,
        lsp_fallback = false,
    },
})

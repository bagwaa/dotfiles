require("conform").setup({
    formatters_by_ft = {
        lua = { "luals" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" }, { "rustywind" } },
        -- vue = { "rustywind" },
        php = { { "pint" } },
        -- format the order of tailwind classes
        blade = { "rustywind" },
        go = { "gofmt" },
    },
})

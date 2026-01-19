local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        -- JSON formatting with jq
        json = { "jq" },
        -- JavaScript/TypeScript formatting with prettier
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        -- Web development
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        -- Other formats prettier supports
        markdown = { "prettier" },
        yaml = { "prettier" },
    },
    format_on_save = false, -- Manual formatting only
})

-- Keymap to format the current buffer
vim.keymap.set("n", "<Leader>f", function()
    conform.format({ bufnr = vim.api.nvim_get_current_buf(), lsp_fallback = true })
end, { desc = "Format buffer" })

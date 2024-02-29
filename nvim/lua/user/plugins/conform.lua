local slow_format_filetypes = {}

require("conform").setup({
    formatters_by_ft = {
        lua = { "luals" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
        -- vue = { "rustywind" },
        php = { { "pint" } },
        -- format the order of tailwind classes
        -- blade = { "rustywind" },
    },
    format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
        end
        local function on_format(err)
            if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
            end
        end

        return { timeout_ms = 200, lsp_fallback = true }, on_format
    end,

    format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
        end
        return { lsp_fallback = true }
    end,
})

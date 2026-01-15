local lspconfig = require("lspconfig")
local builtin = require("telescope.builtin")

-- diagnostic signs in the gutter
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
    },
})

-- LSP keymaps (only active when LSP attaches)
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
end

-- PHP
lspconfig.intelephense.setup({
    on_attach = on_attach,
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,
            },
        },
    },
})

-- Lua (for neovim config)
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})

-- Web development
lspconfig.ts_ls.setup({ on_attach = on_attach })
lspconfig.cssls.setup({ on_attach = on_attach })
lspconfig.html.setup({ on_attach = on_attach })
lspconfig.jsonls.setup({ on_attach = on_attach })
lspconfig.tailwindcss.setup({ on_attach = on_attach })

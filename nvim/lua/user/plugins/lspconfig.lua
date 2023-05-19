require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Diagnostic Configuration
vim.diagnostic.config({
    virtual_text = true,
    float = {
        source = true
    }
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- PHP (license key in ~/intelephense)
require("lspconfig").intelephense.setup({ capabilities = capabilities })

-- Python
require("lspconfig").pyright.setup({ capabilities = capabilities })

-- Rust
require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })

-- Tailwind CSS
require("lspconfig").tailwindcss.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require("tailwindcss-colors").buf_attach(bufnr);
    end,
})

-- Lua
require("lspconfig").lua_ls.setup({ capabilities = capabilities })

-- Vue, Javascript, Typescript
require("lspconfig").volar.setup({
    capabilities = capabilities,
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

-- JSON
require("lspconfig").jsonls.setup({
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
        },
    },
})

-- null-ls
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
    temp_dir = "/tmp",
    sources = {
        require("null-ls").builtins.diagnostics.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file({ '.eslintrc.cjs' })
            end,
        }),
        require("null-ls").builtins.formatting.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file({ '.eslintrc.cjs' })
            end,
        }),
        require("null-ls").builtins.diagnostics.trail_space.with({
            disabled_filetypes = { "NvimTree" },
        }),
        require("null-ls").builtins.diagnostics.jsonlint,
        require("null-ls").builtins.formatting.trim_whitespace,
        require("null-ls").builtins.formatting.prettierd,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})

require("mason-null-ls").setup({ automatic_installation = true })

-- Mappings
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>a", ":CodeActionMenu<CR>")
vim.keymap.set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")

vim.api.nvim_create_user_command('Format', vim.lsp.buf.format, {})

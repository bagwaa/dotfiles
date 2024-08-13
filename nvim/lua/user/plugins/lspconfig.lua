local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = vim.keymap

local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    -- auto formatting on save
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                -- require("conform").format({ bufnr = args.buf })
            end,
        })
    end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure LSP servers
lspconfig["intelephense"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "php" },
})

lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["slint_lsp"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "slint" },
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "rust" },
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})

-- lspconfig["volar"].setup({
--     -- capabilities = capabilities,
--     on_attach = on_attach,
--     -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
--     init_options = {
--         typescript = {
--             tsdk =
--             '/Users/richardbagshaw/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib',
--         },
--     },
-- })

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")

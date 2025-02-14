local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local capabilities = cmp_nvim_lsp.default_capabilities()
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    keymap.set({ "n", "v" }, "<Leader>a", vim.lsp.buf.code_action, opts)
    keymap.set({ "n" }, "K", vim.lsp.buf.hover, opts)

    keymap.set({ "n" }, "gr", ":Telescope lsp_references<CR>")
    keymap.set({ "n" }, "gd", ":Telescope lsp_definitions<CR>")
    keymap.set({ "n" }, "gi", ":Telescope lsp_implementations<CR>")

    keymap.set({ "n" }, "gD", vim.lsp.buf.declaration, opts)
    keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, opts)
    keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, opts)
    keymap.set({ "n" }, "<Leader>d", vim.diagnostic.open_float, opts)
    keymap.set({ "n" }, "<Leader>f", vim.lsp.buf.format, opts)
    keymap.set({ "n" }, "<Leader>r", vim.lsp.buf.rename, opts)
end

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure LSP servers
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.phpactor.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "php" },
})

lspconfig.volar.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
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

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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

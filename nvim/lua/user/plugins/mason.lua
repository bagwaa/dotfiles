local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
    ui = {
        icons = {
            package_installed = "",
            package_outdated = "",
            package_not_installed = "",
            package_uninstalled = "",
            package_pending = "",
        },
    },
})

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        "phpactor",
        "intelephense",
        "volar",
        "gopls",
        "rust_analyzer",
    },
    automatic_installation = true,
})

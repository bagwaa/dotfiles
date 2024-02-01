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
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "pyright",
        "intelephense",
        "volar",
    },
    automatic_installation = true,
})

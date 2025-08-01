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
    },
    automatic_installation = true,
})

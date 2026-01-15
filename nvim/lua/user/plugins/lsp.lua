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
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf, silent = true }

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
    end,
})

-- PHP
vim.lsp.config("intelephense", {
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,
                exclude = {
                    "**/_ide_helper*.php",
                    "**/vendor/_laravel_idea/**",
                    "**/.history/**",
                    "**/vendor/**/vendor/**",
                },
            },
        },
    },
})

-- Lua (for neovim config)
vim.lsp.config("lua_ls", {
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

-- Web development (use defaults)
vim.lsp.config("ts_ls", {})
vim.lsp.config("cssls", {})
vim.lsp.config("html", {})
vim.lsp.config("jsonls", {})
vim.lsp.config("tailwindcss", {})

-- Enable all configured LSP servers
vim.lsp.enable({
    "intelephense",
    "lua_ls",
    "ts_ls",
    "cssls",
    "html",
    "jsonls",
    "tailwindcss",
})

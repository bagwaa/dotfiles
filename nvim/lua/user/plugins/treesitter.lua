require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "css",
        "diff",
        "dockerfile",
        "dot",
        "go",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "regex",
        "rust",
        "slint",
        "scss",
        "sql",
        "svelte",
        "toml",
        "twig",
        "typescript",
        "vim",
        "vue",
        "yaml",
        "zig",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["if"] = "@function.inner",
                ["af"] = "@function.outer",
                ["ia"] = "@parameter.inner",
                ["aa"] = "@parameter.outer",
            },
        },
    },
})

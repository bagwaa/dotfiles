require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "blade",
        "css",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "php",
        "scss",
        "sql",
        "toml",
        "twig",
        "typescript",
        "vim",
        "yaml",
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

-- Add Blade support
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "blade",
}

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

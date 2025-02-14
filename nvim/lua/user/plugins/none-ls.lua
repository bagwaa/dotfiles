local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.pint,
        null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.formatting.blade_formatter,
    },
})

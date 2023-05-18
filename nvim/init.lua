require("user/options")
require("user/plugins")
require("user/keymaps")

-- open telescope on starting neovim
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("Telescope find_files")
    end,
});

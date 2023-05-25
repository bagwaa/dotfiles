require("user/options")
require("user/plugins")
require("user/keymaps")
require("user/globals")

-- open telescope on starting neovim
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("Telescope find_files")
    end,
});

-- open lazygit with leader g inside nvim
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

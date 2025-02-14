local telescope = require("telescope")
local actions = require("telescope.actions")

local keymap = vim.keymap

-- telescope configuration
telescope.setup({
    defaults = {
        path_display = { "truncate" },
        layout_config = {
            horizontal = {
                preview_cutoff = 0,
            },
        },
        file_ignore_patterns = { "node_modules", ".git/", "vendor_local" },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<Tab>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.move_selection_previous,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")

-- some keymappings to open telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>pp", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap.set("n", "<Leader>pg", [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
keymap.set("n", "<Leader>fr", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
keymap.set("n", "<Leader>e", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap.set("n", "<Leader>ff", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
keymap.set("n", "<Leader>l", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
keymap.set(
    "n",
    "<Leader>pv",
    [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files (with vendors)'})<CR>]]
)

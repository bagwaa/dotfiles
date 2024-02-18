local actions = require("telescope.actions")
local colors = require("catppuccin.palettes").get_palette()

local TelescopeColor = {
    TelescopeMatching = { fg = colors.flamingo },
    TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
    TelescopePromptPrefix = { bg = colors.surface0 },
    TelescopePromptNormal = { bg = colors.surface0 },
    TelescopeResultsNormal = { bg = colors.mantle },
    TelescopePreviewNormal = { bg = colors.mantle },
    TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
    TelescopeResultsTitle = { fg = colors.mantle },
    TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}

for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
end

-- telescope configuration
require("telescope").setup({
    defaults = {
        prompt_prefix = "🔎 ",
        file_ignore_patterns = { "node_modules", ".git/", "vendor_local" },
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
            vertical = {
                width = 0.9,
                height = 0.9,
                preview_height = 0.6,
                preview_cutoff = 10,
            },
        },
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
    pickers = {
        find_files = {
            previewer = false,
            hidden = true,
            layout_config = { width = 0.5, height = 0.9 },
        },
        buffers = {
            previewer = false,
            layout_config = { width = 0.5, height = 0.9 },
        },
        oldfiles = {
            prompt_title = "History",
            previewer = false,
            hidden = true,
            layout_config = { width = 0.5, height = 0.9 },
        },
        git_files = {
            previewer = false,
            hidden = true,
            layout_config = { width = 0.5, height = 0.9 },
        },
        lsp_references = {
            fname_width = 800,
            layout_config = { width = 0.5, height = 0.9 },
        },
        help_tags = {
            layout_config = { width = 0.5, height = 0.9 },
            previewer = false,
        },
        lsp_definitions = {
            fname_width = 800,
            layout_config = { width = 0.5, height = 0.9 },
        },
        lsp_implementations = {
            fname_width = 800,
            layout_config = { width = 0.5, height = 0.9 },
        },
    },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")

-- some keymappings to open telescope
vim.keymap.set("n", "<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set("n", "<leader>pp", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set("n", "<Leader>pg", [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
vim.keymap.set("n", "<Leader>fr", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set("n", "<Leader>bb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set("n", "<Leader>e", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set("n", "<Leader>ff", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set("n", "<Leader>l", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
vim.keymap.set(
    "n",
    "<Leader>pv",
    [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files (with vendors)'})<CR>]]
)

local actions = require("telescope.actions")

-- some keymappings to open telescope
vim.keymap.set("n", "<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set("n", "<Leader>p", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set(
	"n",
	"<Leader>pp",
	[[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files (with vendors)'})<CR>]]
)
vim.keymap.set("n", "<Leader>ppp", [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
vim.keymap.set("n", "<Leader>o", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set("n", "<Leader>bb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set("n", "<Leader>ff", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])

-- telescope configuration
require("telescope").setup({
	defaults = {
		prompt_prefix = ">> ",
		file_ignore_patterns = { "node_modules", ".git/" },
		layout_strategy = "vertical",
		layout_config = {
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
		oldfiles = {
			previewer = false,
			hidden = true,
			layout_config = { width = 0.5, height = 0.9 },
		},
		git_files = {
			previewer = false,
			hidden = true,
			layout_config = { width = 0.5, height = 0.9 },
		},
		buffers = {
			previewer = false,
			hidden = true,
			layout_config = { width = 0.5, height = 0.9 },
		},
		lsp_references = {
			fname_width = 800,
			layout_config = { width = 0.5, height = 0.9 },
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

require("nvim-tree").setup({
	view = {
		width = 60,
		hide_root_folder = false,
		side = "right",
		number = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	renderer = {
		group_empty = false,
		icons = {
			show = {
				folder_arrow = false
			}
		},
		indent_markers = {
			enable = true
		}
	},
	git = {
		enable = false,
		timeout = 800, -- (in ms)
	},
})

vim.keymap.set("n", "<leader>1", ":NvimTreeFindFileToggle<CR>")
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#404040" })

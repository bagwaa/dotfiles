vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})

-- vim.keymap.set("n", "<leader>", ":WhichKey ','<CR>", { silent = true })
local wk = require("which-key")

wk.register({
	["<leader>d"] = "which_key_ignore",
	["<leader>1"] = { "<cmd>Neotree reveal toggle right<CR>", "File Tree" },
	["<leader>ff"] = { "<cmd>Telescope live_grep_args<CR>", "Find Text in Files" },
	["<leader>l"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Symbols" },
	["<leader>g"] = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
	["<leader>o"] = { "<cmd>Telescope oldfiles<CR>", "History" },
	["<leader><space>"] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Harpoon Menu" },
	["<leader><space><space>"] = { ':lua require("harpoon.mark").add_file()<CR>', "Harpoon a File" },
	["<leader>a"] = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
	["<leader>r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	["<leader>f"] = { ":lua vim.lsp.buf.format()<CR>", "Format Buffer" },
	["<leader>e"] = { ":A<CR>", "Alternate File" },
	["<leader>w"] = {
		name = "Wiki",
		w = { ":VimwikiIndex<CR>", "Wiki Index" },
	},
	["<leader>c"] = {
		name = "Console",
		c = { ":ToggleTerm<CR>", "Open Console Horizontal" },
		f = { ":ToggleTerm direction=float<CR>", "Open Console in Float" },
	},
	["<leader>b"] = {
		name = "Buffers",
		b = { ":Telescope buffers<CR>", "List Buffers" },
	},
	["<leader>p"] = {
		name = "Files",
		p = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Files" },
		v = {
			"<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files (with vendors)'})<CR>",
			"Files with Vendors",
		},
		g = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Files in Git" },
	},
	["<leader>y"] = {
		name = "PHP Tools (Phpactor)",
		m = { ":PhpactorContextMenu<CR>", "PHP Context Menu" },
		n = { ":PhpactorClassNew<CR>", "New File" },
	},
	["<leader><leader>r"] = {
		name = "Run",
		r = { ":RustRunnables<CR>", "Rust Runnables" },
	},
	["<leader><leader>x"] = {
		name = "Save and Source",
	},
	["<leader>t"] = {
		name = "VimTest",
	},
	["<leader>k"] = { ":nohlsearch<CR>", "Clear Search" },
	["<leader>s"] = { ":w<CR>", "Save" },
	["<leader>v"] = { ":vsp<CR>", "Vertical Split" },
	["<leader>x"] = { ":bd<CR>", "Close" },
	["<leader>q"] = { ":Bdelete<CR>", "Close (keep split)" },
})

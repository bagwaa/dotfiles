-- map a leader key
vim.g.mapleader = ","

-- map jj to esc in insert mode
vim.keymap.set("i", "jj", "<Esc>")

-- map <leader>s to write a file
vim.keymap.set("n", "<leader>s", ":w<CR>")

-- file tree
vim.keymap.set("n", "<leader>1", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>2", ":NvimTreeCollapse<CR>")

-- split mappings
vim.keymap.set("n", "<Leader>v", ":vnew<CR>")
vim.keymap.set("n", "<Leader>h", ":sp<CR>")
vim.keymap.set("n", "<Leader>x", ":bd<CR>")

-- use ctrl keys to navigate splits
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- use tab and shift tab to cycle through buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")

-- open the file
vim.keymap.set("n", "<Leader>o", ":!open %<CR><CR>")

-- disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- keymap for a scratch pad
vim.keymap.set("n", "<Leader>g", ":VimwikiIndex<CR>")

-- allow us to use j and k up and down through wrapped text
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- keep visual selection when indenting in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- add , and ; to the end of lines really quickly with a double tap
vim.keymap.set("i", ";;", "<Esc>A;")
vim.keymap.set("i", ",,", "<Esc>A,")

-- clear search highlighting in the buffer
vim.keymap.set("n", "<Leader>k", ":nohlsearch<CR>")

-- toggle between test and src file or create a test if not available
-- vim.keymap.set("n", "<leader>e", ":A<CR>")

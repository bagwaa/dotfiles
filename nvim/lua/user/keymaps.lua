-- map jj to esc in insert mode
vim.keymap.set("i", "jj", "<Esc>")

-- map <leader>s to write a file
vim.keymap.set("n", "<leader>s", ":w<CR>")

-- split mappings
vim.keymap.set("n", "<Leader>v", ":vnew<CR>")
vim.keymap.set("n", "<Leader>x", ":bd<CR>")

-- use ctrl keys to navigate splits
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- use ctrl keys to navigate splits in terminal mode (useful for nvim-dap)
vim.keymap.set("t", "<C-H>", "<C-\\><C-N><C-H>")
vim.keymap.set("t", "<C-J>", "<C-\\><C-N><C-J>")
vim.keymap.set("t", "<C-K>", "<C-\\><C-N><C-K>")
vim.keymap.set("t", "<C-L>", "<C-\\><C-N><C-L>")

-- use tab and shift tab to cycle through buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")

-- remove annoying keymap typo
vim.keymap.set('n', 'q:', ':q')

-- dont copy replaced contents to clipboard when pasting in visual mode
vim.keymap.set('v', 'p', '"_dP')

-- disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

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

-- save and source the current file (neovim development)
vim.keymap.set("n", "<Leader><Leader>x", ":w<CR>:source %<CR>")

-- open the file explorer
vim.keymap.set("n", "<leader>1", ":Neotree reveal toggle right<CR>")
vim.keymap.set("n", "<leader>2", ":Neotree buffers reveal toggle right<CR>")
vim.keymap.set("n", "<leader>bb", ":Neotree buffers reveal toggle right<CR>")

-- rust specific keymaps
vim.keymap.set("n", "<Leader>cb", ":Cargo build<CR>")
vim.keymap.set("n", "<Leader>cr", ":Cargo run -q<CR>")
vim.keymap.set("n", "<Leader>ct", ":Cargo test<CR>")

-- open the file
-- vim.keymap.set("n", "<Leader>o", ":!open %<CR><CR>")

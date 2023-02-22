vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- map jj to esc in insert mode
vim.keymap.set('i', 'jj', "<Esc>")

-- map <leader>s to write a file 
vim.keymap.set('n', '<leader>s', ":w<CR>")

-- split mappings
vim.keymap.set('n', '<Leader>v', ":vnew<CR>")
vim.keymap.set('n', '<Leader>h', ":sp<CR>")
vim.keymap.set('n', '<Leader>x', ":bd<CR>")

-- use ctrl keys to navigate splits
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

-- disable arrow keys
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- allow us to use j and k up and down through wrapped text
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- keep visual selection when indenting in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- don't move the cursor when yanking
vim.keymap.set('v', 'y', 'myy`y')

-- add , and ; to the end of lines really quickly with a double tap
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- clear search highlighting in the buffer
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- open the file
vim.keymap.set('n', '<Leader>o', ':!open %<CR><CR>')

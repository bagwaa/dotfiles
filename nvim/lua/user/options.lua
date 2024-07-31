-- leader
vim.g.mapleader = ","

-- indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- wrapping
vim.opt.wrap = false

-- line numbers and relative line numbers
vim.opt.number = true

-- autocompletion in command mode
vim.opt.wildmode = "longest:full,full"
vim.opt.completeopt = "menuone,longest,preview"
vim.opt.wildignore:append({
    "*/.git/*",
    "*/.hg/*",
    "*/.svn/*",
    "*/.idea/*",
    "*/vendor/*",
    "*/vendor_local/*",
    "*/storage/*",
    "*/cache/*",
    "*/node_modules/*",
    "*/bower_components/*",
})

-- bad neovim user, surely? mostly for fixing scrolling
vim.opt.mouse = "a"

-- add more colours
vim.opt.termguicolors = true

-- no spell checker
vim.opt.spell = false

-- make searching less case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- show trailing spaces and tabs and don't show tilde's at the bottom of files after the file has ended
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "." }
vim.opt.fillchars:append({ eob = " " })

-- how splits should split by default
vim.opt.splitbelow = true
vim.opt.splitright = true

-- create an offset to the top and bottom of the buffer before scrolling
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0

-- nice message with options when quitting without saving
vim.opt.confirm = true

-- create undofile after quitting vim
vim.opt.undofile = true

-- backup files on edit (don't use the current directory)
vim.opt.backup = true
vim.opt.backupdir:remove(".")

-- remove duplicate status bars when using things like DAP ui
vim.api.nvim_set_option("laststatus", 3)

-- set a custom timeout
vim.opt.timeoutlen = 500

-- show the gutter for git
vim.opt.signcolumn = "yes:2"

-- highlight_yank (flash yanked area when yanking)
vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
    augroup END
]])

vim.cmd([[
    set autoindent
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
]])

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({
	"*/.git/*",
	"*/.hg/*",
	"*/.svn/*",
	"*/.idea/*",
	"*/vendor/*",
	"*/storage/*",
	"*/cache/*",
	"*/node_modules/*",
	"*/bower_components/*",
})

vim.opt.completeopt = "menuone,longest,preview"

vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes:1"

vim.opt.spell = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "." }
vim.opt.fillchars:append({ eob = " " })

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove(".")

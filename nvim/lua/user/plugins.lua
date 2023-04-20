local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").reset()

require("packer").init({
    compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "solid" })
        end,
    },
})

local use = require("packer").use

-- packer (manage plugins for neovim)
use("wbthomason/packer.nvim")

-- highlight_yank (flash yanked area when yanking)
vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
    augroup END
]])

--  vim-peekaboo (show registers when yanking into different places)
use({
    "junegunn/vim-peekaboo",
    config = function()
        vim.cmd("let g:peekaboo_window = 'vertical botright 80new'")
    end,
})

-- dracula (the best theme in the world)
use({
    "dracula/vim",
    config = function()
        vim.cmd("let g:dracula_colorterm = 0")
        vim.cmd("colorscheme dracula")
        vim.api.nvim_set_hl(0, "DraculaComment", { fg = "gray" })

        vim.api.nvim_set_hl(0, "CursorLine", {
            bg = "#30323E",
        })
        -- Changes to the highlight groups require :PackerCompile and :PackerClean
    end,
})

-- vim-commentary (easier comments with "gc")
use("tpope/vim-commentary")

-- vim-surround (manipulate surrounding things like quotes and bracers with cs"')
use("tpope/vim-surround")

-- vim-polyglot (add some syntax highlights to all files)
use("sheerun/vim-polyglot")

-- vim-lastplace (open a file wherre we left off last time it was open)
use("farmergreg/vim-lastplace")

-- vim wiki
use("vimwiki/vimwiki")

-- nvim-autopairs (typing an opening bracket created the closed one and drops us inbetween)
use({
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup()
    end,
})

-- nvim-telescope (fuzzy search front end)
use({
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
        require("user/plugins/telescope")
    end,
})

-- nvim-tree (toggles the sidebar with ,1 and ,2 to collapse the content)
use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("user/plugins/nvim-tree")
    end,
})

-- status bar
use({
    "feline-nvim/feline.nvim",
    config = function()
        require("user/plugins/feline")
    end,
})

-- vim-test (a configurable test runner which adds commands like ,tt ,tn and ,tf)
use({
    "vim-test/vim-test",
    config = function()
        require("user/plugins/vim-test")
    end,
})

-- indent-blankline (add vertical lines to show indent matches easily)
use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup()
    end,
})

-- LSP saga for code actions
use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
})

-- gitsigns (add some git commands to navigate and handle changes)
use({
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({ current_line_blame = true })
        vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>")
        vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>")
        vim.keymap.set("n", "gs", ":Gitsigns stage_hunk<CR>")
        vim.keymap.set("n", "gS", ":Gitsigns undo_stage_hunk<CR>")
        vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
        vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>")
    end,
})

-- nvim-lspconfig (allow us to install and manage language servers with configs)
use({
    "neovim/nvim-lspconfig",
    requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "b0o/schemastore.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    config = function()
        require("user/plugins/lspconfig")
    end,
})

-- nvim-cmp (a completion engine frontend of neovim, works closely with LSPs)
use({
    "hrsh7th/nvim-cmp",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
    },
    config = function()
        require("user/plugins/cmp")
    end,
})

-- ale (enables linting on files that we specify, will probably replace with null-ls at some point)
use({
    "dense-analysis/ale",
    config = function()
        require("user/plugins/ale")
    end,
})

-- notify
use({
    "rcarriga/nvim-notify",
    config = function()
        require("user/plugins/notify")
    end,
})

-- Rust tools
use({
    "simrat39/rust-tools.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
    config = function()
        require("user/plugins/rust")
    end,
})

vim.cmd([[autocmd BufWritePost * lua require("notify")("...")]])

-- treesitter (add meaning to source files we edit, this allows better highlighting)
use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    requires = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        -- "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("user.plugins.treesitter")
    end,
})

-- debugging
use({
 "rcarriga/nvim-dap-ui",
 requires = {
     "mfussenegger/nvim-dap",
     "mfussenegger/nvim-dap-python",
 },
 config = function()
     require("user/plugins/debugging")
 end,
})


-- auto-session (remember the previous session when restarting neovim)
-- use({
--     "rmagatti/auto-session",
--     config = function()
--         require("auto-session").setup({
--             log_level = "error",
--             auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
--         })
--     end,
-- })

-- GitHub Copilot - CTRL+SPACE to activate
-- use({
--  "github/copilot.vim",
--  config = function()
--      require("user/plugins/copilot")
--  end,
-- })

-- vim-unimpaired (mapping added for ]b [b etc)
-- use("tpope/vim-unimpaired")

-- vim-sleuth (detect file indentation and stick with that)
-- use("tpope/vim-sleuth")

-- vim-repeat (allow the use of the . key to repeat tpope package commands)
-- use("tpope/vim-repeat")

-- vim-heritage (create the parent directories when creating files in paths that do not exist)
-- use("jessarcher/vim-heritage")

-- vim-textobj-xmlattr (create two text objects for XML type attributes like class="header")
-- ix (inside xml attribute) and ax (arround xml attribute)
-- this allows us to manipulate them with commands like dax to delete around xml attribute
-- use({
--  "whatyouhide/vim-textobj-xmlattr",
--  requires = "kana/vim-textobj-user",
-- })

if packer_bootstrap then
    require("packer").snc()
end

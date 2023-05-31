local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -- theme
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            local catppuccin = require('catppuccin');

            catppuccin.setup({
                integrations = {
                    treesitter = true
                }
            });

            catppuccin.load();
        end,
        enabled = true,
    },
    {
        -- vim-commentary (easier comments with "gc")
        "tpope/vim-commentary",
        enabled = true,
    },
    {
        -- vim-surround (manipulate surrounding things like quotes and bracers with cs"')
        "tpope/vim-surround",
        enabled = true,
    },
    {
        -- vim-unimpaired, add mappings like [b and ]b
        "tpope/vim-unimpaired",
        enabled = true,
    },
    {
        -- vim-sleuth, use the editorconfig in a project and set indentation
        "tpope/vim-sleuth",
        enabled = true,
    },
    {
        -- vim-repeat, use the . key to repeat tpope commands like change surround
        "tpope/vim-repeat",
        enabled = true,
    },
    {
        -- vim-polyglot (add some syntax highlights to all files)
        "sheerun/vim-polyglot",
        enabled = false,
    },
    {
        -- vim-lastplace (open a file wherre we left off last time it was open)
        "farmergreg/vim-lastplace",
        enabled = true,
    },
    {
        -- vim wiki / add export VIMWIKI="/path/to/Dropbox/Vimwiki" to .zshrc
        "vimwiki/vimwiki",
        enabled = true,
    },
    {
        -- add text objects for html attributes (vix and vax)
        'whatyouhide/vim-textobj-xmlattr',
        dependencies = 'kana/vim-textobj-user',
        enabled = true
    },
    {
        -- smoother scrolling with CTRL D and CTRL U
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end,
        enabled = true
    },
    {
        -- close the buffer without killing the split
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n', '<leader>q', ':Bdelete<CR>')
        end,
        enabled = true
    },
    {
        -- nvim-autopairs (typing an opening bracket created the closed one and drops us inbetween)
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
        enabled = true,
    },
    {
        -- status bar
        "feline-nvim/feline.nvim",
        config = function()
            require("user/plugins/feline")
        end,
        enabled = true,
    },
    {
        "akinsho/bufferline.nvim",
        -- dependencies = "kyazdani42/nvim-web-devicons",
        dependencies = "nvim-tree/nvim-web-devicons",
        after = "catppuccin/nvim",
        config = function()
            require("user.plugins.bufferline")
        end,
        enabled = true,
    },
    {
        -- indent-blankline (add vertical lines to show indent matches easily)
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup()
        end,
        enabled = true,
    },
    {
        -- nvim-telescope (fuzzy search front end)
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "kyazdani42/nvim-web-devicons",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-live-grep-args.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("user/plugins/telescope")
        end,
        enabled = true,
    },
    {
        -- gitsigns (add some git commands to navigate and handle changes)
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
        enabled = true,
    },
    {
        --  vim-peekaboo (show registers when yanking into different places)
        "junegunn/vim-peekaboo",
        config = function()
            vim.cmd("let g:peekaboo_window = 'vertical botright 80new'")
        end,
        enabled = true,
    },
    {
        -- toggle a terminal in a popup
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "horizontal",
            })
            vim.keymap.set("n", "<Leader>cc", ":ToggleTerm direction=horizontal<CR>")
            vim.keymap.set("n", "<Leader>cf", ":ToggleTerm direction=float<CR>")
            vim.keymap.set("t", "<Leader>cc", "<C-\\><C-n>:ToggleTerm<CR>")
        end,
        enabled = true,
    },
    {
        -- vim-test (a configurable test runner which adds commands like ,tt ,tn and ,tf)
        "vim-test/vim-test",
        config = function()
            require("user/plugins/vim-test")
        end,
        enabled = true,
    },
    {
        -- nvim-lspconfig (allow us to install and manage language servers with configs)
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "jayp0521/mason-null-ls.nvim",
        },
        config = function()
            require("user/plugins/lspconfig")
        end,
        enabled = true,
    },
    {
        -- nvim-cmp (a completion engine frontend of neovim, works closely with LSPs)
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lua",
        },
        config = function()
            require("user/plugins/cmp")
        end,
        enabled = true,
    },
    {
        -- ale (enables linting on files that we specify, will probably replace with null-ls at some point)
        "dense-analysis/ale",
        config = function()
            require("user/plugins/ale")
        end,
        enabled = true,
    },
    {
        -- better code action menu
        "weilbith/nvim-code-action-menu",
        cmd = 'CodeActionMenu',
        enabled = true,
    },
    {
        -- rename in a popup window
        'hood/popui.nvim',
        dependencies = 'RishabhRD/popfix',
        config = function()
            vim.ui.select = require('popui.ui-overrider')
            vim.ui.input = require('popui.input-overrider')
        end,
        enabled = true,
    },
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
        enabled = false,
    },
    {
        -- Rust tools
        "simrat39/rust-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
        },
        config = function()
            require("user/plugins/rust")
        end,
        enabled = true,
    },
    {
        -- treesitter (add meaning to source files we edit, this allows better highlighting)
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-textobjects",
            -- "nvim-treesitter/playground",
        },
        config = function()
            require("user.plugins.treesitter")
        end,
        enabled = true,
    },
    {
        -- debugging
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            require("user/plugins/debugging")
        end,
        enabled = true,
    },
    {
        -- gitHub copilot - CTRL+SPACE to activate
        "github/copilot.vim",
        config = function()
            require("user/plugins/copilot")
        end,
        enabled = true
    },
    {
        -- jump around with prime
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            vim.keymap.set("n", "<Leader><Space>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
            vim.keymap.set("n", "<Leader><Space><Space>", ':lua require("harpoon.mark").add_file()<CR>')
        end,
        enabled = true,
    },
    {
        -- more info about crate dependencies
        "saecki/crates.nvim",
        version = 'v0.3.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
        enabled = true,
    },
    {
        -- show hotkeys in a popup
        "folke/which-key.nvim",
        config = function()
            require("user/plugins/whichkey")
        end,
        enabled = true,
    },
    {
        -- php stuff to allow us todo IDE things
        "phpactor/phpactor",
        ft = { "php" },
        build = "composer install --no-dev --optimize-autoloader",
        config = function()
            vim.keymap.set('n', '<Leader>ym', ':PhpactorContextMenu<CR>')
            vim.keymap.set('n', '<Leader>yn', ':PhpactorClassNew<CR>')
            vim.keymap.set('v', '<Leader>yxm', ':PhpactorExtractMethod<CR>')
        end,
        enabled = true,
    },
    {
        -- switch between tests and source quickly
        'tpope/vim-projectionist',
        dependencies = 'tpope/vim-dispatch',
        config = function()
            require('user/plugins/projectionist')
        end,
        enabled = true,
    },
    {
        "Bryley/neoai.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        cmd = {
            "NeoAI",
            "NeoAIOpen",
            "NeoAIClose",
            "NeoAIToggle",
            "NeoAIContext",
            "NeoAIContextOpen",
            "NeoAIContextClose",
            "NeoAIInject",
            "NeoAIInjectCode",
            "NeoAIInjectContext",
            "NeoAIInjectContextCode",
        },
        keys = {
            { "<leader>as", desc = "summarize text" },
            { "<leader>ag", desc = "generate git message" },
            { "<leader>m",  desc = "open ai" },
        },
        config = function()
            vim.keymap.set('n', '<leader>m', ':NeoAIToggle<CR>')

            require("neoai").setup({

            })
        end,
        enabled = true,
    },
    {
        "themaxmarchuk/tailwindcss-colors.nvim",
        config = function()
            -- pass config options here (or nothing to use defaults)
            require("tailwindcss-colors").setup()
        end,
        enabled = true,
    },
    {
        "takac/vim-hardtime",
        config = function()
            -- enabled on all buffers in options.lua
            vim.g.hardtime_timeout = 1000
            vim.g.hardtime_showmsg = 0
            vim.g.hardtime_maxcount = 8
        end,
        lazy = false,
        enabled = false,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        enabled = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require('user/plugins/neo-tree')
        end,
        enabled = true,
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
        end,
        enabled = true,
    },
    {
        "olexsmir/gopher.nvim",
        ft = { "go" },
        config = function(_, opts)
            require('gopher').setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,

    },
    {
        dir = "/Users/richard/Code/neovim/plugins/tinkerbox",
        config = function()
        end,
        lazy = false,
        enabled = true,
    },

}, {})

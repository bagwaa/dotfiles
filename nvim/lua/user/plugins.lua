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
        -- dracula (the best theme in the world)
        "dracula/vim",
        config = function()
            vim.cmd("let g:dracula_colorterm = 0")
            vim.cmd("colorscheme dracula")
            vim.api.nvim_set_hl(0, "DraculaComment", { fg = "gray" })

            vim.api.nvim_set_hl(0, "CursorLine", {
                bg = "#30323E",
            })
        end,
        enabled = true
    },
    {
        --  vim-peekaboo (show registers when yanking into different places)
        "junegunn/vim-peekaboo",
        config = function()
            vim.cmd("let g:peekaboo_window = 'vertical botright 80new'")
        end,
    },
    {
        -- toggle a terminal in a popup
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "float",
            })
            vim.keymap.set("n", "<Leader>cc", ":ToggleTerm<CR>")
            vim.keymap.set("t", "<Leader>cc", "<C-\\><C-n>:ToggleTerm<CR>")
        end
    },
    {
        -- vim-commentary (easier comments with "gc")
        "tpope/vim-commentary"
    },
    {
        -- vim-surround (manipulate surrounding things like quotes and bracers with cs"')
        "tpope/vim-surround",
    },
    {
        -- vim-polyglot (add some syntax highlights to all files)
        "sheerun/vim-polyglot",
    },
    {
        -- vim-lastplace (open a file wherre we left off last time it was open)
        "farmergreg/vim-lastplace",
    },
    {
        -- nvim-autopairs (typing an opening bracket created the closed one and drops us inbetween)
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        -- nvim-telescope (fuzzy search front end)
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "nvim-telescope/telescope-live-grep-args.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("user/plugins/telescope")
        end,
    },
    {
        -- nvim-tree (toggles the sidebar with ,1 and ,2 to collapse the content)
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeFindFileToggle",
        keys = {
            { "<leader>1", "<cmd>NvimTreeFindFileToggle<CR>", desc = "NvimTreeFindFileToggle" },
        },
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("user/plugins/nvim-tree")
        end,
    },
    {
        -- vim wiki / add export VIMWIKI="/path/to/Dropbox/Vimwiki" to .zshrc
        "vimwiki/vimwiki",
        config = function()
            vim.g.vimwiki_list = {{ path = vim.env.VIMWIKI }}
        end,
    },
    {
        -- status bar
        "feline-nvim/feline.nvim",
        config = function()
            require("user/plugins/feline")
        end,
    },
    {
        -- vim-test (a configurable test runner which adds commands like ,tt ,tn and ,tf)
        "vim-test/vim-test",
        config = function()
            require("user/plugins/vim-test")
        end,
    },
    {
        -- indent-blankline (add vertical lines to show indent matches easily)
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup()
        end,
    },
    {
        -- LSP saga for code actions
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
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
    },
    {
        -- nvim-cmp (a completion engine frontend of neovim, works closely with LSPs)
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "onsails/lspkind-nvim",
            -- "hrsh7th/cmp-nvim-lsp-signature-help",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("user/plugins/cmp")
        end,
    },
    {
        -- ale (enables linting on files that we specify, will probably replace with null-ls at some point)
        "dense-analysis/ale",
        config = function()
            require("user/plugins/ale")
        end,
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
    },
    {
        -- treesitter (add meaning to source files we edit, this allows better highlighting)
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            -- "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("user.plugins.treesitter")
        end,
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
    },
    {
        -- gitHub copilot - CTRL+SPACE to activate
        "github/copilot.vim",
        config = function()
            require("user/plugins/copilot")
        end,
        enabled = false
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    }
}, {})

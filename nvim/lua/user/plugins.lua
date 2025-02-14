local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -- tokyonight theme
        -- #[CORE]
        "folke/tokyonight.nvim",
        config = function()
            require("user/plugins/theme")
        end,
        enabled = true,
    },
    {
        -- vim-commentary (easier comments with "gc")
        -- #[CORE]
        "tpope/vim-commentary",
        enabled = true,
    },
    {
        -- vim-surround (manipulate surrounding elements like quotes and bracers with cs"')
        -- #[CORE]
        "tpope/vim-surround",
        enabled = true,
    },
    {
        -- vim-unimpaired, add mappings like [b and ]b
        -- #[OPTIONAL]
        "tpope/vim-unimpaired",
        enabled = true,
    },
    {
        -- #[OPTIONAL]
        "tpope/vim-repeat",
        enabled = true,
    },
    {
        -- #[OPTIONAL]
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
        enabled = true,
    },
    {
        -- #[CORE]
        "nvim-lualine/lualine.nvim",
        config = function()
            require("user/plugins/lualine")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        enabled = true,
    },
    {
        -- nvim-telescope (fuzzy search front end)
        -- #[CORE]
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            },
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function()
            require("user/plugins/telescope")
        end,
        enabled = true,
    },
    {
        -- #[OPTIONAL]
        "lewis6991/gitsigns.nvim",
        config = function()
            require("user/plugins/gitsigns")
        end,
        enabled = true,
    },
    {
        --  vim-peekaboo - show registers with " in normal mode
        -- #[OPTIONAL]
        "junegunn/vim-peekaboo",
        config = function()
            vim.cmd("let g:peekaboo_window = 'vertical botright 80new'")
        end,
        enabled = true,
    },
    {
        -- #[OPTIONAL]
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
        -- #[OPTIONAL]
        "vim-test/vim-test",
        config = function()
            require("user/plugins/vim-test")
        end,
        enabled = true,
    },
    {
        -- LSP Manager - :Mason to install and manage LSP servers
        -- #[CORE]
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("user/plugins/mason")
        end,
        enabled = true,
    },
    {
        -- LSP Configurations
        -- #[CORE]
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            require("user/plugins/lspconfig")
        end,
        enabled = true,
    },
    {
        -- LSP Completion Engine for the Frontend
        -- #[CORE]
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("user/plugins/cmp")
        end,
        enabled = true,
    },
    {
        -- nice pop selection menu for the UI
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("user/plugins/telescope-ui-select")
        end,
        enabled = true,
    },
    {
        -- treesitter - give meaning and structure to the text in the buffer
        -- #[CORE]
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("user.plugins.treesitter")
        end,
        enabled = true,
    },
    {
        -- #[CORE]
        "github/copilot.vim",
        config = function()
            require("user/plugins/copilot")
        end,
        enabled = true,
    },
    {
        -- #[CORE]
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("user/plugins/neo-tree")
        end,
        enabled = true,
    },
    {
        -- <leader>3 to see the undo tree history
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<Leader>3", ":UndotreeToggle<CR>:UndotreeFocus<CR>")
            -- set the style
            vim.g.undotree_WindowLayout = 3
            vim.g.undotree_SplitWidth = 60
        end,
        enabled = true,
    },
    {
        -- figure out the comment type for the current cursor position
        -- #[OPTIONAL]
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
        end,
        enabled = true,
    },
    {
        -- some basic rust tools
        -- #[OPTIONAL]
        "rust-lang/rust.vim",
        config = function()
            vim.g.rustfmt_autosave = 1
        end,
        ft = "rust",
        enabled = true,
    },
    {
        -- none-ls for formatting and linting outside a language server
        -- #[OPTIONAL]
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("user/plugins/none-ls")
        end,
        enabled = true,
    },
    {
        -- add some nice Laravel features if you are working with Laravel
        -- #[OPTIONAL]
        "adalessa/laravel.nvim",
        dependencies = {
            "tpope/vim-dotenv",
            "nvim-telescope/telescope.nvim",
            "MunifTanjim/nui.nvim",
            "kevinhwang91/promise-async",
        },
        cmd = { "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },
        event = { "VeryLazy" },
        opts = {},
        config = true,
        enabled = true,
    },
    {
        -- create a new Laravel helper file
        -- #[OPTIONAL]
        "Bleksak/laravel-ide-helper.nvim",
        opts = {
            write_to_models = true,
            save_before_write = true,
            format_after_gen = true,
        },
        enabled = function()
            return vim.fn.filereadable("artisan") ~= 0
        end,
        keys = {
            {
                "<leader>lgm",
                function()
                    require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
                end,
                desc = "Generate Model Info for current model",
            },
            {
                "<leader>lgM",
                function()
                    require("laravel-ide-helper").generate_models()
                end,
                desc = "Generate Model Info for all models",
            },
        },
    },
}, {})

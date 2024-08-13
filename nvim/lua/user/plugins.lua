local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -- yet another color scheme
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
        -- vim-surround (manipulate surrounding things like quotes and bracers with cs"')
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
        -- vim-repeat, use the . key to repeat tpope commands like change surround
        -- #[OPTIONAL]
        "tpope/vim-repeat",
        enabled = true,
    },
    {
        -- nvim-autopairs (typing an opening bracket created the closed one and drops us inbetween)
        -- #[OPTIONAL]
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
        enabled = true,
    },
    {
        -- status bar
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
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function()
            require("user/plugins/telescope")
        end,
        enabled = true,
    },
    {
        -- gitsigns (add some git commands to navigate and handle changes)
        -- #[OPTIONAL]
        "lewis6991/gitsigns.nvim",
        config = function()
            require("user/plugins/gitsigns")
        end,
        enabled = true,
    },
    {
        --  vim-peekaboo (show registers when yanking into different places)
        -- #[OPTIONAL]
        "junegunn/vim-peekaboo",
        config = function()
            vim.cmd("let g:peekaboo_window = 'vertical botright 80new'")
        end,
        enabled = true,
    },
    {
        -- toggle a terminal in a popup
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
        -- vim-test (a configurable test runner which adds commands like ,tt ,tn and ,tf)
        -- #[OPTIONAL]
        "vim-test/vim-test",
        config = function()
            require("user/plugins/vim-test")
        end,
        enabled = true,
    },
    {
        -- manage downloading of LSP servers
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
        -- nvim-lspconfig (allow us to install and manage language servers with configs)
        -- #[CORE]
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("user/plugins/lspconfig")
        end,
        enabled = true,
    },
    {
        -- nvim-cmp (a completion engine frontend of neovim, works closely with LSPs)
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
        -- nice popups menu for selections and text boxes
        -- #[OPTIONAL]
        "stevearc/dressing.nvim",
        enabled = true,
    },
    {
        -- treesitter (add meaning to source files we edit, this allows better highlighting)
        -- #[CORE]
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            -- "nvim-treesitter/playground",
        },
        config = function()
            require("user.plugins.treesitter")
        end,
        enabled = true,
    },
    {
        -- gitHub copilot
        -- #[CORE]
        "github/copilot.vim",
        config = function()
            require("user/plugins/copilot")
        end,
        enabled = true,
    },
    {
        -- filesystem side bar
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
        config = function() end,
        enabled = true,
    },
    {
        -- some basic rust tools, and format on save
        -- #[OPTIONAL]
        "rust-lang/rust.vim",
        config = function()
            vim.g.rustfmt_autosave = 1
        end,
        ft = "rust",
        enabled = true,
    },
    {
        -- lint files on :Format
        -- #[OPTIONAL]
        "stevearc/conform.nvim",
        config = function()
            require("user/plugins/conform")

            -- Create a user command `:Format` that calls the print_hello function
            vim.api.nvim_create_user_command(
                'Format',  -- Command name
                function(args)
                    require("conform").format({ bufnr = args.buf })
                end,  -- Function to call
                {}  -- Options (none in this case)
            )
        end,
        enabled = true,
    },
}, {})

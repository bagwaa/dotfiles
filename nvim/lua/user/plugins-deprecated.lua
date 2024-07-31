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
        -- lint files on save
        -- #[OPTIONAL]
        "stevearc/conform.nvim",
        config = function()
            require("user/plugins/conform")
        end,
        enabled = false,
    },
    {
        -- vim-lastplace (open a file wherre we left off last time it was open)
        -- #[OPTIONAL]
        "farmergreg/vim-lastplace",
        enabled = false,
    },
    {
        -- add text objects for html attributes (vix and vax)
        -- #[OPTIONAL]
        "whatyouhide/vim-textobj-xmlattr",
        dependencies = "kana/vim-textobj-user",
        enabled = false,
    },
    {
        -- smoother scrolling with CTRL D and CTRL U
        -- #[OPTIONAL]
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end,
        enabled = false,
    },
    {
        -- close the buffer without killing the split
        -- #[OPTIONAL]
        "famiu/bufdelete.nvim",
        config = function()
            vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")
        end,
        enabled = false,
    },
    {
        -- jump around with prime
        -- #[OPTIONAL]
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "<Leader><Space>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
            vim.keymap.set("n", "<Leader><Space><Space>", ':lua require("harpoon.mark").add_file()<CR>')
        end,
        enabled = false,
    },
    {
        -- show hotkeys in a popup
        -- #[OPTIONAL]
        "folke/which-key.nvim",
        config = function()
            require("user/plugins/whichkey")
        end,
        enabled = false,
    },
    {
        -- AI in the editor
        -- #[OPTIONAL]
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
            vim.keymap.set("n", "<leader>m", ":NeoAIToggle<CR>")

            require("neoai").setup({})
        end,
        enabled = false,
    },
    {
        -- laravel blade syntax highlighting
        -- #[OPTIONAL]
        "jwalton512/vim-blade",
        config = function() end,
        enabled = false,
    },
    {
        -- wiki for neovim
        -- #[OPTIONAL]
        "vimwiki/vimwiki",
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/vimwiki",
                    syntax = "markdown",
                    ext = ".md",
                },
            }
        end,
        enabled = false,
    },
    {
        -- theme
        -- #[OPTIONAL]
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            local catppuccin = require("catppuccin")

            catppuccin.setup({
                integrations = {
                    treesitter = true,
                },
            })

            catppuccin.load()
        end,
        enabled = false,
    },
    {
        -- bufferline (show open buffers in a tab like bar)
        -- #[OPTIONAL]
        "akinsho/bufferline.nvim",
        -- dependencies = "kyazdani42/nvim-web-devicons",
        dependencies = "nvim-tree/nvim-web-devicons",
        after = "catppuccin/nvim",
        config = function()
            require("user.plugins.bufferline")
        end,
        enabled = false,
    },
    {
        -- indent-blankline (add vertical lines to show indent matches easily)
        -- #[OPTIONAL]
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                scope = { enabled = false },
            })
        end,
        enabled = false,
    },
    {
        -- debugging
        -- #[OPTIONAL]
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            require("user/plugins/debugging")
        end,
        enabled = false,
    },
}, {})

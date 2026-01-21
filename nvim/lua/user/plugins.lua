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
        -- Icons for neo-tree, lualine, telescope, etc.
        -- #[CORE]
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
            })
        end,
        enabled = true,
    },
    {
        -- one dark theme
        -- #[CORE]
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                style = "deep",
            })
        end,
        lazy = false,
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
                build = "make",
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
            vim.keymap.set("n", "<Leader>ot", ":ToggleTerm direction=horizontal<CR>")
            vim.keymap.set("n", "<Leader>of", ":ToggleTerm direction=float<CR>")
            vim.keymap.set("t", "<Leader>ot", "<C-\\><C-n>:ToggleTerm<CR>")
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
        -- LSP configuration
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("user/plugins/lsp")
        end,
        enabled = true,
    },
    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
            })
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
        -- figure out the comment type for the current cursor position (useful for PHP/Blade mixed files)
        "JoosepAlviste/nvim-ts-context-commentstring",
        enabled = true,
    },
    {
        -- auto-session (remember open files when restarting neovim)
        "rmagatti/auto-session",
        lazy = false,
        config = function()
            -- Exclude terminal from sessionoptions to prevent restore errors
            vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
            require("auto-session").setup({
                log_level = "error",
                suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                pre_save_cmds = {
                    "Neotree close",
                    -- Close all terminal buffers before saving session
                    function()
                        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                            if vim.bo[buf].buftype == "terminal" then
                                vim.api.nvim_buf_delete(buf, { force = true })
                            end
                        end
                    end,
                },
                auto_restore = true,
                auto_save = true,
            })
        end,
        enabled = false,
    },
    {
        -- Claude Code integration (connects neovim to Claude Code CLI)
        "coder/claudecode.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        config = true,
        keys = {
            { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
            { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
            { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
            { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
            { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current file" },
            { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
            { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
        },
        enabled = true,
    },
    {
        -- Formatter plugin - supports multiple formatters including jq for JSON
        -- #[OPTIONAL]
        "stevearc/conform.nvim",
        config = function()
            require("user/plugins/conform")
        end,
        enabled = true,
    },
}, {})

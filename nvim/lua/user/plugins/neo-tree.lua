require("neo-tree").setup({
    source_selector = {
        winbar = true,
        content_layout = "center",
        tabs_layout = "equal",
        sources = {
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "buffers", display_name = "  Buffers " },
            { source = "git_status", display_name = " 󰊢 Git " },
        },
    },
    window = {
        width = 60,
        position = "left"
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        },
        group_empty_dirs = false
    },
    buffers = {
        show_unloaded = true,
    },
    default_component_configs = {
        icon = {
            folder_closed = "󰉋",
            folder_open = "󰝰",
            folder_empty = "󰉖",
            folder_empty_open = "󰷏",
            default = "*",
            highlight = "NeoTreeFileIcon",
        },
        modified = {
            symbol = "",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                added     = "✚",
                modified  = "",
                deleted   = "",
                renamed   = "󰁕",
                untracked = "",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "✓",
                conflict  = "",
            }
        },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                require("neo-tree").close_all()
            end
        },
    }
})

vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { bg = "#191725", fg = "#4C4F61" })
vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { bg = "#191725", fg = "#191725" })

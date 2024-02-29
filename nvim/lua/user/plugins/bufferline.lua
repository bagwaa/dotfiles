require("bufferline").setup({
    options = {
        indicator = {
            icon = " ",
        },
        show_close_icon = false,
        tab_size = 0,
        max_name_length = 25,
        separator_style = "slant",
        modified_icon = "",
        custom_areas = {
            left = function()
                return {
                    { text = "    ", fg = "#8fff6d" },
                }
            end,
        },
    },
})

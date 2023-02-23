require('nvim-tree').setup({
  view = {
    width = 60,
    hide_root_folder = false,
    side = 'right',
    number = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  renderer = {
    group_empty = true
  }

})


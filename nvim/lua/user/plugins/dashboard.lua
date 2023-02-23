local dashboard = require('dashboard')

dashboard.setup({
  config = {
    shortcut = {
      { desc = '!false ... it’s funny because it’s true' },
    },
    header = {
      '',
      '',
      '       ▄▄▄▄    ▄▄▄      ▄████  █     █░ ▄▄▄      ▄▄▄      ',
      '      ▓█████▄ ▒████▄    ██▒ ▀█▓█░ █ ░█░▒████▄   ▒████▄    ',
      '      ▒██▒ ▄██▒██  ▀█▄ ▒██░▄▄▄▒█░ █ ░█ ▒██  ▀█▄ ▒██  ▀█▄  ',
      '      ▒██░█▀  ░██▄▄▄▄██░▓█  ██░█░ █ ░█ ░██▄▄▄▄██░██▄▄▄▄██ ',
      '      ░▓█  ▀█▓▒▓█   ▓██▒▓███▀▒░░██▒██▓ ▒▓█   ▓██▒▓█   ▓██ ',
      '      ░▒▓███▀▒░▒▒   ▓▒█░▒   ▒ ░ ▓░▒ ▒  ░▒▒   ▓▒█░▒▒   ▓▒█  ',
      '       ▒░▒   ░ ░ ░   ▒▒  ░   ░   ▒ ░ ░  ░ ░   ▒▒ ░ ░   ▒▒ ',
      '        ░    ░   ░   ▒   ░   ░   ░   ░    ░   ▒    ░   ▒  ',
    },
    center = {
      { icon = '  ', desc = 'New file', action = 'enew' },
      { icon = '  ', shortcut = 'SPC f', desc = 'Find file', action = 'Telescope find_files' },
      { icon = '  ', shortcut = 'SPC h', desc = 'Recent files', action = 'Telescope oldfiles' },
      { icon = '  ', shortcut = 'SPC g', desc = 'Find Word', action = 'Telescope live_grep' },
    },
    footer = { '' }
  }
})

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = 'red' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })

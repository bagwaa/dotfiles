local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
       open_fn = function()
           return require('packer.util').float({ border = 'solid' })
       end 
    },
})

local use = require('packer').use

-- Packer
use('wbthomason/packer.nvim')

-- Theme
use({
  'dracula/vim',
  config = function ()
    vim.cmd('let g:dracula_colorterm = 0')
    vim.cmd('colorscheme dracula')
    vim.api.nvim_set_hl(0, 'DraculaComment', { fg = 'gray' })

    vim.api.nvim_set_hl(0, 'CursorLine', {
        bg = '#30323E',
    })
    -- Changes to the highlight groups require :PackerCompile and :PackerClean
  end,
})

-- Commenting support
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite
use('tpope/vim-eunuch')

-- Bracket mappings like [b and ]b
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support
use('tpope/vim-sleuth')

-- use the . key to repeat tpope commands
use('tpope/vim-repeat')

-- Add more languages
use('sheerun/vim-polyglot')

-- Open a file where we left off last time
use('farmergreg/vim-lastplace')

-- Create parent directories when saving a file if the directories do not exist
use('jessarcher/vim-heritage')

-- Text objects for XML attributes
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user'
})

-- Autopairs
use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
})

-- Telescope
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  },
  config = function()
    require('user/plugins/telescope')
  end,
})

-- Tree
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user/plugins/nvim-tree')
  end,
})

-- Status Line 
use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('lualine').setup({ 
          options = {
            globalstatus = true
          }
      })
    end
})

-- Buffer Lines
use({
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user.plugins.bufferline')
  end,
})

-- Indent with vertical lines
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup()
  end 
})

-- Git
use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({ current_line_blame = true })
      vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
      vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
      vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
      vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
    end
})

use({
  'tpope/vim-fugitive',
  require = 'tpope/vim-rhubarb',
})

-- Treesitter and Textobjects
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('user.plugins.treesitter')
  end,
})

-- Language Server Protocol
use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('user/plugins/lspconfig')
  end
})

-- Completion
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('user/plugins/cmp')
  end
})

use({
  'glepnir/lspsaga.nvim',
  branch = 'main',
  config = function()
    require("lspsaga").setup({})
  end,
  requires = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-treesitter/nvim-treesitter' }
  }
})

-- Terminal 
use {
  'akinsho/toggleterm.nvim', 
  tag = '*', 
  config = function()
    require('toggleterm').setup({
        direction = "float",
    })
    vim.keymap.set('n', '<Leader>cc', ':ToggleTerm<CR>')
    vim.keymap.set('t', '<Leader>cc', '<C-\\><C-n>:ToggleTerm<CR>')
  end
}

if packer_bootstrap then
    require('packer').snc()
end

vim.cmd([[
  augroup plugin_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

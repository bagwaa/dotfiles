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

if packer_bootstrap then
    require('packer').snc()
end

vim.cmd([[
  augroup plugin_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

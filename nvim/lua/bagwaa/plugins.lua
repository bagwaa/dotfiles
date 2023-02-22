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
    -- display = {
    --    open_fn = function()
    --        require require('packer.util').float({ border = 'solid' })
    --    end 
    -- },
})

local use = require('packer').use

-- Packer
use('wbthomason/packer.nvim')

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

if packer_bootstrap then
    require('packer').snc()
end

vim.cmd([[
  augroup plugin_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

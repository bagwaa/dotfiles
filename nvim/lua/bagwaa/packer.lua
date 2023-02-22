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

require("bagwaa/plugins")

if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
    autocmd BufWritePost packer.lua source <afile>
  augroup end
]])

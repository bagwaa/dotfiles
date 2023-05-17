vim.cmd([[
  highlight clear ALEErrorSign
  highlight clear ALEWarningSign
  let g:ale_linters = { 'php': ['php', 'phpstan'] }
  let g:ale_fixers = { 'php': ['php_cs_fixer', 'phpcbf'] }
]])

vim.g.ale_linters_explicit = 1
vim.g.ale_open_list = 1
vim.g.ale_set_loclist = 0
vim.g.ale_list_window_size = 5
vim.g.ale_fix_on_save = 0
vim.g.ale_php_phpstan_executable = "vendor/bin/phpstan"
vim.g.ale_php_phpstan_level = 6

if vim.fn.filereadable("ruleset.xml") == 1 then
	vim.g.ale_php_phpcbf_standard = "./ruleset.xml"
	vim.g.ale_php_phpcs_standard = "./ruleset.xml"
end

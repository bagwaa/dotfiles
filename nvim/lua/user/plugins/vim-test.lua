vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<Leader>tt", ":TestSuite<CR>")
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>")

vim.cmd([[
  let g:test#strategy = "basic"
  " let g:shtuff_receiver = 'tests'

  let g:test#php#runner = 'phpunit'
  let g:test#php#phpunit#executable = 'php artisan test'
  let test#php#phpunit#options = '--colors=always'
  let g:test#echo_command = 0
]])

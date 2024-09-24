vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<Leader>tt", ":TestSuite<CR>")
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>")

vim.cmd([[
  let g:test#strategy = "basic"
  let g:shtuff_receiver = 'test-runner'

  let g:test#php#runner = 'phpunit'
  let g:test#php#phpunit#executable = 'php artisan test --parallel --stop-on-failure'
  let test#php#phpunit#options = '--colors=always'
  let g:test#echo_command = 0

  let g:test#go#gotest#executable = 'richgo test'
]])


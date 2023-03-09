vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<Leader>tt", ":TestSuite<CR>")
vim.keymap.set("n", "<Leader>ts", ":TestToggleStrategy<CR>")
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>")

vim.api.nvim_create_user_command("TestToggleStrategy", function()
	print("code to switch testing strategy here")
end, {})

vim.cmd([[
  let test#php#phpunit#executable = 'php artisan test'
  let test#php#phpunit#options = '--colors=always'
]])

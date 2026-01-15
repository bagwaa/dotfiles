vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<Leader>tt", ":TestSuite<CR>")
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>")

vim.g["test#strategy"] = "basic"
vim.g["test#echo_command"] = 0
vim.g["test#php#runner"] = "pest"
vim.g["test#php#phpunit#executable"] = "./vendor/bin/pest"
vim.g["test#go#gotest#executable"] = "richgo test -v"

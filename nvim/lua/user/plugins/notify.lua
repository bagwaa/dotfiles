require("notify").setup({
	background_colour = "#c8c8c8",
	timeout = 2000,
	stages = "static",
})

vim.notify = require("notify")

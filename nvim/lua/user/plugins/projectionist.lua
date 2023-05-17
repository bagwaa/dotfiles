-- Default for Laravel prject structures, create a .projections.json in the project root
-- to override these defaults and set your own project locations
--
vim.g.projectionist_heuristics = {
	artisan = {
		["*"] = {
			start = "php artisan serve",
			console = "php artisan tinker",
			make = "npm run dev",
		},
		["app/Models/*.php"] = {
			type = "model",
		},
		["app/Http/Controllers/*.php"] = {
			type = "controller",
		},
		["routes/*.php"] = {
			type = "route",
		},
		["database/migrations/*.php"] = {
			type = "migration",
		},
		["app/*.php"] = {
			type = "source",
			alternate = {
				"tests/Unit/{}Test.php",
				"tests/Feature/{}Test.php",
			},
		},
		["tests/Feature/*Test.php"] = {
			type = "test",
			alternate = "app/{}.php",
		},
		["tests/Unit/*Test.php"] = {
			type = "test",
			alternate = "app/{}.php",
		},
	},
}

vim.keymap.set("n", "<leader>e", ":A<CR>")

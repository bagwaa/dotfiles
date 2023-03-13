require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- PHP (license key in ~/intelephense)
require("lspconfig").intelephense.setup({ capabilities = capabilities })

require("lspconfig").pyright.setup({ capabilities = capabilities })

-- Vue, Javascript, Typescript
require("lspconfig").volar.setup({
	capabilities = capabilities,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

-- JSON
require("lspconfig").jsonls.setup({
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
})

-- null-ls
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	temp_dir = "/tmp",
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.diagnostics.trail_space.with({
			disabled_filetypes = { "NvimTree" },
		}),
		require("null-ls").builtins.formatting.prettier.with({
			extra_args = { "--no-semi", "--single-quote" },
		}),
		-- require("null-ls").builtins.formatting.phpcsfixer.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ "vendor/bin/php-cs-fixer" })
		-- 	end,
		-- 	extra_args = { "--rules=@PSR12" },
		-- }),
		-- require("null-ls").builtins.diagnostics.phpstan.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ "vendor/bin/phpstan" })
		-- 	end,
		-- }),
		-- require("null-ls").builtins.diagnostics.psalm.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ "vendor/bin/psalm" })
		-- 	end,
		-- 	diagnostics_format = "psalm: [#{c}] #{m}",
		-- 	extra_args = { "--show-info=true" },
		-- }),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

require("mason-null-ls").setup({ automatic_installation = true })

-- Tailwind CSS
require("lspconfig").tailwindcss.setup({ capabilities = capabilities })

-- Mappings
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<Leader>a", ":Lspsaga code_action<CR>")
vim.keymap.set("n", "<Leader>r", ":Lspsaga rename<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

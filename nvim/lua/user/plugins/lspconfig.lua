require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- PHP (license key in ~/intelephense)
require("lspconfig").intelephense.setup({ capabilities = capabilities })

-- Python
require("lspconfig").pyright.setup({ capabilities = capabilities })
-- require("lspconfig").emmet_ls.setup({
-- 	-- on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
-- 	init_options = {
-- 		html = {
-- 			options = {
-- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
-- 				["bem.enabled"] = true,
-- 			},
-- 		},
-- 	},
-- })

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
		require("null-ls").builtins.diagnostics.jsonlint,
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

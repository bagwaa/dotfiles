local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip/loaders/from_snipmate").lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[BUF]",
			},
		}),
	},
	mapping = {
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		-- { name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
	experimental = {
		ghost_text = true,
	},
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,longest,preview"

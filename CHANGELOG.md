# Changelog

## 2025-01-15

### LSP Configuration (Major)
- Added `nvim-lspconfig` plugin - LSP was previously broken (Mason installed servers but they weren't configured)
- Created dedicated `lsp.lua` config file separate from `mason.lua`
- Configured LSP servers: intelephense (PHP), lua_ls, ts_ls, cssls, html, jsonls, tailwindcss
- LSP navigation now opens in Telescope (`gd`, `gr`, `gi`)
- Added diagnostic signs config with proper icons (`, `, `, 󰌵`)

### Plugin Cleanup
- Removed `rust.vim` plugin (not used)
- Removed Rust keymaps (`,cb`, `,cr`, `,ct`)
- Removed orphaned Go keymap (`,gg`)
- Cleaned up `nvim-ts-context-commentstring` (removed empty config function)
- Removed commented-out code from `lualine.lua`

### Treesitter
- Removed unused language parsers: c, dot, go, rust, svelte, vue, zig, regex
- Kept PHP-focused languages: php, twig, html, css, scss, js, ts, json, yaml, sql, lua, markdown

### Neo-tree
- Changed sidebar to open on left instead of right
- Fixed folder icons (`, `, `)
- Fixed git status icons (`✚`, ``, ``, `󰁕`, ``, ``, `󰄱`, `✓`, ``)
- Moved diagnostic signs config from `neo-tree.lua` to `lsp.lua`

### Mason
- Simplified to only contain Mason package manager config
- Fixed UI icons (`✓`, `➜`, `✗`)
- LSP server configuration moved to separate `lsp.lua`

### Ghostty
- Added comments to config file for clarity

### Gitsigns
- Already had proper config, no changes needed

### Deprecation Fixes
- Replaced deprecated `vim.fn.sign_define()` with `vim.diagnostic.config()` for diagnostic signs

### Bug Fixes
- Fixed `lazygit.lua` not being loaded (added to `init.lua`)

### Documentation
- Created `CLAUDE.md` for Claude Code guidance
- Updated `README.md` with all current keymaps organized by category
- Fixed incorrect/outdated information in README (LSP section said it was removed)
- Removed references to non-existent plugins (Harpoon, leap/hop)
- Updated neovim version requirement from 0.9.0 to 0.10.0

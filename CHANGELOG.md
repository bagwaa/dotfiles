# Changelog

## 2025-01-15 16:00 - Tmux Window Renumbering

### Tmux
- Enabled `renumber-windows` so windows are automatically renumbered when one is closed

---

## 2025-01-15 15:45 - Keymap Reorganization

### Terminal Keymaps
- Changed terminal toggle from `,cc` to `,ot` (open terminal)
- Changed terminal float from `,cf` to `,of` (open float)
- Avoids conflict with vim-test keymaps (`,tt`, `,tf`)

### Claude Code Keymaps
- Moved all Claude Code keymaps from `,a` prefix to `,c` prefix
- Keymaps: `,cc` toggle, `,cf` focus, `,cr` resume, `,cs` send selection, `,cb` add buffer, `,ca` accept diff, `,cd` deny diff

### Documentation
- Updated README with correct keymaps for Terminal and Claude Code sections
- Added note about using `Ctrl+H/J/K/L` to navigate from terminal back to editor

---

## 2025-01-15 12:00 - Claude Code Integration

### Claude Code Integration
- Added `claudecode.nvim` plugin for Claude Code CLI integration
- When Claude Code is running, it connects to Neovim automatically
- Claude can see your current file/selections and propose changes with native diff view

### Documentation
- Created `CLAUDE.md` for Claude Code guidance
- Updated `README.md` with all current keymaps organized by category
- Added Claude Code integration section to README
- Fixed incorrect/outdated information in README (LSP section said it was removed)
- Removed references to non-existent plugins (Harpoon, leap/hop)
- Updated neovim version requirement from 0.9.0 to 0.10.0

---

## 2025-01-15 10:00 - LSP and Plugin Cleanup

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
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository containing configuration files for:
- **Neovim** (`nvim/`) - Text editor configuration using Lazy.nvim plugin manager
- **tmux** (`tmux/`) - Terminal multiplexer configuration with TPM plugin manager
- **Ghostty** (`ghostty/`) - Terminal emulator configuration
- **Starship** (`starship/`) - Cross-shell prompt configuration with Catppuccin theme
- **OpenCode** (`opencode/`) - AI coding agent configuration with custom commands
- **Zed** (`zed/`) - Zed editor configuration (settings and keybindings)

## Installation

Run the install script to symlink all configurations:
```bash
./install
```

This creates symlinks:
- `tmux/tmux.conf` → `~/.tmux.conf`
- `nvim/` → `~/.config/nvim`
- `ghostty/config` → `~/Library/Application Support/com.mitchellh.ghostty/config`
- `starship/starship.toml` → `~/.config/starship.toml`
- `opencode/opencode.json` → `~/.config/opencode/opencode.json`
- `opencode/commands/` → `~/.config/opencode/commands`
- `zed/settings.json` → `~/.config/zed/settings.json`
- `zed/keymap.json` → `~/.config/zed/keymap.json`

## Neovim Structure

- `nvim/init.lua` - Entry point, loads user modules and sets colorscheme (onedark)
- `nvim/lua/user/options.lua` - Editor options
- `nvim/lua/user/keymaps.lua` - Key mappings
- `nvim/lua/user/plugins.lua` - Lazy.nvim plugin specifications
- `nvim/lua/user/plugins/` - Individual plugin configurations

Install plugins: Open neovim and run `:Lazy`

## tmux Configuration

- Prefix key: `Ctrl-A` (instead of default `Ctrl-B`)
- Reload config: `<prefix> r`
- Split panes: `<prefix> |` (horizontal), `<prefix> =` (vertical)
- Session switcher: `<prefix> Ctrl-E` (uses fzf popup)

Install plugins: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` then `<prefix> Shift-I`

## OpenCode Configuration

- `opencode/opencode.json` - Main configuration file with MCP server settings
- `opencode/commands/` - Custom slash commands
  - `push.md` - `/push` command for commit and push
  - `commit.md` - `/commit` command for commit only

Custom commands automatically follow repository commit conventions.

## Zed Configuration

- `zed/settings.json` - Editor settings (theme, font, LSP, formatting preferences)
- `zed/keymap.json` - Custom key bindings

## Dependencies

- neovim 0.11.0+
- tmux, ripgrep, fzf, lazygit (all via Homebrew)
- OpenCode AI (`curl -fsSL https://opencode.ai/install | bash`)

## Changelog

**Always update `CHANGELOG.md` when making any changes to this repository.**

Format:
```markdown
## YYYY-MM-DD HH:MM - Brief Description

### Category
- Change description
```

- Most recent entries go at the top
- Use `---` to separate entries
- Group related changes under a single timestamp

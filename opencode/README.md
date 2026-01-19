# OpenCode Configuration

This directory contains OpenCode configuration and custom commands.

## Setup

### 1. Install the configuration

The install script will symlink this directory to `~/.config/opencode/`:

```bash
./install
```

### 2. Configure environment variables

Add your Context7 API key to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
export CONTEXT7_API_KEY="your-api-key-here"
```

Then reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

## Files

- `opencode.json` - Main configuration file with MCP server settings
- `commands/push.md` - `/push` command to commit and push changes
- `commands/commit.md` - `/commit` command to commit without pushing

## Custom Commands

### `/push`
Reviews current changes, creates a meaningful commit message following your repo's conventions, commits, and pushes to remote.

### `/commit`
Same as `/push` but doesn't push to remote (commit only).

## Getting Your Context7 API Key

If you don't have a Context7 API key yet, you can get one from [context7.com](https://context7.com).

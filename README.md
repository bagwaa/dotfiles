# My Dotfiles

## Requirements for this config

- neovim 0.11.0 or greater
- tmux (`brew install tmux`)
- ripgrep / fzf (`brew install ripgrep fzf`)
- lazygit (`brew install lazygit`)
- Claude Code CLI (`npm install -g @anthropic-ai/claude-code`)

## Tmux Plugin Manager (TPM)

This configuration uses plugins, for that reason we need to install TPM

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

and then use the following command

`<CTRL> A <SHIFT> I`

## Using Tmux

Sessions can be attached to and detached from, this allows us to have multiple sessions running at the same time and switch between them.
Each session can have multiple windows.

- To create a session type `tmux` in the terminal.
- To disconnect from a session run `<CTRL> A D`
- To start a whole new session for another tmux session (maybe for another project) run `tmux` again
- To switch quickly between sessions run `<CTRL> A E` to pick which session you want to switch to
- To rename a session to something useful instead of `1` or `2` etc then run `<CTRL> A $` and type the name you want to use

- Within each session we can create multiple windows, to create a new window run `<CTRL> A` and then `C`
- To rename a window run `<CTRL> A ,` and type the name you want to use
- To switch windows run `<CTRL> A` and then `N` or `P` to move to the next or previous window or just type the number of the window you want to switch to

## Neovim

### Plugin Install

Inside neovim run `:Lazy`

### General Shortcuts

I have configured a lot of keymaps to make life easier for ME, your milage may vary, feel free to edit `keymaps.lua` to suit your needs.

- `jj` exit insert mode (instead of Esc)
- `,s` save file
- `,k` clear search highlighting
- `;;` add semicolon at end of line (insert mode)
- `,,` add comma at end of line (insert mode)

### Splits and Buffers

- `,v` new vertical split
- `,x` close current buffer
- `<Ctrl>+H/J/K/L` navigate between splits
- `<Tab>` next buffer
- `<Shift>+<Tab>` previous buffer

### Sidebar (Neo-tree)

- `,1` toggle sidebar with current file focused
- `,2` toggle sidebar showing open buffers

### Fuzzy Finding (Telescope)

- `<Ctrl>+P` find files
- `,pv` find files including vendor directories
- `,pg` find files only in the git repository
- `,fr` find recently opened files
- `,e` find open buffers
- `,ff` search file contents (ripgrep)
- `,l` show document symbols

When searching using ripgrep we can pass some extra arguments in the search like so:

- `"foo" app` search for foo in the app directory
- `"foo" -tphp` search for foo in php files only
- `"foo" -tphp app` search for foo in php files only within the app folder

### LSP

- `gd` go to definition (opens in Telescope)
- `gD` go to declaration
- `gr` find references (opens in Telescope)
- `gi` go to implementation (opens in Telescope)
- `K` hover documentation
- `,rn` rename symbol
- `,ca` code actions
- `[d` / `]d` jump between diagnostics
- `,d` show diagnostic float

#### Intelephense Premium Features

These require a license key in `~/intelephense/licence.txt`:

- `,rn` rename symbol across files
- `gi` find all implementations
- `,zs` / `,zo` code folding (close/open all folds)

### Git

- `]h` / `[h` next/previous hunk
- `gs` stage hunk
- `gS` undo stage hunk
- `gp` preview hunk
- `gb` blame line
- `,g` open lazygit

### Terminal

- `,of` toggle floating terminal
- `,ot` toggle terminal at bottom
- `<Ctrl>+H/J/K/L` navigate back to editor from terminal

### Running Tests

- `,tt` run whole test suite
- `,tn` run test nearest cursor
- `,tf` run all tests in file
- `,tl` run last test
- `,tv` visit last test file

### Code Folding

- `,zs` close all folds
- `,zo` open all folds

### Undo Tree

- `,3` toggle undo tree

### Claude Code Integration

This config includes [claudecode.nvim](https://github.com/coder/claudecode.nvim) which connects Neovim to the Claude Code CLI. When you run `claude` in your terminal, it automatically detects Neovim and gains access to your editor.

#### What Claude Code can do when connected:

- **See your current file and selections** - Claude knows what you're looking at in real-time
- **Make edits with diff view** - When Claude proposes changes, you see them in Neovim's native diff view
- **Access your file explorer** - Add files to Claude's context directly from Neo-tree

#### Shortcuts:

- `,cc` toggle Claude Code terminal
- `,cf` focus Claude terminal
- `,cr` resume previous Claude session
- `,cs` send visual selection to Claude
- `,cb` add current file to Claude's context
- `,ca` accept diff changes
- `,cd` deny diff changes

#### How to use:

1. Run `:Lazy` to install the plugin first
2. Open your project in Neovim
3. Press `,cc` to open Claude Code in a floating terminal
4. Claude automatically connects to Neovim
5. Select code with `V` and press `,cs` to send it to Claude
6. When Claude suggests changes, accept with `,ca` or reject with `,cd`

### Commenting

- `gc` comment/uncomment (in visual mode use `SHIFT-V` first)

### Surround

- `cs"'` change surrounding double quotes to single quotes
- `ds"` delete surrounding double quotes
- `ysiw"` add double quotes around word

### Visual Mode

- `<` / `>` indent and keep selection
- `p` paste without yanking replaced text

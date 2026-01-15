# My Dotfiles

## Requirements for this config

- neovim 0.11.0 or greater
- tmux (`brew install tmux`)
- ripgrep / fzf (`brew install ripgrep fzf`)
- lazygit (`brew install lazygit`)

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
Also, if you press the leader key and nothing else, you will be presented with a cheatsheet after 1 second or so.

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

- `,cf` toggle floating terminal
- `,cc` toggle terminal at bottom

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

### Copilot

- `<Ctrl>+<Space>` accept Copilot suggestion

### Commenting

- `gc` comment/uncomment (in visual mode use `SHIFT-V` first)

### Surround

- `cs"'` change surrounding double quotes to single quotes
- `ds"` delete surrounding double quotes
- `ysiw"` add double quotes around word

### Visual Mode

- `<` / `>` indent and keep selection
- `p` paste without yanking replaced text

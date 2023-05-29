# My Dotfiles

## Requirements for this config

- neovim 0.9.0 or greater
- tmux (`brew install tmux`)
- yabai (`brew install koekeishiya/formulae/yabai`)
- skhd (`brew install koekeishiya/formulae/skhd`)
- ripgrep / fzf (`brew install ripgrep fzf`)
- lazygit (`brew install lazygit`)

## TMUX Plugin install

This configuration uses plugins, for that reason we need to install them using the following command

`<CTRL> A <SHIFT> I`

## Using Tmux

Sessions can be attached to and detached from, this allows us to have multiple sessions running at the same time and switch between them.  Each session can have multiple windows.

- To create a session type `tmux` in the terminal.
- To disconnect from a session run `<CTRL> A D`
- To start a whole new session for another tmux session (maybe for another project) run `tmux` again
- To swtich quickly between sessions run `<CTRL> A E` to pick which session you want to switch to
- To rename a session to something useful instead of `1` or `2` etc then run `<CTRL> A $` and type the name you want to use

- Within each session we can create multiple windows, to create a new window run `<CTRL> A` and then `C`
- To rename a window run `<CTRL> A ,` and type the name you want to use
- To switch windows run `<CTRL> A` and then `N` or `P` to move to the next or previous window or just type the number of the window you want to switch to

### Neovim Plugin Install

Inside neovim run `:Lazy`

### Shortcuts

I have configured a lot of keymaps to make life easier for ME, your milage may vary, feel free to edit `keymaps.lua` to suit your needs. Also, if you press the leader key and nothing else, you will be presented with a cheatsheet after 1 second or so.

### Navigation within a file

All the usual vim navigation commands work, however I have added some extra ones to make life easier

- type `s` followed by two letters you are looking for, you will then be taken to the first match. If there are any more then you will be able to use the key shown.

### Creating a test from a corresponding file

- Goto the file you want to test, for example `User.php` in the models directory
- Type `,e` which will try and switch to the test for that class
- If it can't find one, it will ask if you want to create a feature test or a unit test
- Once the blank file is open, type `ftest` or `utest` to load a test class snippet

### Sidebar

- `,1` to toggle the sidebar with the current file focused

### Git

- `]h and [h` to move up and down through hunks, you can also hit `<leader>g` to bring up lazygit inside neovim

### Lsp

- Use `:LspInfo` to see what language servers are attached to the current buffer
- use `:Mason` to install and update language servers
- use `:PhpActorClassNew` to create a new class from a template

### Terminal

- `,cf` to toggle a terminal window that floats
- `,cc` to toggle a terminal window at the bottom of the screen

### Running Tests

- `,tt` when viewing a test runs the whole test suite
- `,tn` when viewing a test runs the test nearest the cursor
- `,tf` when viewing a test runs all the tests in the file

### Commenting code / Uncommenting Code

- Use `SHIFT-V` to get into visual block mode
- `gc` to comment or uncomment

### Change surrounding stuff

- To change double quotes to double, from "test" to 'test' place the cursor over the double quote and then type the command `cs"'` (change surround from " to ')

### Deleting HTML attributes

- Use `dax` to delete around the xml attribute (ie, class="foo") or
- Use `dix` to delete inside the xml attribute (ie, class="foo")

### Fuzzy Finding

- `<Ctrl>+P` to find files
- `<leader> pv` to find files including vendor directories
- `<leader> pg` to find files only in the git repository
- `<leader> o` to find recently opened files
- `<leader> bb` to find a file in an open buffer
- `<leader> ff` to find a file containing some text (ripgrep)

When searching using ripgrep we can pass some extra arguments in the search like so :-

- `"foo" app` search for foo in the app directory
- `"foo" -tphp` search for foo in php files only
- `"foo" -tphp app` search for foo in php files only within the app folder

### Harpoon

If you want to move between a few files in a project quickly without having to use telescope of neotree, then you can mark file locations and switch between them quikly using harpoon.

- `<leader> <space> <space>` to mark a file at the current location
- `<leader> <space>` to switch between the marked files

### AI

You can ask an assistant to give you hints and tips on concepts that you might need help with using `<leader>m`.

#### Python

```
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

#### Tailwind

TailwindCSS is installed in the LSP, however it won't work unless tailwind is actually installed into the project, when viewing a file with tailwind classes, the colours will be displayed in the editor visually.

### Window Manager Setup

#### Configure some OSX Settings for yabai

- Open Several Desktops (~7) on Your Machine
- Go To Keyboard Settings > Shortcuts > Mission Control
- Expand Mission Control and Turn On Shortcuts for Switching Spaces 1-7 with "Ctrl + # Of Space"
- Go to System Settings > Accessibility > Display
- Turn On Reduce Motion
- Go To System Settings > Desktop & Dock > Mission Control
- Turn off "Automatically Rearrange Spaces Based On Most Recent Use"

I use this exact configuration https://www.josean.com/posts/yabai-setup (video format: https://www.youtube.com/watch?v=k94qImbFKWE) however a few notes about restarting these services using brew.

- `brew install koekeishiya/formulae/yabai`
- `brew install koekeishiya/formulae/skhd`

instead of
- `brew services start yabai`
- `brew services restart yabai`

use
- `yabai --start-service`
- `yabai --restart-service`

Same with SKHD.

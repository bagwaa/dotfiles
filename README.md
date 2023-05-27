# My personal configuration

# Software Requirements

1. Neovim (from neovim.io)
2. Tmux (`brew install tmux`)
3. Yabai (`brew install koekeishiya/formulae/yabai`)
4. Skhd (`brew install koekeishiya/formulae/skhd`)
5. Ripgrep / FZF

### Window Manager Setup

#### Configure some OSX Settings for yabai

    * Open Several Desktops (~7) on Your Machine
    * Go To Keyboard Settings > Shortcuts > Mission Control
    * Expand Mission Control and Turn On Shortcuts for Switching Spaces 1-7 with "Ctrl + # Of Space"
    * Go to System Settings > Accessibility > Display
    * Turn On Reduce Motion
    * Go To System Settings > Desktop & Dock > Mission Control
    * Turn off "Automatically Rearrange Spaces Based On Most Recent Use"

I use this exact configuration https://www.josean.com/posts/yabai-setup (video format: https://www.youtube.com/watch?v=k94qImbFKWE) however a few notes about restarting these services using brew.

`brew install koekeishiya/formulae/yabai`
`brew install koekeishiya/formulae/skhd`

instead of
    `brew services start yabai`
    `brew services restart yabai`
use
    `yabai --start-service`
    `yabai --restart-service`

Same with SKHD.

### TMUX Plugin install

`<CTRL> A <SHIFT> I`

### Neovim Plugin Install

Inside neovim run `:Lazy`

### Creating a test from a corresponding file

- Goto the file you want to test, for example `User.php` in the models directory
- Type `,e` which will try and switch to the test for that class
- If it can't find one, it will ask if you want to create a feature test or a unit test
- Once the blank file is open, type `ftest` or `utest` to load a test class snippet

### Sidebar

- `,1` to toggle the sidebar with the current file focused

### Git

- `]h and [h` to move up and down through hunks

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

#### Python

```
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

#### Tailwind

TailwindCSS is installed in the LSP, however it won't work unless tailwind is actually installed into the project

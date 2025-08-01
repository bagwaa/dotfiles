# My Dotfiles

## Requirements for this config

- neovim 0.9.0 or greater
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
- To swtich quickly between sessions run `<CTRL> A E` to pick which session you want to switch to
- To rename a session to something useful instead of `1` or `2` etc then run `<CTRL> A $` and type the name you want to use

- Within each session we can create multiple windows, to create a new window run `<CTRL> A` and then `C`
- To rename a window run `<CTRL> A ,` and type the name you want to use
- To switch windows run `<CTRL> A` and then `N` or `P` to move to the next or previous window or just type the number of the window you want to switch to

### Neovim Plugin Install

Inside neovim run `:Lazy`

### Shortcuts

I have configured a lot of keymaps to make life easier for ME, your milage may vary, feel free to edit `keymaps.lua` to suit your needs. 
Also, if you press the leader key and nothing else, you will be presented with a cheatsheet after 1 second or so.

### Navigation within a file

All the usual vim navigation commands work, however I have added some extra ones to make life easier

- type `s` followed by two letters you are looking for, you will then be taken to the first match. If there are any more then you will be able to use the key shown.

### Sidebar

- `,1` to toggle the sidebar with the current file focused

### Git

- `]h and [h` to move up and down through hunks, you can also hit `<leader>g` to bring up lazygit inside neovim

### Lsp

- LSP has been removed for now as the configuration will need updating, also I am trying to keep this config from being something that needs constant maintenence.

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


# Setup

### TMUX Plugin install

`<CTRL> A <SHIFT> I`

### Neovim Plugin Install

Inside neovim run `:PackerSync`, `:PackerCompile`, and `:PackerClean`

### Commands and use cases

#### Creating a test from a corresponding file

1. Goto the file you want to test, for example `User.php` in the models directory
2. Type `,e` which will try and switch to the test for that class
3. If it can't find one, it will ask if you want to create a feature test or a unit test
4. Once the blank file is open, type `ftest` or `utest` to load a test class snippet

#### Sidebar

`,1` to toggle the sidebar with the current file focused
`,2` to collapse all open directories in the sidebar

#### Buffers

`[b and ]b` to move left and right through buffers

#### Git

`]h and [h` to move up and down through hunks

#### Lsp

Use `:LspInfo` to see what language servers are attached to the current buffer
use `:Mason` to install and update language servers
use `:PhpActorClassNew` to create a new class from a template

#### Terminal

`,cc` to toggle a terminal window that floats

#### Running Tests

`,tt` when viewing a test runs the whole test suite
`,tn` when viewing a test runs the test nearest the cursor
`,tf` when viewing a test runs all the tests in the file

#### Commenting code / Uncommenting Code

Use `SHIFT-V` to get into visual block mode
`gc` to comment or uncomment

#### Change surrounding stuff

To change double quotes to double, from "test" to 'test' place the cursor over the double
quote and then type the command `cs"'` (change surround from " to ')

#### Deleting HTML attributes

Use `dax` to delete around the xml attribute (ie, class="foo") or
Use `dix` to delete inside the xml attribute (ie, class="foo")

#### Fuzzy Finding

`<Ctrl>+P` to find files
`<leader> p` to find files
`<leader> pp` to find files including vendor directories
`<leader> ppp` to find files only in the git repository
`<leader> o` to find recently opened files
`<leader> bb` to find a file in an open buffer
`<leader> ff` to find a file containing some text (ripgrep)

When searching using ripgrep we can pass some extra arguments in the search like so :-

`"foo" app` search for foo in the app directory
`"foo" -tphp` search for foo in php files only
`"foo" -tphp app` search for foo in php files only within the app folder

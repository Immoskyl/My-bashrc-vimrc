"---------- OPTIONS ----------

set nocompatible      "enable features not compatible with vi
set nu                "show current line and column ruler position
set list              "show $ at the end of each line
set hlsearch          "highlight matched text when searching for a pattern
set autoread          "update in Vim files changed outside of Vim
set expandtab         "tabs dynamically translated to spaces
set tabstop=4         "set tabs to 4 spaces
set shiftwidth=4      "set auto indents to 4 spaces
set so=9              "set the start of screen scrolling 9 lines above or below the ruler
set history=999       "set the undo history to maximum
set undolevels=999    "set the undo history to maximum
set nobackup          "do not create a backup file at every file written with Vim
set nowritebackup     "do not create a backup file at every file written with Vim
set noswapfile        "do not create swap files
set ignorecase        "set case insensitive lowercase searches
set smartcase         "set case sensitive uppercase searches
set gdefault          "set g option b y default on substitute command (substitute all occurances on a line)
set magic             "make special character work well in search patterns
set noerrorbells      "turn off the Vim syntax error bell
set showcmd           "show the input for an incomplete Vim command

"---------- SHORTCUTS ----------

":q is case unsensitive
cmap Q q

":w is case unsensitive
cmap W w

"fix for :wq misspelled
cmap qw wq

"F2 key print current date and time
map <F2> a<C-R>=strftime("%c")<CR><Esc>

"F12 key works as escape key
imap <F12> <Esc> 
vmap <F12> <Esc> 

"P pastes the buffer without swapping if with the overriden text
vmap P "0p

"// searches the selected text
vnoremap // y/<C-R>"<CR>

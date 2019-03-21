set nu
set list
set hls
set autoread
set nocompatible
set expandtab
set tabstop=4
set shiftwidth=4
set so=9
set history=999
set undolevels=999
set autoread
set nobackup
set nowritebackup
set noswapfile
set ignorecase smartcase
set gdefault
set magic
set hlsearch
cmap Q q
cmap W w
cmap qw wq
map <F2> a<C-R>=strftime("%c")<CR><Esc>
imap <F12> <Esc> 
vmap <F12> <Esc> 
vmap P "0p
"cmap st ai ; %retab
""cmap ut noai ; %noretab

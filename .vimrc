"""""""""""""""""""""""""""""
" Wolf's .vimrc 
"""""""""""""""""""""""""""""

set ruler
syntax on
set t_Co=256
"colors wombat256
colors xoria256

set history=700

" Persistent Undo
try
  set undodir=~/.vim/undo
  set undofile
catch
endtry

set backspace=indent,eol,start
"set whichwrap+=<,>,h,l
set mouse=a
"set mousem=extend
set clipboard=unnamed
set showmode
set showcmd

autocmd BufNewFile,BufRead .bash_aliases setfiletype sh

"""""""""""""""""""
" Wildmenu Settings
"""""""""""""""""""
set wildmenu
set wildmode=list:longest
"set wildmode=longest:full,full
set wildignore=*.swp,*.db,*.bak,*.old,*.dat,*.tmp

"""""""""""""""""""
" Tab Settings
"""""""""""""""""""
set expandtab
set shiftwidth=2
set softtabstop=2

"""""""""""""""""""
" Search Settings
"""""""""""""""""""
set ignorecase 
set smartcase
set showmatch
set incsearch
"set hlsearch

"""""""""""""""""""
" Key Remaping 
"""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

" Use Y to copy until the end of the line. Use yy to copy the whole line.
nnoremap Y y$

" Map cmd-c and cmd-v to use system clipboard.
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

" Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


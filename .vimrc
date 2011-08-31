"""""""""""""""""""""""""""""
" Wolf's .vimrc
"""""""""""""""""""""""""""""
set ruler
syntax on
set t_Co=256
"colors wombat256
colors xoria256
set mouse=a
set backspace=indent,eol,start
"set whichwrap+=<,>,h,l
set smarttab
set autoindent nocindent nosmartindent
set clipboard=unnamed
set title
set showmode
set showcmd
set laststatus=2
set scrolloff=2   " minimum lines to keep above and below cursor
set hidden
set history=700

autocmd BufNewFile,BufRead,BufEnter .bash_aliases setfiletype sh

"""""""""""""""""""
" Wildmenu Settings
"""""""""""""""""""
set wildmenu
"set wildmode=list:longest
set wildmode=longest,list
"set wildoptions=ignorecase
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
" 
"""""""""""""""""""

" only set if unset, since it has side effects (resetting a bunch of options)
if &compatible
  set nocompatible
endif

" show trailing spaces in yellow (or red, for users with dark backgrounds).
" "set nolist" to disable this.
" this only works if syntax highlighting is enabled.
set list
set listchars=tab:\ \ ,trail:\ ,
if &background == "dark"
  highlight SpecialKey ctermbg=Red guibg=Red
else
  highlight SpecialKey ctermbg=Yellow guibg=Yellow
end

" If swap and undo dirs don't exist, make them and set persistent undo.


" If swap and undo dirs don't exist, make them and set persistent undo.
" ONLY WORKS IN 7.3 and above!
if version >= 703
  function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                  \ 'undo': 'undodir',
                  \ 'swap': 'directory' }

    for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . '/' . dirname
      if exists("*mkdir")
        if !isdirectory(directory)
          call mkdir(directory)
        endif
      endif
      if !isdirectory(directory)
        echo "Warning: Unable to create backup directory: " . directory
        echo "Try: mkdir -p " . directory
      else
        let directory = substitute(directory, " ", "\\\\ ", "")
        exec "set " . settingname . "=" . directory
      endif
    endfor
    if !isdirectory("$HOME/.vim/undo/")
      set undofile
    endif
  endfunction
  call InitializeDirectories()
endif


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


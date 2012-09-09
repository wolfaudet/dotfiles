"""""""""""""""""""
" Wolf's .vimrc
"""""""""""""""""""
" only set if unset, since it has side effects (resetting a bunch of options)
if &compatible
  set nocompatible
endif

set ruler
syntax on
set t_Co=256
"colors wombat256
colors xoria256
set backspace=indent,eol,start
"set whichwrap+=<,>,h,l
set smarttab
set autoindent nocindent nosmartindent
"set clipboard=unnamed
"set clipboard=unnamedplus
set title
set showmode
set showcmd
set laststatus=2
set scrolloff=2   " minimum lines to keep above and below cursor
set hidden
set history=500
"set textwidth=80
"set colorcolumn=+1..+5
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

autocmd BufNewFile,BufRead,BufEnter .bash_aliases setfiletype sh
" Turn off auto linewrap at 80 chars for certain filetypes
au BufRead,BufNewFile *.txt,*.html,.bash_aliases setl tw=0

"""""""""""""""""""
" Mouse Settings
"""""""""""""""""""
map <MouseDown> <Up>
map <MouseUp> <Down>
nmap <LeftMouse> <nop>
nmap <2-LeftMouse> <LeftMouse>

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
" Wildmenu Settings
"""""""""""""""""""
set wildmenu
"set wildmode=list:longest
set wildmode=longest,list
"set wildoptions=ignorecase
"set wildmode=longest:full,full
set wildignore=*.swp,*.db,*.bak,*.old,*.dat,*.tmp

"""""""""""""""""""
" General Key Remapping
"""""""""""""""""""
nnoremap Y y$

let mapleader = ","
let g:mapleader = ","

" Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""
" Long Stuff
"""""""""""""""""""
" show trailing spaces in yellow (or red, for users with dark backgrounds).
" 'set nolist' to disable this.
" this only works if syntax highlighting is enabled.
set list
set listchars=tab:\ \ ,trail:\ ,
if &background == "dark"
  highlight SpecialKey ctermbg=Red guibg=Red
else
  highlight SpecialKey ctermbg=Yellow guibg=Yellow
end

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

" OS specific stuff
if has("unix")
  let uname = system("uname")
  if uname =~ "Darwin"
    set mouse=a
    source ~/google.vim
  else
    source /usr/share/vim/google/google.vim
  endif
endif

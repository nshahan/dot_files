filetype off

"
" General Settings
"
set nocompatible                " No compatibility with legacy vi
set encoding=utf-8              " UTF8 encoding
set hidden                      " Allow buffer switching without saving
set clipboard=unnamed           " Map default copy/paste to * (clipboard)

"
" Editor view
"
syntax on                       " Syntax highlighting
set number                      " Line numbers
hi LineNr ctermfg=grey
set showmatch                   " Show matching brackets/parenthesis
set scrolloff=5                 " Minimum lines to keep above/below cursor
set colorcolumn=81              " Show 80 col marker
hi ColorColumn ctermbg=darkgrey
set showmatch                   " Show matching braces

"
" UI
"
set laststatus=2                " Always show status bar
set mouse=a                     " Enable mouse
set showmode                    " Display the current mode
set showcmd                     " Display incomplete commands
set autoread                    " Automatically read file changes from outside.
set cursorline                  " Highlight the current line
set ruler                       " Show col/row numbers in status bar
set spell                       " Spellcheck on
set spelllang=en                " Spellcheck language
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad ctermfg=darkred

"
" Search
"
set incsearch                   " Incremental
set hlsearch                    " Highlight results
set ignorecase                  " Case insensitive...
set smartcase                   " ...unless search contains a capital letter

"
" Formatting
"
set nowrap                      " Don't wrap lines
set autoindent                  " Take indentation from previous line
set smarttab                    " Make <tab> and <backspace> smarter
set shiftwidth=2                " A tab is two spaces
set softtabstop=2
set tabstop=2                   " Indentation of two spaces
set expandtab                   " Use spaces, not tabs
set backspace=indent,eol,start  " Backspace through everything in insert mode

" Plugins via vim-plug
" github.com/junegunn/vim-plug

filetype plugin indent off

call plug#begin('~/.vim/plugged')

Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Initialize plugin system
call plug#end()

" Dart language server
let g:lsc_server_commands = {
    \ 'dart': 'dart_language_server',
    \ 'html': 'dart_language_server',
    \}
let g:lsc_auto_map = v:true
let g:lsc_enable_apply_edit = v:true


" Map j then k to <esc>
inoremap jk <esc>

" Cursor shapes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Remove trailing white space on save
function! <SID>StripTrailingWhitespaces()
  " Preparation, save last search, and cursor position.
  let _s=@/
  let l = line('.')
  let c = col('.')
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * call <SID>StripTrailingWhitespaces()
"
"NERDTree config
"

" Show hidden files
let NERDTreeShowHidden=1

" Start NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

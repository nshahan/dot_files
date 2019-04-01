filetype off

"
" General Settings
"
set ttyfast
set lazyredraw
set nocompatible                " No compatibility with legacy vi
set encoding=utf-8              " UTF8 encoding
set hidden                      " Allow buffer switching without saving
set clipboard=unnamed           " Map default copy/paste to * (clipboard)
set nobackup                    " Don't save backup versions of files

" Cursor shapes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"
" Editor view
"
syntax on                       " Syntax highlighting
set number                      " Line numbers
"hi LineNr ctermfg=grey
set showmatch                   " Show matching brackets/parenthesis
set scrolloff=5                 " Minimum lines to keep above/below cursor
set colorcolumn=81              " Show 80 col marker
"hi ColorColumn ctermbg=darkgrey
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
set splitbelow                  " Open new horizontal splits below
set splitright                  " Open new vertical splits to the right
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

"
" Key Mappings
"
" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" j then k --> <esc>
inoremap jk <esc>

" Plugins via vim-plug
" github.com/junegunn/vim-plug

filetype plugin indent off

call plug#begin('~/.vim/plugged')

Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()

" Color scheme setup
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

colorscheme base16-eighties

" Dart language server
let g:lsc_server_commands = {
    \ 'dart': 'dart_language_server',
    \ 'html': 'dart_language_server',
    \}
let g:lsc_auto_map = v:true
let g:lsc_enable_apply_edit = v:true

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Run dartfmt on save.
let dart_format_on_save = 1

" Close preview window after autocomplete.
autocmd CompleteDone * silent! pclose

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

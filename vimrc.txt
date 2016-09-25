set nocompatible
filetype off
filetype plugin indent off


set encoding=utf-8

filetype plugin indent on    " required

" Misc editor features
set autoindent
set ruler
set relativenumber
set noshowmode
set showmatch
set ignorecase
set incsearch
set laststatus=2
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set hlsearch
set cursorline

" Misc prefrences
syntax on
inoremap jk <esc>
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Remove trailing whitespace on save
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
filetype plugin on
autocmd BufWritePre * call <SID>StripTrailingWhitespaces()
source ~/.vim/vimrc_py

set autoindent
set smarttab
set ts=4
set sw=4
set et
set number
set cursorline
set nowrap
set backspace=indent,eol,start

colorscheme mihasya

augroup mkd

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;

augroup END

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

au! BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.g set syntax=antlr3

au CursorHold * checktime
au WinEnter * checktime
au BufWinEnter * checktime

"ctrl-s mapping
imap <C-s> <Esc>:w<CR>a
nmap <C-s> :w<CR>

"I don't want fucking swap files
set backupdir=/tmp
set directory=/tmp

set rtp+=/usr/local/go/misc/vim
set rtp+=/usr/go/misc/vim
filetype plugin indent on
syntax on

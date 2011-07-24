source ~/.vim/vimrc_py

set autoindent
set smarttab
set ts=4
set number
set cursorline
set nowrap

colorscheme mihasya

augroup mkd

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;

augroup END


au CursorHold * checktime
au WinEnter * checktime
au BufWinEnter * checktime

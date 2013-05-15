set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

source ~/.vim/my_bundles


"source ~/.vim/vimrc_py

set autoindent
set smarttab
set ts=4
set sw=4
"set et
set number
set cursorline
set nowrap
set backspace=indent,eol,start
set splitbelow
set laststatus=2

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

"*autocmd FileType go compiler golang
"let g:golang_goroot = "/usr/local/go"

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

" Syntastic options
let g:syntastic_auto_loc_list=1
" Tagbar
nmap <F8> :TagbarToggle<CR>
source ~/.vim/tagbar_config
filetype plugin on
let $PATH=$PATH . ":/Users/mihasya/bin:/home/mihasya/bin"

" supertab completion options
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" ctrlp
let g:ctrlp_working_path_mode = 'r'

" running stuff via tmux
nmap <buffer> gr :call VimuxRunCommand("")<left><left>
nmap <buffer> grr :VimuxRunLastCommand<cr>
nmap <buffer> grc :VimuxCloseRunner<cr>

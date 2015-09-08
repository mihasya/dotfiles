if exists ("b:did_goft")
	finish
endif
let b:did_goft=1

setlocal omnifunc=gocomplete#Complete
" Commands for using templates to accelerate certain tasks in Go

nmap <buffer> ggt :call goutil#GoFindOrCreateTest()<CR>

let g:go_fmt_command="goimports"

" turn on extras per https://github.com/fatih/vim-go#settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" automatically call gofmt on every save; i think this is done by fatih/go-vim
" now
" augroup gofmt
	"autocmd FileType go autocmd BufWritePre <buffer> silent Fmt
" augroup END

nmap <Leader>s <Plug>(go-implements)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>r <Plug>(go-rename)

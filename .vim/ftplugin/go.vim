if exists ("b:did_goft")
	finish
endif
let b:did_goft=1

setlocal omnifunc=gocomplete#Complete
" Commands for using templates to accelerate certain tasks in Go

nmap <buffer> ggt :call goutil#GoFindOrCreateTest()<CR>

let g:gofmt_command="goimports"

" automatically call gofmt on every save
augroup gofmt
	autocmd FileType go autocmd BufWritePre <buffer> silent Fmt
augroup END

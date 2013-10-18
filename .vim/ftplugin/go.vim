setlocal omnifunc=gocomplete#Complete
" Commands for using templates to accelerate certain tasks in Go

nmap <buffer> ggt :call goutil#GoFindOrCreateTest()<CR>

" automatically call gofmt on every save
augroup gofmt
	autocmd FileType go autocmd BufWritePre <buffer> Fmt
augroup END

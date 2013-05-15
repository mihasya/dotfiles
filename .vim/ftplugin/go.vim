setlocal omnifunc=gocomplete#Complete
" Commands for using templates to accelerate certain tasks in Go

nmap <buffer> gt :call GoFindOrCreateTest()<CR>

" automatically call gofmt on every save
augroup gofmt
	autocmd BufWritePre,FileWritePre,FileAppendPre 		*.go Fmt
augroup END

function! GoFindOrCreateTest()
    let fname = split(expand('%:t'), '[.]')[0]
    let test_name = fname . "_test.go"
    if (findfile(test_name, expand('%:p:h')) ==# "")
        let exists = 0
    else
        let exists = 1
    endif
    let path = expand('%:p:h') . '/' . test_name
    execute 'sp ' . path
    if (exists == 0)
        execute "normal igocheck\<Tab>"
    endif
endfunction

setlocal omnifunc=gocomplete#Complete
" Commands for using templates to accelerate certain tasks in Go

nmap <buffer> ggt :call GoFindOrCreateTest()<CR>

" automatically call gofmt on every save
augroup gofmt
	autocmd FileType go autocmd BufWritePre <buffer> Fmt
augroup END

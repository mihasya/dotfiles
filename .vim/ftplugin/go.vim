setlocal omnifunc=gocomplete#Complete
" Commands for using templates to accelerate certain tasks in Go

nmap <buffer> gt :call GoFindOrCreateTest()<CR>

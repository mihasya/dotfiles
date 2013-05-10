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
        r ~/.vim/tpl/go_gocheck.tpl
        call search("Foo")
        execute "normal! vt(\<C-G>"
    endif
endfunction

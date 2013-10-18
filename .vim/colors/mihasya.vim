hi clear Normal
set bg=dark

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mihasya"

" vim: sw=2
set background=dark
hi NonText ctermfg=0
hi LineNr 		cterm=none ctermfg=245 guibg=none gui=none
hi CursorLine   cterm=none ctermbg=237 ctermfg=none
hi Cursor   	cterm=inverse
hi VertSplit    cterm=none ctermbg=240 ctermfg=240

hi comment ctermfg=248
hi statement ctermfg=214
hi Function ctermfg=166
hi Constant ctermfg=64
hi Number ctermfg=176
hi String ctermfg=176
" hi string ctermfg=244
" hi todo ctermbg=60
hi Pmenu ctermbg=239
hi TabLine ctermbg=240 cterm=none
hi TabLineFill ctermfg=240
hi TabLineSel cterm=bold ctermbg=168 ctermfg=16

 hi StatusLineNC ctermfg=233 ctermbg=230
hi StatusLine cterm=standout

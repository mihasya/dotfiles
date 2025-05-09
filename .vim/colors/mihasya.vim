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
hi LineNr 		cterm=NONE ctermfg=245 guibg=NONE gui=NONE
hi CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE
hi Cursor   	cterm=inverse
hi VertSplit    cterm=NONE ctermbg=240 ctermfg=240

hi comment ctermfg=248
hi statement ctermfg=214
hi Function ctermfg=166
hi Constant ctermfg=64
hi Number ctermfg=176
hi String ctermfg=176
" hi string ctermfg=244
" hi todo ctermbg=60
hi Pmenu ctermbg=239
hi TabLine ctermbg=233 ctermfg=240 cterm=NONE
hi TabLineFill ctermfg=233
hi TabLineSel cterm=bold ctermbg=233 ctermfg=230

hi StatusLineNC ctermfg=233 ctermbg=240
hi StatusLine ctermfg=233 ctermbg=230 cterm=standout

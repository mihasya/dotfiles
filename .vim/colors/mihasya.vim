" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
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
hi Normal  ctermbg=0
hi NonText ctermbg=0 ctermfg=0
hi LineNr 		cterm=none ctermbg=0 ctermfg=245 guibg=none gui=none
hi CursorLine   cterm=none ctermbg=236 ctermfg=none guibg=darkred guifg=none
hi VertSplit    cterm=none ctermbg=240 ctermfg=240

hi comment ctermfg=248
hi statement ctermfg=214
hi Function ctermfg=166
hi Constant ctermfg=64
hi Number ctermfg=176
hi String ctermfg=176
" hi string ctermfg=244
" hi todo ctermbg=60

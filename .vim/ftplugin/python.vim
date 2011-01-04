" Set tab stobs and generic settings for python
" buffers. Joy for everyone.

setlocal tabstop=8 " Setting this to 8 hard tabs so I can tell them
		   " apart more easily. Fear not, shiftwidth is still 4.
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=72
setlocal smarttab
setlocal expandtab
setlocal autoindent ai
setlocal shiftround " Indent to multiples of shiftwidth. <3

" Anal retentive settings for PEP8
setlocal list listchars=tab:>~,trail:* " Display tabs and trailing spaces
match Error /\%>78v.\+\| \+$/ " Err-hilight text past column 78 and spaces
setlocal formatoptions=cq " Autowrap comments to textwidth, but not code.

" Syntax tweaks
" Change indent after an open paren to be aligned on shiftwidth
" instead of tcie the shiftwidth. This had always annoyed me.
" Change indent after an open paren to the same as the shiftwidth
let g:pyindent_open_paren = '&sw'

" highlight settings
"let python_highlight_builtins=1
"let python_highlight_builtin_objs=1
"let python_highlight_builtin_funcs=1
"let python_highlight_exceptions=1
"let python_highlight_string_formatting=1
"let python_highlight_string_format=1
"let python_highlight_string_templates=1
"let python_highlight_space_errors=1
"let python_highlight_doctests=1

let python_highlight_all = 1 " MOAR COLORS

" Speaking of, let's hardcode colors for SpellBad highlights.
" PyFlakes uses it.
highlight SpellBad ctermbg=Red ctermfg=Yellow

" Set Pylint as compiler
compiler pylint

" Do not autorun pylint on write.
" It is utterly annoying. I'd rather call it myself when
" I want to, with :make or :Pylint.
let g:pylint_onwrite = 0



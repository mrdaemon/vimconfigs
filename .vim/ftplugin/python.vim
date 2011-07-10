" Set tab stobs and generic settings for python
" buffers. Joy for everyone.

" -*-*- TL;DR: Set python files to use 4 spaces for tabs -*-*-

setlocal tabstop=8 " Set hard tab value to 8 columns (8 spaces)
		   " Only affects value of an actual tab, not what you insert
		   " nor indentation. Leave at 8 to tell soft/hard tabs
		   " apart easily.

setlocal softtabstop=4  " Tab size in insert mode. Behaviour is highly
			"  dependent on respective tabstop/softtabstop values
			"  as well as if expandtabs is turned on. See help
			"  for 'softtabstop' and 'expandtab' for more details.
setlocal shiftwidth=4	" Indentation size in columns. Indent to 4 spaces.
setlocal expandtab	" Hitting tab expands to required amount of spaces to
			"  match tab size. This is what we want. Soft,
			"  space-based tabs all over the place.

setlocal smarttab	" <Tab> in front of a line inserts value of
			"  'shiftwidth', tabstop/softtabstop is used
			"  elsewhere instead.

setlocal autoindent " Enable autoindent.
setlocal shiftround " Indent to multiples of shiftwidth

setlocal textwidth=72 " Wrap text to 72 columns. Note that this doesn't affect
		      " code, only comments and plain text (heredocs, multil.)
		      " See 'formatoptions below'

" Anal retentive settings for PEP8
match Error /\%>78v.\+\| \+$/ " Err-hilight text past column 78 and spaces
setlocal formatoptions+=cq " Autowrap comments to textwidth, but not code.

" Syntax tweaks
" Change indent after an open paren to be aligned on shiftwidth
" instead of twice the shiftwidth. This had always annoyed me.
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

let python_highlight_all = 1 " MOAR COLORS. Encompasses everything above.

" Speaking of, let's hardcode colors for SpellBad highlights.
" PyFlakes uses it. 
"
" (Disabled because cterm bg colors are horrible. I don't mind if it
" is turned off in non-256colors terminals, I mostly use gvim.)
"highlight SpellBad ctermbg=Red ctermfg=Yellow

" Set Pylint as compiler
" (Requires pylint plugin)
compiler pylint


" Strips spurious whitespace on save
func! b:DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py call b:DeleteTrailingWS()




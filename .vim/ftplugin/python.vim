setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal smartindent

set makeprg=pyflakes "%"

command Pyflakes :call Pyflakes()
function! Pyflakes()
	setlocal makeprg=(pyflakes "%")
	silent make
	cwindow
endfunction

command Pylint :call Pylint()
function! Pylint()
	setlocal makeprg=(echo\ '[%]';\ pylint\ %)
	setlocal efm=%+P[%f],%t:\ %#%l:%m
	silent make
	cwindow
endfunction

"autocmd BufWrite *.{py} :call Pyflakes()

"map <F7> :Pyflakes <cr>
"map <F8> :Pylint <cr>


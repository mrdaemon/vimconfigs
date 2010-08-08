"set complete+=k~/.vim/syntax/python.vim isk+=.,(

" For vicle plugin
let w:vicle_selection_string = "0v}y"

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
setlocal autoindent ai

command Pyflakes :call Pyflakes()
function! Pyflakes()
    let tmpfile = tempname()
    execute "w" tmpfile
    execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
    make
    cw
endfunction

command Pylint :call Pylint()
function! Pylint()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    silent make
    cwindow
endfunction

autocmd BufWrite *.{py} :call Pyflakes()

" highlight settings
let python_highlight_builtins=1
let python_highlight_builtin_objs=1
let python_highlight_builtin_funcs=1
let python_highlight_exceptions=1
let python_highlight_string_formatting=1
let python_highlight_string_format=1
let python_highlight_string_templates=1
let python_highlight_space_errors=1
let python_highlight_doctests=1

" Snipplets
autocmd BufNewFile,BufRead *.py inorea <buffer> def <s-tab>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\npass")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> class <s-tab>=IMAP_PutTextWithMovement("class <++>(Object):\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> for <s-tab>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> if <s-tab>=IMAP_PutTextWithMovement("if <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> ifelse <s-tab>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<CR>

imap <s-tab> <C-j>

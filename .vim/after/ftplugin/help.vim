" Fuck the default keybindings, seriously.
" They don't work all that well on canadian french keyboards.
"
" Within help files, I'd rather jump to and back to tags
" using control enter and backspace.
"
" Also navigation to next/previous tag with tab/shift-tab.
" MUCH MORE COMFORTABLE.

" FORCIBLY ENABLING REMAPPING FOR THIS VERY BUFFER >:(
nmap <buffer><CR> <C-]>
nmap <buffer><BS> <C-T>

nnoremap <buffer> <Tab> /<Bar>\zs\k*\ze<Bar><CR>
nnoremap <buffer> <S-Tab> ?<Bar>\zs\k*\ze<Bar><CR>


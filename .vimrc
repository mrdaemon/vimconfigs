" Generic stuff that cannot be lived without
set nocompatible
syntax on
set number "Line numbering
set hidden " Keep buffers open, allows switch without save
set bufhidden=hide " This is to prevent remote edit fuckups
set history=1000 " Larger command history
colorscheme desert256 " Assume we are running off a low color terminal

" Kill search highlight with C-n 
nmap <silent> <C-N> :silent noh<cr>

" Incremental search, ignores case
" (Except for explicitely specified uppercase characters)
set incsearch
set ignorecase
set smartcase

" Status Line full of awesome junk
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" Enable cold folding
"set foldenable
"set fdm=indent

" Space as 'toggle fold' key
"nnoremap <space> za

" Toggle line numbering with F3
nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

" Navigate buffers with F1 and F2
noremap <F1> :bprev!<CR>
noremap <F2> :bnext!<CR>

" Enable filetype plugin so I don't clutter this.
filetype plugin indent on

" Somehow this doesn't work at all in python.vim
" through ftplugin. No clue why. So here it is. 
let python_highlight_all = 1

" gVim specific junk
if has("gui_running")
	" Remove toolbar from gVim, because, frankly, it's a waste of space.
	set guioptions-=T

	" Awesomest non-256 colors theme if running in gVim
	colorscheme desert
endif

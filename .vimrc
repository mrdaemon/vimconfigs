" Generic stuff that cannot be lived without
set nocompatible
syntax on
set number "Line numbering
set hidden " Keep buffers open, allows switch without save
set bufhidden=hide " This is to prevent remote edit fuckups
set history=1000 " Larger command history
set showmatch " Briefly display matching brackets when inserting such.
colorscheme desert256 " Assume we are running off a low color terminal

" Kill search highlight with C-n 
nmap <silent> <C-N> :silent noh<cr>

" Incremental search, ignores case
" (Except for explicitely specified uppercase characters)
set incsearch
set ignorecase
set smartcase

" Status Line full of awesome junk
"   Filename
"   end line forat (DOS/UNIX)
"   Detected filetype
"   ASCII and Hex for current char
"   Postion (row, col)
"   Linecount
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Enable code folding
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

	" vim 7+: Change status line color in insert mode
	if version >= 700
		au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=bold,reverse
		au InsertLeave * hi StatusLine term=reverse ctermfg=0 gui=none
	endif
endif

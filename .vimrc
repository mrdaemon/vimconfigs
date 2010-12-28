" Generic stuff that cannot be lived without
set nocompatible
set number "Line numbering
set hidden " Keep buffers open, allows switch without save
set bufhidden=hide " This is to prevent remote edit fuckups
set history=1000 " Larger command history
set title " Set terminal title to filename.
set showmatch " Briefly display matching brackets when inserting such.
set matchtime=10 " How long to flash matching brackets, in 1/10th of a sec.

" I keep forgetting some OSes suck.
" Let's have some better backspace action.
set backspace=indent,eol,start

" Wild completion menu.
" Slightly better tabbing.
set wildmenu
set wildmode=list:longest,full
set wildignore=.svn,.hg,.git,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,jar,exe,bin,zip

set cursorline  " Highlight current line.
set startofline " Move to first non-blank character of a line
		" after jump. Also I lied in earlier changesets.
		" Turns out I like it.

" Enable 256 colors terminal.
" Comment out if it bugs you.
set t_Co=256

colorscheme mustang " This color scheme supports 256 colors too,
		    " So, no need for the former hackery. (see history)
		    " Do note that since Terminal.app (Mac OS X) sucks
		    " so bad it's actually painful, that will result in a
		    " blinking screen forever.

" Kill search highlight with C-n 
nmap <silent> <C-N> :silent noh<cr>

" Incremental search, ignores case
" (Except for explicitely specified uppercase characters)
set incsearch
set ignorecase " Case Insensitive
set smartcase  " Case sensitive if caps
set infercase  " Adjust case of completed text
               " to be like that of the match.

set smartindent " Proper awesome indenting

" I suppose I very well could use some mouse.
" Everywhere. All the time. Always full of mouse support.
set mouse=a

" Shorten the irritating 'Press ENTER or type command' messages.
" Also removes the plea for the poor children in uganda.
set shortmess=aI

" For the love of god STOP BLEEPING WHILE I'M AT WORK
set visualbell

" Status Line full of awesome junk
"   First block is flags:
"     Filename (full path)
"     Modified Flag
"     Read Only Flag
"     helo flag
"     preview flag
"     
"   end line format (DOS/UNIX)
"   Detected filetype
"   ASCII and Hex for current char
"   Postion (row, col)
"   Linecount
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Always show status bar.
" Always. All the time.
set laststatus=2

" Disable redrawing of the UI while executing
" macros, registers and friends.
set lazyredraw

" Toggle line numbering with F3
nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

" Navigate buffers with F1 and F2
noremap <F1> :bprev!<CR>
noremap <F2> :bnext!<CR>

" MiniBufExpl behaviour:
let g:miniBufExplMapWindowNavVim = 1 " Maps ctrl+ vim movement keys to window navigation
let g:miniBufExplMapWindowNavArrows = 1 " Maps ctrl + arrows to window navigation
let g:miniBufExplMapCTabSwitchBufs = 0 " Switch buffer tabs with <C-TAB> and <C-S-TAB> 
let g:miniBufExplModSelTarget = 1   " Coerces buffers into not appearing in non-editable windows.
let g:miniBufExplUseSingleClick = 0 " Activate buffer tabs with a single click

" Bind <F4> to MiniBufExpl toggle (hide/show) 
noremap <F4> :TMiniBufExplorer<CR>

" PURTY COLORS IN MY CODE
" THEY ARE REQUIRED
syntax on

" Enable filetype plugin so I don't clutter this.
filetype plugin indent on

" Keep 4 lines on screen while scrolling,
" because I hate going 'Uh.. did.. I miss it?'
set scrolloff=4

" gVim specific junk
if has("gui_running")
	" Remove toolbar and scrollbars from gVim, 
        " because, frankly, they are a waste of space.
	" Also, really stupid bug where I have to set the options
	" I wish to remove first. This baffles me, but it works.
	set guioptions+=Trl
	set guioptions-=Trl

        " Use text more dialogs even in gvim.
        " The ugly gtk boxes annoy me.
        " Also, do show the scrollbars in the event there's a
        " vertically split window.
        set guioptions+=cLR

	" Set font. I tend to change this a lot
	" depending on the Machine, OS, and DPI.
	set guifont=Monaco 12


	" vim 7+: Change status line color in insert mode
        " Have I ever mentioned how much I love this?
	if version >= 700
		au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=bold,reverse
		au InsertLeave * hi StatusLine term=reverse ctermfg=0 gui=none
	endif

	" Technically, according to the documentation
	" (try :help mousehide if you think I'm a filthy liar)
	" The default behavior in the gui is to hide the mouse pointer
	" when you are typing, and bring it back once you stop.
	" On my system it's just always gone forever.
	" So, we remedy this.
	set nomousehide
endif

" Still there? Have some crappy easter eggs.
map <F12> ggVGg?



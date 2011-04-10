"         ,-.-. .=-.-.       ___                _,.----.
"  ,--.-./=/ ,//==/_ /.-._ .'=.'\  .-.,.---.  .' .' -   \
" /==/, ||=| -|==|, |/==/ \|==|  |/==/  `   \/==/  ,  ,-'
" \==\,  \ / ,|==|  ||==|,|  / - |==|-, .=., |==|-   |  .
"  \==\ - ' - /==|- ||==|  \/  , |==|   '='  /==|_   `-' \
"   \==\ ,   ||==| ,||==|- ,   _ |==|- ,   .'|==|   _  , |
"   |==| -  ,/|==|- ||==| _ /\   |==|_  . ,'.\==\.       /
"   \==\  _ / /==/. //==/  / / , /==/  /\ ,  )`-.`.___.-'
"    `--`--'  `--`-` `--`./  `--``--`-`--`--'
"
" Specific vim setting for GUI modes (gvim)
" Alexandre Gauthier <alex@underwares.org>
"
" Up to date version always on github:
"   https://github.com/mrdaemon/vimconfigs
"
"-----------------------------------------------------------------------------

" Remove toolbar and scrollbars from gVim,
" because, frankly, they are a waste of space.
set guioptions-=T
set guioptions-=r
set guioptions-=l

" Only remove menubar on non-windows platforms.
" The windows version looks a bit like ass without it,
" somehow, it develops ugly white borders around
" the bottom frame, I have no clue where they come from.
if !has("gui_win32")
        :set guioptions-=m
endif

" colorscheme to use for GUI
"set background=dark
"colorscheme solarized

" Overridding the color column color in gvim as well -- the colorscheme
" change above will reset it.
" TODO: make this into a function.
if version >= 703
    set colorcolumn=80 " Highlight column 80, as a guide.

    " Override color for highlighted column
    " Often it is this eye melting red (Unecessary for liquidcarbon and nazca)
    "hi ColorColumn term=reverse ctermbg=238 guibg=#1f1f1f
endif

" Set GUI Font depending on the kind of gui/platform being loaded.
" TODO: Set these fonts correctly once I load this on my other work platforms.
if has("gui_win32")
	:set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
elseif has("gui_macvim")
	:set antialias " Use smooth, antialiased fonts (OS X Specific)
	:set guifont=Menlo\ Regular:h12
endif

" MacVim specific: Set fullscreen options to be ass full screen as possible
if has("gui_macvim")
    set fuoptions=maxhorz,maxvert
endif

" Technically, according to the documentation
" (try :help mousehide if you think I'm a filthy liar)
" The default behavior in the gui is to hide the mouse pointer
" when you are typing, and bring it back once you stop.
" On my system it's just always gone forever.
" So, we remedy this.
set nomousehide

" 'Config changed' autocmd hook
autocmd BufWritePost $MYGVIMRC let g:needrestart = 1

" Attempt to source .gvimrc.local for very machine-specific configurations that
" would benefit absolutely no one by being here. Mostly bug workarounds.
if filereadable(expand('~/.gvimrc.local'))
    source ~/.gvimrc.local
endif

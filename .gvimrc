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
set guioptions-=m
set guioptions-=r
set guioptions-=l

" colorscheme to use for GUI
let g:liquidcarbon_high_contrast=1
colorscheme liquidcarbon

" Overridding the color column color in gvim as well -- the colorscheme
" change above will reset it. 
" TODO: make this into a function.
if version >= 703
    set colorcolumn=80 " Highlight column 80, as a guide.
    
    " Override color for highlighted column
    " Often it is this eye melting red.
    hi ColorColumn term=reverse ctermbg=238 guibg=#1f1f1f
endif

" Set GUI Font depending on the kind of gui/platform being loaded.
" TODO: Set these fonts correctly once I load this on my other work platforms.
if has("gui_win32")
	:set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
elseif has("gui_macvim")
	:set guifont=Menlo\ Regular:h12
endif

" Technically, according to the documentation
" (try :help mousehide if you think I'm a filthy liar)
" The default behavior in the gui is to hide the mouse pointer
" when you are typing, and bring it back once you stop.
" On my system it's just always gone forever.
" So, we remedy this.
set nomousehide

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
" Also, for some reason
set guioptions-=T
set guioptions-=r
set guioptions-=l

" Set GUI Font depending on the kind of gui/platform being loaded.
" TODO: Set these fonts correctly once I load this on my other work platforms.
if has("gui_win32")
	:set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
endif

" Technically, according to the documentation
" (try :help mousehide if you think I'm a filthy liar)
" The default behavior in the gui is to hide the mouse pointer
" when you are typing, and bring it back once you stop.
" On my system it's just always gone forever.
" So, we remedy this.
set nomousehide

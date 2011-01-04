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
set guioptions-=Trl
set guifont=Monaco 12

" Technically, according to the documentation
" (try :help mousehide if you think I'm a filthy liar)
" The default behavior in the gui is to hide the mouse pointer
" when you are typing, and bring it back once you stop.
" On my system it's just always gone forever.
" So, we remedy this.
set nomousehide
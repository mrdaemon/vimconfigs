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
" Main vim editor confirguation file
" Alexandre Gauthier <alex@underwares.org>
"
" Up to date version always on github:
"   https://github.com/mrdaemon/vimconfigs
"
"-----------------------------------------------------------------------------

" Using pathogen to split plugins into 'bundles'.
" Feels a lot neater. Must be called first with filetype disabled.
"   @ See vim.org script 2332
"   @ https://github.com/tpope/vim-pathogen
" -- Pathogen --
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" --

" -- Base, Important editor behavior --
set nocompatible            " This is not 1979 anymore. Sorry, grandpa vi.
filetype plugin indent on   " Turns on filetype detection and loading of
                            " plugin and syntax files.
" --

" -- Editor messages, info and verbosity --
set showcmd        " Show current command, text area etc as last line
set shortmess=aI   " Use abbreviated messages and selfishly ignore uganda
""set cmdheight=2    " Larger command window, more space for messages, which
                   "  directly translates to less *hit ENTER to continue*
		   "  crap. God that can kill a good workflow.
set visualbell     " For the love of god STOP BLEEPING WHILE I'M AT WORK
" --

" -- Editor Movement, searching and patterns --
set startofline  " Move to first non-blank character of a line
set incsearch    " Incremental search
set ignorecase   " Case Insensitive
set smartcase    " Case sensitive if caps
" --

" -- Text Display Options --
set scrolloff=4 " Keep 4 lines on screen while scrolling,
                "  because I hate going 'Uh.. did.. I miss it?'
set number      " Line numbering
" --

" -- Highlighting, spelling and Text Appearance --
syntax on          " Auto select syntax highlighting from filetype

" Color Scheme for terminal
" (GUI colorscheme is defined in gvim)
colorscheme solarized

set cursorline     " Highlight current line.
set hlsearch       " Highlight search results

" Override underline for CursorLine on cterm
" It annoys me more than it actually helps.
hi CursorLine cterm=none

" Column highlight is only supported on vim 7.3+
if version >= 703
    set colorcolumn=80 " Highlight column 80, as a guide.

    " Override color for highlighted column
    " Often it is this eye melting red. (Unecessary for liquidcarbon/nazca)
    "hi ColorColumn term=reverse ctermbg=238 guibg=#1f1f1f
endif
" --

" -- Windows, Tabs and buffers behavior --

"  -Windows:
set laststatus=2   " Always show status bar

" Status Line full of awesome junk.
" Information marked with '*' requires extra functions,
" most likely defined below.
"
"   First block is flags:
"     Buffer Number
"     Filename (full path)
"     Modified Flag
"     Read Only Flag
"     helo flag
"     preview flag
"     Fugitive (git) status
"
"   Detected filetype
"   Gzipped flag*
"
"   File Encoding*
"   end line format (DOS/UNIX)
"
"   Position block:
"     line,column
"     Percentage/File linecount
"
"   Character block:
"     ASCII and Hex for current char
"  
"   Restart needed flag*
"
set statusline=%n\:%f%m%r%h%w%{fugitive#statusline()}\ \%y\%{SafeGet('b:gzf','[gz]')}\ \|%{FileEncoding()}\|%{&ff}\|\ \|\%04l,%04v\|%p%%/%L\|\ \|char\:%03.3b\|0x%02.2B\|\ %{SafeGet('g:needrestart','**CONFIG\!**\ ')}


"  -Buffers:
set hidden         " Don't unload buffers when the windows is no longer shown.
                   "  Allows you to navigate buffers without saving them.

set bufhidden=hide " Set default action of buffers that are no longer
                   "  in a window to be hidden. This is the default, and is
                   "  per-buffer, but I set it there anyways -- I once had
                   "  a remote edit go terribly wrong when switching buffers
                   "  and forcing this on loading the first buffer prevented
                   "  it. It probably is not necessary, feel free to ignore.

set autoread       " Automatically reload  externally changed file

"  -Tabs:
set showtabline=1  " Only show tabline if there are more than one tab open.

" -- Terminal Settings --
set ttyfast  " Better, faster redrawing on modern ttys.
             "  Yeah... remember to turn this off if redrawing
             "  goes awry wherever you use this.

set title    " Set terminal title to filename and status

set t_Co=256 " Force terminal into 256 colors mode.
             "  ** this WILL be nasty on crappy terms like Terminal.app **
" --

" -- Mouse settings
set mouse=a  " Enable mouse in all supported modes.
" --

" -- Text editing settings --
set infercase    " Adjust case of completed text
                 "  to be like that of the match.

set showmatch    " Briefly display matching brackets when inserting such.
set matchtime=10 " How long to flash matching brackets, in 1/10th of a sec.
set backspace=indent,eol,start  " Make backspace useful in insert mode.
" --

" -- Indent and tabbing --
"  NOTE: The proper tabbing settings, i.e. shiftwdith, tabstop, etc
"        are all defined in their specific filetype plugins.
set smartindent   " Proper awesome indenting
" --

"-- Insert mode completion
set completeopt=menu,preview 	" Use popup menu *and* preview window

" -- Command line Editing
set history=1000                " Larger command history
set wildmenu                    " Enable completion menu
set wildmode=list:longest,full  " Command line completion

" Ignore these partterns while tabbing out to complete
set wildignore=.svn,.hg,.git,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,jar,exe,bin,zip
" --

" -- Misc and AutoCommands --
set encoding=utf-8  " Default encoding used through vim

" Source guard. Everything breaks in creative ways if you just re-source
" .vimrc in a futile attempt to reload without restarting.
if !exists("vimrc_sourced")

    " vim 7+: Change status line color in insert mode
    " Have I ever mentioned how much I love this?
    if version >= 700
        " Function to save current status line highlight
        " settings for StatusLine and StatusLineNC
        "
        " Not sure where I originally got the reference code I based
        " this function upon. Credit goes to whoever wrote the code fragment
        " which has been sitting in my ~/tmp for ages until I shaped it into this.
        let s:sline_hi = {}
        function! s:save_statuslinehl()
            for g in ['StatusLine', 'StatusLineNC']
                let l:current = ''
                redir => l:current
                silent exec 'hi '.g
                redir END

                " Dict to hold the values we will be
                " modifying -- set to NONE for now.
                let l:vals = {}
                for a in ['term', 'cterm', 'gui']
                    let l:vals[a] = 'NONE'
                endfor

                " Parse current values, map out to attributes
                " defined above, and save as s:savedstatus_hi[group]
                for token in split(l:current)[2:-1]
                    let [attribute, value] = split(token, '=')
                    let l:vals[attribute] = value
                endfor
                let s:sline_hi[g] = join(map(items(l:vals),'v:val[0]."=".v:val[1]'))
            endfor
        endfunction

        call s:save_statuslinehl() " Call our save function once at load

        au ColorScheme * call s:save_statuslinehl() " Save on scheme change
        au InsertEnter * hi StatusLine term=reverse cterm=reverse gui=reverse,bold
        au InsertLeave * exec 'hi StatusLine '.s:sline_hi['StatusLine']
    endif

    " Safe-Get.
    " return variable value or empty string.
    function! SafeGet(var, val)
        if exists(a:var)
            return a:val
        else
            return ''
        endif
    endfunction

    " Returns current file encoding.
    " Currently used for status line.
    function! FileEncoding()
        if &fileencoding == ''
            return "NONE"
        else
            return &fenc
        endif
    endfunction

    " Autocommands
    autocmd BufRead *.gz let b:gzf = 1 "[GZ] status bar flag
    autocmd BufWritePost $MYVIMRC let g:needrestart = 1 " Config modified flag
    " --
endif

" -- Keybinds, macros and aliases --

" Kill search highlight with C-n
nmap <silent> <C-N> :silent noh<cr>

" Toggle line numbering with <F3>
nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>
" Togger relative line numbering with <S-F3>
nnoremap <S-F3> :set relativenumber!<CR>

" Navigate buffers with F1 and F2
noremap <F1> :bprev!<CR>
noremap <F2> :bnext!<CR>

" MiniBufExpl behaviour (enable/disable)
let g:miniBufExplMapWindowNavVim = 1    " Maps ctrl+ vim movement keys to
                                        " window navigation
let g:miniBufExplMapWindowNavArrows = 1 " Maps ctrl + arrows to window
                                        "  navigation
let g:miniBufExplMapCTabSwitchBufs = 0  " Switch buffer tabs
                                        "  with <C-TAB> and <C-S-TAB>
let g:miniBufExplModSelTarget = 1       " Coerces buffers into not appearing
                                        "  in non-editable windows.
let g:miniBufExplUseSingleClick = 0     " Activate buffer tabs with a
                                        "  single click

" Bind <F4> to MiniBufExpl toggle (hide/show)
noremap <F4> :TMiniBufExplorer<CR>

" Pylint Settings
" Do not autorun pylint nor pop the cwindow open.
" It is utterly annoying. I'd rather call it myself when
" I want to, with :make or :Pylint.
"
" Seriously. Imagine the cwindow opening up with really anal retentive
" errors like 'Local variable is never read hurrrr' ON EVERY write. Urgh.
"
" It was probably one of the circles of hell.
let g:pylint_onwrite = 0
let g:pylint_cwindow = 0

" -*- vimpager -*-
let vimpager_use_gvim=1 " Allow gvim use for pager. Note that script
                        "  will not attempt this unless  there is no $DISPLAY

" Still there? Have some crappy easter eggs.
map <F12> ggVGg?

let vimrc_sourced = 1

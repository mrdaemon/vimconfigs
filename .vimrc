" vim: set foldmarker={,} foldlevel=0:
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
" Main vim editor configuration file
" Alexandre Gauthier <alex@underwares.org>
"
" Up to date version always on github:
"   https://github.com/mrdaemon/vimconfigs
"
" HINT: Type zR if you don't know how to use folds
"-----------------------------------------------------------------------------

" init {
" Using pathogen to split plugins into 'bundles'.
" Feels a lot neater. Must be called first with filetype disabled.
"   @ See vim.org script 2332
"   @ https://github.com/tpope/vim-pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()
" }

" Base, Important editor behavior {
set nocompatible            " This is not 1979 anymore. Sorry, grandpa vi.
filetype plugin indent on   " Turns on filetype detection and loading of
                            " plugin and syntax files.

set encoding=utf-8          " Default encoding used through vim


" Enable modelines in patched/safe vim versions and disable them in any
" vulnerable version. Modelines are vim settings embedded in files, such as
" the first line of his very file.
if (v:version == 801 && has("patch1365")) || (v:version > 801)
    set modeline
else
    set nomodeline
endif

" Enable undo file in case of modernity
if (v:version > 703)
    set undodir=~/.vim/undofiles
    set undofile
endif

" }

" Editor messages, info and verbosity {
set showcmd        " Show current command, text area etc as last line
set shortmess=aI   " Use abbreviated messages and selfishly ignore uganda
"set cmdheight=2   " Larger command window, more space for messages, which
                   "  directly translates to less *hit ENTER to continue*
                   "  crap. God that can kill a good workflow.
set visualbell     " For the love of god STOP BLEEPING WHILE I'M AT WORK
" }

" Editor Movement, searching and patterns {
set startofline  " Move to first non-blank character of a line
set incsearch    " Incremental search
set ignorecase   " Case Insensitive
set smartcase    " Case sensitive if caps
" }

" Text Display Options {
set scrolloff=4       " Keep 4 lines on screen while scrolling,
                      "  because I hate going 'Uh.. did.. I miss it?'
set number            " Line numbering

set foldenable        " Enable folds
set foldmethod=marker " Fold blocks using markers in the text
set foldlevel=100     " Keep all folds open by default

set formatoptions-=o  " Don't continue comments when opening a new line
                      " with o/O

" Set prettier non printing characters
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" -- Highlighting, spelling and Text Appearance {
syntax on          " Auto select syntax highlighting from filetype

" Color Scheme
" (GUI colorscheme is defined in .gvimrc)

set background=dark " Force dark version
colorscheme hybrid

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
" -- }
" }

" Windows, Tabs and buffers behavior {

" -- Windows: {
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
" -- }

" -- Buffers: {
set hidden         " Don't unload buffers when the windows is no longer shown.
                   "  Allows you to navigate buffers without saving them.

set bufhidden=hide " Set default action of buffers that are no longer
                   "  in a window to be hidden. This is the default, and is
                   "  per-buffer, but I set it there anyways -- I once had
                   "  a remote edit go terribly wrong when switching buffers
                   "  and forcing this on loading the first buffer prevented
                   "  it. It probably is not necessary, feel free to ignore.

set autoread       " Automatically reload  externally changed file

set confirm        " When a command fails due to unsaved changes, ask to save,
                   "  instead of flat out failing.
" -- }

" -- Tabs: {
set showtabline=1  " Only show tabline if there are more than one tab open.
" -- }
" }

" Terminal Settings {
set ttyfast  " Better, faster redrawing on modern ttys.
             "  Yeah... remember to turn this off if redrawing
             "  goes awry wherever you use this.

set title    " Set terminal title to filename and status

set t_Co=256 " Force terminal into 256 colors mode.
             "  ** this WILL be nasty on crappy terms like Terminal.app **
" }

" Mouse settings {
set mouse=a  " Enable mouse in all supported modes.
" }

" Text editing settings {
set infercase    " Adjust case of completed text
                 "  to be like that of the match.

set showmatch    " Briefly display matching brackets when inserting such.
set matchtime=10 " How long to flash matching brackets, in 1/10th of a sec.
set backspace=indent,eol,start  " Make backspace useful in insert mode:
                                "  Allows backspace over indent, end of line
                                "  and start of line.

" -- Indent and tabbing {
"  NOTE: The proper tabbing settings, i.e. shiftwdith, tabstop, etc
"        are all defined in their specific filetype plugins wherever they
"        actually differ from the generic defaults below.

set autoindent     " Automatically match indent of previous line, except if
                   "  the line starts with '#'. To disable that, see the
                   "  keybind section of this file.

"set smartindent   " Automatically indent based on c-like language rules.
                   "  -- Do not enable unlike you really enjoy breaking
                   "  filetype-based indentation and fighting it forever.

set tabstop=8      " Hard tab set to standard 8 spaces
set softtabstop=4  " Number of spaces used for <Tab> during editing
set shiftwidth=4   " Number of spaces for each (auto)indent step.
set expandtab      " <Tab> inserts enough spaces to match the size of a tab,
                   "  which is defined above. Effectively makes the <Tab> key
                   "  insert spaces instead of hard tabs.

" -- }

" Insert mode completion {
set completeopt=menu,preview 	" Use popup menu *and* preview window
" -- }

" Command line Editing --{
set history=1000                " Larger command history
set wildmenu                    " Enable completion menu
set wildmode=list:longest,full  " Command line completion

" Ignore these partterns while tabbing out to complete
set wildignore=.svn,.hg,.git,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,jar,exe,bin,zip
" -- }
" }

" Hacks and AutoCommands {

" vim 7+: Change status line color in insert mode
" Have I ever mentioned how much I love this?
if version >= 700
    " Function to save current status line highlight
    " settings for StatusLine and StatusLineNC
    "
    " Not sure where I originally got the reference code I based
    " this function upon. Credit goes to whoever wrote the code fragment
    " which has been sitting in my ~/tmp for ages until I shaped it into
    " this.
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

" -- Functions and commands {

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

" Command to open a non-file backed buffer showing difference between current
" buffer state and file on disk. Useful for figuring out what you actually
" changed before going out and writing the buffer to disk.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p
            \ | diffthis

" Status bar autocommands
autocmd BufRead *.gz let b:gzf = 1 "[GZ] status bar flag
autocmd BufWritePost $MYVIMRC let g:needrestart = 1 " Config modified flag

" Enable spell checking for things that look like commit logs.
autocmd filetype svn,*commit* set spell

" Enable * and # in visual selection mode. This owns.
" Scroolose is my hero, read his blog like a motherfucker.
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


" -- }
" }

" Keybinds and plugin settings {

" Map leader key to comma because backslash is dumb on non us keymaps
let mapleader = ","

" Unbind the arrow keys. See this as preemptive rage prevention.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Kill search highlight with C-n
nmap <silent> <C-N> :silent noh<cr>

" Toggle line numbering with <F3>
nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

" Toggle relative line numbering with <S-F3>
nnoremap <S-F3> :set relativenumber!<CR>

" Navigate buffers with F1 and F2
noremap <F1> :bprev!<CR>
noremap <F2> :bnext!<CR>

" F4 stores the current file path, relative to working directory, on the
" system clipboard.
noremap <F4> :let @* = @%<CR>

" Toggle between paste and insert mode with F11
set pastetoggle=<F11>

" Supertab Settings -- {
" Set default completion to 'context' and omnicomplete
let g:SuperTabSefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" -- }

" UltiSnips Settings -- {
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsListSnippets="<Leader><c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" -- }

" airline settings -- {
let g:airline#extensions#tabline#enabled = 1
"
" Enable powerline fonts for GUIs
" This somehow is too late when in .gvimrc.
if has("gui_running")
    let g:airline_powerline_fonts = 1
endif

" Airline Theme
let g:airline_theme = "hybrid"
" -- }

" Pylint Settings -- {
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
" -- }

" vimpager script helper -- {
let vimpager_use_gvim=1 " Allow gvim use for pager. Note that script
                        "  will not attempt this unless there is no $DISPLAY
" -- }

" Syntastic (*nix only) -- {
if !has('gui_win32')
    let g:syntastic_enable_signs=1 " Use :sign to show errors
    let g:syntastic_auto_jump=1     " Automagically jump to errors when saving
    let g:syntastic_auto_loc_list=2 " 2 - Autoclose loc window when error free
                                    " but never open it at all. 1 is auto
                                    " everything forever.

    " let g:syntastic_disabled_filetypes = ['python', 'java']
endif

" -- }

" Virtualenv Settings -- {
if has('gui_win32')
    let g:virtualenv_directory = '~/envs'
else
    let g:virtualenv_directory = '~/.env'
endif
" -- }

" CtrlP Settings -- {
" Use the python matcher, which is significantly faster
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" -- }

" Misc {
" Still there? Have some crappy easter eggs.
map <F12> ggVGg?

" Attempt to source .vimrc.local for very machine-specific configurations that
" would benefit absolutely no one by being here. Mostly bug workarounds.
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
" }

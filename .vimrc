set nocp
filetype plugin indent on
autocmd FileType python set omnifunc=pythoncomplete#Complete
set ai
set completeopt=menu
let OmniCpp_SelectFirstItem = 2
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
syntax on
colorscheme desert
set wildmenu
set wildmode=list:longest,full
set guioptions-=T

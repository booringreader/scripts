set nocompatible "disable compatibility with the original vi (the historic unix text editor)
filetype on "enable type of file detection (let's vim detect the file type under progress)
filetype plugin on "detect plugins specific to filetype and enable them
filetype indent on "enable file specific indentation 
syntax on "enable syntax highlighting
set number "add line numbers on the left
"highlight cursorline (horizontally) & cursor column (vertically)
set cursorline
set cursorcolumn
set incsearch "setup incremental search like google (search as the user enters more data)
set ignorecase "ignores capital letters during search
set smartcase "allows search for capital letters (ignores ignorecase)a
set showcmd "show last entered / partially entered command in the command line area
set showmode "display the current mode of editing in the status line
set hlsearch "highlight the search term as it is being typed
set wildmenu "enable autocompletion after pressing tab key
set wildmode=list:longest "display search options based on longest matching string
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.xlsx,*.img "wildmenu will ignore files with these extensions
set hidden
set ruler
set guifont=* "sets the size of font
set relativenumber
set tabstop=4 " set tab width to 4 columns
set shiftwidth=4 " set width of shift to 4 spaces
set expandtab " enables insertion of no. of spaces specified with tabstop instead of standard tab press
" set nobackup " disable creation of backup files 
set autoindent
colorscheme lunaperche
set mouse=a
set softtabstop=4
set laststatus=2
set nowrap " lines won't wrap after the window ends
set mouse=a
" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
    Plug 'ervandew/supertab'
    Plug 'mattn/emmet-vim'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{
" Mappings code goes here.
inoremap jj <esc>
"emmet mappings
let g:user_emmet_leader_key=',' "maps leader key with ,
let g:user_emmet_mode='n' "only active in normal mode
nnoremap ,f :EmmetFormat<CR>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" auto group for folding using marker method
setlocal foldmethod=marker
"If the current file type is HTML, set indentation to 2 spaces
 autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
" }}}


" STATUS LINE ------------------------------------------------------------ {{{
" Status bar code goes here.
" }}}

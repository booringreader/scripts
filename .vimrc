" GENERAL ------------------------------------------------------------------- {{
set nocompatible          " Disable compatibility with the original vi
filetype on               " Enable type of file detection
filetype plugin on        " Detect and enable filetype-specific plugins
filetype indent on        " Enable file-specific indentation
syntax on                 " Enable syntax highlighting
" }}

" USER INTERFACE ------------------------------------------------------- {{
set number                " Show line numbers on the left
set relativenumber        " Show relative line numbers
set cursorline            " Highlight the current line
set cursorcolumn          " Highlight the current column
set showcmd               " Show the last entered or partially entered command
set showmode              " Display the current mode of editing in the status line
set ruler                 " Show the cursor position in the status line
set laststatus=2          " Always display the status line
" }}

" COLORS AND FONTS --------------------------------------------------------- {{
colorscheme lunaperche    " Set the color scheme
set guifont=*             " Set the size of the font (only in GUI)
" }}

" FILES AND BACKUPS -------------------------------------------------------- {{
" set nobackup 
set hidden                " Allow switching buffers without saving
" }}

" TEXT, TAB, AND INDENT RELATED ------------------------------------------- {{
set tabstop=4             " Set tab width to 4 columns
set shiftwidth=4          " Set the width of auto-indent to 4 spaces
set expandtab             " Use spaces instead of tabs
set autoindent            " Automatically indent new lines
set softtabstop=4         " Set the number of spaces for a tab in insert mode
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab " Set specific indentation for HTML files
" }}

" VISUAL MODE RELATED ------------------------------------------------------ {{
set hlsearch              " Highlight the search term
set incsearch             " Incremental search as the user types
set ignorecase            " Ignore case during search
set smartcase             " Override ignorecase if search term contains uppercase
" }}

" MOVING AROUND, TABS, AND BUFFERS ---------------------------------------- {{
set wrap                  " Wrap lines to fit within the window
set mouse=v               " Enable mouse support for visual mode(since selecting text with mouse, enables the visual mode; easier for clipboard copy pasting across vim)
set wildmenu              " Enable autocompletion after pressing the Tab key
set wildmode=list:longest " Display options based on the longest matching string
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.xlsx,*.img " Ignore files with these extensions in autocompletion
" }}

" STATUS LINE ------------------------------------------------------------- {{
" Status bar code (customization)
" }}

" EDITING MAPPINGS -------------------------------------------------------- {{
" let mapleader=","
inoremap jj <esc> " Map 'jj' in insert mode to escape to normal mode
" nnoremap <Leader>tv :vertical terminal<CR>

" Emmet mappings
let g:user_emmet_leader_key=','  " Set leader key for Emmet to ','
let g:user_emmet_mode='n'       " Activate Emmet only in normal mode
nnoremap ,f :EmmetFormat<CR>    " Map ',f' to Emmet format
" }}

" VIMGREP SEARCHING AND COPE DISPLAYING ----------------------------------- {{
" vimgrep and quickfix window settings
" }}

" SPELL CHECKING ---------------------------------------------------------- {{
" spell-checking settings here
" }}

" MISC -------------------------------------------------------------------- {{
set wrap " Enable wrapping of long lines
" }}

" HELPER FUNCTIONS -------------------------------------------------------- {{
call plug#begin('~/.vim/plugged')
    Plug 'ervandew/supertab'
    Plug 'mattn/emmet-vim'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

setlocal foldmethod=marker " Use marker method for code folding
" }}


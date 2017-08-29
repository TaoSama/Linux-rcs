" >>>>

set nocompatible

" ----------------------------------------------------------------------------
" BASIC SETTINGS
" ----------------------------------------------------------------------------
 
" <C-a> copy all to system register
map <C-a> gg"+yG

" Linebreak on 500 characters
set lbr
set tw=500

" Enable mouse
set mouse=a

let mapleader = ';'

set encoding=utf-8

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store lots of :cmdline history
set history=500

" Show line numbers
set nu

set nowrap

" Autoindent when starting new line
set autoindent
set smartindent
set lazyredraw

" Show the size of block one selected in visual mode
set showcmd

" Hide buffers
set hidden
set visualbell

" Indent using four spaces
set expandtab smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Ignore case when searching
set ignorecase 

" Don't ignore case when search has capital letter
set smartcase

" Enable highlighted case-insensitive incremential search
set incsearch

" Enble search highlighting
set hlsearch

" Always show window statuses
set laststatus=2

" Statusline style
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%8*\ %=\ row:%l/%L\ (%p%%)\               "Rownumber/total (%)
set statusline+=%9*\ col:%c\                              "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

" Show the line and column number of the cursor position
set ruler

" Highlight line under cursor
set cursorline
set cursorcolumn

" remember the line that last edited
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" ----------------------------------------------------------------------------
" BASIC MAPPINGS
" ----------------------------------------------------------------------------
  
" Source when MYVIMRC is edited 
autocmd BufWritePost $MYVIMRC source $MYVIMRC 

" Copy and paste
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" <tab> / <s-tab> | Circular windows navigation

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ColorSchem
set background=dark
let g:molokai_original = 1
" colorschem molokai
colorschem desert

" <<<<

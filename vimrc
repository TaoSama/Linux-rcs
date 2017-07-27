" >>>>

set nocompatible

" 自动生成代码设置
map <F4> :call LoadACMTemplate()<CR>
func LoadACMTemplate()
	exec "r ~/.vim/templates/main.cpp"
endfunc

" C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %< -O2 -Wall -DLOCAL -std=c11"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %< -O2 -Wall -DLOCAL -std=c++11"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'markdown'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!open %.html &"
	endif
endfunc
" C,C++的调试
map <F6> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -o %< -O2 -Wall -DLOCAL -g -std=c++11"
	exec "!lldb %<"
endfunc


" <<<<
" >>>>
" VIM-PLUG BLOCK

silent! if plug#begin('~/.vim/plugged')

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sheerun/vim-polyglot'

" Edit
Plug 'SirVer/ultisnips'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-operator-user'
Plug 'gcmt/wildfire.vim'
Plug 'lilydjwg/fcitx.vim'

" Browsing
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'      }
Plug 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp', 'objc'] }
Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'objc'] }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Lint
Plug 'w0rp/ale'

Plug 'fholgado/minibufexpl.vim'
Plug 'sjl/gundo.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'

"cd ~
"mkdir ycm_build
"cd ycm_build/
"cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/Downloads/clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-16.04 . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
"cmake --build . --target ycm_core

"Plug 'Valloric/YouCompleteMe'

function! BuildYCM(info)
if a:info.status == 'installed' || a:info.force
  !./install.py --clang-completer
endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()
endif

" <<<<
" >>>>
" BASIC SETTINGS
 
" <C-a> copy all to system register
map <C-a> gg"+yG
" 选中状态复制
vmap <C-c> "+y
nmap <C-v> "+p
imap <C-v> <Esc>"+p

" Linebreak on 500 characters
set lbr
set tw=500

" enable mouse
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
set statusline+=%8*\ %=\ row:%l/%L\ (%p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

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

set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

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

" <<<<
" >>>>
" MAPPINGS

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------
  
" Profile
iabbrev @@ lwt1367@gmail.com
iabbrev @b taosama.com


" Edit myvimrc
autocmd BufWritePost $MYVIMRC source $MYVIMRC 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Edit
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Save
nnoremap <leader>w :w<cr>

" Copy
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" Quit
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a
inoremap <C-^> <C-o><C-^>

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------

nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>lw <C-W>l

" ----------------------------------------------------------------------------
" :CopyRTF
" ----------------------------------------------------------------------------

function! s:colors(...)
return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
    \                  'v:val !~ "^/usr/"'),
    \           'fnamemodify(v:val, ":t:r")'),
    \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

" ----------------------------------------------------------------------------
" <F8> | Color scheme selector
" ----------------------------------------------------------------------------
"  
set background=dark

let g:molokai_original = 1
"colorschem molokai
colorschem desert

function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  set background=dark
  execute 'colorscheme' name
  redraw
  echo name
endfunction

nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>
inoremap <silent> <F8> <esc>:call <SID>rotate_colors()<cr>

" <<<<
" >>>>
" PLUGINS

" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" ----------------------------------------------------------------------------
" vim-multiple-cursors
" ----------------------------------------------------------------------------

"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_skip_key='<C-k>'

" ----------------------------------------------------------------------------
" vim-move
" ----------------------------------------------------------------------------

let g:move_key_modifier = 'C'

" ----------------------------------------------------------------------------
" auto-pairs
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" vim-operator-user
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" wildfire.vim
" ----------------------------------------------------------------------------

map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)

" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
  
let g:indentLine_char = '│'

" ----------------------------------------------------------------------------
" tarbar
" ----------------------------------------------------------------------------

inoremap <F2> <esc>:TagbarToggle<cr>
nnoremap <F2> :TagbarToggle<cr>

let tagbar_left=1
let tagbar_width=32
let g:tagbar_sort = 0
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
 \ 'ctagstype' : 'c++',
 \ 'kinds'     : [
     \ 'c:classes:0:1',
     \ 'd:macros:0:1',
     \ 'e:enumerators:0:0', 
     \ 'f:functions:0:1',
     \ 'g:enumeration:0:1',
     \ 'l:local:0:1',
     \ 'm:members:0:1',
     \ 'n:namespaces:0:1',
     \ 'p:functions_prototypes:0:1',
     \ 's:structs:0:1',
     \ 't:typedefs:0:1',
     \ 'u:unions:0:1',
     \ 'v:global:0:1',
     \ 'x:external:0:1'
 \ ],
 \ 'sro'        : '::',
 \ 'kind2scope' : {
     \ 'g' : 'enum',
     \ 'n' : 'namespace',
     \ 'c' : 'class',
     \ 's' : 'struct',
     \ 'u' : 'union'
 \ },
 \ 'scope2kind' : {
     \ 'enum'      : 'g',
     \ 'namespace' : 'n',
     \ 'class'     : 'c',
     \ 'struct'    : 's',
     \ 'union'     : 'u'
 \ }
\ }

" ----------------------------------------------------------------------------
" vim-fswitch
" ----------------------------------------------------------------------------

nmap <silent> <Leader>fs :FSHere<cr>

" ----------------------------------------------------------------------------
" vim-protodef
" ----------------------------------------------------------------------------

let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1

" ----------------------------------------------------------------------------
" nerdcommenter
" ----------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------

inoremap <F3> <esc>:NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>

let NERDTreeWinSize=22
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" ----------------------------------------------------------------------------
" vim-instant-markdown
" ----------------------------------------------------------------------------

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0

nnoremap <Leader>md :InstantMarkdownPreview<CR>


" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" vim-gitgutter
" ----------------------------------------------------------------------------
  
set updatetime=249

let g:gitgutter_sign_column_always = 0

" ----------------------------------------------------------------------------
" ale
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" minibufexpl
" ----------------------------------------------------------------------------

inoremap <F3> <esc>:MBEToggle<cr>
nnoremap <F3> :MBEToggle<cr>

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" gundo.vim
" ----------------------------------------------------------------------------

nnoremap <Leader>ud :GundoToggle<CR>

set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

if !strlen(finddir('~/.vim/undofiles'))
echo "undofiles[~/.vim/undofiles] not found. Now it's being created. Press ENTER or type command to continue."
!mkdir -p ~/.vim/undofiles
endif

if v:version >= 702
set undodir=~/.vim/undofiles
set undofile
set colorcolumn=+0 
endif

" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------

"nnoremap <c-f> :CtrlSF<CR>

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

" Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz1,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_map = '<s-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vendor/bundle/*\|vendor/cache/*\|public\|spec)$',
  \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
  \ }

" ----------------------------------------------------------------------------
" YouCompleteMe
" ----------------------------------------------------------------------------

set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1	" 从第2个键入字符就开始罗列匹配项

let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

let g:ycm_python_binary_path = 'python'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" <<<<

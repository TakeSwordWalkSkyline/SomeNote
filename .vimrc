set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

syntax on
set ruler
let g:go_version_warning = 0

set fileencodings=ucs-bom,utf-8,gbk,default,latin1
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set fencs=utf-8

set showcmd
set cmdheight=1
set scrolloff=3

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY

set expandtab
set tabstop=4
set shiftwidth=4
set nosmartindent
set noautoindent
set nocindent
set hlsearch
set incsearch
set backspace=indent,eol,start
set nu
set showmatch

set cursorline
"set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=blue  ctermfg=NONE guibg=NONE guifg=NONE
hi CursorColumn   cterm=NONE ctermbg=blue  ctermfg=NONE guibg=NONE guifg=NONE
hi MatchParen ctermbg=red guibg=yellow
hi comment ctermfg=6

set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"filetype on

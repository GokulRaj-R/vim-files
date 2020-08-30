" CP
autocmd filetype cpp nnoremap <F2> :w <bar> !g++ -Wall -Wextra -DLOCAL -O2 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> !g++ -Wall -Wextra -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -DLOCAL -O2 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F3> :!%:r<CR>
autocmd GUIEnter * simalt ~x

" Editor Settings
set nu
set mouse=a
set smarttab
set tabstop=2
set expandtab
set autoindent
set linespace=2
set belloff=all
set shiftwidth=2
set laststatus=2
set guioptions-=m  
set guioptions-=T  
set softtabstop=2
set encoding=UTF-8
set guifont=Cousine_NF:h11
set backspace=indent,eol,start

" Movement Mappings
imap jk <ESC>
imap kj <ESC>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>y :%y+<CR>
nmap <C-\> gcc
vmap <C-\> gc

set nocompatible             
syntax on
filetype off                
filetype plugin on
call plug#begin('~/vimfiles/plugged')

Plug 'dracula/vim'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'garbas/vim-snipmate'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" Color Scheme
set t_Co=256
set background=dark
colorscheme dracula

" revert the shell
if has('win32')
   if !empty($SHELL)
      set shell=cmd.exe shellcmdflag=/c shellredir=>%s\ 2>&1
      set shellxquote=( shellxescape&vim shellquote=
   endif
endif

" NERDTree
nmap <leader>c cdCD
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Buffers
" Mappings to access buffers (don't use \p because a
" delay before pressing p would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>:b<Space>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

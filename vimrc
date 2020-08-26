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

set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

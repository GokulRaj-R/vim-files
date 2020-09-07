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
autocmd GUIEnter * simalt ~x

" Movement Mappings
imap jk <ESC>
imap kj <ESC>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>y :%y+<CR>

" Comments
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
nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" CP 
" Run with ith Input File
nnoremap <Leader>1 :!%:r < %:rin_1<CR>
nnoremap <Leader>2 :!%:r < %:rin_2<CR>
nnoremap <Leader>3 :!%:r < %:rin_3<CR>
nnoremap <Leader>4 :!%:r < %:rin_4<CR>
nnoremap <Leader>5 :!%:r < %:rin_5<CR>
nnoremap <Leader>6 :!%:r < %:rin_6<CR>
nnoremap <Leader>7 :!%:r < %:rin_7<CR>

" Make ith Input File
nnoremap <Leader>i1 :tabe %:rin_1<bar>:%d<bar>:put +<CR><bar>:wq<CR>
nnoremap <Leader>i2 :tabe %:rin_2<bar>:%d<bar>:put +<CR><bar>:wq<CR>
nnoremap <Leader>i3 :tabe %:rin_3<bar>:%d<bar>:put +<CR><bar>:wq<CR>
nnoremap <Leader>i4 :tabe %:rin_4<bar>:%d<bar>:put +<CR><bar>:wq<CR>
nnoremap <Leader>i5 :tabe %:rin_5<bar>:%d<bar>:put +<CR><bar>:wq<CR>
nnoremap <Leader>i6 :tabe %:rin_6<bar>:%d<bar>:put +<CR><bar>:wq<CR>
nnoremap <Leader>i7 :tabe %:rin_7<bar>:%d<bar>:put +<CR><bar>:wq<CR>

" Open input and output manually
nnoremap <leader>ii :e %:rin_
nnoremap <leader>oo :e %:rout_

" Open Command Prompt
noremap <leader>t :!cmd<CR>

" Compile OR Run
autocmd filetype cpp nnoremap <F2> :w <bar> !g++ -Wall -Wextra -DLOCAL -O2 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F3> :w <bar> !g++ -Wall -Wextra -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -DLOCAL -O2 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F4> :!%:r<CR>
autocmd filetype cpp nnoremap <F5> :!%:r < %:rin_1 > %:rout_

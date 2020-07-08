" CP
autocmd filetype cpp nnoremap <F2> :w <bar> !g++ -Wall -Wextra -DLOCAL -O2 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F3> :!%:r<CR>
autocmd GUIEnter * simalt ~x

" Editor Settings
set nu
set mouse=a
set smarttab
set smartcase
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
nnoremap <F6> :ALEToggle<CR>
nmap <C-\> gcc
vmap <C-\> gc

set nocompatible             
syntax on
filetype off                
filetype plugin on
call plug#begin('~/vimfiles/plugged')

Plug 'dracula/vim'
Plug 'tomtom/tlib_vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'garbas/vim-snipmate'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'maxmellon/vim-jsx-pretty'
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

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Linter configuration
let g:ale_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_warning = '#'
let g:ale_lint_on_text_changed = 'never'
let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}

" NERDTree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

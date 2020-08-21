call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace'
" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" CoC + languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'
Plug 'ledger/vim-ledger'
Plug 'vmchale/dhall-vim'
Plug 'lervag/vimtex'
" Plug 'fatih/vim-go'

Plug 'itchyny/vim-parenmatch'
Plug 'lambdalisue/gina.vim'
" Plug 'mtth/scratch.vim'
Plug 'machakann/vim-sandwich'

Plug 'dag/vim-fish'

Plug 'unblevable/quick-scope'

" itchyny/lightline.vim
" mgee/lightline-bufferline
" junegunn/goyo.vim
" mhinz/vim-startify

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
" Plug 'dracula/vim'
" Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" vim-terraform
let g:terraform_align         = 1
let g:terraform_fold_sections = 1
let g:terraform_fmt_on_save   = 1

" CoC.vim + vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" airline
" enable the list of buffers
let g:airline#extensions#tabline#enabled      = 1
" show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-better-whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save  = 0

" nord-vim
let g:nord_italic    = 1
let g:nord_underline = 1

" vim-parenmatch
let g:loaded_matchparen = 1

" NERDTree
let g:NERDTreeShowHidden = 1

" quick-scope
let g:qs_buftype_blacklist = ['terminal', 'nofile']
" let g:qs_lazy_highlight    = 1
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
" enable vim-surround like keymappings
" runtime macros/sandwich/keymap/surround.vim

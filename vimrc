" Leader
let mapleader = " "

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile     " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50     " Length of history
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching
set laststatus=2   " Always display the status line
set t_Co=256       " Set number of colors, boom.
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
set mouse-=a       " Disable mouse
set mousehide      " Hide mouse after chars typed
" Tabs to spaces
set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab    " Make tabs into spaces (set by tabstop)
set smarttab     " Smarter tab levels
" Apparently this stops Vim from adding a new line at the end of each file.
" See: http://vimhelp.appspot.com/vim_faq.txt.html#faq-5.4
set binary
set noeol
" Numbers
set number
set numberwidth=5
" Folding settings
set foldmethod=indent " Fold based on indent
set foldnestmax=10    " Deepest fold is 10 levels
set nofoldenable      " Don't fold by default
set foldlevel=3
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Encodings
set fileencodings=utf-8,latin1
set encoding=utf-8

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>

" Mac OSX fix for navigating NERDTree properly
let g:NERDTreeDirArrows=0
" Always show NERDtree tab
let g:nerdtree_tabs_open_on_console_startup=1

" Quit vim if NERDTree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Due to a bug / "feature" w/ `set binary` this is needed to ensure that when
" files are "reloaded", tabs are still exanded to spaces
autocmd FileChangedShellPost * set expandtab

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Switch between light / dark background
map <leader>s :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set syntax highlighting for specific file types
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
" Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Themein'
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow

" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Open vimrc in new tab
map <leader>vimrc :tabe ~/.vimrc<cr>
autocmd bufwritepost .vimrc source $MYVIMRC

" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Apparently needed for textobj-rubyblock
runtime macros/matchit.vim

" macVim options
set fileencodings=utf-8,latin1
set guifont=Menlo\ Regular:h11
set guioptions=egm
set guitablabel=%M%t
set termencoding=utf-8
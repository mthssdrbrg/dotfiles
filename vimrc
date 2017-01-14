" Leader
let mapleader = " "

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

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
set timeoutlen=500 " Time to wait after ESC (default causes an annoying delay)
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
set regexpengine=1
let g:ruby_path=system('echo $HOME/.rbenv/shims')

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>

" Mac OSX fix for navigating NERDTree properly
let g:NERDTreeDirArrows=0

" Attempt to explicitly enforce tabs as two (2) spaces,
" all of the goddamn time
autocmd FileChangedShellPost * set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
" Well, almost all of the goddamn time
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType make setlocal noexpandtab

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><D-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><D-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Switch between light / dark background
map <leader>s :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Bindings for making fugitive a bit easier to use
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gca :Gcommit --amend<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Gpush<CR>
nnoremap <space>gpl :Gpull<CR>
nnoremap <space>gbl :Gblame<CR>
nnoremap <space>m :Merginal<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set syntax highlighting for specific file types
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile Makefile set noexpandtab

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
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Apparently needed for textobj-rubyblock
runtime macros/matchit.vim

" load (OS) specifics
if filereadable(expand("~/.vimrc.specifics"))
  source ~/.vimrc.specifics
endif
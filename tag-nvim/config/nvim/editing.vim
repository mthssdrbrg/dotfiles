set nobackup
set nowritebackup
set noswapfile     " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set timeoutlen=500 " Time to wait after ESC
set mousehide      " Hide mouse after chars typed
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Apparently this stops Vim from adding a new line at the end of each file.
" See: http://vimhelp.appspot.com/vim_faq.txt.html#faq-5.4
set binary
" Numbers
set number
set numberwidth=4
" Folding settings
set foldmethod=indent " Fold based on indent
set foldnestmax=10    " Deepest fold is 10 levels
set nofoldenable      " Don't fold by default
set foldlevel=3
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set regexpengine=1
" set textwidth=80
" set colorcolumn=+1
set ignorecase " Make searching case insensitive
set smartcase " ... unless the query has capital letters.
set gdefault " Use 'g' flag by default with :s/foo/bar/.
set magic " Use 'magic' patterns (extended regular expressions).
" Forcefully apply some options
autocmd FileType * set expandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab
" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.ru set filetype=ruby
autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufRead,BufNewFile Guardfile set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufWritePost .vimrc source $MYVIMRC
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
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

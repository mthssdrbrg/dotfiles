set nobackup
set nowritebackup
set noswapfile     " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set timeoutlen=250 " Time to wait after ESC (or leader?)
" set ttimeoutlen=250
set mousehide      " Hide mouse after chars typed
" tabs and such
set list
set listchars=tab:▸·,trail:·
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
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
" set colorcolumn=+1
set ignorecase " Make searching case insensitive
set smartcase " ... unless the query has capital letters.
set magic " Use 'magic' patterns (extended regular expressions).
set autochdir
set termguicolors
" highlight TermCursor ctermfg=red guifg=red
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab
" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile config.ru set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.journal,*.ledger setf ledger | comp ledger
autocmd BufRead,BufNewFile *.md setlocal textwidth=120 spell

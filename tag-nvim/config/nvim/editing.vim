set nobackup
set nowritebackup
set noswapfile     " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set timeoutlen=500 " Time to wait after ESC
set mousehide      " Hide mouse after chars typed
" tabs and such
set list
set listchars=tab:▸·,trail:·
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
" Apparently this stops Vim from adding a new line at the end of each file.
" See: http://vimhelp.appspot.com/vim_faq.txt.html#faq-5.4
" set binary
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
highlight TermCursor ctermfg=red guifg=red
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab
" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile config.ru set filetype=ruby
autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:terminal_scrollback_buffer_size = 1000000
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Apparently needed for textobj-rubyblock
runtime macros/matchit.vim

" Leader
let mapleader = " "
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>
" Search and Replace
nmap <leader>s :%s//g<Left><Left>
" Clear search highlight
nnoremap <silent> <leader>hl :nohlsearch<CR>
" fugitive
" nnoremap <leader>ga :Git add %:p<CR><CR>
" nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gc :Gcommit -v -q<CR>
" nnoremap <leader>gt :Gcommit -v -q %:p<CR>
" nnoremap <leader>gca :Gcommit --amend<CR>
" nnoremap <leader>gd :Gdiff<CR>
" nnoremap <leader>ge :Gedit<CR>
" nnoremap <leader>gr :Gread<CR>
" nnoremap <leader>gw :Gwrite<CR><CR>
" nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Gpush<CR>
" nnoremap <leader>gpl :Gpull<CR>
" nnoremap <leader>gbl :Gblame<CR>
" nnoremap <leader>m :Merginal<CR>
" Quicker window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <cr> :
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" tabs
nnoremap <leader>t2 :set shiftwidth=2<cr>:set tabstop=2<cr>
nnoremap <leader>t4 :set shiftwidth=4<cr>:set tabstop=4<cr>
nnoremap <leader>te :set expandtab<cr>:retab<cr>
nnoremap <leader>tn :set noexpandtab<cr>:retab<cr>
" Terminal keys
tnoremap <leader><ESC> <C-\><C-n>
" CoC.vim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" fzf
nnoremap <C-p> :Files<Cr>
nnoremap <leader>/ :Rg<Space>
nnoremap <leader>bl :Buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

nnoremap <leader>h :History<CR>
nnoremap \/ :Rg<Space>
nnoremap \b :Buffers<CR>
nnoremap \h :History<CR>

" if exists(":Tabularize")
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
" endif

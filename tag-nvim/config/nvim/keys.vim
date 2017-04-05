" Leader
let mapleader = " "
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>
" Switch between light / dark background
" map <leader>s :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
" Use <C-L> to clear the highlighting of :set hlsearch.
" nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gca :Gcommit --amend<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>m :Merginal<CR>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

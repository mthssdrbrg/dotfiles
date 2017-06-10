" Leader
let mapleader = " "
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>
" Search and Replace
nmap <leader>s :%s//g<Left><Left>
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
nnoremap <leader>j <C-w>j<CR>
nnoremap <leader>k <C-w>k<CR>
nnoremap <leader>h <C-w>h<CR>
nnoremap <leader>l <C-w>l<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <cr> :
" tabs
nnoremap <leader>t2 :set shiftwidth=2<cr>:set tabstop=2<cr>
nnoremap <leader>t4 :set shiftwidth=4<cr>:set tabstop=4<cr>
nnoremap <leader>te :set expandtab<cr>:retab<cr>
nnoremap <leader>tn :set noexpandtab<cr>:retab<cr>
" Terminal keys
tnoremap <leader><ESC> <C-\><C-n>

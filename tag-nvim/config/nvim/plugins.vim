call plug#begin('~/.local/share/nvim/plugged')

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    !./install.py --clang-completer --gocode-completer --system-libclang
  endif
endfunction

Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/matchit.zip'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/paredit.vim'
Plug 'lervag/vimtex'
Plug 'hashivim/vim-terraform'
Plug 'tbastos/vim-lua'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rodjek/vim-puppet'
Plug 'bling/vim-airline'
Plug 'dracula/vim'
Plug 'chriskempson/base16-vim'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

execute pathogen#infect()
filetype plugin indent on
syntax on
set encoding=UTF-8
set guifont=PragmataPro

let g:ycm_rust_src_path="/home/eduardo/Developer/GitHub/rust-master/src/"

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-t> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>

"enable mouse support
set mouse=a

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" line numbers 
:set number relativenumber

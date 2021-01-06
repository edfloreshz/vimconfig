" VIM Configuration File
" Description: Optimized for C/Rust development, but useful also for other things.
" Author: Eduardo Flores
"
" Instructions:
" :source %
" :PlugInstall

" VimPlug plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/L9'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mg979/vim-visual-multi'
Plug 'anyakichi/vim-surround'
Plug 'sirver/ultisnips'
Plug 'vim-scripts/OmniCppComplete'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'rhysd/rust-doc.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'chiel92/vim-autoformat'

call plug#end()

set nocp
set updatetime=1000
filetype plugin indent on

" turn syntax highlighting on
set t_Co=256
syntax on

" turn line numbers on
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set encoding=UTF-8

" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 80 chars.
set textwidth=80

let g:DoxygenToolkit_authorName="Eduardo Flores <edfloreshz@gmail.com>"

" set gui font
set guifont=PragmataPro

let g:ycm_rust_src_path="/home/eduardo/Developer/GitHub/rust-master/src/"
let g:formatterpath = ['/home/eduardo/.cargo/bin/rustfmt', '/usr/bin/clang-format']

map gc :call Comment()<CR>
map gC :call Uncomment()<CR>

function! Comment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^/\#/
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^:\/\/:g
	elseif ft == 'tex'
		silent s:^:%:g
	elseif ft == 'vim'
		silent s:^:\":g
	endif
endfunction

function! Uncomment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^\#//
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^\/\/::g
	elseif ft == 'tex'
		silent s:^%::g
	elseif ft == 'vim'
		silent s:^\"::g
	endif
endfunction

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

" tags
set tags=tags

" Enhanced keyboard mappings
"

" in normal mode F3 will save the file
nmap <C-S> :w<CR>
" in insert mode F3 will exit insert, save, enters insert again
imap <C-S> <ESC>:w<CR>i
" autoformat
nmap <F4> :Autoformat<CR>
" switch between header/source with F4
map <F5> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" create doxygen comment
map <F6> :Dox<CR>
" remove comment
map <F7> :call Uncomment()<CR>
" toggle comment
map <F8> :call Comment()<CR>
" build using makeprg with <F7>
map <F9> :!clear && cd build && cmake --build .<CR>
" build using makeprg with <S-F7>
map <S-F9> :make clean all<CR>
" buld and run with <F8>
map <F10> :!BASENAME=$(basename $(pwd)) && clear && cd build && cmake --build . && ./$BASENAME <CR>
" run
map <F11> :!BASENAME=$(basename $(pwd)) && clear && cd build && ./$BASENAME
" goto definition with F10
map <F12> <C-]>

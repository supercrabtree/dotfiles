" ----------------------------------------------------------------------
" Vundle Setup ---------------------------------------------------------
set nocompatible                    " be iMproved, required
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'marijnh/tern_for_vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'maxbrunsfeld/vim-yankstack'

call vundle#end()                   " required
filetype plugin indent on           " required


" ----------------------------------------------------------------------
" Vim Settings ---------------------------------------------------------
syntax on
set laststatus=2
set relativenumber
set number
set hlsearch
set incsearch
set timeoutlen=1000 ttimeoutlen=0
set noshowmode
set nowrap
set mouse=a
set term=xterm-256color

" White Space
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2

" Colors
set background=dark
colorscheme solarized
hi StatusLine ctermbg=0 ctermfg=12
hi CursorLineNR ctermbg=8 ctermfg=12


" ----------------------------------------------------------------------
" Keys -----------------------------------------------------------------
let mapleader = ","
noremap jj <esc>
nnoremap ; :
nnoremap <c-j> :bnext<cr>
nnoremap <c-k> :bprevious<cr>

" ----------------------------------------------------------------------
" Plugin Settings
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_custom_ignore = {
  \'dir': 'node_modules\|app-build\|lib',
  \'file': 'v[\/]\.(git)$'
  \}
" hide the status bar
let g:ctrlp_buffer_func = {
  \'enter': 'Function_Name_1',
  \'exit':  'Function_Name_2',
  \}
func! Function_Name_1()
  set laststatus=0
endfunc

func! Function_Name_2()
  set laststatus=2
endfunc 


" ----------------------------------------------------------------------
" Others ---------------------------------------------------------------
set statusline=
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%<\                       " cut at
set statusline+=%f\                       " path
set statusline+=%=                        " align right
set statusline+=(%c,%l/%L)\               " line and colum

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" Mode changes
autocmd InsertEnter * call EnterInsertMode()
autocmd InsertLeave * call LeaveInsertMode()

func! EnterInsertMode()
  hi CursorLineNR ctermbg=5 ctermfg=0
endfunc
func! LeaveInsertMode()
  hi CursorLineNR ctermbg=8 ctermfg=12
endfunc

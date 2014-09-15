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
set background=dark
colorscheme solarized
set laststatus=2

" Colors
hi StatusLine ctermbg=0 ctermfg=12

" ----------------------------------------------------------------------
" Keys -----------------------------------------------------------------
inoremap jj <esc>
nnoremap ; :


" ----------------------------------------------------------------------
" Others ---------------------------------------------------------------
set statusline=
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%<\                       " cut at
set statusline+=%f\                       " path
set statusline+=%=                        " align right
set statusline+=(%c,%l/%L)\               " line and colum

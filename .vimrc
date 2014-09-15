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
PLugin 'pangloss/vim-javascript'
PLugin 'jelera/vim-javascript-syntax'
PLugin 'groenewege/vim-less'
PLugin 'plasticboy/vim-markdown'
PLugin 'terryma/vim-multiple-cursors'
Plugin 'maxbrunsfeld/vim-yankstack'

call vundle#end()                   " required
filetype plugin indent on           " required
" End Vundle -----------------------------------------------------------
" ----------------------------------------------------------------------

" ----------------------------------------------------------------------
" Vim Settings ---------------------------------------------------------
syntax on
set background=dark
colorscheme solarized

" ----------------------------------------------------------------------
" Keys -----------------------------------------------------------------
nnoremap ; :

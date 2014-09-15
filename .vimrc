" ----------------------------------------------------------------------
" Vundle Setup ---------------------------------------------------------
set nocompatible                    " be iMproved, required
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

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

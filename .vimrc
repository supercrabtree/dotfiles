set nocompatible
" ------------------------------------------------------------------------------
" Vundle Setup -----------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
"Plugin 'scrooloose/nerdtree'
"Plugin 'godlygeek/tabular'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'PeterRincker/vim-argumentative'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'digitaltoad/vim-jade'
"Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'groenewege/vim-less'
Plugin 'kana/vim-arpeggio'
"Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mhinz/vim-startify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'dahu/vim-fanfingtastic'
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on

" ------------------------------------------------------------------------------
" Vim Settings -----------------------------------------------------------------
syntax on
set encoding=utf-8
set term=xterm-256color

" always show status bar
set laststatus=2

" show relative line numbers
set relativenumber

" show the current line number rather than zero
set number

" hightlight current cursor line
set cursorline

" hightlight search results
set hlsearch

" incremental search
set incsearch

" set no timeout when swapping modes
set timeoutlen=1000 ttimeoutlen=0

" don't show vim mode in bottom right
set noshowmode

" no line wrap
set nowrap

" settings to stop automatic line wrapping when typing
set textwidth=0
set wrapmargin=0

" gimme mouse
set mouse=a

" let the backspace work normally
set backspace=2

" new split panes always on the bottom or right
set splitbelow
set splitright

" always keep some context when moving about
set scrolloff=3

" allow buffers to be hidden
set hidden

" allow cursor to move anywhere
" set ve=all

" off for some reason, can't remember why...
set nowritebackup

" don't dirty up my repos
set backupdir=~/vim-tmp
set directory=~/vim-tmp

" dont move the cursor to the start of a line when switching buffers
set nostartofline

" dont redraw when executing macros
set lazyredraw

" show me those ugly tabs so i can kill them
set list
set listchars=tab:❯—

" white space
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" colors
set background=dark
colorscheme solarized
hi StatusLine ctermbg=12 ctermfg=0
hi CursorLineNR ctermbg=8 ctermfg=12

" highlight the 81st colomm
highlight ColorColumn ctermbg=0
set colorcolumn=81

" matching braces highlight them blue bg and white fg
hi MatchParen ctermbg=4 ctermfg=7

" different cursor shapes for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" ------------------------------------------------------------------------------
" Keys -------------------------------------------------------------------------
map <Space> <Leader>

" faster navigation
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" navigate through visible lines too, when word wrapping
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" quick edits of my vimrc, tweeky fiddley
nmap <leader>v :e $MYVIMRC<cr>

" double tap space to clear search highlights
nmap <leader><space> :noh<cr>

" find in all files
nmap <leader>/ :Ag!

" exit insert mode
inoremap jj <esc>

" quicker commands
nnoremap ; :

" buffer navigation
nnoremap <c-u> :bwipe<cr>
nnoremap <c-j> :bnext<cr>
nnoremap <c-k> :bprevious<cr>

" quickly add lots of whitespace
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" don't jumo to the next word, thats really annoying
nnoremap * *N

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" make Y act like the other capitals and only delete until the end of the line
nnoremap Y y$

" get rid of Ex mode, and play the last recorded Q command instead
nnoremap Q @q

" replay last command
nnoremap !! :<Up><CR>

" iterm uses <c-j> and <c-k> to toggle through old commands so they have to be
" remapped back in here using their escape keys
map <silent> <esc>[A :bnext<cr>:echo<cr>
map <silent> <esc>[B :bprevious<cr>:echo<cr>

" sudo save
cmap w!! w !sudo tee > /dev/null %

" ------------------------------------------------------------------------------
" Plugin Settings
" CtrlP ------------------------------------------------------------------------
let g:ctrlp_map ='\'
let g:ctrlp_user_command = 'ag %s --ignore "lib/manual" --ignore ".git" -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'i'

let g:ctrlp_buffer_func = {
  \'enter': 'Enter_CtrlP',
  \'exit':  'Exit_CtrlP',
  \}
func! Enter_CtrlP()
  " hide status bar
  set laststatus=0
endfunc

func! Exit_CtrlP()
  " show status bar
  set laststatus=2
endfunc

" NERDTree ---------------------------------------------------------------------
nmap <leader>t :NERDTreeToggle<cr>
let g:NERDTreeWinSize = 40
let g:NERDTreeMapActivateNode='<space>'

" DelimitMate ------------------------------------------------------------------
let delimitMate_expand_cr = 1

" javascript-libraries-syntax --------------------------------------------------
let g:used_javascript_libs = 'underscore,angularjs,angularui'

" Ag - The Silver Searcher -----------------------------------------------------
let g:aghighlight=1

" Supertab ---------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

" YankStack --------------------------------------------------------------------
let g:yankstack_map_keys = 0
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-_> <Plug>yankstack_substitute_newer_paste


" Startify
let g:startify_custom_header = [
\ '                                                          __       __                                                                                                                                                                       |',
\ '                                                         /\ \     /\ \__                                                                                                                                                                    |',
\ '  ____  __  __  _____      __   _ __   ___   _ __    __  \ \ \____\ \ ,_\  _ __    __     __                                                                                                                                                |',
\ ' /'',__\/\ \/\ \/\ ''__`\  /''__`\/\`''__\/''___\/\`''__\/''__`\ \ \ ''__`\\ \ \/ /\`''__\/''__`\ /''__`\                                                                                                                                              |',
\ '/\__, `\ \ \_\ \ \ \L\ \/\  __/\ \ \//\ \__/\ \ \//\ \L\.\_\ \ \L\ \\ \ \_\ \ \//\  __//\  __/                                                                                                                                              |',
\ '\/\____/\ \____/\ \ ,__/\ \____\\ \_\\ \____\\ \_\\ \__/.\_\\ \_,__/ \ \__\\ \_\\ \____\ \____\                                                                                                                                             |',
\ ' \/___/  \/___/  \ \ \/  \/____/ \/_/ \/____/ \/_/ \/__/\/_/ \/___/   \/__/ \/_/ \/____/\/____/                                                                                                                                             |',
\ '                  \ \_\                                                                                                                                                                                                                     |',
\ '                   \/_/                                                                                                                                                                                                                     |',
\ '',
\ ]


" ------------------------------------------------------------------------------
" Status Line ------------------------------------------------------------------
set statusline=
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%<\                       " when the winow is too narrow, cut it here
set statusline+=%f\                       " path & filename
set statusline+=%=                        " align from here on to the right
set statusline+=[%c\|%l/%L]\              " [column,line/totalLines]


" ------------------------------------------------------------------------------
" Auto Commands ----------------------------------------------------------------
augroup georges_autocommands " {
  autocmd!
  autocmd InsertEnter * call EnterInsertMode()
  autocmd InsertLeave * call LeaveInsertMode()

  " auto source this .vimrc on save
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

  " return to the last edited position when opening a file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " when opening a new line in a comment, don't continue the comment, empty line please
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END " }


func! EnterInsertMode()
  if &background == "dark"
    hi CursorLineNR ctermbg=5 ctermfg=0
  else
    hi CursorLineNR ctermbg=5 ctermfg=9
  endif
endfunc
func! LeaveInsertMode()
  if &background == "dark"
    hi CursorLineNR ctermbg=8 ctermfg=12
  else
    hi CursorLineNR ctermbg=15 ctermfg=9
  endif
endfunc

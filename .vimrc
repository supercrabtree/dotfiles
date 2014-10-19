set nocompatible
" Vundle Setup -----------------------------------------------------------------
" ------------------------------------------------------------------------------
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
"Plugin 'kana/vim-arpeggio'
"Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mhinz/vim-startify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'dahu/vim-fanfingtastic'
Plugin 'ervandew/supertab'
Plugin 'takac/vim-hardtime'
" Plugin 'justinmk/vim-sneak'
Plugin 'sjbach/lusty'

call vundle#end()
filetype plugin indent on


" Custom Functions
" ------------------------------------------------------------------------------
function! EnterInsertMode()
  if &background == "dark"
    highlight CursorLineNR ctermbg=5 ctermfg=0
  else
    highlight CursorLineNR ctermbg=5 ctermfg=7
  endif
endfunction
function! LeaveInsertMode()
  if &background == "dark"
    highlight CursorLineNR ctermbg=8 ctermfg=12
  else
    highlight CursorLineNR ctermbg=15 ctermfg=8
  endif
endfunction

function! SetBackgroundDark()
  set background=dark
  highlight StatusLine ctermbg=12 ctermfg=0
  highlight CursorLineNR ctermbg=8 ctermfg=12
endfunction
function! SetBackgroundLight()
  set background=light
    highlight StatusLine ctermbg=12 ctermfg=7
    highlight CursorLineNR ctermbg=15 ctermfg=8
endfunction

function! Enter_CtrlP()
  " hide status bar
  " set laststatus=0
endfunction

function! Exit_CtrlP()
  " show status bar
  " set laststatus=2
endfunction

function! s:CloseBuffer()
  if &filetype == ""
    q
  else
    bdelete
  endif
endfunction
" command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    " \ | diffthis | wincmd p | diffthis
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction


" Custom Commands
" ------------------------------------------------------------------------------
command! CloseBuffer call s:CloseBuffer()
com! DiffSaved call s:DiffWithSaved()


" Vim Settings -----------------------------------------------------------------
" ------------------------------------------------------------------------------
syntax on
set encoding=utf-8
set term=xterm-256color

" always show status bar
set laststatus=2

" show relative line numbers
" set relativenumber

" show the current line number rather than zero
set number

" highlight current cursor line
set cursorline

" highlight search results
set hlsearch

" incremental search
set incsearch

" set no timeout when swapping modes
set timeoutlen=1000 ttimeoutlen=0

" don't show vim mode in bottom right
" set noshowmode

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

" smarter? indenting
set autoindent

" off for some reason, can't remember why...
set nowritebackup

" don't dirty up my repos
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" holy sheeet persistant undo
set undodir=~/.vim/undo
set undofile

" dont move the cursor to the start of a line when switching buffers
set nostartofline

" dont redraw when executing macros
set lazyredraw

" fancy line indenting on text wrap
set breakindent

" show me those ugly chars so i can kill them
set list
set listchars=tab:❯—,nbsp:§

" white space
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" colors
colorscheme solarized
call SetBackgroundDark()


" highlight the 81st colomm (changed in autocmd section below for git commits)
highlight ColorColumn ctermbg=0
set colorcolumn=81

" matching braces highlight them blue bg and white fg
highlight MatchParen ctermbg=4 ctermfg=7

" different cursor shapes for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" Keys -------------------------------------------------------------------------
  " ------------------------------------------------------------------------------
let mapleader="\<Space>"
nnoremap <space> <nop>

" clear search highlights and refresh screen
noremap <esc><esc><esc> :noh<cr><c-l>

" find in all files
nmap <leader>/ :Ag! --ignore=".git" --ignore="dist" --ignore="lib" --hidden 

" faster copy paste from the clipboard
nmap <leader>p "*p
nmap <leader>P "*P
nmap <leader>y "*y
nmap <leader>Y "*Y
nmap <leader>w :update<cr>
nmap <leader>q :quit<cr>
nmap <leader>e :write<cr>:quit<cr>
nmap <leader>sd :call SetBackgroundDark()<cr>
nmap <leader>sl :call SetBackgroundLight()<cr>

" faster navigatibn
" nmap J 5j
" nmap K 5k
" xmap J 5j
" xmap K 5k

" navigate through visible lines too, when word wrapping
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" exit insert mode
" inoremap jj <esc>

" quicker commands
" nnoremap ; :

" buffer navigation
" nnoremap <silent><c-u> :CloseBuffer<cr>
nnoremap <c-n> :bdelete<cr>
nnoremap <c-j> :bnext<cr>:echo<cr>
nnoremap <c-k> :bprevious<cr>:echo<cr>
nnoremap gb :ls<CR>:b<Space>

" quickly add lots of whitespace
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" faster goto line
nmap <cr> G

" don't jumo to the next word, thats really annoying
nnoremap * *N
nnoremap # #N

" Make horizontal scrolling easier
nmap <leader>l 10zl
nmap <leader>h 10zh
" nmap <silent> <C-o> 10zl
" nmap <silent> <C-i> 10zh

" make Y act like the other capitals and only delete until the end of the line
nnoremap Y y$

" get rid of Ex mode, and play the last recorded Q command instead
nnoremap Q @q

" replay last command
nnoremap !! :<Up><CR>

" iterm uses <c-j> and <c-k> to toggle through old commands so they have to be
" remapped back in here using their escape keys
map <silent> <esc>[A <c-j>
map <silent> <esc>[B <c-k>

" sudo save
cmap w!! w !sudo tee > /dev/null %


" Plugin Settings
" ------------------------------------------------------------------------------

" Hardtime ---------------------------------------------------------------------
" let g:hardtime_showmsg = 1
let g:hardtime_default_on = 1

" CtrlP ------------------------------------------------------------------------
let g:ctrlp_map ='\'
let g:ctrlp_user_command = 'ag %s --ignore "lib/manual" --ignore ".git" --ignore "dist" -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_buffer_func = {
  \'enter': 'Enter_CtrlP',
  \'exit':  'Exit_CtrlP',
  \}

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

" Startify ---------------------------------------------------------------------
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


" Status Line ------------------------------------------------------------------
" ------------------------------------------------------------------------------
set statusline=
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%<\                       " when the winow is too narrow, cut it here
set statusline+=%f\                       " path & filename
set statusline+=%=                        " align from here on to the right
set statusline+=[%c\|%l/%L]\              " [column,line/totalLines]


" Auto Commands ----------------------------------------------------------------
" ------------------------------------------------------------------------------
augroup georges_autocommands " {
  autocmd!
  autocmd InsertEnter * call EnterInsertMode()
  autocmd InsertLeave * call LeaveInsertMode()

  " auto source this .vimrc on save
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

  " return to the last edited position when opening a file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " highlight colums in git commit messages
  autocmd filetype gitcommit set colorcolumn=51,73
  autocmd filetype gitcommit setlocal spell

  " when opening a new line in a comment, don't continue the comment, empty line please
  autocmd FileType * set formatoptions-=r formatoptions-=o
  autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

  " auto create global marks when leaving
  autocmd BufLeave,BufWritePost $MYVIMRC      normal! mV
  autocmd BufLeave,BufWritePost $MYZSHRC      normal! mZ
  autocmd BufLeave,BufWritePost *.js          normal! mJ
  autocmd BufLeave,BufWritePost *.css,*.less  normal! mC
  autocmd BufLeave,BufWritePost *.html,*.jade normal! mH
augroup END " }

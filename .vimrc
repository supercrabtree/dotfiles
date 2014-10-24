set nocompatible


" Vundle Plugins ---------------------------------------------------------------
" ------------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
"Plugin 'PeterRincker/vim-argumentative'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
"Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'mhinz/vim-startify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'dahu/vim-fanfingtastic'
Plugin 'ervandew/supertab'
Plugin 'takac/vim-hardtime'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'justinmk/vim-sneak'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'

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

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

function! g:CopyToClipboard()
    let old_z = @z
    normal! gv"zy
    call system('pbcopy', @z)
    let @z = old_z
endfunction

" Custom Commands
" ------------------------------------------------------------------------------
command! SDiff call s:DiffWithSaved()


" Vim Settings -----------------------------------------------------------------
" ------------------------------------------------------------------------------
syntax on
set encoding=utf-8
set term=xterm-256color
set laststatus=2         " always show status bar
set number               " show the current line number rather than zero
set cursorline           " highlight current cursor line
set hlsearch             " highlight search results
set incsearch            " incremental search
set timeoutlen=1000      " set no timeout when swapping modes
set ttimeoutlen=0
set nowrap               " no line wrap
set textwidth=0          " settings to stop automatic line wrapping when typing
set wrapmargin=0
set mouse=a              " gimme mouse
set backspace=2          " let the backspace work normally
set splitbelow           " new split panes always on the bottom
set splitright           " new split panes always on the right
set scrolloff=3          " always keep some context when moving about
set hidden               " allow buffers to be hidden
set showcmd              " for easierness show the command in the bottom right
 " set ve=all             " allow cursor to move anywhere
set autoindent           " smarter? indenting
set nowritebackup        " off for some reason, can't remember why...
set backupdir=~/.vim/tmp " don't dirty up my repos
set directory=~/.vim/tmp
set undodir=~/.vim/undo  " holy sheeet persistant undo
set undofile
set nostartofline        " dont move the cursor to the start of a line when switching buffers
set lazyredraw           " dont redraw when executing macros
set breakindent          " fancy line indenting on text wrap
set list                 " show me those ugly chars so i can kill them
set listchars=tab:❯—,nbsp:§
set synmaxcol=800        " Don't try to highlight lines longer than 800 characters.
set ignorecase           " case insensitive search
set smartcase            " pig == PIG, Pig == Pig, but Pig != pig
set expandtab            " white space
set tabstop=2
set shiftwidth=2
set softtabstop=2

" colors stuff
colorscheme solarized
call SetBackgroundDark()

" highlight the 81st colomm (changed in autocmd section for git commits)
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
nmap <leader><space> :

" Raw shortcuts ++++++++++++++++++++++++
" save deserves a super short shortcuts, fact
" nnoremap s :write<cr>:echo strftime("%I:%M:%S %p")<cr>

" clear search highlights and refresh screen
map <leader>r :noh<cr>:redraw<cr>

" Leaders ++++++++++++++++++++++++++++++
" Unite - Find [f]ings [c]wd [r]ecent, [b]uffer, [h]ere, [t]here, [a]nywhere
nmap <leader>ff :Unite -buffer-name=buffer-files-mru -start-insert              buffer file_mru file_rec/async:!<cr>
nmap <leader>fc :Unite -buffer-name=files            -start-insert              file_rec/async:!<cr>
nmap <leader>fr :Unite -buffer-name=mru              -start-insert              file_mru<cr>
nmap <leader>fb :Unite -buffer-name=buffer           -quick-match               buffer<cr>
nmap <leader>fd :Unite -buffer-name=here                                        file<cr>
nmap <leader>ft :Unite -buffer-name=there            -path=/Users/supercrabtree file<cr>
nmap <leader>fa :Unite -buffer-name=any              -path=/                    file<cr>
nmap <leader>/  :Unite -buffer-name=ag               -auto-preview              grep:.<cr>

" OSX not copying t clipboard??
noremap <leader>p :silent! set paste<CR>"*p:set nopaste<CR>
vnoremap <leader>y :<c-u>call g:CopyToClipboard()<cr>

nmap <leader>q :quit<cr>
nmap <leader>w :write<cr>
nmap <leader>Q :write<cr>:quit<cr>

nmap <leader>sd :call SetBackgroundDark()<cr>
nmap <leader>sl :call SetBackgroundLight()<cr>

" sick of shitty indenting
nmap <leader>} <i[
nmap <leader>{ >i[
nmap <leader>[ <i{
nmap <leader>] >i{

" faster navigatibn
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" navigate through visible lines too, when word wrapping
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" buffer navigation easier
nnoremap <c-n> :bdelete<cr>
nnoremap <c-j> :bnext<cr>:echo<cr>
nnoremap <c-k> :bprevious<cr>:echo<cr>

" More sensible redo, I always typo <c-r> to <s-r> and it breaks everything
nnoremap U <c-r>

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

" make Y act like the other capitals and only delete until the end of the line
nnoremap Y y$

" get rid of Ex mode, and play the last recorded Q command instead
nnoremap Q @q

" replay last command
nnoremap !! :<Up><CR>

" iterm uses <c-j> and <c-k> to toggle through old commands so they have to be
" remapped back in here using their escape keys
" map <silent> <esc>[A <c-j>
" map <silent> <esc>[B <c-k>

" sudo save
cmap w!! w !sudo tee > /dev/null %


" Plugin Settings
" ------------------------------------------------------------------------------

" Hardtime ---------------------------------------------------------------------
" let g:hardtime_showmsg = 1
let g:hardtime_default_on = 0

" Whitespace
let g:better_whitespace_filetypes_blacklist=['unite', 'startify']

" Unite ------------------------------------------------------------------------
let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --ignore ".git" --ignore "lib/manual" --ignore ".tmp" --ignore "node_modules" --hidden -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden --ignore ".git" --ignore "lib/manual" --ignore ".tmp" --ignore "node_modules"'
let g:unite_source_grep_recursive_opt = ''
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Custom mappings for the unite buffer
function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <BS> <BS>
  nmap <buffer> <esc> <Plug>(unite_exit)
  nmap <buffer> <tab> <nop>
  imap <buffer> <tab> <nop>
  imap <buffer> <c-j> <Plug>(unite_select_next_line)
  imap <buffer> <c-k> <Plug>(unite_select_previous_line)
endfunction

" DelimitMate ------------------------------------------------------------------
let delimitMate_expand_cr = 1

" javascript-libraries-syntax --------------------------------------------------
let g:used_javascript_libs = 'underscore,angularjs,angularui'

" Ag - The Silver Searcher -----------------------------------------------------
" let g:aghighlight=1

" Supertab ---------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

" YankStack --------------------------------------------------------------------
let g:yankstack_map_keys = 0
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-_> <Plug>yankstack_substitute_newer_paste


" Status Line ------------------------------------------------------------------
" ------------------------------------------------------------------------------
set statusline=
set statusline+=%*[%n%H%M%R%W]%*\         " flags and buf no
set statusline+=%c\|%p%%                      " percentage through file
set statusline+=%<\                       " when the winow is too narrow, cut it here
set statusline+=%f\                       " path & filename
set statusline+=%=                        " align from here on to the right
set statusline+=%{getcwd()}               " show current working directory of vim instance
" set statusline+=\ [%{v:register}]         " show the current register in use
" set statusline+=%c\:\%l\\|\%P           " [column,line/totalLines]

" Auto Commands ----------------------------------------------------------------
" ------------------------------------------------------------------------------
augroup georges_autocommands " {
  autocmd!
  autocmd InsertEnter * call EnterInsertMode()
  autocmd InsertLeave * call LeaveInsertMode()

  autocmd FileType unite call s:unite_settings()

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

  " help file in a right slit please
  autocmd FileType help wincmd L

  " css completion
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType less setlocal iskeyword+=-
  autocmd FileType html setlocal iskeyword+=-
  autocmd FileType jade setlocal iskeyword+=-
augroup END " }

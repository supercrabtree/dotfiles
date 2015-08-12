set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Plugins
" ------------------------------------------------------------------------------

" Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neocomplete.vim'

" Pope stack
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-obsession'

" June Gunn
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'junegunn/vim-easy-align'

" Usability
Plug 'ntpeters/vim-better-whitespace'
Plug 'justinmk/vim-sneak'
Plug 'AndrewRadev/linediff.vim'
Plug 'ap/vim-buftabline'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
Plug 'chrisbra/Recover.vim'
Plug 'airblade/vim-gitgutter'

" Language Specific
Plug 'digitaltoad/vim-jade'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'fatih/vim-go'
Plug 'wavded/vim-stylus'

" Trialing/tmp
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

filetype plugin indent on

runtime macros/matchit.vim


" Vim Settings
" ------------------------------------------------------------------------------
set t_Co=256
set encoding=utf-8
set term=xterm-256color
set laststatus=2               " always show status bar
set number                     " show the current line number
set cursorline                 " highlight current cursor line
set hlsearch                   " highlight search results
set incsearch                  " incremental search
set timeoutlen=1000            " set no timeout when swapping modes
set ttimeoutlen=0
set nowrap                     " no line wrap
set textwidth=0                " settings to stop automatic line wrapping when typing
set wrapmargin=0               " hate text wrap
set mouse=a                    " gimme mouse
set splitbelow                 " new split panes always on the bottom
set splitright                 " new split panes always on the right
set scrolloff=3                " always keep some context when moving about
set hidden                     " allow buffers to be hidden
set showcmd                    " for easierness show the command in the bottom right
set autoindent                 " smarter? indenting
set nowritebackup              " off for some reason, can't remember why...
set backupdir=~/.vim/tmp       " don't dirty up my repos
set directory=~/.vim/tmp
set undodir=~/.vim/undo        " holy sheeet persistant undo
set undofile
set undolevels=1000            " howmany undos per file
set undoreload=10000
set nostartofline              " dont move the cursor to the start of a line when switching buffers
set lazyredraw                 " dont redraw when executing macros
set list                       " show me those ugly chars so i can kill them
set listchars=tab:❯—,nbsp:§
set synmaxcol=800              " Don't try to highlight lines longer than 800 characters.
set ignorecase                 " case insensitive search
set smartcase                  " pig == PIG, Pig == Pig, but Pig != pig
set expandtab                  " white space
set completeopt-=preview       " dont show annoying preview window
set backspace=indent,eol,start " let the backspace work normally
set fillchars=vert:\|
set tabstop=2
set shiftwidth=2
set softtabstop=2
set colorcolumn=81
set history=1000
set wildmenu
" set wildignore=*/.git/**/*
" set wildignore+=**/node_modules/**/*
" set wildignore+=**/bower_components/**/*

" different cursor shapes for insert mode
if &term == 'xterm-256color' || &term == 'screen-256color'
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif


" Change keycodes
" ------------------------------------------------------------------------------
" in karabiner ctrl-m is remapped to <F19> so i can use it indepent of return
set <F17>=[15;2~
set <F18>=[17;2~
set <F19>=[18;2~


" Keyboard Shortcuts
" ------------------------------------------------------------------------------
inoremap jj <esc>
noremap <C-C> <Esc>
vnoremap Y y`]

" now give join back
nnoremap + mzj0d^i<bs><esc>`z

" clear search highlights and refresh screen
nnoremap <silent> <bs> :noh<cr>:redraw<cr>jk

" rapid buffer nav
nnoremap <silent> <down> :bprevious<cr>
nnoremap <silent> <up> :bnext<cr>
nnoremap <silent> <left> <c-^>

nnoremap <F17> <c-w>W
nnoremap <F18> <c-w>w

inoremap <F17> <esc><c-w>W
inoremap <F18> <esc><c-w>w

vnoremap <F17> <esc><c-w>W
vnoremap <F18> <esc><c-w>w

cnoremap <F17> <c-u><esc><c-w>W
cnoremap <F18> <c-u><esc><c-w>w

" ctrl-loose
nnoremap <silent> <right> :bdelete<cr>

" allow suspension in insert mode
inoremap <c-z> <esc><c-z>

" don't jumo to the next word, thats really annoying
nnoremap * *N
nnoremap # #N

" get rid of Ex mode, and play the last recorded q register instead
nmap Q @q

" map ctrl q to quit
noremap <c-q> <esc>:<c-u>q<cr>

" map ctrl space to save
nnoremap <NUL> <esc>:<c-u>w<cr>
inoremap <NUL> <esc>:<c-u>w<cr>a

" Make Y act like the other capitals
nnoremap Y y$

" redindent pasting
nnoremap p p=`]

" replay last command
nnoremap !! :<Up><CR>

" use - to interact with the system keyboard
vnoremap - :<c-u>call g:CopyTheText()<cr>
nnoremap - :r !pbpaste<cr>

" ctrl-a copies register to system clipboard
nnoremap <c-a> :<c-u>call system('pbcopy', @")<cr>:echo 'Copied:' @"<cr>

" " ctrl-s to substitute
" nnoremap <c-s> :<c-u>%smagic/

nnoremap gV `[V`]

nnoremap gu u*<c-r>n

nnoremap g0 ^

" neocomplete close pum
" inoremap <expr> <esc> pumvisible() ? "\<c-o>:pclose<cr>" : "\<esc>"

vmap <Enter> <Plug>(EasyAlign)


" Space Leaders
" ------------------------------------------------------------------------------
" append function parameter
nnoremap <space>af 0/function.*<cr>:silent noh<cr>f(%i

" append parameter
nnoremap <space>aa f)i

" insert empty lines easily
nnoremap <space>o o<esc>
nnoremap <space>O O<esc>

" debugger toggle
nnoremap <silent> <space>d :ToggleDebugger<cr>

" make use strict javascript
nnoremap <space>us mzggO'use strict';<cr><esc>`z

" show highlight group under cursor
nnoremap <space>sh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

vnoremap // y/<C-R>"<CR>N


" Arglist stuff
" ------------------------------------------------------------------------------
nnoremap <space>ad :ArgsDelete<cr>
nnoremap <space>as :ArgsShow<cr>
nnoremap <space>ar :ArgsReorderByBufNum<cr>
nnoremap <space>ac :ArgsCleanDuplicates<cr>
nnoremap <F19> :ArgToggle<cr>
nnoremap M :ArgToggle<cr>
nnoremap J :ArgPrevious<cr>
nnoremap K :ArgNext<cr>
nnoremap L :ArgDelete<cr>

command! ArgsDelete :call <sid>ArgsDelete()
function! <sid>ArgsDelete()
  try
    %argd
  catch /E474/
  endtry
  set tabline=%!buftabline#render()
  echo 'Arg list emptied'
endfunction

command! ArgDelete :call <sid>ArgDelete()
function! <sid>ArgDelete()
  try
    argd %
  catch /E480/
  endtry
  bdelete
endfunction

command! ArgsCleanDuplicates :call <sid>ArgsCleanDuplicates()
function! <sid>ArgsCleanDuplicates()
  let args = argv()
  %argd
  for arg in uniq(args)
    execute 'arga ' . arg
  endfor
  call <SID>ArgsShow()
endfunction

command! ArgsReorderByBufNum :call <SID>ArgsReorderByBufNum()
function! <SID>ArgsReorderByBufNum()
  let args = argv()
  function! SortByBufferNumber(arg1, arg2)
    return bufnr(a:arg1) > bufnr(a:arg2) ? 1 : -1
  endfunction
  %argd
  let reorderedArgs = sort(args, "SortByBufferNumber")
  for arg in reorderedArgs
    execute 'arga ' . arg
  endfor
  call <SID>ArgsShow()
endfunction

command! ArgNext :call <SID>ArgNext()
function! <SID>ArgNext()
  let argListLength = len(argv())
  if argListLength == 0
    echo 'Arg list empty'
    return
  endif
  if argListLength == 1
    echo 'Only item in arg list'
    silent first
    return
  endif
  try
    silent next
  catch /E165/
    silent first
  endtry
  call <SID>ArgsShow()
endfunction

command! ArgPrevious :call <SID>ArgPrevious()
function! <SID>ArgPrevious()
  let argListLength = len(argv())
  if argListLength == 0
    echo 'Arg list empty'
    return
  endif
  if argListLength == 1
    echo 'Only item in arg list'
    silent first
    return
  endif
  try
    silent previous
  catch /E164/
    silent last
  endtry
  call <SID>ArgsShow()
endfunction

command! ArgToggle :call <SID>ArgToggle()
function! <SID>ArgToggle()
  let hasToggled = 0
  for arg in argv()
    if arg == @%
      echohl WarningMsg
      echo 'Deleted ' . arg
      echohl Normal
      argd %
      let hasToggled = 1
      break
    endif
  endfor
  if hasToggled == 0
    echohl GoodMsg
    echo 'Added ' . @%
    echohl Normal
    arga %
  endif
endfunction

command! ArgsShow :call <SID>ArgsShow()
function! <SID>ArgsShow()
  let argv = argv()
  if argv == []
    echo 'Arg list empty'
    return
  endif
  for arg in argv
    if arg == @%
      echohl GoodMsg
    endif
    echon fnamemodify(arg, ':t') . '  '
    if arg == @%
      echohl Normal
    endif
  endfor
endfunction

" Status Line
" ------------------------------------------------------------------------------
set statusline=
set statusline+=%*[%n%H%M%R%W]%*\         " flags and buf no
set statusline+=%c\|%L\|%p%%                " percentage through file
set statusline+=%{ShowCount()}\         " show last search count
set statusline+=%<                        " when the window is too narrow, cut it here
set statusline+=%f                        " path & filename
" set statusline+=%=                        " align from here on to the right


" Plugin Settings
" ------------------------------------------------------------------------------
" Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

let g:sneak#textobject_z = 0
let g:sneak#s_next = 1

" Undotree
nnoremap <space>ut :UndotreeToggle<cr>
let g:undotree_SplitWidth = 40
let g:undotree_DiffpanelHeight = 18
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2

function! g:Undotree_CustomMap()
  noremap <buffer> <down> <nop>
  noremap <buffer> <up> <nop>
  noremap <buffer> <down> J
  noremap <buffer> <up> K
  noremap <buffer> C <nop>
  noremap <buffer> gg ggjj
endfunction

" Peekaboo
let g:peekaboo_window = 'vertical botright 40new'

" Bufline
let g:buftabline_indicators=1
let g:buftabline_show=1

" Whitespace
let g:better_whitespace_filetypes_blacklist=['unite', 'gitcommit', 'help']

" Neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=1

let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'


" Multiple Cursors
nnoremap <silent> <C-c> :call multiple_cursors#quit()<CR>

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  exe 'NeoCompleteLock'
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  exe 'NeoCompleteUnlock'
endfunction

" indexed search
let g:indexed_search_colors=0
let g:indexed_search_shortmess=1
let g:indexed_search_dont_move=1

" Unite
nnoremap <space>f          :Unite               -start-insert file_rec/async:!<cr>
nnoremap <space>F          :UniteWithCurrentDir -start-insert file_rec/async:!<cr>
nnoremap <space>r          :Unite               -start-insert file_mru<cr>
nnoremap <space>b          :Unite               -start-insert -auto-resize buffer<cr>
nnoremap <space>h          :Unite               -start-insert -no-split file file/new<cr>
" Notes
nnoremap <space>j          :Unite               -start-insert -path=/Users/supercrabtree/Dropbox/Notes file file/new<cr>

" Grep
nnoremap <space>g          :Unite               -auto-preview -no-split -smartcase -no-empty grep:.<cr>
nnoremap <space>G          :Unite               -auto-preview -no-split -smartcase -no-empty grep:$buffers<cr>
nnoremap <space>k :execute 'Unite grep:.::' . expand("<cword>") . ' -auto-preview -no-split -smartcase -no-empty'<cr>
nnoremap <space>K :execute 'Unite grep:$buffers::' . expand("<cword>") . ' -auto-preview -no-split -smartcase -no-empty'<cr>

" Custom mappings for the unite buffer
function! s:unite_settings()
  nmap <buffer> <tab> <nop>
  imap <buffer> <tab> <nop>
  nmap <buffer> <esc> <nop>
  imap <buffer> <F19> <nop>
  nmap <buffer> q <nop>

  imap <buffer> <BS> <BS>

  nmap <buffer> <down>  <Plug>(unite_select_next_line)
  imap <buffer> <down>  <Plug>(unite_select_next_line)
  nmap <buffer> <up>    <Plug>(unite_select_previous_line)
  imap <buffer> <up>    <Plug>(unite_select_previous_line)
  imap <buffer> <c-n>   <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer> <c-n>   <Plug>(unite_toggle_mark_current_candidate)
  imap <buffer> <right> <Plug>(unite_redraw)
  nmap <buffer> <right> <Plug>(unite_redraw)
  nmap <buffer> <C-c>   <Plug>(unite_exit)
  imap <buffer> <C-c>   <Plug>(unite_exit)
  imap <silent><buffer><expr> <c-r> unite#do_action('rename')
endfunction

let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --ignore ".git" --ignore "lib" --ignore ".tmp" --ignore "node_modules" --ignore "fonts" --hidden -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden --ignore ".git" --ignore "lib" --ignore ".tmp" --ignore "node_modules" --ignore "fonts"'
let g:unite_source_grep_recursive_opt = ''
call unite#filters#matcher_default#use(['matcher_fuzzy', 'converter_relative_word'])
call unite#filters#sorter_default#use(['sorter_rank'])

let s:filters = {
\   "name" : "my_converter",
\}

function! s:filters.filter(candidates, context)
  for candidate in a:candidates
    let bufname = bufname(candidate.action__buffer_nr)
    let filename = fnamemodify(bufname, ':p:t')
    let path = fnamemodify(bufname, ':p:h')

    " Customize output format.
    let candidate.abbr = printf("%s", filename)
  endfor
  return a:candidates
endfunction

call unite#define_filter(s:filters)
unlet s:filters

call unite#custom#source('buffer', 'converters', 'my_converter')

let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_mru,file_rec,file_rec/async,grep', 'max_candidates', 0)

" Functions
" ------------------------------------------------------------------------------
function! s:JSONPrettyify()
  execute "%!python -m json.tool"
endfunction
command! JSONPretty call <SID>JSONPrettyify()

function! s:ToggleDebuggerStatement()
  let current_line = getline('.')
  let found =  matchstr(current_line, '\s*\S*')
  if empty(found)
    normal ccdebugger;
  elseif !empty(matchstr(found, '\s*debugger;'))
    normal ddk
  else
    normal odebugger;
  endif
endfunction
command! ToggleDebugger call <SID>ToggleDebuggerStatement()

function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

function! s:RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R %"
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open %:p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
  redraw!
endfunction
command! Reveal call <SID>RevealInFinder()

function! g:CopyTheText()
  let old_z = @z
  normal! gv"zy
  call system('pbcopy', @z)
  let @z = old_z
endfunction

" " show search count in status line
let s:prevcountcache=[[], 0]
function! ShowCount()
    let key=[@/, b:changedtick]
    if s:prevcountcache[0]==#key
        return s:prevcountcache[1]
    endif
    let s:prevcountcache[0]=key
    let s:prevcountcache[1]=0
    let pos=getpos('.')
    try
        redir => subscount
        silent %s///gne
        redir END
        let match_number = matchstr(subscount, '\d\+')
        let result=''
        let s:prevcountcache[1]=result
        if match_number > 0
          let result='|x'.match_number
          let s:prevcountcache[1]=result
        endif
        return result
    finally
        call setpos('.', pos)
    endtry
endfunction



" Auto Commands
" ------------------------------------------------------------------------------
augroup georges_autocommands
  autocmd!
  autocmd FileType unite call s:unite_settings()

  " return to the last edited position when opening a file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " highlight colums in git commit messages
  autocmd filetype gitcommit set colorcolumn=51,73
  autocmd filetype gitcommit setlocal spell
  autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

  " when opening a new line in a comment, don't continue the comment, empty line please
  autocmd FileType * set formatoptions-=r formatoptions-=o

  " auto create global marks when leaving
  autocmd BufLeave,BufWritePost $MYVIMRC normal! mV
  autocmd BufLeave,BufWritePost $MYZSHRC normal! mZ

  " css completion
  autocmd FileType * set iskeyword+=-

  autocmd BufNewFile,BufRead *.less set ft=less.css

  autocmd filetype go setlocal listchars=tab:\ \ ,nbsp:§

  autocmd BufLeave * if !&diff | let b:winview = winsaveview() | endif
  autocmd BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | endif

  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

  autocmd FileType qf call AdjustWindowHeight(3, 35)

  " save session by default when saving
  autocmd VimEnter * if !exists('g:this_obsession') && expand('%:p') !~# '\.git[\/].*MSG$' | silent Obsession | endif

augroup END




" Colors
" ------------------------------------------------------------------------------
" dark
" 0  = 7%
" 12 = 10%
" 9  = 15%
" 10 = 25%
" 11 = 30%
" 8  = 50%
" 5  = 60%
" 13 = 70%
" 14 = 80%
" 7  = 90%
" 15 = 100%

" 1  = red
" 2  = green
" 3  = yellow
" 4  = blue
" 6  = purple

" light
" 0  = 7%
" 12 = 90%
" 9  = 80%
" 10 = 70%
" 11 = 60%
" 8  = 50%
" 5  = 30%
" 13 = 25%
" 14 = 15%
" 7  = 10%
" 15 = 100%

" 1  = red
" 2  = green
" 3  = yellow
" 4  = blue
" 6  = purple


hi clear
syntax reset


" ui
hi ColorColumn       ctermbg=9
hi CursorLine        ctermbg=9                 cterm=none
hi MatchParen        ctermbg=none ctermfg=1
hi SneakPluginTarget ctermbg=2    ctermfg=232
hi LineNr                         ctermfg=10
hi CursorLineNr                   ctermfg=none
hi Search            ctermbg=3    ctermfg=232
hi IncSearch         ctermbg=2    ctermfg=232  cterm=none
hi SpellBad          ctermbg=none ctermfg=1    cterm=none
hi ExtraWhitespce    ctermbg=1    ctermfg=1
hi PMenu             ctermbg=11   ctermfg=5
hi PMenuSel          ctermbg=10   ctermfg=14

hi uniteMarkedLine                ctermfg=2
hi DiffChange        ctermbg=none
hi StatusLine        ctermbg=9    ctermfg=13   cterm=none
hi StatusLineNC      ctermbg=none ctermfg=5    cterm=none
hi VertSplit         ctermbg=9    ctermfg=9
hi WildMenu          ctermbg=9    ctermfg=2
hi Visual            ctermbg=10   ctermfg=7    cterm=none


" Buftabline
hi BufTabLineActive  ctermbg=12 ctermfg=1 cterm=none
hi BufTabLineCurrent ctermbg=12 ctermfg=2    cterm=none
hi BufTabLineHidden  ctermbg=12 ctermfg=11   cterm=none
hi BufTabLineArglist ctermbg=12 ctermfg=5    cterm=none
hi BufTabLineFill    ctermbg=12              cterm=none


" git
hi diffAdded ctermfg=2
hi diffRemoved ctermfg=1
hi gitcommitBranch ctermfg=4


" Text
hi Normal     ctermfg=none
hi ErrorMsg   ctermbg=1   ctermfg=255
hi Error      ctermbg=1   ctermfg=255
hi NonText    ctermfg=5
hi Comment    ctermfg=11
hi Function   ctermfg=11
hi Special    ctermfg=11
hi SpecialKey ctermfg=4
hi Keyword    ctermfg=13
hi Type       ctermfg=5
hi Constant   ctermfg=5
hi String     ctermfg=4
hi Boolean    ctermfg=4
hi Preproc    ctermfg=5
hi Number     ctermfg=4
hi Identifier ctermfg=13
hi Statement  ctermfg=5
hi Title      ctermfg=255
hi Todo       ctermfg=7   ctermbg=13
hi WarningMsg ctermfg=1
hi GoodMsg    ctermfg=2
hi Directory  ctermfg=4
hi MoreMsg    ctermfg=2
hi Question   ctermfg=2
hi Folded     ctermfg=12   ctermbg=5
hi FoldColumn ctermfg=12   ctermbg=5
hi DiffAdd    ctermfg=2    ctermbg=none
hi DiffChange ctermfg=3   ctermbg=none
hi DiffDelete ctermfg=1   ctermbg=none
hi DiffText   ctermfg=8   ctermbg=7


" Language Specific
hi jsBooleanFalse ctermfg=1
hi jsBooleanTrue ctermfg=2
hi jsGlobalObjects ctermfg=13 " Math, Date, Number, console etc
hi jsStorageClass ctermfg=13 " var
hi jsFunction ctermfg=13 " function
hi jsFuncName ctermfg=5 " function name
hi javascriptAngularMethods ctermfg=13
hi jsFutureKeys ctermfg=1


" custom sytax varibles
syn match jadeNbsp "nbsp"
hi jadeNbsp ctermfg=2

syntax enable

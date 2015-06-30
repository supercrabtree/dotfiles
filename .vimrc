set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Plugins
" ------------------------------------------------------------------------------
Plugin 'gmarik/Vundle.vim'

" Unite
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neocomplete.vim'

" Pope stack
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-obsession'

" Usability
Plugin 'moll/vim-bbye'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'justinmk/vim-sneak'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'ap/vim-buftabline'
Plugin 'mbbill/undotree'

" Language Specific
Plugin 'digitaltoad/vim-jade'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'wavded/vim-stylus'

" Trialing/tmp
" Plugin 'takac/vim-hardtime'
Plugin 'chrisbra/Recover.vim'
" Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()
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
set undolevels=10000           " howmany undos per file
set nostartofline              " dont move the cursor to the start of a line when switching buffers
set lazyredraw                 " dont redraw when executing macros
set list                       " show me those ugly chars so i can kill them
set listchars=tab:❯—,nbsp:§
set synmaxcol=800              " Don't try to highlight lines longer than 800 characters.
set ignorecase                 " case insensitive search
set smartcase                  " pig == PIG, Pig == Pig, but Pig != pig
" set clipboard=unnamed          " share the clipboard
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

" different cursor shapes for insert mode
if &term == 'xterm-256color' || &term == 'screen-256color'
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif


" Keyboard Shortcuts
" ------------------------------------------------------------------------------
inoremap jj <esc>
noremap <C-C> <Esc>
vnoremap Y y`]

" faster navigation
nnoremap J 5j
nnoremap K 5k

" now give join back
nnoremap + mzj0d^i<bs><esc>`z

" clear search highlights and refresh screen
nnoremap <silent> <bs> :noh<cr>:redraw<cr>jk

" rapid buffer nav
nnoremap <silent> <down> :bprevious<cr>
nnoremap <silent> <up> :bnext<cr>
nnoremap <silent> <left> <c-^>

" ctrl-loose
nnoremap <silent> <right> :Bdelete<cr>

" allow suspension in insert mode
inoremap <c-z> <esc><c-z>

" don't jumo to the next word, thats really annoying
nnoremap * *N
nnoremap # #N

" get rid of Ex mode, and play the last recorded q regigster instead
nnoremap Q @q

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
nnoremap <c-a> :<c-u>call system('pbcopy', @")<cr>

" ctrl-s to substitute
nnoremap <c-s> :<c-u>%smagic/

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


" Status Line
" ------------------------------------------------------------------------------
set statusline=
set statusline+=%*[%n%H%M%R%W]%*\         " flags and buf no
set statusline+=%c\|%p%%\                 " percentage through file
" set statusline+=%{ShowCount()}\         " show last search count
" set statusline+=%{getcwd()}\            " show current working directory of vim instance
set statusline+=%<                        " when the winow is too narrow, cut it here
set statusline+=%f                        " path & filename
set statusline+=%=                        " align from here on to the right


" Plugin Settings
" ------------------------------------------------------------------------------
" Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

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

" Bufline
let g:buftabline_indicators=1
let g:buftabline_show=1

" Whitespace
let g:better_whitespace_filetypes_blacklist=['unite', 'gitcommit', 'help']

" Neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=1

nnoremap <silent> <C-c> :call multiple_cursors#quit()<CR>

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  exe 'NeoCompleteLock'
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  exe 'NeoCompleteUnlock'
endfunction

" Unite
nnoremap <space>f          :Unite -start-insert file_rec/async:!<cr>
nnoremap <space>r          :Unite -start-insert file_mru<cr>
nnoremap <space>b          :Unite -quick-match  -auto-resize buffer<cr>
nnoremap <space>h          :Unite -no-split     file<cr>

" Notes
nnoremap <space>j          :Unite -path=/Users/supercrabtree/Dropbox/Notes file<cr>

" Grep
nnoremap <space>g          :Unite -auto-preview -no-split -smartcase -no-empty grep:.<cr>
nnoremap <space>G          :Unite -auto-preview -no-split -smartcase -no-empty grep:$buffers<cr>
nnoremap <space>k :execute 'Unite grep:.::' . expand("<cword>") . ' -auto-preview -no-split -smartcase -no-empty'<cr>
nnoremap <space>K :execute 'Unite grep:$buffers::' . expand("<cword>") . ' -auto-preview -no-split -smartcase -no-empty'<cr>

" Custom mappings for the unite buffer
function! s:unite_settings()
  imap <buffer> <BS> <BS>
  nmap <buffer> <tab> <nop>
  imap <buffer> <tab> <nop>
  imap <buffer> <down>  <Plug>(unite_select_next_line)
  imap <buffer> <up>    <Plug>(unite_select_previous_line)
  imap <buffer> <c-n>   <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer> <c-n>   <Plug>(unite_toggle_mark_current_candidate)
  imap <buffer> <right> <Plug>(unite_redraw)
  nmap <buffer> <right> <Plug>(unite_redraw)
  nmap <buffer> <C-c>   <Plug>(unite_exit)
  imap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <esc> <nop>
  nmap <buffer> q <nop>
endfunction

let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --ignore ".git" --ignore "lib" --ignore ".tmp" --ignore "node_modules" --hidden -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden --ignore ".git" --ignore "lib" --ignore ".tmp" --ignore "node_modules"'
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
        let result='|x'.matchstr(subscount, '\d\+')
        let s:prevcountcache[1]=result
        return result
    finally
        call setpos('.', pos)
    endtry
endfunction



" Auto Commands
" ------------------------------------------------------------------------------
augroup georges_autocommands
  autocmd!
  " auto reload config on save
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

  autocmd FileType unite call s:unite_settings()

  " auto source this .vimrc on save
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

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

  au VimEnter * if !exists('g:this_obsession') && expand('%:p') !~# '\.git[\/].*MSG$' | silent Obsession | endif

  " css completion
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType less.css setlocal iskeyword+=-
  autocmd FileType sass setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
  autocmd FileType html setlocal iskeyword+=-
  autocmd FileType jade setlocal iskeyword+=-

  autocmd FileType css,css.lss,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

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
set background=dark
hi clear
syntax reset

" ui
hi ColorColumn ctermbg=234
hi CursorLine ctermbg=234 cterm=none
hi MatchParen ctermbg=none ctermfg=196
hi SneakPluginTarget ctermbg=203 ctermfg=233
hi SneakPluginTarget ctermbg=203 ctermfg=233
hi LineNr ctermfg=240
hi CursorLineNr ctermfg=252
hi Search ctermbg=214 ctermfg=232
hi IncSearch ctermfg=71 ctermbg=232
hi ExtraWhitespace ctermbg=124
hi SpellBad ctermfg=160 ctermbg=none
hi PMenu ctermbg=236 ctermfg=244
hi PMenuSel ctermbg=238 ctermfg=110
hi uniteMarkedLine ctermfg=65
hi DiffChange ctermbg=none
hi StatusLine ctermfg=236 ctermbg=252
hi StatusLineNC ctermfg=234 ctermbg=240
hi VertSplit ctermfg=234
hi TabLine cterm=none ctermfg=235 ctermbg=234
hi TabLineSel cterm=none ctermfg=250 ctermbg=233
hi TabLineFill cterm=none ctermfg=235 ctermbg=234

" Buftabline
hi BufTabLineActive ctermfg=242

" git
hi diffAdded ctermfg=65
hi diffRemoved ctermfg=124
hi gitcommitBranch ctermfg=110

" Text
hi Normal ctermfg=250
hi ErrorMsg ctermbg=160
hi Error ctermbg=160
hi NonText ctermfg=240
hi Comment ctermfg=236
hi Function ctermfg=242
hi Special ctermfg=245
hi SpecialKey ctermfg=17
hi Keyword ctermfg=247
hi Type ctermfg=246
hi Constant ctermfg=246
hi String ctermfg=110
hi Boolean ctermfg=110
hi Preproc ctermfg=246
hi Number ctermfg=110
hi Identifier ctermfg=242
hi Statement ctermfg=245
hi Title ctermfg=255
hi Todo ctermfg=234 ctermbg=249

" Language Specific
hi jsBooleanFalse ctermfg=124
hi jsBooleanTrue ctermfg=65
hi jsGlobalObjects ctermfg=65 " Math, Date, Number, console etc
hi jsStorageClass ctermfg=240 " var
hi jsFunction ctermfg=240 " function
hi jsFuncName ctermfg=247 " functionName
hi javascriptAngularMethods ctermfg=242
hi jsFutureKeys ctermfg=124

" custom sytax varibles
syn match jadeNbsp "nbsp"
hi jadeNbsp ctermfg=65
hi StartifyPath ctermfg=236
hi StartifyFile ctermfg=250


" light ------------------------------------------------------------------------
" hi ColorColumn ctermbg=255
" hi CursorLine ctermbg=255 cterm=none
" hi LineNr ctermfg=240
" hi PMenu ctermbg=254 ctermfg=236
" hi PMenuSel ctermbg=250 ctermfg=234
" hi uniteMarkedLine ctermfg=65

" hi TabLine cterm=none ctermfg=233 ctermbg=250
" hi TabLineSel cterm=none ctermfg=233 ctermbg=255
" hi TabLineFill cterm=none ctermfg=255 ctermbg=256

" hi StatusLine ctermfg=255 ctermbg=236
" hi StatusLineNC ctermfg=234 ctermbg=240
" hi VertSplit ctermfg=234

syntax enable

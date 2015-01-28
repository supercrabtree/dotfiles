set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins ----------------------------------------------------------------------
Plugin 'gmarik/Vundle.vim'

"Unite
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'

" Pope stack
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'

" Usability
Plugin 'moll/vim-bbye'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'justinmk/vim-sneak'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'ap/vim-buftabline'

" Language Specific
Plugin 'digitaltoad/vim-jade'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'

" Custom Text Objects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'thinca/vim-textobj-function-javascript'

" Trialing/tmp
Plugin 'takac/vim-hardtime'
Plugin 'csscomb/vim-csscomb'
Plugin 'wavded/vim-stylus'
Plugin 'vim-scripts/AutoComplPop'

call vundle#end()
filetype plugin indent on


" Keyboard Shortcuts -----------------------------------------------------------
imap jj <esc>

" auto select from AutoComplPop menu
" imap <expr> . pumvisible() ? '<cr>.' : '.'
" imap <expr> , pumvisible() ? '<cr>,' : ','
" imap <expr> ( pumvisible() ? '<cr>(' : '('
" imap <expr> [ pumvisible() ? '<cr>[' : '['
" imap <expr> / pumvisible() ? '<cr>/' : '/'
" imap <expr> <space> pumvisible() ? '<cr><space>' : '<space>'


" use minus to interact with the copy clipboard
vmap - :<c-u>call g:CopyTheText()<cr>
nmap - :r !pbpaste<cr>

" i am always deleting lines
nmap dj j
nmap dk k

" faster navigation
nmap J 5j
nmap K 5k

" now give join back
nmap + mzj0d^i<bs><esc>`z

" clear search highlights and refresh screen
nmap <silent> <bs> :noh<cr>:redraw<cr>jk

" rapid buffer nav
nmap <silent> <down> :bprevious<cr>
nmap <silent> <up> :bnext<cr>
nmap <silent> <left> <c-^>

" ctrl-no
nmap <silent> <c-n> :Bdelete<cr>

" don't jumo to the next word, thats really annoying
nnoremap * *N
nnoremap # #N

" get rid of Ex mode, and play the last recorded q regigster instead
nnoremap Q @q

" Make Y act like the other capitals
nnoremap Y y$

" quick jump
nnoremap <cr> G

" replay last command
nnoremap !! :<Up><CR>

" Leaders
" append function parameter
nmap <space>af 0/function.*<cr>:silent noh<cr>f(%i

" append parameter
nmap <space>aa f)i

" debugger toggle
nmap <space>d <esc>odebugger;<esc>==

" toggle bufline

" show highlight group under cursor
nmap <space>sh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" sessions
map <space>ms :mksession! ~/.vim/sessions/default <cr>
map <space>ls :source ~/.vim/sessions/default <cr>

" Plugin Settings --------------------------------------------------------------
" sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" Hardtime
" let g:hardtime_default_on = 0
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]
let g:list_of_insert_keys = ["h", "j", "k", "l"]

" Bufline
let g:buftabline_indicators=1
let g:buftabline_show=1

" Whitespace
let g:better_whitespace_filetypes_blacklist=['unite', 'gitcommit', 'help']

" DelimitMate
let delimitMate_expand_cr = 1

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,angularjs,angularui'

" Unite
nmap <space>f          :Unite -start-insert file_rec/async:!<cr>
nmap <space>r          :Unite               file_mru<cr>
nmap <space>b          :Unite -quick-match  buffer<cr>
nmap <space>h          :Unite -no-split     file<cr>
nmap <space>y          :Unite               history/yank<cr>

" Notes
nmap <space>j          :Unite -path=/Users/supercrabtree/Dropbox/Notes file<cr>

" Grep
nmap <space>g          :Unite -auto-preview -no-split -smartcase -no-empty grep:.<cr>
nmap <space>G          :Unite -auto-preview -no-split -smartcase -no-empty grep:$buffers<cr>
nmap <space>k :execute 'Unite grep:.::' . expand("<cword>") . ' -auto-preview -no-split -smartcase -no-empty'<cr>
nmap <space>K :execute 'Unite grep:$buffers::' . expand("<cword>") . ' -auto-preview -no-split -smartcase -no-empty'<cr>

" Custom mappings for the unite buffer
function! s:unite_settings()
  imap <buffer> <BS> <BS>
  nmap <buffer> <tab> <nop>
  imap <buffer> <tab> <nop>
  imap <buffer> <down>  <Plug>(unite_select_next_line)
  imap <buffer> <up>    <Plug>(unite_select_previous_line)
  imap <buffer> <c-n>   <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer> <c-n>   <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer> n       <Plug>(unite_toggle_mark_current_candidate)
  imap <buffer> <right> <Plug>(unite_redraw)
  nmap <buffer> <right> <Plug>(unite_redraw)
  nmap <buffer> <C-c>   <Plug>(unite_exit)
  imap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <esc> <nop>
  nmap <buffer> q <nop>
  " nmap <buffer> <esc>   <Plug>(unite_exit)
  call acp#disable()
endfunction

let g:unite_source_history_yank_enable = 1
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


" Functions --------------------------------------------------------------------
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


" Vim Settings -----------------------------------------------------------------
set t_Co=256
set encoding=utf-8
set term=xterm-256color
set laststatus=2         " always show status bar
set number               " show the current line number
set cursorline           " highlight current cursor line
set hlsearch             " highlight search results
set incsearch            " incremental search
set timeoutlen=700       " set no timeout when swapping modes
set ttimeoutlen=0
set nowrap               " no line wrap
set textwidth=0          " settings to stop automatic line wrapping when typing
set wrapmargin=0
" set mouse=a              " gimme mouse
set backspace=2          " let the backspace work normally
set splitbelow           " new split panes always on the bottom
set splitright           " new split panes always on the right
set scrolloff=3          " always keep some context when moving about
set hidden               " allow buffers to be hidden
set showcmd              " for easierness show the command in the bottom right
set autoindent           " smarter? indenting
set nowritebackup        " off for some reason, can't remember why...
set backupdir=~/.vim/tmp " don't dirty up my repos
set directory=~/.vim/tmp
set undodir=~/.vim/undo  " holy sheeet persistant undo
set undofile
set nostartofline        " dont move the cursor to the start of a line when switching buffers
set lazyredraw           " dont redraw when executing macros
set list                 " show me those ugly chars so i can kill them
set listchars=tab:❯—,nbsp:§
set synmaxcol=800        " Don't try to highlight lines longer than 800 characters.
set ignorecase           " case insensitive search
set smartcase            " pig == PIG, Pig == Pig, but Pig != pig
" set clipboard=unnamed    " share the clipboard
set expandtab            " white space
set completeopt-=preview " dont show annoying preview window
set fillchars=vert:\ 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set colorcolumn=81
" set ve=all             " allow cursor to move anywhere
" set breakindent          " fancy line indenting on text wrap

" different cursor shapes for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"



" Status Line ------------------------------------------------------------------
set statusline=
set statusline+=%*[%n%H%M%R%W]%*\         " flags and buf no
set statusline+=%c\|%p%%                  " percentage through file
set statusline+=%<\                       " when the winow is too narrow, cut it here
set statusline+=%f\                       " path & filename
set statusline+=%=                        " align from here on to the right
set statusline+=%{getcwd()}               " show current working directory of vim instance

" Auto Commands ----------------------------------------------------------------
augroup georges_autocommands
  autocmd!
  autocmd FileType unite call s:unite_settings()

  " disable acp in unite windows
  autocmd WinEnter * :if &ft=='unite' | AcpDisable | else | AcpEnable | endif

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

  " help file in a right slit please
  autocmd FileType help wincmd L

  " css completion
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType less setlocal iskeyword+=-
  autocmd FileType html setlocal iskeyword+=-
  autocmd FileType jade setlocal iskeyword+=-

  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

  autocmd BufNewFile,BufRead *.less set ft=less.css

  " golang
  autocmd filetype go setlocal listchars=tab:\ \ ,nbsp:§

  au BufLeave * if !&diff | let b:winview = winsaveview() | endif
  au BufEnter * if exists('b:winview') && !&diff | call   winrestview(b:winview) | endif
augroup END



" Colors -----------------------------------------------------------------------
set background=dark
hi clear
syntax reset

"fg=71

" ui
hi ColorColumn ctermbg=234
hi CursorLine ctermbg=234 cterm=none
hi MatchParen ctermbg=none ctermfg=196
hi SneakPluginTarget ctermbg=203 ctermfg=233
hi SneakPluginTarget ctermbg=203 ctermfg=233
hi LineNr ctermfg=240
hi CursorLineNr ctermfg=255
hi Search ctermbg=214 ctermfg=232
hi IncSearch ctermfg=71 ctermbg=232
hi ExtraWhitespace ctermbg=124
hi SpellBad ctermfg=160 ctermbg=none
hi PMenu ctermbg=236 ctermfg=244
hi PMenuSel ctermbg=238 ctermfg=110
hi uniteMarkedLine ctermfg=65
hi DiffChange ctermbg=none
hi StatusLineNC ctermfg=234 ctermbg=240
hi VertSplit ctermfg=234
hi TabLine cterm=none ctermfg=235 ctermbg=234
hi TabLineSel cterm=none ctermfg=250 ctermbg=233
hi TabLineFill cterm=none ctermfg=235 ctermbg=234

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


syntax enable

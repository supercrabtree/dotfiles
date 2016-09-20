set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Plugins
" ------------------------------------------------------------------------------

" Shougo
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neocomplete.vim'

" Pope stack
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'

" June Gunn
Plug 'junegunn/fzf'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'

" Usability
Plug 'bronson/vim-trailing-whitespace'
Plug 'justinmk/vim-sneak'
Plug 'AndrewRadev/linediff.vim'
Plug 'ap/vim-buftabline'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'svermeulen/vim-easyclip'
Plug 'nathanaelkane/vim-indent-guides'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-brace'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'poetic/vim-textobj-javascript'

" Language Specific
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'fatih/vim-go'
Plug 'wavded/vim-stylus'
Plug 'mattn/emmet-vim'
Plug 'heavenshell/vim-jsdoc'

" Trialing/tmp
Plug 'davidosomething/EasyClipRing.vim'
Plug 'nicklasos/vim-jsx-riot'
Plug 'Valloric/MatchTagAlways'
Plug 'Quramy/vim-js-pretty-template'

call plug#end()

filetype plugin indent on

runtime macros/matchit.vim


" :profile start profile.log
" :profile func *
" :profile file *
" " At this point do slow actions
" :profile pause
" :noautocmd qall!


" Vim Settings
" ------------------------------------------------------------------------------
set t_Co=256
set encoding=utf-8
set term=xterm-256color
set termguicolors
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
set ttyfast
set shell=zsh\ -l
set diffopt+=context:99999     " stop folds in diffs

" allow italics
set t_ZH=[3m
set t_ZR=[23m

" different cursor shapes for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Disable newtr
let loaded_netrwPlugin = 1



" Change keycodes
" ------------------------------------------------------------------------------
" in iterm command-up and command-down are remapped to send these sequences
" currently needed for karabiner
" set <F17>=[15;2~
set <F18>=[17;2~
" in karabiner ctrl-m is remapped to <F19> so i can use it indepent of return
set <F19>=[18;2~


" Keyboard Shortcuts
" ------------------------------------------------------------------------------
" Allow file writing when no permissions
cnoremap w!! w !sudo tee > /dev/null %

" Ctrl space writes file
nnoremap <NUL> <esc>:<c-u>w<cr>
inoremap <NUL> <esc>:<c-u>w<cr>a

inoremap jj <esc>
noremap <c-c> <Esc>
vnoremap Y y`]

nnoremap j gj
nnoremap k gk

imap <C-p> <Plug>(EasyClipRing)
let g:EasyClipShareYanks=1
nnoremap M YD
nnoremap <space>yf  :call EasyClip#Yank(expand('%:t'))<cr>:echo 'Yanked '.expand('%:t')<cr>
nnoremap <space>yrp :call EasyClip#Yank(fnamemodify(expand("%"), ":~:."))<cr>:echo 'Yanked '.fnamemodify(expand("%"), ":~:.")<cr>
nnoremap <space>yp  :call EasyClip#Yank(expand('%:p'))<cr>:echo 'Yanked '.expand('%:p')<cr>

" now give join back
nnoremap + mzj0d^i<bs><esc>`z
nnoremap g+ mzj0d^i<bs> <esc>`z

" Capital L end of line but not end of line char
vnoremap L $h

" auto insertions
inoremap {<cr> {}<C-G>U<Left><cr><cr><c-g>U<Up><tab>

" clear search highlights and refresh screen
nnoremap <silent> <bs> :noh<cr>:redraw<cr>jk:diffupdate<cr>

" rapid buffer nav
nnoremap <silent> <down> :PressDown<cr>
nnoremap <silent> <up> :PressUp<cr>
nnoremap <silent> <left> <c-^>

command! PressUp :call <sid>PressUp()
function! <sid>PressUp()
  if &diff
    normal [c
    return
  endif
  silent bnext
endfunction

command! PressDown :call <sid>PressDown()
function! <sid>PressDown()
  if &diff
    normal ]c
    return
  endif
  silent bprevious
endfunction

" ctrl-loose
nnoremap <silent> <right> :bdelete<cr>

" allow suspension in insert mode
inoremap <c-z> <esc><c-z>

" don't jump to the next word, thats really annoying
nnoremap * *N
nnoremap # #N

" get rid of Ex mode, and play the last recorded q register instead
nmap Q @q

" map ctrl q to quit
noremap <c-q> <esc>:<c-u>qa<cr>

" Make Y act like the other capitals
nnoremap Y y$

" redindent pasting
nnoremap p p=`]

" replay last command
nnoremap !! :<Up><cr>

" use - to interact with the system keyboard
vnoremap - :<c-u>call g:CopyTheText()<cr>
vnoremap g- xk:<c-u>r !pbpaste<cr>
nnoremap - :<c-u>r !pbpaste<cr>

" ctrl-a copies register to system clipboard
nnoremap <c-a> :<c-u>call system('pbcopy', @")<cr>:echo 'Copied to clipboard'<cr>
vnoremap <c-a> y:<c-u>call system('pbcopy', @")<cr>:echo 'Copied to clipboard'<cr>

" create 'search' mark before each search
nnoremap / ms/

nnoremap gV `[V`]

nnoremap gu u*<c-r>n

nnoremap g0 ^

" grab paste
vnoremap gp `[v`]

" neocomplete close pum
inoremap <expr> <c-c> pumvisible() ? neocomplete#cancel_popup() : "\<esc>"
inoremap <silent> <C-y> :NeoCompleteDisable<cr><c-y>:NeoCompleteEnable<cr>

vmap <Enter> <Plug>(EasyAlign)

" delete content, like dd but make it so you can jam it in another line somewhere
nnoremap dc ^v$hd"_dd

function! DoThatSpellingYo()
  if &spell=='nospell'
    set spell
    set nocursorline
  endif
  normal! as
endfunction
inoremap <c-s> <esc>:call DoThatSpellingYo()<CR>

nnoremap <silent> f<cr> :Finder<cr>

nnoremap gK K

nnoremap J :GitGutterNextHunk<cr>
nnoremap K :GitGutterPrevHunk<cr>
nnoremap H :GitGutterStageHunk<cr>
nnoremap U mh:GitGutterRevertHunk<cr>'h

" Ctrl-Enter is enter without leaving current place
inoremap <F18> <esc>lmzi<cr><esc>`za

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
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

vnoremap * y/<c-r>"<cr>N

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

nnoremap <space>ga :Git add %<cr><cr>:GitGutter<cr>
nnoremap <space>gA :Git add -A . <cr><cr>:GitGutter<cr>
nnoremap <space>gc :Gcommit -v -q<cr>
nnoremap <space>gC :Gcommit --amend -v -q<cr>
nnoremap <space>gs :Gstatus<cr>
nnoremap <space>gr :Git reset -q %<cr><cr>:GitGutter<cr>
nnoremap <space>gR :Git reset -q<cr><cr>:GitGutter<cr>
nnoremap <space>gd :Gdiff<cr>
nnoremap <space>gt :Git! diff --staged<cr>
nnoremap <space>gp :Gpush<cr>
nnoremap <space>gP :Git push --force<cr>
nnoremap <space>gl :silent Glog<cr>:copen 20<cr>f<space>lzs
nnoremap <space>gq :copen 20<cr>f<space>lzs

command! PutLastCommit :call <sid>PutLastCommit()
function! <sid>PutLastCommit()
  :read !git log -1 --pretty=%b<cr>
endfunction

let g:are_comments_invisible=0
command! Ghost :call <sid>Ghost()
function! <sid>Ghost()
  if g:are_comments_invisible
    hi! link Comment Comment
    let g:are_comments_invisible=0
  else
    hi! link Comment Ignore
    let g:are_comments_invisible=1
  endif
endfunction


" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! GzippedFileSize()
  let bytes = system("gzip -9 -c " . expand('%:p') . "| wc -c | xargs")
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB'
  elseif (exists('kbytes'))
    return kbytes . 'KB'
  else
    return bytes . 'B'
  endif
endfunction

function! ShowFileSize()
  echo 'filesize: ' . FileSize() . '| gzipped: ' . GzippedFileSize()
endfunction

command! ShowFileSize call ShowFileSize()

" Status Line
" ------------------------------------------------------------------------------
set statusline=
set statusline+=%L\:%c\ \|\ %p%%\ " current line number / percentage
set statusline+=%{ShowCount()}\   " show last search count
set statusline+=%<                " when the window is too narrow, cut it here
set statusline+=%f\               " path & filename
set statusline+=%{IsReadOnly()}
set statusline+=%{IsModified()}
" set statusline+=%{FileSize()}
" set statusline+=\ [%{GzippedFileSize()}]
set statusline+=%=                " align from here on to the right
set statusline+=%{fugitive#statusline()}


" Plugin Settings
" ------------------------------------------------------------------------------
" Extra whitespace
let g:extra_whitespace_ignored_filetypes = ['gitcommit']

" Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap S <Plug>Sneak_S

let g:sneak#streak = 0
let g:sneak#s_next = 0
let g:sneak#use_ic_scs = 1

" Match targets
let g:mta_set_default_matchtag_color=0
let g:mta_use_matchparen_group=0

" Undotree
nnoremap <space>ut :UndotreeToggle<cr>
let g:undotree_SplitWidth = 33
let g:undotree_DiffAutoOpen = 0
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
let g:peekaboo_window = 'vertical botright 80new'

" Bufline
let g:buftabline_indicators=1
let g:buftabline_show=1

" Neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=1

let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'

" Ctrlsf
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_indent = 2

vmap <c-s>  <Plug>CtrlSFVwordPath
nmap <c-s>s <Plug>CtrlSFCwordPath
nmap <c-s>/ <Plug>CtrlSFPwordPath

nnoremap <c-s>       :echoerr 'too slow!'<cr>
nnoremap <c-s><c-s>  :CtrlSF 
nnoremap <c-s><up>   :CtrlSF <up>
nnoremap <c-s><down> :CtrlSF <down>
nnoremap <c-s><c-t>  :CtrlSFToggle<cr>

let g:ctrlsf_mapping = {
\ "next"  : "<down>",
\ "prev"  : "<up>",
\ "popen" : ["p", "<c-p>"],
\ "open"  : "<cr>",
\ "tab"   : "",
\ "tabb"  : "",
\ "openb" : "O",
\ "split" : ""
\ }



" FZF
" ------------------------------------------------------------------------------
set rtp+=~/.fzf
vnoremap <c-f>      :<c-u>execute 'FindFilesHere ' . <sid>get_visual_selection()<cr>
nnoremap <c-f>      :echoerr 'too slow!'<cr>
nnoremap <c-f><c-f> :FindFilesIn<cr>
nnoremap <c-f>!     :FindFilesIn!<cr>
nnoremap <c-f>f     :execute 'FindFilesHere ' . expand('<cword>')<cr>
nnoremap <c-f>/     :FindFilesHere /<cr>
nnoremap <c-f>j     :FindFilesIn ~/Dropbox/Notes<cr>
nnoremap <c-f>h     :FindFilesIn ~/<cr>
nnoremap <c-f>r     :MRU<cr>
nnoremap <c-f><c-r> :MRU<cr>
nnoremap <c-b>      :Lines<cr>

function! s:getStockAgArgs(bang)
  if a:bang == 0
    return ' --depth "-1" --ignore ".git" --hidden --nocolor '
  else
    return ' --depth "-1" --ignore ".git" --hidden --nocolor --skip-vcs-ignores --path-to-agignore "~/.empty-agignore" '
  endif
endfunction

let s:ctrlF = '--bind ctrl-g:ignore --expect=ctrl-g'

command! -complete=file -nargs=1 Locate call fzf#run({'source': 'locate <q-args>', 'sink': 'e', 'options': ''})

command! -bang -complete=file -nargs=* FindFilesHere call <sid>FindFilesHere(<bang>0, <q-args>)
function! s:FindFilesHere(bang, args)
  call fzf#run({
\   'source'  : printf('ag'.<sid>getStockAgArgs(a:bang).'-g "" %s', '.'),
\   'sink*'   : function('<SID>FindFilesHandler'),
\   'options' : s:ctrlF . escape(empty(a:args) ? '' : ' --query="'.a:args.'"', '\')
\ })
endfunction

command! -bang -complete=file -nargs=? FindFilesIn call <sid>FindFilesIn(<bang>0, <q-args>)
function! s:FindFilesIn(bang, args)
  call fzf#run({
\   'source'  : printf('ag'.<sid>getStockAgArgs(a:bang).'-g "" %s',
\               escape(empty(a:args) ? '.' : a:args, '"\')),
\   'sink*'   : function('<SID>FindFilesHandler'),
\   'options' : s:ctrlF . escape(empty(a:args) ? '' : ' --prompt="'.a:args.'> "', '\')
\ })
endfunction

function! s:FindFilesHandler(files)
  if len(a:files) < 2
    return
  endif
  let action = a:files[0]
  if action == 'ctrl-g'
    let cmd = 'Finder'
  else
    let cmd = 'e'
  endif
  for file in a:files[1:]
    execute cmd s:escape(file)
  endfor
endfunction

function! s:all_files()
  return extend(
\ filter(reverse(copy(v:oldfiles)),
\        "v:val !~ 'fugitive:\\|__CtrlSF__$\\|__CtrlSFPreview__$\\|^/tmp/\\|.git/'"),
\ filter(map(s:buflisted(), 'bufname(v:val)'), '!empty(v:val)'))
endfunction

command! MRU call fzf#run({
\ 'source': 'sed "1d" $HOME/.cache/neomru/file',
\ 'sink*':   function('<sid>FindFilesHandler'),
\ 'options': '--bind ctrl-g:ignore --reverse --expect=ctrl-g --prompt "MRU> "'
\})

function! s:buflisted()
  return filter(range(1, bufnr('$')), 'buflisted(v:val)')
endfunction

function! s:escape(path)
  return escape(a:path, ' %#''"\')
endfunction

for [s:c, s:a] in items({'red': 31, 'green': 32, 'yellow': 33, 'blue': 34, 'magenta': 35})
  execute "function! s:".s:c."(str, ...)\n"
        \ "  return s:ansi(a:str, ".s:a.", get(a:, 1, 0))\n"
        \ "endfunction"
endfor

function! s:strip(str)
  return substitute(a:str, '^\s*\|\s*$', '', 'g')
endfunction

function! s:escape(path)
  return escape(a:path, ' %#''"\')
endfunction

function! s:ansi(str, col, bold)
  return printf("\x1b[%s%sm%s\x1b[m", a:col, a:bold ? ';1' : '', a:str)
endfunction

" Buffers
function! s:format_buffer(b)
  let name = bufname(a:b)
  let name = empty(name) ? '[No Name]' : name
  let flag = a:b == bufnr('')  ? '%' :
        \ (a:b == bufnr('#') ? '#' : ' ')
  let modified = getbufvar(a:b, '&modified') ? s:red(' [+]') : ''
  let readonly = getbufvar(a:b, '&modifiable') ? '' : s:green(' [RO]')
  let extra = join(filter([modified, readonly], '!empty(v:val)'), '')
  return s:strip(printf("[%s] %s\t%s\t%s", s:blue(a:b, 1), flag, name, extra))
endfunction

function! s:bufopen(lines)
  execute 'buffer' matchstr(a:lines[0], '\[\zs[0-9]*\ze\]')
endfunction

function! s:bufselect(bang)
  let bufs = map(s:buflisted(), 's:format_buffer(v:val)')

  call fzf#run({
  \ 'source':  bufs,
  \ 'sink*':   function('<SID>bufopen'),
  \ 'options': '+m --ansi -e -d "\t" -n 2,1..2 --prompt="Buffers> "'
  \})
endfunction

command! -bang AllBuffers call s:bufselect(<bang>0)


" Multiple Cursors
" nnoremap <silent> <c-c> :call multiple_cursors#quit()<cr>
let g:multi_cursor_exit_from_insert_mode=0

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  exe 'NeoCompleteLock'
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  exe 'NeoCompleteUnlock'
endfunction

" vim-indent-guides
let g:indent_guides_guide_size=2
let g:indent_guides_auto_colors=0
let g:indent_guides_default_mapping=0
nmap <silent> <space>i <Plug>IndentGuidesToggle


" Functions
" ------------------------------------------------------------------------------
function! s:Tailf()
  e
  redraw

  sleep 1
  call <sid>Tailf()
endfunction
command! Tailf call <sid>Tailf()

function! s:SpellMode()
  if &spell=='nospell'
    set spell
    set nocursorline
  else
    set nospell
    set cursorline
  endif
endfunction
command! SpellMode call <sid>SpellMode()

function! s:JSONPrettyify()
  execute "%!python -m json.tool"
endfunction
command! JSONPretty call <sid>JSONPrettyify()

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
command! ToggleDebugger call <sid>ToggleDebuggerStatement()

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

function! s:Open(file)

  if a:file != ''
    let l:file = a:file
  else
    let l:file = '%'
  endif

  if filereadable(expand(l:file))
    let l:command = "open " . l:file
  elseif getftype(expand(l:file . ":p:h")) == "dir"
    let l:command = "open ".l:file.":p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
  redraw!
endfunction

command! -complete=file -nargs=? Open call <sid>Open(<q-args>)

function! s:RevealInFinder(file)

  if a:file != ''
    let l:file = a:file
  else
    let l:file = '%'
  endif

  if filereadable(expand(l:file))
    let l:command = "open -R " . l:file
  elseif getftype(expand(l:file . ":p:h")) == "dir"
    let l:command = "open ".l:file.":p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
  redraw!
endfunction

command! -complete=file -nargs=? Finder call <sid>RevealInFinder(<q-args>)

function! g:CopyTheText()
  let old_z = @z
  normal! gv"zy
  call system('pbcopy', @z)
  let @z = old_z
endfunction

function! IsModified()
  if getbufvar(winbufnr(0), '&mod')
    return '+ '
  endif
  return ''
endfunction

function! IsReadOnly()
  if &ro
    return '[readonly] '
  endif
  return ''
endfunction

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\   'html': {
\       'snippets': {
\           'html': "<!doctype html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"utf-8\">\n  <title></title>\n  <meta name=viewport content=\"width=device-width,initial-scale=1\">\n</head>\n<body>\n${cursor}\n</body>\n</html>",
\           'defer': "<script defer src=\"${cursor}\"></script>",
\           'async': "<script async src=\"${cursor}\"></script>"
\       },
\       'default_attributes': {
\           'svg': [{'width': '500'}, {'height': '400'}, {'viewBox': '0 0 500 400'}, {'xmlns': 'http://www.w3.org/2000/svg'}, {'xmlns:xlink': 'http://www.w3.org/1999/xlink'}],
\       },
\   },
\ }

" function! GitDiffName()
"   let l:diffcontent = system("git diff --stat client/app-run.js | head -1")
"   if len(l:diffcontent)
"     return l:diffcontent
"   endif
"   return 'client/app-run.js'
" endfunction

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
          let result='| x'.match_number
          let s:prevcountcache[1]=result
        endif
        return result
    finally
        call setpos('.', pos)
    endtry
endfunction

function! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Auto Commands
" ------------------------------------------------------------------------------
augroup georges_autocommands
  autocmd!

  autocmd FileType ctrlsf map <buffer> <c-o> Ozt<c-w><c-w>
  autocmd FileType ctrlsf map <buffer> o     Ozt
  autocmd FileType ctrlsf map <buffer> K     <up>pzz
  autocmd FileType ctrlsf map <buffer> J     <down>pzz

  " return to the last edited position when opening a file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " highlight colums in git commit messages
  autocmd filetype gitcommit setlocal colorcolumn=51,73
  autocmd filetype gitcommit setlocal spell
  autocmd FileType gitcommit setlocal nocursorline
  autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
  autocmd FileType gitcommit if expand("%:h:t") ."/". expand("%:t") == ".git/index" | nmap <buffer> <down> :<C-U>execute <SNR>28_StageNext(v:count1)<CR>| else | map <buffer> <down> 10j| endif
  autocmd FileType gitcommit if expand("%:h:t") ."/". expand("%:t") == ".git/index" | nmap <buffer> <up> :<C-U>execute <SNR>28_StagePrevious(v:count1)<CR>| else | map <buffer> <up> 10k| endif

  " when opening a new line in a comment, don't continue the comment, empty line please
  autocmd FileType * set formatoptions-=r formatoptions-=o

  " Markdown
  au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md setfiletype markdown
  au filetype markdown setlocal spell
  au filetype markdown setlocal textwidth=79
  au filetype markdown setlocal formatoptions+=t
  au filetype markdown setlocal wrap linebreak nolist

  " auto create global marks when leaving
  autocmd BufLeave,BufWritePost /Users/supercrabtree/dev/dotfiles/.zshrc normal! mZ
  autocmd BufLeave,BufWritePost /Users/supercrabtree/dev/dotfiles/.vimrc normal! mV

  " css completion
  autocmd FileType * set iskeyword+=-

  autocmd BufNewFile,BufRead *.less set ft=less.css

  autocmd filetype go setlocal listchars=tab:\ \ ,nbsp:§

  autocmd BufEnter * if &diff | nmap dy <c-w><c-w>yy<c-w><c-w>Vp | endif

  autocmd BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | endif

  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

  autocmd FileType qf :nmap <up> k<cr>:copen 20<cr>f<space>lzs
  autocmd FileType qf :nmap <down> j<cr>:copen 20<cr>f<space>lzs
  " Removes red highlight around subshell commands in shell files
  autocmd FileType sh hi Error ctermbg=10 ctermfg=15

  au BufNewFile,BufRead *.tag setlocal ft=javascript

augroup END




" Colors
" ------------------------------------------------------------------------------
" white = #ffffff => 100%
" grey1 = #f3f3f3 => 97%
" grey2 = #e8e8e8 => 91%
" grey3 = #dbdbdb => 86%
" grey4 = #b3b3b3 => 70%
" grey5 = #808080 => 50%
" black = #000000 => 100%

" red      = #ce3a2f
" green    = #56bd22
" yellow   = #ffaf00
" blue     = #5c95da
" purple   = #8780c5


" Highlight          Background     Foreground     Style (cterm)
" ------------------------------------------------------------------------------
hi Normal            guifg=NONE
hi ErrorMsg          guibg=#ce3a2f  guifg=#ffffff
hi Error             guibg=#ce3a2f  guifg=#ffffff
hi NonText                          guifg=NONE
hi Comment           guifg=#808080
hi Ignore            guibg=#f3f3f3  guifg=#f3f3f3
hi Title                            guifg=NONE
hi Function                         guifg=NONE
hi Special                          guifg=NONE
hi SpecialKey                       guifg=NONE
hi Keyword                          guifg=NONE
hi Type                             guifg=NONE
hi Constant                         guifg=NONE
hi String                           guifg=NONE
hi Boolean                          guifg=NONE
hi Preproc                          guifg=NONE
hi Number                           guifg=NONE
hi Identifier                       guifg=NONE
hi Statement                        guifg=NONE
hi Todo                             guifg=NONE
hi WarningMsg                       guifg=#ce3a2f
hi GoodMsg                          guifg=#56bd22
hi Directory                        guifg=NONE
hi MoreMsg                          guifg=NONE
hi Question                         guifg=NONE
hi Folded                           guifg=NONE
hi FoldColumn                       guifg=NONE
hi DiffAdd           guibg=NONE     guifg=#56bd22
hi DiffChange        guibg=NONE
hi DiffDelete        guibg=#ce3a2f  guifg=#ce3a2f
hi DiffText          guibg=#e8e8e8  guifg=#ce3a2f
hi SpellBad          guibg=NONE     guifg=#ce3a2f  cterm=NONE
hi SpellCap          guibg=NONE     guifg=NONE     cterm=NONE

" UI elements
hi ColorColumn       guibg=#e8e8e8
hi CursorLine        guibg=#e8e8e8                 cterm=NONE
hi PMenu             guibg=#e8e8e8  guifg=#808080
hi LineNr            guifg=#b3b3b3
hi CursorLineNr      guifg=NONE
hi MatchParen        guibg=NONE     guifg=#ce3a2f
hi Search            guibg=#ffaf00  guifg=#000000
hi IncSearch         guibg=#56bd22  guifg=#000000  cterm=NONE

hi StatusLine        guibg=#e8e8e8  guifg=#000000  cterm=NONE
hi StatusLineNC      guibg=#e8e8e8  guifg=#b3b3b3  cterm=NONE
hi VertSplit         guibg=#e8e8e8  guifg=#e8e8e8
hi WildMenu          guibg=#000000  guifg=#ffffff

hi ExtraWhitespace   guibg=#ce3a2f  guifg=#ce3a2f


" Buftabline
hi BufTabLineActive                                cterm=italic
hi BufTabLineHidden  guibg=#e8e8e8  guifg=#808080  cterm=NONE
hi BufTabLineFill    guibg=#e8e8e8                 cterm=NONE




" Sneak
hi SneakPluginTarget guibg=#e8e8e8  guifg=#ce3a2f  cterm=underline

" Fugative
hi diffAdded guifg=#56bd22
hi diffRemoved guifg=#ce3a2f

" Git Gutter
hi GitGutterAdd          guifg=#56bd22
hi GitGutterChange       guifg=#b3b3b3
hi GitGutterDelete       guifg=#ce3a2f
hi GitGutterChangeDelete guifg=#b3b3b3


" Multiple Cursors
hi multiple_cursors_cursor guibg=#000000 guifg=#ffffff
hi multiple_cursors_visual guibg=#666666 guifg=#ffffff

" Indent Guides
hi IndentGuidesOdd  guibg=#e8e8e8
hi IndentGuidesEven guibg=#f3f3f3


" Language Specific
" -----------------

" HTML
hi htmlItalic                                      cterm=italic
hi MatchTag          guibg=#dbdbdb  guifg=#000000
hi link htmlH1 Normal
hi link htmlH2 Normal
hi link htmlH3 Normal
hi link htmlH4 Normal
hi link htmlH5 Normal
hi link htmlH6 Normal
hi link htmlTag Keyword
hi link htmlTagName Keyword
hi link htmlSpecialTagName Keyword
hi link htmlArg Keyword
hi link htmlTagN htmlTagName
hi link htmlEndTag htmlTag


" Markdown
hi markdownH1        guibg=NONE     guifg=NONE     cterm=reverse
hi markdownH2        guibg=NONE     guifg=NONE     cterm=reverse
hi markdownH3        guibg=NONE     guifg=NONE     cterm=reverse
hi markdownH4        guibg=NONE     guifg=NONE     cterm=reverse
hi markdownH5        guibg=NONE     guifg=NONE     cterm=reverse
hi markdownH6        guibg=NONE     guifg=NONE     cterm=reverse
hi link markdownHeadingDelimiter markdownH1


" JavaScript
" hi jsBooleanFalse guifg=#ce3a2f
" hi jsBooleanTrue guifg=#56bd22
" hi jsGlobalObjects ctermfg=8
" hi jsStorageClass ctermfg=8
" hi jsFunction ctermfg=8
" hi jsFuncName ctermfg=8

" hi javascriptAngularMethods ctermfg=13
" hi jsFutureKeys ctermfg=1
" hi link jsDocParam Comment
" hi link jsDocType Comment
" hi link jsDocTags Comment


" CSS
" hi link cssClassName normal


" Jade
syn match jadeNbsp "nbsp"
hi jadeNbsp guifg=#ce3a2f

syntax enable

autocmd! FileType javascript JsPreTmpl html

set nocompatible

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
Plug 'tpope/vim-eunuch'

" June Gunn
Plug 'junegunn/fzf'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim', {'on': 'GV'}

" UX
Plug 'justinmk/vim-sneak'
Plug 'ntpeters/vim-better-whitespace'
Plug 'justinmk/vim-dirvish'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'AndrewRadev/linediff.vim'
Plug 'chrisbra/Recover.vim'
Plug 'ap/vim-buftabline'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'osyo-manga/vim-anzu'
Plug 'vim-scripts/EnhancedJumps' | Plug 'vim-scripts/ingo-library'
Plug 'jceb/vim-shootingstar'
Plug 'supercrabtree/vim-resurrect'

" Text Objects
" Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

" Language
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'wavded/vim-stylus'
Plug 'mattn/emmet-vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'Valloric/MatchTagAlways'

" Trialing / tmp
Plug 'lambdalisue/vim-gita'
Plug 'sickill/vim-pasta'
Plug 'skywind3000/asyncrun.vim'
Plug 'metakirby5/codi.vim'

call plug#end()

filetype plugin indent on


" Disable unused builtin plugins
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1


" " Slow vim debugging
" :profile start profile.log
" :profile func *
" :profile file *
" " At this point do slow actions
" :profile pause
" :noautocmd qall!



" Vim Settings
" ------------------------------------------------------------------------------
set autoindent
set backspace=indent,eol,start " let the backspace work normally
set backupdir=~/.vim/tmp//     " don't dirty up my repos
set colorcolumn=81             " highlight column 81
set completeopt-=preview       " dont show annoying preview window
set cursorline                 " highlight current cursor line
set diffopt+=context:99999     " stop folds in diffs
set diffopt+=vertical          " always vertical diffs
set directory=~/.vim/tmp//     " swap file dir
set encoding=utf-8
set expandtab                  " tab becomes <space><space>
set formatoptions-=o           " don't insert comment char on next line when on comment line and o is pressed
set formatoptions+=n           " when formatting text, recognize numbered lists.
set formatoptions+=j           " where it makes sense, remove a comment leader when joining lines.
set hidden                     " allow buffers to be hidden
set history=10000
set hlsearch                   " highlight search results
set ignorecase                 " case insensitive search
set incsearch                  " incremental search
set laststatus=2               " always show status bar
set lazyredraw                 " dont redraw when executing macros
set list                       " show me those ugly chars so i can kill them
set listchars=tab:❯—,nbsp:§
set listchars+=precedes:❮
set listchars+=extends:❯
set mouse=a                    " gimme mouse
set nofoldenable               " disable folding
set nostartofline              " dont move the cursor to the start of a line when switching buffers
set nowrap                     " no line wrap
set number                     " show the current line number
set scrolloff=3                " always keep some context when moving about
set shell=/usr/local/bin/zsh   " use my login shell
set shiftwidth=2
set shortmess=fimtTF
set showcmd                    " for easierness show the command in the bottom right
set smartcase                  " pig == PIG, Pig == Pig, but Pig != pig
set softtabstop=2
set splitright                 " new split panes always on the right
set synmaxcol=800              " Don't try to highlight lines longer than 800 characters.
set tabstop=2
set termguicolors              " allow hex values for colors
set textwidth=80               " only for comments (check formatoptions)
set timeoutlen=1000
set ttimeoutlen=0
set ttyfast
set undodir=~/.vim/undo
set undofile
set undolevels=1000            " how many undos per file
set virtualedit=block
set wildmenu
set wrapmargin=0

" allow italics
set t_ZH=[3m
set t_ZR=[23m

" different cursor shapes for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"



" Map keycodes
" ------------------------------------------------------------------------------
" in karabiner ctrl-enter is remapped to <F17>
set <F17>=[15;2~
" in karabiner shift-enter is remapped to <F18>
set <F18>=[17;2~
" in karabiner ctrl-m is remapped to <F19> so i can use it indepent of return
set <F19>=[18;2~



" Mappings
" ------------------------------------------------------------------------------

" Ctrl space writes file
nnoremap <NUL> <esc>:<c-u>w<cr>
inoremap <NUL> <esc>:<c-u>w<cr>a

" esc shortcuts
inoremap jj <esc>
noremap <c-c> <esc>

" move through line wraps with ease
nnoremap j gj
nnoremap k gk

" insert undo stop points
inoremap <cr> <c-]><c-g>u<cr>
inoremap <c-h> <c-g>u<c-h>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
inoremap <space> <c-g>u<space>

" joins
nnoremap g+ :join!<cr>
nnoremap + :join<cr>
xnoremap + :join<cr>

" Capital L end of line but not end of line char
xnoremap g$ $h

" Insert } after an {
inoremap {<cr> {}<C-G>U<Left><cr><cr><c-g>U<Up><tab>

" Ctrl<enter>{ inserts a });
inoremap <F18> });<C-G>U<Left><Left><Left><cr><cr><c-g>U<Up><tab>

" clear search highlights and refresh screen and diff update
nnoremap <silent> <bs> :noh<cr>:redraw<cr>jk:diffupdate<cr>

" home row keys for rapid buffer nav
nnoremap <silent> <down>  :call <sid>PressCtrlJ()<cr>
nnoremap <silent> <up>    :call <sid>PressCtrlK()<cr>
nnoremap <silent> <left>  :call <sid>PressCtrlH()<cr>
nnoremap <silent> <right> :call <sid>PressCtrlL()<cr>
nnoremap <silent> H       :call <sid>PressH()<cr>
nnoremap <silent> J       :call <sid>PressJ()<cr>
nnoremap <silent> K       :call <sid>PressK()<cr>

" allow suspension in insert mode
inoremap <c-z> <esc><c-z>

" get rid of Ex mode, and play the last recorded q register instead
nmap Q @q

" map ctrl q to quit
noremap <c-q> <esc>:<c-u>qa<cr>

" Make Y act like the other capitals
nnoremap Y y$

" replay last command
nnoremap !! :<Up><cr>

" use - to interact with the system keyboard
xnoremap - :<c-u>call g:CopyTheText()<cr>
xnoremap g- xk:<c-u>r !pbpaste<cr>
nnoremap - :<c-u>r !pbpaste<cr>
nnoremap g- :<c-u>call system('pbcopy', @")<cr>:echo 'Copied to clipboard'<cr>

" shift 6 is hard to push...
nnoremap g0 ^

" neocomplete close pum
inoremap <expr> <c-c> pumvisible() ? neocomplete#cancel_popup() : "\<esc>"

" Fix <c-y> to work with NeoComplete
inoremap <silent> <C-y> :NeoCompleteDisable<cr><c-y>:NeoCompleteEnable<cr>

" enter in visual mode for aliging
xmap <Enter> <Plug>(EasyAlign)

" delete content, like dd but make it so you can jam it in another line somewhere
nnoremap dc ^v$hd"_dd

" f-enter opens current file in finder
nnoremap <silent> f<cr> :Finder<cr>

" big U undo hunk :)
nnoremap U mh:GitGutterRevertHunk<cr>'h

" Ctrl-Enter is enter without leaving current place
inoremap <F17> <esc>lmzi<cr><esc>`za

" Enter selects from pum
inoremap <silent> <cr> <C-r>=<SID>HyperEnter()<cr>

" Allow file writing when no permissions
" cnoremap w!! w !sudo tee > /dev/null %

" Remove pointless map for goto line mark
nnoremap ' `

" shortcut blackhole register
nnoremap _ "_

" use d for delete (really delete)
nnoremap d "_d
xnoremap d "_d
nnoremap D "_D

" use m for 'move' (cut)
nnoremap m d
nnoremap mm dd
nnoremap M D
xnoremap m d

" use gm to do marks
nnoremap gm m

" incsearch + anzu
nmap / gms<Plug>(incsearch-forward)
xmap / <Plug>(incsearch-forward)
nmap ? gms<Plug>(incsearch-fuzzy-/)
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * *N
nmap # g*N
xnoremap * y/<c-r>"<cr>N



" Space Leaders
" ------------------------------------------------------------------------------
let mapleader="\<space>"

" append function parameter
nnoremap <leader>af 0/function.*<cr>:silent noh<cr>f(%i

" append parameter
nnoremap <leader>aa f)i

" insert empty lines easily
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" debugger toggle
nnoremap <silent> <leader>d :call <sid>ToggleDebugger()<cr>

" make use strict javascript
nnoremap <leader>us mzggO'use strict';<cr><esc>`z

" show highlight group under cursor
nnoremap <leader>sh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Git whatevers
nnoremap <leader>ga :Git add %<cr><cr>:GitGutter<cr>
nnoremap <leader>gA :Git add -A . <cr><cr>:GitGutter<cr>
nnoremap <leader>gc :Gcommit -v -q<cr>
nnoremap <leader>gC :Gcommit --amend -v -q<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gr :Git reset -q %<cr><cr>:GitGutter<cr>
nnoremap <leader>gR :Git reset -q<cr><cr>:GitGutter<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gD :Git! diff --staged<cr>
nnoremap <leader>gp :call <sid>AsyncRunVerbose("git push","Pushed")<cr>
nnoremap <leader>gP :call <sid>AsyncRunVerbose("git push --force","Pushed")<cr>
nnoremap <leader>gb :Gita blame<cr>
nnoremap <leader>gl :GV<cr>



" Commands
" ------------------------------------------------------------------------------
command! PutLastCommit call <sid>PutLastCommit()
command! Ghost call <sid>Ghost()
command! Tailf call <sid>Tailf()
command! SpellMode call <sid>SpellMode()
command! JSONPretty call <sid>JSONPrettyify()
command! -complete=file -nargs=? Open call <sid>Open(<q-args>)
command! -complete=file -nargs=? Finder call <sid>RevealInFinder(<q-args>)
command! ShowFileSize call <sid>ShowFileSize()
command! ToggleWindowLayout call <sid>ToggleWindowLayout()
command! DiffSaved call s:DiffSaved()
command! DiffSavedComplete call s:DiffSavedComplete()
command! CDC cd %:p:h



" Status Line
" ------------------------------------------------------------------------------
set statusline=
set statusline+=%L\:%c\ \|\ %p%%\ " current line number / percentage
set statusline+=%<                " when the window is too narrow, cut it here
set statusline+=%f\               " path & filename
set statusline+=%{IsReadOnly()}   " tidier readonly
set statusline+=%{IsModified()}   " tidier ismodified
set statusline+=%=                " align from here on to the right
let &statusline = &statusline . "%{gita#statusline#format('%ln/%lb')}"



" Plugin Settings
" ------------------------------------------------------------------------------
"  Rooter
let g:rooter_patterns = ['.git/', 'node_modules', 'package.json']
let g:rooter_manual_only = 1

" Extra whitespace
let g:better_whitespace_filetypes_blacklist = [
  \ 'gitcommit',
  \ 'vim-plug',
  \ 'gita-blame-navi',
  \ 'help',
  \ 'GV'
\]

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

xmap <c-s>  <Plug>CtrlSFVwordPath
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

" Emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\   'html': {
\     'snippets': {
\       'html': "<!doctype html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"utf-8\">\n  <title></title>\n  <meta name=viewport content=\"width=device-width,initial-scale=1\">\n</head>\n<body>\n${cursor}\n</body>\n</html>",
\       'defer': "<script defer src=\"${cursor}\"></script>",
\       'async': "<script async src=\"${cursor}\"></script>"
\     },
\     'default_attributes': {
\       'svg': [{'width': '500'}, {'height': '400'}, {'viewBox': '0 0 500 400'}, {'xmlns': 'http://www.w3.org/2000/svg'}, {'xmlns:xlink': 'http://www.w3.org/1999/xlink'}],
\     },
\   },
\ }


" Multiple Cursors
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  execute 'NeoCompleteLock'
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  execute 'NeoCompleteUnlock'
endfunction


" vim-indent-guides
let g:indent_guides_guide_size=2
let g:indent_guides_auto_colors=0
let g:indent_guides_default_mapping=0
nmap <silent> <leader>i <Plug>IndentGuidesToggle

" Resurrect
let g:resurrect_ignore_patterns = [
\ '/.git/',
\ 'fugitive://',
\ '/undotree_2',
\ '/__CtrlSF__',
\ '[Plugins]'
\]

" FZF
set rtp+=~/.fzf
xnoremap <c-f>      :<c-u>execute 'FindFilesHere ' . <sid>get_visual_selection()<cr>
nnoremap <c-f>      :echoerr 'too slow!'<cr>
nnoremap <c-f><c-f> :FindFilesIn<cr>
nnoremap <c-f>!     :FindFilesIn!<cr>
nnoremap <c-f>f     :execute 'FindFilesHere ' . expand('<cword>')<cr>
nnoremap <c-f>/     :FindFilesHere /<cr>
nnoremap <c-f>h     :FindFilesIn ~/<cr>
nnoremap <c-f>r     :MRU<cr>
nnoremap <c-f><c-r> :MRU<cr>
nnoremap <c-b>      :Lines<cr>

command! -complete=file -nargs=1 Locate call fzf#run({'source': 'locate <q-args>', 'sink': 'e', 'options': ''})
command! -bang -complete=file -nargs=* FindFilesHere call <sid>FindFilesHere(<bang>0, <q-args>)
command! -bang -complete=file -nargs=? FindFilesIn call <sid>FindFilesIn(<bang>0, <q-args>)
command! -bang AllBuffers call s:bufselect(<bang>0)
command! MRU call fzf#run({
\ 'source': 'sed "1d" $HOME/.cache/neomru/file',
\ 'sink*':   function('<sid>FindFilesHandler'),
\ 'options': '--bind ctrl-g:ignore --reverse --expect=ctrl-g --prompt "MRU> "'
\})

function! s:getStockAgArgs(bang)
  if a:bang == 0
    return ' --depth "-1" --ignore ".git" --hidden --nocolor '
  else
    return ' --depth "-1" --ignore ".git" --hidden --nocolor --skip-vcs-ignores --path-to-agignore "~/.empty-agignore" '
  endif
endfunction

let s:ctrlF = '--bind ctrl-g:ignore --expect=ctrl-g'

function! s:FindFilesHere(bang, args)
  call fzf#run({
\   'source'  : printf('ag'.<sid>getStockAgArgs(a:bang).'-g "" %s', '.'),
\   'sink*'   : function('<SID>FindFilesHandler'),
\   'options' : s:ctrlF . escape(empty(a:args) ? '' : ' --query="'.a:args.'"', '\')
\ })
endfunction

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

function! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction



" Custom Functions
" ------------------------------------------------------------------------------
function! <sid>PressCtrlH()
  if &diff
    normal do
    return
  endif
  execute 'Resurrect'
endfunction

function! <sid>PressCtrlK()
  if &diff
    normal [czz
  elseif &filetype == 'gita-blame-navi'
    normal [c
  elseif &filetype == 'GV'
    normal [[o
  else
    silent bnext
  endif
endfunction

function! <sid>PressCtrlJ()
  if &diff
    normal ]czz
  elseif &filetype == 'gita-blame-navi'
    normal ]c
  elseif &filetype == 'GV'
    normal ]]o
  else
    silent bprevious
  endif
endfunction

function! <sid>PressCtrlL()
  bdelete
endfunction

function! <sid>PressH()
  if &diff
    normal do
    return
  endif
  execute 'GitGutterStageHunk'
endfunction

function! <sid>PressJ()
  if &diff
    normal ]c
    return
  endif
  execute 'GitGutterNextHunk'
endfunction

function! <sid>PressK()
  if &diff
    normal [c
    return
  endif
  execute 'GitGutterPrevHunk'
endfunction

function! s:DiffSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  execute "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
  wincmd W
endfunction

function! s:DiffSavedComplete()
  windo diffoff
  windo if &readonly | bd | endif
endfunction

function! s:HyperEnter()
  return pumvisible() ? "\<C-y>" : "\<cr>"
endfunction

let s:are_comments_invisible=0
function! <sid>Ghost()
  if s:are_comments_invisible
    hi! link Comment Comment
    hi! link Todo Todo
    let s:are_comments_invisible=0
  else
    hi! link Comment Ignore
    hi! link Todo Ignore
    let s:are_comments_invisible=1
  endif
endfunction

function! <sid>AsyncRunVerbose(command, successMessage)
  let g:asyncrun_exit = '
  \ if s:async_code == 0
  \|  echo "'.a:successMessage.'"
  \|else
  \|  copen
  \|endif
  \'
  execute ':silent AsyncRun ' . a:command
  echo 'Running: '.a:command
endfunction

function! s:Tailf()
  e
  redraw
  sleep 1
  call <sid>Tailf()
endfunction

function! s:SpellMode()
  if &spell=='nospell'
    set spell
    set nocursorline
  else
    set nospell
    set cursorline
  endif
endfunction

function! <sid>PutLastCommit()
  :read !git log -1 --pretty=%b<cr>
endfunction

function! s:JSONPrettyify()
  execute "%!python -m json.tool"
endfunction

function! <sid>ToggleDebugger()
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

function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

function! AdjustWindowHeight(minheight, maxheight)
  execute max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
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

" Find out current buffer's size and output it.
function! <sid>FileSize()
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

function! <sid>GzippedFileSize()
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

function! <sid>ShowFileSize()
  echo 'filesize: ' . <sid>FileSize() . '| gzipped: ' . <sid>GzippedFileSize()
endfunction


function! <sid>ToggleWindowLayout()
  let curwin= winnr()
  if curwin == 1
    " try to go down one window
    wincmd j
    let isvert= winnr() != curwin
    wincmd k
  else
    " try to go up one window
    wincmd k
    let isvert= winnr() != curwin
    wincmd j
  endif
  if isvert
    windo wincmd H
    windo wincmd H
  else
    windo wincmd K
    windo wincmd K
  endif
endfun


" function! GitDiffName()
"   let l:diffcontent = system("git diff --stat client/app-run.js | head -1")
"   if len(l:diffcontent)
"     return l:diffcontent
"   endif
"   return 'client/app-run.js'
" endfunction



" Auto Commands
" ------------------------------------------------------------------------------
augroup georges_autocommands
  autocmd!

  au FileType ctrlsf map <buffer> <c-o> Ozt<c-w><c-w>
  au FileType ctrlsf map <buffer> o     Ozt
  au FileType ctrlsf map <buffer> K     <up>pzz
  au FileType ctrlsf map <buffer> J     <down>pzz

  " return to the last edited position when opening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif

  " highlight colums in git commit messages
  au filetype gitcommit setlocal colorcolumn=51,73
  au filetype gitcommit setlocal spell
  au FileType gitcommit setlocal nocursorline
  au FileType gitcommit setlocal listchars+=tab:\ \ 
  au FileType gitcommit if expand("%:h:t") ."/". expand("%:t") == ".git/index" | nmap <buffer> <down> <c-n>| else | map <buffer> <down> 10j| endif
  au FileType gitcommit if expand("%:h:t") ."/". expand("%:t") == ".git/index" | nmap <buffer> <up> <c-p>| else | map <buffer> <up> 10k| endif
  au FileType gitcommit if expand("%:h:t") ."/". expand("%:t") == ".git/index" | nmap <buffer>  -| endif
  au FileType gitcommit if expand("%:h:t") ."/". expand("%:t") == ".git/index" | nmap <buffer> <NUL> cvc| endif

  au FileType help setlocal listchars+=tab:\ \ 
  au FileType help setlocal tabstop=4

  " Markdown
  au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md setfiletype markdown
  au filetype markdown setlocal spell
  au filetype markdown setlocal textwidth=79
  au filetype markdown setlocal formatoptions+=t
  au filetype markdown setlocal wrap linebreak nolist

  " auto create global marks when leaving
  au BufLeave,BufWritePost /Users/supercrabtree/dev/dotfiles/.zshrc normal! mZ
  au BufLeave,BufWritePost /Users/supercrabtree/dev/dotfiles/.vimrc normal! mV

  au BufNewFile,BufRead *.less set ft=less.css

  au filetype go setlocal listchars+=tab:\ \ 

  au BufEnter * if &diff | nmap dy <c-w><c-w>yy<c-w><c-w>Vp | endif

  au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | endif

  au BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

  au BufNewFile,BufRead *.tag setlocal ft=javascript

  " ftplugin sets this for everything
  au FileType * setlocal formatoptions-=o
augroup END




" Colors
" ------------------------------------------------------------------------------
" white = #ffffff => 100%
" grey1 = #f3f3f3 => 97%
" grey2 = #e8e8e8 => 91%
" grey3 = #dbdbdb => 86%
" grey4 = #b3b3b3 => 70%
" grey5 = #999999 => 60%
" grey6 = #808080 => 50%
" black = #000000 => 100%

" red      = #bf2222
" green    = #4ead1f
" yellow   = #ffaf00
" blue     = #2275bf
" purple   = #8780c5



" Highlight          Background     Foreground     Style (cterm)
" ------------------------------------------------------------------------------
hi Normal                           guifg=NONE
hi ErrorMsg          guibg=#bf2222  guifg=#ffffff
hi Error             guibg=#bf2222  guifg=#ffffff
hi NonText                          guifg=#b3b3b3
hi Comment                          guifg=#999999
hi Ignore            guibg=#f3f3f3  guifg=#f3f3f3
hi Title                            guifg=NONE
hi Function                         guifg=NONE
hi Special                          guifg=NONE
hi SpecialKey                       guifg=#b3b3b3
hi Keyword                          guifg=NONE
hi Type                             guifg=NONE
hi Constant                         guifg=NONE
hi String                           guifg=#2275bf
hi Boolean                          guifg=#2275bf
hi Preproc                          guifg=NONE
hi Number                           guifg=#2275bf
hi Identifier                       guifg=NONE
hi Statement                        guifg=NONE
hi Todo                             guifg=NONE
hi WarningMsg                       guifg=NONE
hi GoodMsg                          guifg=#4ead1f
hi BadMsg                           guifg=#bf2222
hi Directory                        guifg=#2275bf
hi MoreMsg                          guifg=#2275bf
hi Question                         guifg=NONE
hi Folded                           guifg=NONE
hi FoldColumn                       guifg=NONE
hi DiffAdd           guibg=NONE     guifg=#4ead1f
hi DiffChange        guibg=NONE
hi DiffDelete        guibg=#bf2222  guifg=#bf2222
hi DiffText          guibg=#e8e8e8  guifg=#bf2222
hi SpellBad          guibg=NONE     guifg=#bf2222  cterm=NONE
hi SpellCap          guibg=NONE     guifg=NONE     cterm=NONE

" UI elements
hi ColorColumn       guibg=#f3f3f3
hi CursorLine        guibg=#e8e8e8                 cterm=NONE
hi PMenu             guibg=#e8e8e8  guifg=#808080
hi LineNr                           guifg=#b3b3b3
hi CursorLineNr                     guifg=NONE
hi MatchParen        guibg=NONE     guifg=#bf2222
hi StatusLine        guibg=#e8e8e8  guifg=#000000  cterm=NONE
hi StatusLineNC      guibg=#e8e8e8  guifg=#b3b3b3  cterm=NONE
hi VertSplit         guibg=#e8e8e8  guifg=#e8e8e8
hi WildMenu          guibg=#000000  guifg=#ffffff

hi Search            guibg=#ffaf00  guifg=#000000
hi IncSearch         guibg=#4ead1f  guifg=#000000  cterm=NONE
hi ExtraWhitespace   guibg=#bf2222  guifg=#bf2222

" Buftabline
hi BufTabLineActive                 guifg=#b3b3b3
hi BufTabLineHidden  guibg=#e8e8e8  guifg=#808080  cterm=NONE
hi BufTabLineFill    guibg=#e8e8e8                 cterm=NONE

" Sneak
hi SneakPluginTarget guibg=#e8e8e8  guifg=#bf2222  cterm=underline

" Fugative
hi diffAdded                        guifg=#4ead1f
hi diffRemoved                      guifg=#bf2222
hi gitcommitSelectedFile            guifg=#4ead1f
hi gitcommitDiscardedFile           guifg=#bf2222

" Git Gutter
hi GitGutterAdd                     guifg=#4ead1f
hi GitGutterChange                  guifg=#b3b3b3
hi GitGutterDelete                  guifg=#bf2222
hi GitGutterChangeDelete            guifg=#b3b3b3

" Indent Guides
hi IndentGuidesOdd   guibg=#e8e8e8
hi IndentGuidesEven  guibg=#f3f3f3

" Multiple Cursors
hi multiple_cursors_cursor guibg=#000000 guifg=#ffffff
hi multiple_cursors_visual guibg=#666666 guifg=#ffffff


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
hi jsBooleanFalse                   guifg=#bf2222
hi jsBooleanTrue                    guifg=#4ead1f

syntax enable


set nocompatible
filetype plugin indent on
syntax enable
" Colors {{{
" white  = #ffffff => 100%
" grey0  = #fafafa => 99%
" grey1  = #f3f3f3 => 97%
" grey2  = #e8e8e8 => 91%
" grey3  = #dbdbdb => 86%
" grey4  = #b3b3b3 => 70%
" grey5  = #999999 => 60%
" grey6  = #808080 => 50%
" grey7  = #333333 => 20%
" black  = #000000 => 0%
"
" red    = #941a1e
" green  = #006215
" blue   = #1a5b94
" yellow = #ffaf00
" orange = #ea7a19

"  Name             Foreground    Background    Attributes
" ------------------------------------------------------------------------------
hi xNone            guifg=NONE    guibg=NONE    cterm=NONE
hi xGrey0Bg         guifg=NONE    guibg=#fafafa cterm=NONE
hi xGrey2Bg         guifg=NONE    guibg=#e8e8e8 cterm=NONE
hi xGrey3Bg         guifg=NONE    guibg=#dbdbdb cterm=NONE
hi xGrey4           guifg=#b3b3b3 guibg=NONE    cterm=NONE
hi xGrey5Italic     guifg=#999999 guibg=NONE    cterm=italic
hi xGrey4FgGrey2Bg  guifg=#b3b3b3 guibg=#e8e8e8 cterm=NONE
hi xGrey6FgGrey0Bg  guifg=#808080 guibg=#fafafa cterm=NONE
hi xGrey7FgGrey2Bg  guifg=#333333 guibg=#e8e8e8 cterm=NONE
hi xBlue            guifg=#1a5b94 guibg=NONE    cterm=NONE
hi xGreen           guifg=#006215 guibg=NONE    cterm=NONE
hi xRed             guifg=#941a1e guibg=NONE    cterm=NONE
hi xRedBg           guifg=NONE    guibg=#941a1e cterm=NONE
hi xBlackFgYellowBg guifg=#000000 guibg=#ffaf00 cterm=NONE
hi xOrangeFgGrey1Bg guifg=#ea7a19 guibg=#f3f3f3 cterm=NONE
hi xWhiteFgGreenBg  guifg=#ffffff guibg=#006215 cterm=NONE
hi xWhiteFgRedBg    guifg=#ffffff guibg=#941a1e cterm=NONE
hi xWhiteFgOrangeBg guifg=#ffffff guibg=#ea7a19 cterm=NONE
hi xWhiteFgGrey7Bg  guifg=#ffffff guibg=#333333 cterm=NONE

" Match above colors " {{{
call matchadd('xNone', 'xNone')
call matchadd('xGrey4', 'xGrey4')
call matchadd('xGrey5Italic', 'xGrey5Italic')
call matchadd('xGrey4FgGrey2Bg', 'xGrey4FgGrey2Bg')
call matchadd('xGrey6FgGrey0Bg', 'xGrey6FgGrey0Bg')
call matchadd('xGrey7FgGrey2Bg', 'xGrey7FgGrey2Bg')
call matchadd('xBlue', 'xBlue')
call matchadd('xRed', 'xRed')
call matchadd('xRedBg', 'xRedBg')
call matchadd('xGreen', 'xGreen')
call matchadd('xBlackFgYellowBg', 'xBlackFgYellowBg')
call matchadd('xOrangeFgGrey1Bg', 'xOrangeFgGrey1Bg')
call matchadd('xWhiteFgGreenBg', 'xWhiteFgGreenBg')
call matchadd('xWhiteFgRedBg', 'xWhiteFgRedBg')
call matchadd('xWhiteFgOrangeBg', 'xWhiteFgOrangeBg')
call matchadd('xWhiteFgGrey7Bg', 'xWhiteFgGrey7Bg')
call matchadd('xGrey0Bg', 'xGrey0Bg')
call matchadd('xGrey2Bg', 'xGrey2Bg')
call matchadd('xGrey3Bg', 'xGrey3Bg')
" }}}

" Black text
hi! link Normal          xNone
hi! link Constant        xNone
hi! link Function        xNone
hi! link Identifier      xNone
hi! link Keyword         xNone
hi! link Preproc         xNone
hi! link Question        xNone
hi! link Special         xNone
hi! link SpellCap        xNone
hi! link Statement       xNone
hi! link Title           xNone
hi! link Type            xNone
hi! link Underlined      xNone
hi! link WarningMsg      xNone

" Grey text
hi! link NonText         xGrey4
hi! link SpecialKey      xGrey4
hi! link Comment         xGrey5Italic
hi! link Todo            xGrey5Italic

" Blue text
hi! link Boolean         xBlue
hi! link Directory       xBlue
hi! link MoreMsg         xBlue
hi! link Number          xBlue
hi! link String          xBlue

" Red text
hi! link BadMsg          xRed
hi! link SpellBad        xRed
hi! link Error           xWhiteFgRedBg
hi! link ErrorMsg        xWhiteFgRedBg

" Green text
hi! link GoodMsg         xGreen
hi! link BrightGoodMsg   xWhiteFgGreenBg

" UI elements
hi! link ColorColumn     xGrey0Bg
hi! link ExtraWhitespace xGrey2Bg
hi! link Ignore          xGrey2Bg
hi! link QuickFixLine    xGrey2Bg
hi! link VertSplit       xGrey2Bg
hi! link StatusLine      xGrey2Bg
hi! link StatusLineNC    xGrey4FgGrey2Bg
hi! link LineNr          xGrey4
hi! link Folded          xGrey6FgGrey0Bg
hi! link Visual          xGrey3Bg

hi! link IncSearch       xWhiteFgGreenBg
hi! link MatchParen      xGrey2Bg
hi! link Search          xBlackFgYellowBg
hi! link WildMenu        xWhiteFgGrey7Bg
hi! link PMenu           xGrey7FgGrey2Bg
hi! link PMenuSel        xWhiteFgGrey7Bg

" Diffs
hi! link DiffAdd         xGreen
hi! link DiffChange      xNone
hi! link DiffDelete      xRedBg
hi! link DiffText        xOrangeFgGrey1Bg
hi! link diffAdded       xGreen
hi! link diffRemoved     xRed

" Git Commits
hi! link gitcommitSelectedFile  xGreen
hi! link gitcommitDiscardedFile xGreen

" Git Gutter
hi! link GitGutterAdd           xGreen
hi! link GitGutterChange        xGrey4
hi! link GitGutterDelete        xRed
hi! link GitGutterChangeDelete  xGrey4

" ALE
hi! link ALEErrorSign   xWhiteFgRedBg
hi! link ALEWarningSign xWhiteFgOrangeBg

" Markdown
hi! link markdownH1               xWhiteFgGrey7Bg
hi! link markdownH2               xWhiteFgGrey7Bg
hi! link markdownH3               xWhiteFgGrey7Bg
hi! link markdownH4               xWhiteFgGrey7Bg
hi! link markdownH5               xWhiteFgGrey7Bg
hi! link markdownH6               xWhiteFgGrey7Bg
hi! link markdownHeadingDelimiter xWhiteFgGrey7Bg

" JavaScript
hi! link jsUndefined xBlue
hi! link jsNull xBlue

augroup whitespace
  autocmd!
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END
" }}}
" Settings {{{
set backspace=indent,eol,start
set clipboard=unnamed
set completeopt=menu,longest
set colorcolumn=81
set diffopt+=vertical,context:3
set expandtab
set encoding=utf-8
set gdefault
set grepformat=%f:%l:%c:%m,%f:%l:%m
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --hidden
set fillchars=vert:\ ,fold:\ ,diff:\ 
set foldminlines=0
set foldmethod=indent
set foldlevelstart=5
set foldnestmax=5
set foldtext=FoldText()
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set iskeyword+=-,$
set laststatus=2
set lazyredraw
set list
set listchars=tab:˖˗,nbsp:§,precedes:❮,extends:❯
set mouse=a
set number
set nofixendofline
set nostartofline
set noswapfile
set nowrap
set path=.,**
set scroll=10
set scrolloff=3
set shell=/usr/local/bin/zsh
set shiftwidth=4
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=-1
set statusline=%m%r%y\ %f:%l%<\ of\ %L\ col\ %c%=%{noscrollbar#statusline(20,'■','□')}\ 
set tabstop=4
set termguicolors
set ttimeoutlen=0
set undodir=$HOME/.vim/undo
set undofile
set wildmenu
set wildcharm=<Tab>
set wildignore=dist/**,**/node_modules/**,**/bower_components/**

" start matchit
runtime macros/matchit.vim

" find files in require() and import statments
set suffixesadd+=.js
set path+=$PWD/node_modules

" different cursor shapes for insert mode for iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" allow italics
set t_ZH=[3m
set t_ZR=[23m

" allow $() in sh scripts
let g:is_posix=1

" }}}
" Auto Commands {{{
augroup vimrc
  autocmd!
  au Filetype qf setlocal statusline=%t%{exists('w:quickfix_title')\ ?\ '\ '.w:quickfix_title\ :\ ''}\ %l\ of\ %L\ col\ %c
  au FileType qf setlocal nobuflisted
  au Filetype qf nnoremap <buffer><silent> <c-c> :<c-u>execute "try\n:ccl\ncatch\n:bd\nendtry"<cr>
  au FileType qf execute max([min([line("$"), 20]), 3]) . "wincmd _"
  au FileType qf wincmd J
  au FileType qf nmap <buffer> <c-n> j<space>
  au FileType qf nmap <buffer> <c-p> k<space>
  au FileType qf nnoremap <buffer> s :cfdo %s/<C-R>///c<left><left>
  au FileType qf nnoremap <buffer> S yiw:cfdo %s/<C-R>"//c<left><left>
  au FileType qf xnoremap <buffer> s y:cfdo %s/\V<C-R>=escape(@", '/')<CR>//c<left><left>
  au FileType qf xnoremap <buffer> S :echo 'need to implement'
  au FileType qf setlocal conceallevel=2
  au FileType qf setlocal concealcursor=nc
  au FileType qf syntax match glogCruft /^fugitive:\/\/\/\S*|| / conceal

  au FileType php setlocal complete=.,w,b,u

  au FileType gitcommit setlocal colorcolumn=51,73
  au FileType gitcommit setlocal spell
  au FileType gitcommit setlocal nonumber
  au FileType gitcommit setlocal omnifunc=GitLogOmni

  au FileType markdown setlocal spell
  au FileType markdown setlocal textwidth=80
  au FileType markdown setlocal colorcolumn=81

  au FileType * setlocal formatoptions-=cor

  au BufRead,BufNewFile *.filedump setfiletype filedump
  au FileType filedump nnoremap <buffer> <C-C> :bd<cr>
  au FileType filedump nnoremap <buffer> <CR> gf
  au FileType filedump xmap <CR> gf

  au BufWritePost $HOME/dev/dotfiles/.vimrc source $HOME/dev/dotfiles/.vimrc|setlocal foldmethod=marker
  au BufReadPost $HOME/dev/dotfiles/.vimrc,$HOME/dev/dotfiles/.zshrc setlocal foldmethod=marker|setlocal foldlevel=0
  au BufReadPost * if !&diff && &filetype != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"zz" | endif

  au QuickFixCmdPost *grep* cwindow
augroup END
" }}}
" Plugins {{{
function! s:SetupVAM() " {{{
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager' shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif " }}}
  call vam#ActivateAddons([
  \  'github:ianks/vim-tsx',
  \  'github:leafgarland/typescript-vim',
  \  'github:Quramy/tsuquyomi',
  \  'github:heavenshell/vim-jsdoc',
  \  'github:pangloss/vim-javascript',
  \
  \  'github:airblade/vim-gitgutter',
  \  'github:gcavallanti/vim-noscrollbar',
  \  'github:supercrabtree/vim-subl',
  \  'github:tpope/vim-commentary',
  \  'github:tpope/vim-eunuch',
  \  'github:tpope/vim-fugitive',
  \  'github:tpope/vim-rhubarb',
  \  'github:tpope/vim-sleuth',
  \  'github:tpope/vim-repeat',
  \  'github:w0rp/ale',
  \
  \  'github:kana/vim-textobj-user',
  \  'github:Julian/vim-textobj-variable-segment',
  \  'github:saaguero/vim-textobj-pastedtext',
  \], {'auto_install' : 1})
endfunction
call s:SetupVAM()
" source $HOME/dev/snaplist/snaplist.vim
" }}}
" Plugin Settings {{{
let g:ale_linters = {
\   'html': [],
\}
let g:ale_sign_column_always = 1
" some more ⇨ ⊗ ◗ ⊙ ≫ 𝒆 𝒘 𝓮 𝔀  𝕖 𝕨 𝔼 𝕎
let g:ale_sign_error = '»'
let g:ale_sign_warning = '»'
" }}}
" Disable unused builtin plugins {{{
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
" }}}
" MRU {{{
if !filereadable($HOME . '/.vim/mru.txt')
  call system('mkdir -p ' . $HOME . '/.vim/')
  call system('touch ' . $HOME . '/.vim/mru.txt')
endif

augroup mru
  autocmd!
  au BufEnter * call s:saveFileToMRU(expand('%:p'))
augroup END

function! s:saveFileToMRU(filename)
  let l:lines = readfile($HOME.'/.vim/mru.txt')
  let l:lines = filter(l:lines, 'v:val != "'.a:filename.'"')
  let l:lines = insert(l:lines, a:filename)
  let l:lines = filter(l:lines, '!empty(v:val)')
  call writefile(l:lines[0:100000], $HOME.'/.vim/mru.txt')
endfunction

function! s:MRU()
  let l:files = readfile($HOME."/.vim/mru.txt")
  let l:files = filter(l:files, "!empty(v:val)")
  let l:files = filter(l:files, 'v:val != "'.expand('%:p').'"')
  let l:files = filter(l:files, {key, val -> match(val, '\/vim\d\d\/') == -1})
  let l:files = filter(l:files, {key, val -> match(val, '^fugitive:\/\/\/') == -1})
  let l:files = filter(l:files, {key, val -> match(val, '\/var\/folders') == -1})
  let l:files = filter(l:files, {key, val -> match(val, '\/.vim\/vim-addons.*doc\/') == -1})

  let l:open_buffers = filter(copy(l:files), {key, val -> bufloaded(val)})
  let l:unopened_files = filter(copy(l:files), {key, val -> (index(open_buffers, val) == -1)})

  let l:last_ten_in_cwd = []
  let l:remaining_files = []
  let l:cwd_count = 0
  for file in l:unopened_files
    if l:cwd_count < 10
      if stridx(file, getcwd()) > -1
        let l:cwd_count += 1
        call add(l:last_ten_in_cwd, file)
      else
        call add(l:remaining_files, file)
      endif
    else
      call add(l:remaining_files, file)
    endif
  endfor

  let l:file_list = map(l:remaining_files, {key, val -> fnamemodify(val, ':~:.')})

  if len(l:last_ten_in_cwd)
    let l:last_ten_in_cwd = map(l:last_ten_in_cwd, {key, val -> fnamemodify(val, ':~:.')})
    let l:file_list = l:last_ten_in_cwd + [""] + l:file_list
  endif

  if len(l:open_buffers)
    let l:open_buffers = map(l:open_buffers, {key, val -> fnamemodify(val, ':~:.')})
    let l:file_list = l:open_buffers + [""] + l:file_list
  endif

  call s:setupFileDumpBuffer(l:file_list, ".")
endfunction

" }}}
" Mappings {{{
nnoremap <C-F><C-F> g*<esc>N:FileDump /
nnoremap <C-F> :FileDump 
nnoremap <C-F>! :FileDump! 

nnoremap <C-F><C-O> :execute 'FileDump' expand('%:h')<cr>
xmap <C-F> *N<esc>:<C-U>FileDump /

nnoremap <C-F><C-G> :call <SID>dirtyFiles()<cr>
nnoremap <C-F><C-R> :call <SID>MRU()<cr>

nnoremap <C-G> :grep! 
nnoremap <C-G><C-G> :call <SID>setSearchWord(expand("<cword>"))\|set hlsearch<CR>:call feedkeys(":grep! -F '" . expand("<cword>") . "'")<cr>
xnoremap <C-G> :call setreg('/', substitute(<SID>getVisualSelection(), "'", "'\\\\''", 'g'))\|set hlsearch<CR>:<c-u>grep! -F '/'

nnoremap Q @q
nnoremap Y y$
nnoremap _ g-
nnoremap + g+
nnoremap <silent> <BS> :noh<cr>:redraw!<cr>jk:diffupdate<cr>
nnoremap <c-q> :<space><c-r>%<home>!
nnoremap j gj
nnoremap k gk

" Count Search
nnoremap cs :%s///n<cr>

" 'line-content' mappings, yank content - delete content
nnoremap yc mz^yg_`z
nnoremap dc mz^dg_`z

" force go file
nnoremap cgf :e <cfile><CR>

" if pumvisible complete next letter
inoremap <expr> <right> pumvisible() ? "\<C-L>" : "<right>"

" Format line
inoremap <c-f> <esc>gqq$A

" cheapo brace expansion
inoremap {<cr> {<cr>}<esc>O

" insert undo stop points
inoremap <cr> <c-]><C-G>u<cr>
inoremap <c-h> <C-G>u<c-h>
inoremap <c-u> <C-G>u<c-u>
inoremap <c-w> <C-G>u<c-w>
inoremap <space> <C-G>u<space>

" fix missing mappings due to hjkl global remap
inoremap <c-x><right> <c-x><c-l>
inoremap <c-x><up> <c-x><c-k>
inoremap <expr> <right> pumvisible() ? "\<C-L>" : "\<right>"

" open multiple files in visualmode
xnoremap gf :call <SID>openAllVisuallySelectedFiles()<cr>:echo<cr>

" faster indenting
xnoremap > >gv
xnoremap < <gv

" Stop accidently lowercasing everything when I want to yank
xnoremap u y

" Rotate Case
xnoremap ~ "zc<C-R>=<SID>rotateCase(@z)<CR><Esc>v`[

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-X> <C-R>=getline(".")<cr>
cnoremap <expr> <S-Tab> <SID>betterIncSearch('stab')
cnoremap <expr> <Tab> <SID>betterIncSearch('tab')

" substitute shortcuts
nnoremap s :%s/
nnoremap S yiw:%s/<C-R>"/<C-R>"/c<left><left>
xnoremap s y:%s/\V<C-R>=escape(@", '/')<CR>//c<left><left>
xnoremap S :s///c<left><left>

" Buffer Movement
nmap <silent> <C-N> :bn<CR>
nmap <silent> <C-P> :bp<CR>
nmap <silent> <C-C> :bp\|bd#<cr>
nnoremap <C-B> :ls<cr>:b
cmap <expr> <silent> <C-N> getcmdline() == 'b' ? 'n\|redraw\|ls<CR>:b' : ':bn<CR>'
cmap <expr> <silent> <C-P> getcmdline() == 'b' ? 'p\|redraw\|ls<CR>:b' : ':bp<CR>'

" Previous Buffer
nnoremap # <c-^>

" Quickfix Movement
nmap [q :cp<cr>zz
nmap ]q :cn<cr>zz

" Tab Movement
nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>

" Ale Movement
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

" Diff Movement
nmap J ]c
nmap K [c

" Hunk Control
nnoremap <expr> H &diff ? 'do' : ':GitGutterStageHunk<cr>'
nnoremap <expr> U &diff ? 'dp' : 'mz:GitGutterUndoHunk<cr>`z'
nnoremap <expr> dy &diff ? '<c-w><c-w>yy<c-w><c-w>Vp' : ':echoerr "E99: Current buffer is not in diff mode"<cr>'
" nnoremap dy <c-w>hyy<c-w>lVp' : 'dy'

" Change CWD from project root to file location
nnoremap <silent> <c-_> :call <SID>switchCWD()<CR>
inoremap <silent> <c-_> <c-o>:call <SID>switchCWD()<CR>

" Spelling Fixes
inoremap <c-s> <esc>:set spell<cr>[sea<c-x><c-s>
nnoremap <c-s> :set spell!<cr>:set spell?<cr>

" Star Remaps
xnoremap <silent> * :call <SID>setSearch(<SID>getVisualSelection())<CR><esc>
nnoremap <silent> * :call <SID>setSearchWord(expand("<cword>"))\|set hlsearch<CR>
nnoremap <silent> g* :call <SID>setSearch(expand("<cword>"))\|set hlsearch<CR>

" }}}
" Commands {{{

" Manual Indentation Adjustments
command! -nargs=1 Spaces execute "setlocal shiftwidth=" . <args> . " tabstop=" . <args> . " expandtab"
command! -nargs=1 Tabs   execute "setlocal shiftwidth=" . <args> . " tabstop=" . <args> . " noexpandtab"

command! -nargs=? -bang -complete=file FileDump call s:fileDump("<args>", <bang>0)

command! -nargs=0 Vimrc e ~/dev/dotfiles/.vimrc

command! -nargs=0 VMD call s:vmd()

command! -nargs=0 WipeReg for r in split('abcdefghijklmnopqrstuvwxyz"', '\zs') | silent! exec 'let @'. r . ' = ""' | endfor

command! -nargs=0 OnlyBuffer %bd|e#|bd#
" }}}
" Macros {{{
let @f='ru/<[^ >]\{-} \|" /ezz'
" }}}
" Search Functions {{{
function! s:regexEscape(str)
  return escape(a:str, '^$.*~[]')
endfunction

function! s:searchEscape(str)
  let l:res = s:regexEscape(a:str)
  let l:res = substitute(l:res, '\', '\\', 'g')
  let l:res = substitute(l:res, '/', '\\/', 'g')
  return l:res
endfunction

function! s:setSearch(str, ...)
  let l:with_word_boundries = a:0 > 0 ? a:1 : 0
  if (l:with_word_boundries)
    let l:search_command = "/\\<" . s:searchEscape(a:str) . "\\>"
  else
    let l:search_command = "/" . s:searchEscape(a:str)
  endif
  let g:presearch_winview = winsaveview()
  norm mz
  call feedkeys(":keepjumps " . l:search_command . "\<CR>")
  call feedkeys(":keepjumps norm `z\<CR>")
  call feedkeys(":call winrestview(g:presearch_winview)\<CR>:echo '" .  l:search_command . "'\<CR>")
endfunction

function! s:setSearchWord(str)
  return s:setSearch(a:str, 1)
endfunction
" }}}
function! s:openAllVisuallySelectedFiles() " {{{
  if line(".") == line("'>")
    execute "edit " . getline(".")
  else
    execute "edit " . getline(".") | b#
  endif
endfunction " }}}
function! s:fileDump(regex, ignore_git) " {{{
  let l:root = systemlist("git rev-parse --show-toplevel")[0]
  if (v:shell_error || a:ignore_git)
    let l:files = system("find " . getcwd() . " -type f")
    let l:root = getcwd()
    let l:is_git=0
  else
    let l:files = system("git -C " . l:root . " ls-files -oc --exclude-standard")
    let l:is_git=1
  endif
  if (v:shell_error)
    echomsg "No matching files."
    return
  endif
  if (!l:is_git)
    let l:files = map(split(l:files), {key, val -> substitute(fnamemodify(val, ':s?' . escape(l:root, '?') . '??:~'), '^\/', '', '')})
  endif

  if exists("g:file_buffer_no") && buffer_exists(g:file_buffer_no)
    exec 'b' . g:file_buffer_no
    normal ggdG
  else
    enew
    let g:file_buffer_no = bufnr('%')
  endif

  call s:setupFileDumpBuffer(l:files, l:root, g:file_buffer_no, a:regex)
endfunction " }}}
function! s:setupFileDumpBuffer(files, root, ...) " {{{
  " if exists("a:1")
  "   exec 'b' . a:1
  "   normal ggdG
  " else
  enew
  " endif
  execute "lcd " . a:root
  setlocal statusline=%f\ \|\ %l\ of\ %L\ col\ %c
  set buftype=nofile
  set filetype=filedump
  put = a:files
  normal ggdd
  if exists("a:2") && a:2 != ''
    call feedkeys(":g/" . escape(a:2, '/\') . "/m0\<CR>", "nt")
  endif
  nnoremap <buffer> <c-q> :<space><c-r><c-f><home>!
endfunction " }}}
function! s:rotateCase(str) " {{{
  let l:snake = '^[a-z0-9]\+\(-\+[a-z0-9]\+\)\+$'
  let l:camel = '\C^[a-z][a-z0-9]*\([A-Z][a-z0-9]*\)*$'
  let l:kebab = '\C^[a-z0-9]\+\(_\+[a-z0-9]\+\)*$'
  let l:constant = '\C^[A-Z][A-Z0-9]*\(_[A-Z0-9]\+\)*$'
  let l:pascal = '\C^[A-Z][a-z0-9]*\([A-Z0-9][a-z0-9]*\)*$'

  if (a:str =~ l:snake)
    return substitute(a:str, '-\+\([a-z]\)', '\U\1', 'g')
  elseif (a:str =~ l:camel)
    return substitute(a:str, '^.*$', '\u\0', 'g')
  elseif (a:str =~ l:constant)
    return tolower(a:str)
  elseif (a:str =~ l:pascal)
    return toupper(substitute(a:str, '\C^\@<![A-Z]', '_\0', 'g'))
  else
    return substitute(a:str, '_\+', '-', 'g')
  endif
endfunction " }}}
function! s:getVisualSelection() " {{{
  try
    let l:z_save = @z
    silent normal! gv"zygv
    return @z
  finally
    let @z = l:z_save
  endtry
endfunction " }}}
function! s:betterIncSearch(key) abort " {{{
  let l:cmdType = getcmdtype()

  if l:cmdType ==# '/' || l:cmdType ==# '?'
    " Search Mode
    let l:cmd = getcmdline()

    call feedkeys("\<C-C>:set hlsearch\<Enter>")

    if @/ !=# l:cmd
      call setreg('/', l:cmd)
    else
      let l:direction = v:searchforward && l:cmdType ==# '/'
      if xor(l:direction, a:key ==# 'tab')
        call feedkeys('N')
      else
        call feedkeys('n')
      end
    endif

    call feedkeys(l:cmdType . "\<C-R>/")
    return
  else
    " Not in search mode
    if a:key ==# 'tab'
      return "\<Tab>"
    else
      return "\<S-Tab>"
    endif
  endif
endfunction
" }}}
function! s:vmd() " {{{
  let b:vmd_pid=systemlist("vmd " . shellescape(bufname('')) . "&echo $!")[0]
  redraw!
  echo "vmd " . bufname('') . "&echo $!"
  augroup vmd
    autocmd!
    au TextChanged,TextChangedI <buffer> silent write
    au BufDelete,VimLeave <buffer> call system("kill " . b:vmd_pid)
  augroup END
endfunction
" }}}
function! s:dirtyFiles() " {{{
  let l:files = system("git status -s | sed 's/^...//'")
  call s:setupFileDumpBuffer(l:files, '.')
endfunction " }}}
function! s:switchCWD() " {{{
    if !exists("g:change_cwd_root_directory")
        let g:change_cwd_root_directory = getcwd()
    endif

    let l:current_file_dir=expand('%:p:h')

    if l:current_file_dir != getcwd()
        exec("cd " . l:current_file_dir)
    else
        exec("cd " . g:change_cwd_root_directory)
    endif
endfunction " }}}
function! GitLogOmni(findstart, base) " {{{
  if a:findstart
    return 0
  else
    return systemlist("git branch | sed -e 's/..//' && git log --pretty=%s --no-merges -10")
  endif
endfunction
" }}}
function! FoldText() " {{{
    let line_count = v:foldend - v:foldstart + 1
    let line_count_text = line_count ==# 1 ? ' line' : ' lines'
    let line = getline(v:foldstart)
    let line = substitute(line, '\(" \)\{-}{{{$', '', 'g')
    let line = substitute(line, '\s*$', '', 'g')
    let line = substitute(line, '^"', '', 'g')
    let line = substitute(line, '^ ', '', 'g')
    let line = substitute(line, '^ ', '', 'g')
    return '» ' . line . ' - ' . line_count . line_count_text
endfunction
" }}}

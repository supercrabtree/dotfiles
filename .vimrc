set nocompatible
filetype plugin indent on
syntax enable
" Colors {{{
" white = #ffffff => 100% => 15
" grey1 = #f3f3f3 => 97%  =>
" grey2 = #e8e8e8 => 91%
" grey3 = #dbdbdb => 86%
" grey4 = #b3b3b3 => 70%
" grey5 = #999999 => 60%
" grey6 = #808080 => 50%
" black = #000000 => 0%   =>

" " red      = #bf2222
" " green    = #008c00
" " yellow   = #ffaf00
" " blue     = #2275bf
" " brown    = #724700

" red        = #941a1e -> ad1f1f
" green      = #006215 -> 006600
" blue       = #1a5b94
" yellow     = #ffaf00
" darkorange = #ea7a19
"
" Highlight          Background     Foreground     Style (cterm)
" ------------------------------------------------------------------------------
hi Normal                           guifg=NONE
hi BadMsg                           guifg=#941a1e
hi Boolean                          guifg=#1a5b94
hi BrightGoodMsg     guibg=#006215  guifg=#FFFFFF
hi Comment                          guifg=#999999 cterm=italic
hi Constant                         guifg=NONE
hi Directory                        guifg=#1a5b94
hi Error             guibg=#941a1e  guifg=#ffffff
hi ErrorMsg          guibg=#941a1e  guifg=#ffffff
hi FoldColumn                       guifg=NONE
hi Folded            guibg=#f3f3f3  guifg=NONE
hi Function                         guifg=NONE
hi GoodMsg                          guifg=#006215
hi Identifier                       guifg=NONE
hi Ignore            guibg=#f3f3f3  guifg=#f3f3f3
hi Keyword                          guifg=NONE
hi MoreMsg                          guifg=#1a5b94
hi NonText                          guifg=#b3b3b3
hi Number                           guifg=#1a5b94
hi Preproc                          guifg=NONE
hi Question                         guifg=NONE
hi Special                          guifg=NONE
hi SpecialKey                       guifg=#b3b3b3
hi SpellBad          guibg=NONE     guifg=#941a1e  cterm=NONE
hi SpellCap          guibg=NONE     guifg=NONE     cterm=NONE
hi Statement                        guifg=NONE
hi String                           guifg=#1a5b94
hi Title                            guifg=NONE
hi Todo                             guifg=NONE
hi Type                             guifg=NONE
hi WarningMsg                       guifg=NONE
hi Underlined                       guifg=NONE     cterm=NONE

" UI elements
hi ColorColumn       guibg=#f3f3f3
hi CursorLine                                      cterm=NONE
hi PMenu             guibg=#e8e8e8  guifg=#808080
hi LineNr                           guifg=#b3b3b3
hi CursorLineNr                     guifg=NONE
hi MatchParen        guibg=NONE     guifg=#941a1e
hi StatusLine        guibg=#e8e8e8  guifg=#000000  cterm=NONE
" hi StatusLineWarn    guibg=#e8e8e8  guifg=#941a1e  cterm=NONE
hi StatusLineNC      guibg=#e8e8e8  guifg=#b3b3b3  cterm=NONE
hi VertSplit         guibg=#e8e8e8  guifg=#e8e8e8
hi WildMenu          guibg=#000000  guifg=#ffffff
hi QuickFixLine      guibg=#e8e8e8
hi Visual            guibg=#dbdbdb

hi Search            guibg=#ffaf00  guifg=#000000
hi IncSearch         guibg=#006215  guifg=#ffffff  cterm=NONE
hi ExtraWhitespace   guibg=#e8e8e8  guifg=#e8e8e8

" Diffs
hi DiffAdd           guibg=NONE     guifg=#006215
hi DiffChange        guibg=NONE
hi DiffDelete        guibg=#941a1e  guifg=#941a1e
hi DiffText          guifg=#ea7a19  guibg=#f6f6f6 cterm=NONE
hi diffAdded                        guifg=#006215
hi diffRemoved                      guifg=#941a1e

" Commits
hi gitcommitSelectedFile            guifg=#006215
hi gitcommitDiscardedFile           guifg=#941a1e

" Git Gutter
hi GitGutterAdd                     guifg=#006215
hi GitGutterChange                  guifg=#b3b3b3
hi GitGutterDelete                  guifg=#941a1e
hi GitGutterChangeDelete            guifg=#b3b3b3


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

" old
" hi ALEErrorSign      guibg=#ffffff  guifg=#bb0900
" hi ALEWarningSign    guibg=#ffffff  guifg=#c1a700

" new
hi ALEErrorSign      guibg=#ffffff  guifg=#941a1e
hi ALEWarningSign    guibg=#ffffff  guifg=#ffaf00

match ExtraWhitespace /\s\+$/
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
set completeopt=menuone,longest,noinsert
" set cursorline
set diffopt+=vertical,context:3
set expandtab
set encoding=utf-8
set gdefault
set grepformat=%f:%l:%c:%m,%f:%l:%m
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --hidden
set foldmethod=indent
set foldlevelstart=5
set foldnestmax=5
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
set wildignore+=dist/**,**/node_modules/**,**/bower_components/**

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

  au FileType php setlocal complete=.,w,b,u

  au FileType gitcommit setlocal colorcolumn=51,73
  au FileType gitcommit setlocal spell
  au FileType gitcommit setlocal nonumber

  au FileType markdown setlocal spell
  au FileType markdown setlocal textwidth=80
  au FileType markdown setlocal colorcolumn=81

  au BufRead,BufNewFile *.filedump setfiletype filedump
  au FileType filedump nnoremap <buffer> <C-C> :bd<cr>
  au FileType filedump nnoremap <buffer> <CR> gf
  au FileType filedump xmap <CR> gf

  au FileType * setlocal formatoptions-=cor

  au BufWritePost $HOME/dev/dotfiles/.vimrc source $HOME/dev/dotfiles/.vimrc|setlocal foldmethod=marker
  au BufReadPost $HOME/dev/dotfiles/.vimrc,$HOME/dev/dotfiles/.zshrc setlocal foldmethod=marker|setlocal foldlevel=0
  au BufReadPost * if !&diff && &filetype != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"zz" | endif

  au QuickFixCmdPost *grep* cwindow
augroup END
" }}}
" VAM & Plugins {{{
function! s:SetupVAM() " {{{
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager' shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif " }}}
  call vam#ActivateAddons([
  \  'github:Quramy/tsuquyomi',
  \  'github:airblade/vim-gitgutter',
  \  'github:gcavallanti/vim-noscrollbar',
  \  'github:heavenshell/vim-jsdoc',
  \  'github:ianks/vim-tsx',
  \  'github:leafgarland/typescript-vim',
  \  'github:pangloss/vim-javascript',
  \  'github:supercrabtree/vim-subl',
  \  'github:tpope/vim-commentary',
  \  'github:tpope/vim-fugitive',
  \  'github:tpope/vim-rhubarb',
  \  'github:tpope/vim-sleuth',
  \  'github:tpope/vim-surround',
  \  'github:tpope/vim-repeat',
  \  'github:Alok/notational-fzf-vim',
  \  'github:junegunn/fzf',
  \  'github:junegunn/fzf.vim',
  \  'github:w0rp/ale',
  \], {'auto_install' : 1})
endfunction
call s:SetupVAM()
" source $HOME/dev/snaplist/snaplist.vim
" }}}
" Plugin Settings {{{
let g:nv_directories=["/Users/george.crabtree/Notes", "./docs", "readme.md"]
let g:nv_use_short_pathnames=1
let g:nv_create_note_window = 'split'

let g:ale_linters = {
\   'html': [],
\}
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
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
  au BufEnter * call s:save_file_to_MRU_file(expand('%:p'))
augroup END

function! s:save_file_to_MRU_file(filename)
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
  let l:files = filter(l:files, {key, val -> match(val, '\/quickfix-\d*$') == -1})

  let l:open_buffers = filter(copy(l:files), {key, val -> bufloaded(val)})
  let l:remaining_files = filter(copy(l:files), {key, val -> (index(open_buffers, val) == -1)})

  let l:in_cwd = filter(copy(l:remaining_files), {key, val -> (stridx(val, getcwd()) > -1)})
  let l:remaining_files = filter(copy(l:remaining_files), {key, val -> (index(in_cwd, val) == -1)})

  let l:file_list = map(l:remaining_files, {key, val -> fnamemodify(val, ':~:.')})

  if len(l:in_cwd)
    let l:in_cwd = map(l:in_cwd, {key, val -> fnamemodify(val, ':~:.')})
    let l:file_list = l:in_cwd + [""] + l:file_list
  endif

  if len(l:open_buffers)
    let l:open_buffers = map(l:open_buffers, {key, val -> fnamemodify(val, ':~:.')})
    let l:file_list = l:open_buffers + [""] + l:file_list
  endif

  call s:setup_file_buffer(l:file_list, ".")
endfunction

" }}}
function! s:OpenAllVisuallySelectedFiles() " {{{
  if line(".") == line("'>")
    execute "edit " . getline(".")
  else
    execute "edit " . getline(".") | b#
  endif
endfunction " }}}
function! s:Find(regex, ignore_git) " {{{
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

  call s:setup_file_buffer(l:files, l:root, g:file_buffer_no, a:regex)
endfunction " }}}
function! s:DirtyFiles(args) " {{{
  let l:files = system("git status -s " . a:args . "| sed 's/^...//'")
  call s:setup_file_buffer(l:files, '.')
endfunction " }}}
function! s:setup_file_buffer(files, root, ...) " {{{
  if exists("a:1")
    exec 'b' . a:1
    normal ggdG
  else
    enew
  endif
  execute "lcd " . a:root
  setlocal statusline=%f\ \|\ %l\ of\ %L\ col\ %c
  set buftype=nofile
  set filetype=filedump
  put = a:files
  normal ggdd
  if exists("a:2") && a:2 != ''
    call feedkeys(":g/" . escape(a:2, '/\') . "/m0\<CR>", "nt")
  endif
  " cnoremap <buffer> : <space><c-r><c-f><home>!
endfunction " }}}
function! s:ChangeCWD() " {{{
    if !exists("g:change_cwd_root_directory")
        let g:change_cwd_root_directory = getcwd()
    endif

    let l:currentFileDir=expand('%:p:h')

    if l:currentFileDir != getcwd()
        exec("cd " . l:currentFileDir)
    else
        exec("cd " . g:change_cwd_root_directory)
    endif
endfunction " }}}
function! s:CaseChange(str) " {{{
    let l:snake = '^[a-z0-9]\+\(-\+[a-z0-9]\+\)\+$'
    let l:camel = '\C^[a-z][a-z0-9]*\([A-Z][a-z0-9]*\)*$'
    let l:under = '\C^[a-z0-9]\+\(_\+[a-z0-9]\+\)*$'
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
function! s:GetVisualSelection() " {{{
  try
    let l:a_save = @a
    silent normal! gv"aygv
    return @a
  finally
    let @a = l:a_save
  endtry
endfunction " }}}
function! s:ShowGitLogs() " {{{
 enew
 setlocal buftype=nofile
 setlocal nonumber
 silent exec '.!git log --no-merges --pretty="\%s\%b\%n---"'
 " silent exec '.!git log --no-merges --pretty="\%an \%H\%n\%s\%b\%n"'
endfunction " }}}
function! s:BetterIncSearch(key) abort " {{{
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
function! s:VMD() " {{{
  let b:VMDpid=systemlist("vmd " . shellescape(bufname('')) . "&echo $!")[0]
  redraw!
  echo "vmd " . bufname('') . "&echo $!"
  augroup vmd
    autocmd!
    au TextChanged,TextChangedI <buffer> silent write
    au BufDelete,VimLeave <buffer> call system("kill " . b:VMDpid)
  augroup END
endfunction
" }}}
" Search Functions {{{
function! s:SearchEscape(reg)
    return substitute(escape(a:reg, '\'), '\n', '\\n', 'g')
endfunction

function! s:SetSearch(reg)
    call setreg('/', "\\V" . s:SearchEscape(a:reg))
endfunction

function! s:SetSearchWord(reg)
    call setreg('/', "\\V\\<" . s:SearchEscape(a:reg) . "\\>")
endfunction
" }}}
" Mappings {{{
" Find and grep mappings
nnoremap <C-F><C-F> g*<esc>N:Find /
nnoremap <C-F> :Find 
nnoremap <C-F>! :Find! 

nnoremap <C-F><C-O> :execute 'Find' expand('%:h')<cr>
nnoremap <C-F><C-N> :NV<cr>
xmap <C-F> *N<esc>:<C-U>Find /

nnoremap <C-G> :grep! 
nnoremap <C-G><C-G> :call <SID>SetSearchWord(expand("<cword>"))\|set hlsearch<CR>:call feedkeys(":grep! -F " . expand("<cword>"))<cr>
xnoremap <C-G> :call setreg('/', substitute(<SID>GetVisualSelection(), '"', '\\"', 'g'))\|set hlsearch<CR>:<c-u>grep! -F "/"

nnoremap <C-F><C-G> :DirtyFiles<cr>
nnoremap <C-F><C-R> :MRU<cr>

inoremap <expr> <right> pumvisible() ? "\<C-L>" : "<right>"

cnoremap <C-X> <C-R>=getline(".")
nnoremap Y y$
nnoremap - o<esc>"*p
nnoremap _ g-
nnoremap + g+
nnoremap <silent> <BS> :noh<cr>:redraw!<cr>jk:diffupdate<cr>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
" cnoremap <expr> : <space><c-r>%<home>!
cnoremap <expr> <S-Tab> <SID>BetterIncSearch('stab')
cnoremap <expr> <Tab> <SID>BetterIncSearch('tab')

" substitute shortcuts
nnoremap s :%s/
nnoremap S yiw:%s/<C-R>"//c<left><left>
xnoremap s y:%s/\V<C-R>=escape(@", '/')<CR>//c<left><left>

" force go file
nnoremap cgf :e <cfile><CR>

" toggle fugative blame with c-q
nnoremap <expr> <c-q> &filetype == 'fugitiveblame' ? "\<c-w>\<c-c>" : ":Gblame<cr>"

" open multiple files in visualmode
xnoremap gf :call <SID>OpenAllVisuallySelectedFiles()<cr>:echo<cr>

" insert undo stop points
inoremap <cr> <c-]><C-G>u<cr>
inoremap <c-h> <C-G>u<c-h>
inoremap <c-u> <C-G>u<c-u>
inoremap <c-w> <C-G>u<c-w>
inoremap <space> <C-G>u<space>

nnoremap j gj
nnoremap k gk

" cheapo brace expansion
inoremap {<cr> {<cr>}<esc>O

" 'line-content' mappings, yank content - delete content
nnoremap yc mz^yg_`z
nnoremap dc mz^dg_`z

nmap J ]c
nmap K [c
nnoremap <expr> H &diff ? 'do' : ':GitGutterStageHunk<cr>'
nnoremap <expr> U &diff ? 'dp' : 'mz:GitGutterUndoHunk<cr>`z'
nnoremap <expr> dy &diff ? '<c-w><c-w>yy<c-w><c-w>Vp' : 'dy'

" navigate quickfix quickly
nmap [q :cp<cr>zz
nmap ]q :cn<cr>zz


" buffer movement
" nmap <silent> <C-P> :SnapForward<CR>
" nmap <silent> <C-N> :SnapBack<CR>
nmap <silent> <C-N> :bn<CR>
nmap <silent> <C-P> :bp<CR>
" nmap <expr> <silent> <C-C> len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<cr>' : ':bp<CR>:bd #<CR>'
nmap <silent> <C-C> :bd<cr>
nnoremap g<C-C> :%bd<cr>:e#<cr>
nnoremap <C-B> :ls<cr>:b
cmap <expr> <silent> <C-N> getcmdline() == 'b' ? 'n\|redraw\|ls<CR>:b' : ':bn<CR>'
cmap <expr> <silent> <C-P> getcmdline() == 'b' ? 'p\|redraw\|ls<CR>:b' : ':bp<CR>'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <expr> / getcmdtype() == '/' ? getcmdline() == '' ? '/' : '\/' : '/'

" fix missing mappings due to hjkl global remap
inoremap <c-x><right> <c-x><c-l>
inoremap <c-x><up> <c-x><c-k>
inoremap <expr> <right> pumvisible() ? "\<C-L>" : "\<right>"

" last file
nnoremap # <c-^>

" mark just before a search
nnoremap / mS/
nnoremap g/ `S

nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>

nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

nnoremap <silent> <F11> :call s:ChangeCWD()<CR>
inoremap <silent> <F11> <c-o>:call s:ChangeCWD()<CR>

" quick spell fixes
inoremap <c-s> <esc>:set spell<cr>[sea<c-x><c-s>
nnoremap <c-s> :set spell!<cr>

" fix indent
xnoremap > >gv
xnoremap < <gv

cmap <C-R>' <C-R>=getline('.')<CR>

nnoremap <expr> dy &diff ? '<c-w><c-w>yy<c-w><c-w>Vp' : ':echoerr "E99: Current buffer is not in diff mode"<cr>'
" nnoremap dy <c-w>hyy<c-w>lVp' : 'dy'

xnoremap <silent> * :call <SID>SetSearch(<SID>GetVisualSelection())\|set hlsearch<CR>
nnoremap <silent> * :call <SID>SetSearchWord(expand("<cword>"))\|set hlsearch<CR>
nnoremap cs :%s///n<cr>

vnoremap ~ "zc<C-R>=<SID>CaseChange(@z)<CR><Esc>v`[


" }}}
"Commands {{{

" Manual Indentation Adjustments
command! -nargs=1 Spaces execute "setlocal shiftwidth=" . <args> . " tabstop=" . <args> . " expandtab"
command! -nargs=1 Tabs   execute "setlocal shiftwidth=" . <args> . " tabstop=" . <args> . " noexpandtab"

command! -nargs=? -bang -complete=file Find call s:Find("<args>", <bang>0)

command! -nargs=* DirtyFiles call s:DirtyFiles("<args>")

command! -nargs=0 MRU call s:MRU()

command! -nargs=0 ShowGitLogs call s:ShowGitLogs()

command! -nargs=0 Vimrc e ~/dev/dotfiles/.vimrc

command! -nargs=0 VMD call s:VMD()
" }}}

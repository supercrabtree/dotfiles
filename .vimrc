set nocompatible
filetype plugin indent on
syntax enable

" VAM Setup {{{
function! EnsureVamIsOnDisk(plugin_root_dir)
  let vam_autoload_dir = a:plugin_root_dir.'/vim-addon-manager/autoload'
  if isdirectory(vam_autoload_dir)
    return 1
  else
    if 1 == confirm("Clone VAM into ".a:plugin_root_dir."?","&Y\n&N")
      call mkdir(a:plugin_root_dir, 'p')
      execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:plugin_root_dir, 1).'/vim-addon-manager'
      execute 'helptags '.fnameescape(a:plugin_root_dir.'/vim-addon-manager/doc')
    endif
    return isdirectory(vam_autoload_dir)
  endif
endfunction

function! SetupVAM()
  let l:c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = l:c
  let l:c.plugin_root_dir = expand('$HOME/.vim/vim-addons', 1)
  if !EnsureVamIsOnDisk(l:c.plugin_root_dir)
    echohl ErrorMsg | echomsg "No VAM found!" | echohl NONE
    return
  endif
  let &rtp.=(empty(&rtp)?'':',').l:c.plugin_root_dir.'/vim-addon-manager'
  call vam#ActivateAddons([
  \  'github:airblade/vim-gitgutter',
  \  'github:editorconfig/editorconfig-vim',
  \  'github:heavenshell/vim-jsdoc',
  \  'github:pangloss/vim-javascript',
  \  'github:Quramy/tsuquyomi',
  \  'github:leafgarland/typescript-vim',
  \  'github:ianks/vim-tsx',
  \  'github:ronakg/quickr-preview.vim',
  \  'github:tpope/vim-commentary',
  \  'github:tpope/vim-fugitive',
  \  'github:tpope/vim-rhubarb',
  \  'github:w0rp/ale',
  \], {'auto_install' : 1})
endfunction

call SetupVAM()
" }}}

" Plugin Settings {{{
let g:quickr_preview_keymaps = 0

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_core_mode = 'external_command'

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
let g:loaded_matchit = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
" }}}

" Settings {{{
set backspace=indent,eol,start
set clipboard=unnamed
set completeopt=menu,longest
set diffopt+=vertical,context:3
set expandtab
set encoding=utf-8
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
set shiftwidth=4
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=-1
set statusline=%m%r%y\ %f:%l\ of\ %L\ col\ %c\ %P
set tabstop=4
set termguicolors
set ttimeoutlen=0
set undodir=$HOME/.vim/undo
set undofile
set wildmenu
set wildignore+=*/node_modules/*,*/bower_components/*,node_modules,bower_components

" find files in require() and import statments
set suffixesadd+=.js
set path+=$PWD/node_modules

" different cursor shapes for insert mode for iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" allow italics
set t_ZH=[3m
set t_ZR=[23m
" }}}

" Auto Commands {{{
augroup vimrc
  autocmd!
  " maintain window layout between sessions
  " au BufLeave * if !&diff | let b:winview = winsaveview() | endif
  " au BufEnter * if exists("b:winview") | call winrestview(b:winview) | unlet! b:winview | endif
  au BufReadPost * if !&diff && &filetype != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"zz" | endif

  au Filetype qf setlocal statusline=%t%{exists('w:quickfix_title')\ ?\ '\ '.w:quickfix_title\ :\ ''}\ %l\ of\ %L\ col\ %c
  au FileType qf setlocal nobuflisted
  au Filetype qf nnoremap <buffer><silent> <c-c> :<c-u>execute "try\n:ccl\ncatch\n:bd\nendtry"<cr>
  au Filetype qf nmap <buffer> <space> <plug>(quickr_preview)
  au FileType qf execute max([min([line("$"), 20]), 3]) . "wincmd _"
  au FileType qf wincmd J
  au FileType qf nmap <buffer> <c-n> j<space>
  au FileType qf nmap <buffer> <c-p> k<space>
  au FileType qf nnoremap <buffer> s :cfdo %s///gc<left><left><left>
  au FileType qf nnoremap <buffer> S yiw:cfdo %s/\V<C-R>=escape(@", '/')<CR>//gc<left><left><left>
  au FileType qf xnoremap <buffer> s y:cfdo %s/\V<C-R>=escape(@", '/')<CR>//gc<left><left><left>
  au FileType qf xnoremap <buffer> S y:cfdo %s/\V<C-R>=escape(@", '/')<CR>//gc<left><left><left>

  au FileType php setlocal complete=.,w,b,u

  au FileType gitcommit setlocal colorcolumn=51,73
  au FileType gitcommit setlocal spell
  au FileType gitcommit setlocal nonumber

  au FileType markdown setlocal spell
  au FileType markdown setlocal colorcolumn=81

  au FileType * setlocal formatoptions-=cor
augroup END
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

command! -nargs=0 MRU call s:MRU()
" }}}

function! OpenAllVisuallySelectedFiles() " {{{
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
  setlocal buftype=nofile
  put = a:files
  normal ggdd
  if exists("a:2") && a:2 != ''
    call feedkeys(":g/" . escape(a:2, '/\') . "/m0\<CR>", "nt")
  endif
  nnoremap <buffer> <C-C> :bw<cr>
  nnoremap <buffer> <Enter> mFgf
endfunction " }}}

function! s:Grep(args, ignore_git, force_case_sensitive) " {{{
  let l:save = &grepprg
  let l:grep_cmd = 'grep -n'
  let l:is_git_dir = system("git rev-parse >/dev/null 2>&1; printf $?") == 0

  if l:is_git_dir && !a:ignore_git
    let l:grep_cmd = 'git ' . l:grep_cmd
  else
    let l:grep_cmd = l:grep_cmd . ' -R'
  endif

  if !a:force_case_sensitive && !(a:args !=# tolower(a:args))
    let l:grep_cmd = l:grep_cmd . " -i"
  endif

  execute 'set grepprg=' . escape(l:grep_cmd, ' ')
  execute 'silent grep! ' . a:args . ' | cwindow | sleep 10m | redraw!'

  let &grepprg = l:save
endfunction " }}}

function! ChangeCWD() " {{{
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

function! s:Context(reverse) " {{{
  call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', a:reverse ? 'bW' : 'W')
endfunction " }}}

function! s:Ranger() " {{{
    let tmp = tempname()
    exec 'silent !ranger --choosefiles=' . shellescape(tmp)
    if !filereadable(tmp)
        redraw!
        return
    endif
    let names = readfile(tmp)
    if empty(names)
        redraw!
        return
    endif
    exec 'edit ' . fnameescape(names[0])
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction " }}}

" Executioner {{{
function! s:ExecutionerRun(prev_win)
    let l:command = getline('$')
    let l:arguments = getline(1, '$')[:-2]
    q
    exec a:prev_win . "wincmd w"

    let l:i = 1
    let l:command = substitute(l:command, '"', '', '')

    for param in l:arguments
        let l:command = substitute(l:command, "$" . l:i, param, 'g')
        let l:i += 1
    endfor

    exec l:command
endfunction

function! Executioner(command)
    let l:executioner_prev_win = winnr()
    let l:program = split(a:command, ' ')[0]
    let l:folder = expand('~/.vim/executioner/')

    let l:cwd = getcwd()
    let l:file_name = l:folder . substitute(l:cwd, '/', '-', 'g') . '-' . l:program . '.vim'

    let maxdollar = max(split(substitute(a:command, '.\{-}\$\(\d\)', '\1 ', 'g'), ' '))

    bot new
    setlocal statusline=\ 
    execute "edit " . l:file_name

    let l:filecontents = getline(1, '$')

    if join(l:filecontents, '\n') == ''
        execute 'norm ' . l:maxdollar . 'o'
        call setline('$', '" ' . a:command)
        norm gg
    endif

    execute 'resize ' . len(getline(1, '$'))
    set nobuflisted

    nnoremap <buffer> <cr> :w<cr>
    nnoremap <buffer> <c-c> :bd!<cr>

    augroup executioner
        autocmd!
        " autocmd TextChanged,TextChangedI <buffer> execute 'resize ' . len(getline(1, '$')) . '|norm gg``'
        execute 'autocmd BufWritePost <buffer> exec "call s:ExecutionerRun("' . l:executioner_prev_win . '")"'
    augroup END
endfunction

command! -nargs=? Executioner call Executioner("<args>")

" }}}

function! CaseChange(str) " {{{
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

function! GetVisualSelection() " {{{
  try
    let l:a_save = @a
    silent normal! gv"aygv
    return @a
  finally
    let @a = l:a_save
  endtry
endfunction " }}}

" Search Functions {{{
function! SearchEscape(reg)
    return substitute(escape(a:reg, '\'), '\n', '\\n', 'g')
endfunction

function! SetSearch(reg)
    call setreg('/', "\\V" . SearchEscape(a:reg))
endfunction

function! SetSearchWord(reg)
    call setreg('/', "\\V\\<" . SearchEscape(a:reg) . "\\>")
endfunction
" }}}

" Mappings {{{
" Find and grep mappings
nnoremap <C-F><C-F> g*<esc>N:Find /
nnoremap <C-F> :Find 
nnoremap <C-F>! :Find! 
xmap <C-F> *N<esc>:<C-U>Find /

nnoremap <C-G> :Executioner Grep $1 -- $2<CR>:1<cr>cc
nnoremap <C-G><CR> :Executioner Grep $1 -- $2<CR>:1<cr>$
nnoremap <C-G><C-G> g*N:noh<CR>:Executioner Grep $1 -- $2<CR>:1,0<cr>cc/<ESC>
xmap <silent> <C-G> :call setreg('/', SearchEscape(GetVisualSelection()))<cr>:noh<CR>:Executioner Grep $1 -- $2<CR>:1,0<cr>cc/<ESC>

nnoremap <C-F><C-G> :DirtyFiles<cr>
nnoremap <C-F><C-R> :MRU<cr>

inoremap <expr> <right> pumvisible() ? "\<C-L>" : "<right>"

cnoremap <C-X> <C-R>=getline(".")
nnoremap Y y$
nnoremap - o<esc>"*p
xnoremap - "*y
nnoremap _ g-
nnoremap + g+
nnoremap <silent> <BS> :noh<cr>:redraw!<cr>jk:diffupdate<cr>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" substitute shortcuts
nnoremap s :%s/<C-R>///gc<left><left><left>
nnoremap S yiw:%s/\V\<<C-R>=escape(@", '/')<CR>\>//gc<left><left><left>
xnoremap s :s/<C-R>///gc<left><left><left>
xnoremap S y:%s/\V<C-R>=escape(@", '/')<CR>//gc<left><left><left>


" open multiple files in visualmode
xnoremap gf :call OpenAllVisuallySelectedFiles()<cr>:echo<cr>
xmap <Enter> gf

" insert undo stop points
inoremap <cr> <c-]><C-G>u<cr>
inoremap <c-h> <C-G>u<c-h>
inoremap <c-u> <C-G>u<c-u>
inoremap <c-w> <C-G>u<c-w>
inoremap <space> <C-G>u<space>

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
nmap <silent> <C-N> :bn<CR>
nmap <silent> <C-P> :bp<CR>
nmap <expr> <silent> <C-C> len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<cr>' : ':bp<CR>:bd #<CR>'
nnoremap <C-B> :ls<cr>:b
cmap <expr> <silent> <C-N> getcmdline() == 'b' ? 'n\|redraw\|ls<CR>:b' : ':bn<CR>'
cmap <expr> <silent> <C-P> getcmdline() == 'b' ? 'p\|redraw\|ls<CR>:b' : ':bp<CR>'

" fix missing mappings due to hjkl global remap
inoremap <c-x><right> <c-x><c-l>
inoremap <c-x><up> <c-x><c-k>
inoremap <expr> <right> pumvisible() ? "\<C-L>" : "\<right>"

" last file
nnoremap <expr> <cr> &filetype == 'qf' ? "\<cr>" : "\<c-^>"

" mark just before a search
nnoremap / mS/
nnoremap g/ `S

nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>

nnoremap [a :call <SID>Context(1)<CR>
nnoremap ]a :call <SID>Context(0)<CR>

nnoremap <silent> <F5> :call ChangeCWD()<CR>
inoremap <silent> <F5> <c-o>:call ChangeCWD()<CR>

" quick spell fixes
inoremap <c-s> <esc>:set spell<cr>[sea<c-x><c-s>
nnoremap <c-s> :set spell!<cr>

" fix indent
xnoremap > >gv
xnoremap < <gv

cmap <C-R>' <C-R>=getline('.')<CR>

nnoremap <expr> dy &diff ? '<c-w><c-w>yy<c-w><c-w>Vp' : ':echoerr "E99: Current buffer is not in diff mode"<cr>'
" nnoremap dy <c-w>hyy<c-w>lVp' : 'dy'

xnoremap <silent> * :call SetSearch(GetVisualSelection())\|set hlsearch<CR>
nnoremap <silent> * :call SetSearchWord(expand("<cword>"))\|set hlsearch<CR>

vnoremap ~ "zc<C-R>=CaseChange(@z)<CR><Esc>v`[

" }}}

"Commands {{{

" Manual Indentation Adjustments
command! -nargs=1 Spaces execute "setlocal shiftwidth=" . <args> . " tabstop=" . <args> . " expandtab"
command! -nargs=1 Tabs   execute "setlocal shiftwidth=" . <args> . " tabstop=" . <args> . " noexpandtab"

command! -nargs=+ -bang -complete=dir Grep call s:Grep(<q-args>, <bang>0, 0)
command! -nargs=? -bang -complete=file Find call s:Find("<args>", <bang>0)
command! -nargs=* DirtyFiles call s:DirtyFiles("<args>")

command! -bar Ranger call s:Ranger()

command! -nargs=+ GitGutterBase execute "let g:gitgutter_diff_base = '" . system("git rev-parse <args>")[:-2] . "'"
" }}}

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
hi ErrorMsg          guibg=#941a1e  guifg=#ffffff
hi Error             guibg=#941a1e  guifg=#ffffff
hi NonText                          guifg=#b3b3b3
hi Comment                          guifg=#999999 cterm=italic
hi Ignore            guibg=#f3f3f3  guifg=#f3f3f3
hi Title                            guifg=NONE
hi Function                         guifg=NONE
hi Special                          guifg=NONE
hi SpecialKey                       guifg=#b3b3b3
hi Keyword                          guifg=NONE
hi Type                             guifg=NONE
hi Constant                         guifg=NONE
hi String                           guifg=#1a5b94
hi Boolean                          guifg=#1a5b94
hi Preproc                          guifg=NONE
hi Number                           guifg=#1a5b94
hi Identifier                       guifg=NONE
hi Statement                        guifg=NONE
hi Todo                             guifg=NONE
hi WarningMsg                       guifg=NONE
hi GoodMsg                          guifg=#006215
hi BrightGoodMsg     guibg=#006215  guifg=#FFFFFF
hi BadMsg                           guifg=#941a1e
hi Directory                        guifg=#1a5b94
hi MoreMsg                          guifg=#1a5b94
hi Question                         guifg=NONE
hi Folded            guibg=#f3f3f3  guifg=NONE
hi FoldColumn                       guifg=NONE
hi SpellBad          guibg=NONE     guifg=#941a1e  cterm=NONE
hi SpellCap          guibg=NONE     guifg=NONE     cterm=NONE

" UI elements
hi ColorColumn       guibg=#f3f3f3
hi CursorLine        guibg=#e8e8e8                 cterm=NONE
hi PMenu             guibg=#e8e8e8  guifg=#808080
hi LineNr                           guifg=#b3b3b3
hi CursorLineNr                     guifg=NONE
hi MatchParen        guibg=NONE     guifg=#941a1e
hi StatusLine        guibg=#e8e8e8  guifg=#000000  cterm=NONE
hi StatusLineNC      guibg=#e8e8e8  guifg=#b3b3b3  cterm=NONE
hi VertSplit         guibg=#e8e8e8  guifg=#e8e8e8
hi WildMenu          guibg=#000000  guifg=#ffffff
hi QuickFixLine      guibg=#e8e8e8
hi Visual            guibg=#dbdbdb

hi Search            guibg=#ffaf00  guifg=#000000
hi IncSearch         guibg=#006215  guifg=#ffffff  cterm=NONE
hi ExtraWhitespace   guibg=#941a1e  guifg=#941a1e

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

hi ALEErrorSign      guibg=#ffffff  guifg=#bb0900
hi ALEWarningSign    guibg=#ffffff  guifg=#c1a700

match ExtraWhitespace /\s\+$/
augroup whitespace
  autocmd!
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END
" }}}

" vim:fdm=marker

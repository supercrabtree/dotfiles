set nocompatible
filetype plugin indent on
syntax enable

function! EnsureVamIsOnDisk(plugin_root_dir)
  let vam_autoload_dir = a:plugin_root_dir.'/vim-addon-manager/autoload'
  if isdirectory(vam_autoload_dir)
    return 1
  else
    if 1 == confirm("Clone VAM into ".a:plugin_root_dir."?","&Y\n&N")
      call mkdir(a:plugin_root_dir, 'p')
      exe '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:plugin_root_dir, 1).'/vim-addon-manager'
      exe 'helptags '.fnameescape(a:plugin_root_dir.'/vim-addon-manager/doc')
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
  \   'github:airblade/vim-gitgutter',
  \   'github:tpope/vim-commentary'
  \ ], {'auto_install' : 1})
endfunction

call SetupVAM()

" Disable unused builtin plugins
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1

set backspace=indent,eol,start
set cursorline
set expandtab
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set iskeyword+=-,$
set laststatus=2
set lazyredraw
set list
set listchars=tab:❯—,nbsp:§,precedes:❮,extends:❯
set mouse=a
set nofixendofline
set nostartofline
set noswapfile
set nowrap
set scroll=10
set scrolloff=1
set shiftwidth=4
set shortmess=F
set smartcase
set smarttab
set softtabstop=4
set statusline=%f:%l\ of\ %L\ col\ %c\ %y%q%m%r
set tabstop=4
set termguicolors
set ttimeoutlen=0
set undodir=~/.vim/undo
set undofile
set wildmenu

" different cursor shapes for insert mode for iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if !filereadable($HOME . '/.vim/mru.txt')
  call system('mkdir -p ' . $HOME . '/.vim/')
  call system('touch ' . $HOME . '/.vim/mru.txt')
endif

" commands for adjusting indentation rules manually
command! -nargs=1 Spaces execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " tabstop=" . <args> . " expandtab"
command! -nargs=1 Tabs   execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " tabstop=" . <args> . " noexpandtab"

augroup vimrc_mini
  autocmd!
  " maintain window layout between sessions
  au BufLeave * if !&diff | let b:winview = winsaveview() | endif
  au BufEnter * if exists("b:winview") && !&diff | call winrestview(b:winview) | unlet! b:winview | endif
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"zz" | endif
  au BufReadPost * if !&diff && &filetype != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"zz" | endif

  au Filetype qf setlocal statusline=%t%{exists('w:quickfix_title')\ ?\ '\ '.w:quickfix_title\ :\ ''}\ %l\ of\ %L\ col\ %c
  au Filetype qf nnoremap <buffer> <silent> g<CR> <CR>:ccl<CR>

  au FileType gitcommit setlocal colorcolumn=51,73
  au FileType gitcommit setlocal spell
  au FileType gitcommit setlocal nocursorline

  au BufEnter * call s:save_file_to_MRU_file(expand('%:p'))
augroup END

function! s:save_file_to_MRU_file(filename)
  let l:lines = readfile($HOME.'/.vim/mru.txt')
  let l:lines = filter(l:lines, 'v:val != "'.a:filename.'"')
  let l:lines = insert(l:lines, a:filename)
  let l:lines = filter(l:lines, '!empty(v:val)')
  call writefile(l:lines[0:100000], $HOME.'/.vim/mru.txt')
endfunction

function! OpenAllVisuallySelectedFiles()
  if line(".") == line("'>")
    execute "edit " . getline(".")
  else
    execute "edit " . getline(".") | b#
  endif
endfunction

function! s:Find(regex, ignore_git)
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
  if a:regex != ''
    let l:name = '/' . a:regex . ' ' . fnamemodify(l:root, ':~')
  else
    let l:name = fnamemodify(l:root, ':~')
  endif
  call s:setup_file_buffer(l:files, l:root, 'Find', l:name, a:regex)
endfunction

function! s:MRU()
  let l:files = readfile($HOME."/.vim/mru.txt")
  let l:files = filter(l:files, "!empty(v:val)")
  let l:files = filter(l:files, 'v:val != "'.expand('%:p').'"')
  let l:files = filter(l:files, {key, val -> match(val, '\/vim\d\d\/') == -1})
  let l:files = map(l:files, {key, val -> fnamemodify(val, ':~:.')})
  let l:open_buffers = filter(copy(l:files), {key, val -> bufloaded(expand(val))})
  let l:other_files = filter(copy(l:files), {key, val -> !bufloaded(expand(val))})
  if len(l:open_buffers)
    let l:file_list = l:open_buffers + [""] + l:other_files
  else
    let l:file_list = l:other_files
  endif
  let l:name = fnamemodify(expand('.'), ":~")
  call s:setup_file_buffer(l:file_list, ".", 'MRU', l:name)
endfunction

function! s:Grep(args, ignore_git, force_case_sensitive)
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
endfunction

function! s:setup_file_buffer(files, root, type, title, ...)
  enew
  execute "lcd " . a:root
  setlocal statusline=%f\ \|\ %l\ of\ %L\ col\ %c
  setlocal buftype=nofile
  setlocal nobuflisted
  "execute "file " . escape(a:type . ' ' . bufnr('%') . ' ' . a:title , ' ')
  put = a:files
  normal ggdd
  if a:0 > 0 && a:1 != ''
    " call feedkeys("/" . a:1 . "\<CR>", "nt")
    " call feedkeys(":v//d\<CR>", "nt")
    call feedkeys(":v/" . a:1 . "/d\<CR>", "nt")
    call feedkeys("gg:noh\<CR>:echo\<CR>", "nt")
  endif
  nnoremap <buffer> <C-C> :bw<cr>
  nnoremap <buffer> <Enter> gf
  xnoremap <buffer> gf :call OpenAllVisuallySelectedFiles()<cr>:echo<cr>
  xmap <buffer> <Enter> gf
endfunction

function! QF()
  return expand("%") . ":" . line(".") .  ":" . getline(".")
endfunction

function! s:Ranger()
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
endfunction

command! -bar Ranger call s:Ranger()
command! -nargs=+ -bang -complete=dir Grep call s:Grep(<q-args>, <bang>0, 0)
command! -nargs=+ -bang -complete=dir GrepCaseSensitive call s:Grep(<q-args>, <bang>0, 1)
command! -nargs=? -bang -complete=file Find call s:Find("<args>", <bang>0)
command! -nargs=0 MRU call s:MRU()

" Find and grep mappings
nnoremap <C-F><C-F> g*<esc>N:Find /
nnoremap <C-F> :Find 
nnoremap <C-F>! :Find! 
xmap <C-F> *N<esc>:<C-U>Find /

nnoremap <C-G><C-G> g*N:noh<CR>:Grep /
nnoremap <C-G> :Grep 
nnoremap <C-G>! :Grep! 
xmap <C-G> *N:noh<CR>:<C-U>Grep /

nnoremap <C-F><C-R> :MRU<cr>
nnoremap <C-B> :ls<cr>:b

" Mappings
nnoremap * *N
nnoremap Y y$
xnoremap * mzy/<C-R>=escape('<C-R>"', '/.')<CR><CR>`z
nnoremap - o<esc>"*p
xnoremap - "*y
nnoremap _ g-
nnoremap + g+
nnoremap <silent> <BS> :noh<cr>:redraw!<cr>jk:diffupdate<cr>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
nnoremap s :let @*=@"<cr>:echo 'Stamped'<cr>
nnoremap S :let @*=@
nnoremap <C-S> :%s//
xnoremap <C-S> y:%s/<C-R>=escape('<C-R>"', '/.')<CR>/

" insert undo stop points
inoremap <cr> <c-]><c-g>u<cr>
inoremap <c-h> <c-g>u<c-h>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
inoremap <space> <c-g>u<space>

" cheapo brace expansion
inoremap {<cr> {}<C-G>U<Left><cr><cr><c-g>U<Up><tab>

" 'line-content' mappings, yank content - delete content
nnoremap yc mz^yg_`z
nnoremap dc mz^dg_`z

nnoremap H :GitGutterStageHunk<cr>
nmap J ]c
nmap K [c
nnoremap U mz:GitGutterUndoHunk<cr>`z

nmap [q :cp<cr>zz
nmap ]q :cn<cr>zz

nmap <silent> <C-N> :bn<CR>
nmap <silent> <C-P> :bp<CR>
nmap <silent> <C-C> :bn<CR>:bd #<CR>

colorscheme supercrabtree


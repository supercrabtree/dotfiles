" Colors
" ------------------------------------------------------------------------------
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

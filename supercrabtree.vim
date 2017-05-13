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
" 80807f


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
hi BrightGoodMsg     guibg=#4ead1f  guifg=#FFFFFF
hi BadMsg                           guifg=#bf2222
hi Directory                        guifg=#2275bf
hi MoreMsg                          guifg=#2275bf
hi Question                         guifg=NONE
hi Folded                           guifg=NONE
hi FoldColumn                       guifg=NONE
hi DiffAdd           guibg=NONE     guifg=#4ead1f
hi DiffChange        guibg=NONE
hi DiffDelete        guibg=#bf2222  guifg=#bf2222
hi DiffText          guibg=#dbdbdb
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
" hi jsBooleanFalse                   guifg=#bf2222
" hi jsBooleanTrue                    guifg=#4ead1f

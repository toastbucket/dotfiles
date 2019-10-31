hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="maxcolors"
"basic
hi Normal       ctermfg=248     ctermbg=None    cterm=None
hi Cursor       ctermfg=248     ctermbg=None    cterm=None
hi Directory    ctermfg=154     ctermbg=None    cterm=None
hi Visual       ctermbg=233
"standard
hi ErrorMsg             ctermfg=Red     ctermbg=none    cterm=none
hi PreProc              ctermfg=Red     ctermbg=None    cterm=None
hi Type                 ctermfg=81      ctermbg=None    cterm=None
hi Statement            ctermfg=33      ctermbg=None    cterm=None
hi Comment              ctermfg=240     ctermbg=None    cterm=None
hi Identifier           ctermfg=208     ctermbg=None    cterm=None
hi Float                ctermfg=141
hi DiffText             ctermfg=88      ctermbg=250     cterm=None
hi Constant             ctermfg=202     ctermbg=None    cterm=None
hi Todo                 ctermfg=160     ctermbg=None    cterm=None
hi done                 ctermfg=Green   ctermbg=None    cterm=None
hi Error                ctermfg=White   ctermbg=Red     cterm=none
hi Special              ctermfg=160     ctermbg=None    cterm=None
hi Ignore               ctermfg=220     ctermbg=None    cterm=None
hi Underline            ctermfg=244     ctermbg=None    cterm=None
hi LineNr               ctermfg=32      ctermbg=None    cterm=None
hi NonText              ctermfg=236     ctermbg=None    cterm=None
hi Search               ctermfg=none    ctermbg=234     cterm=none
hi SpecialKey           ctermfg=235     ctermbg=None    cterm=None
hi MatchParen           ctermfg=green   ctermbg=None    cterm=None
hi Folded               ctermfg=27      ctermbg=None    cterm=None
hi FoldColumn           ctermfg=Red     ctermbg=none    cterm=None
hi String               ctermfg=202     ctermbg=None    cterm=None
hi Number               ctermfg=208     ctermbg=None    cterm=None
hi ColorColumn          ctermfg=Red     ctermbg=None    cterm=None
hi OverLength           ctermfg=None    ctermbg=None    cterm=None
hi WarningMsg           ctermfg=208     ctermbg=None    cterm=None
hi ModeMsg              ctermfg=Green   ctermbg=None    cterm=None
hi Function             ctermfg=154
hi cppScope             ctermfg=125
hi cppAttrib            ctermfg=166
hi cppClass             ctermfg=9
hi Conditional          ctermfg=197
hi Operator             ctermfg=161
hi Repeat               ctermfg=161     cterm=None
hi Keyword              ctermfg=197     cterm=None
hi customFunction       ctermfg=yellow
hi cOperator            ctermfg=yellow
hi cppOperator          ctermfg=yellow
hi Delimiter            ctermfg=45
hi cComa                ctermfg=yellow
hi Question             ctermfg=81
hi Typedef              ctermfg=81
hi StorageClass         ctermfg=208
hi Label                ctermfg=202
"statusline
hi StatusLine           ctermfg=244     ctermbg=234     cterm=None
hi StatusLineNC         ctermfg=240     ctermbg=None    cterm=None
hi VertSplit            ctermfg=233     ctermbg=233     cterm=None
hi WildMenu             ctermfg=118     ctermbg=234     cterm=None
"pmenu
hi Pmenu                ctermfg=39      ctermbg=16      cterm=None
hi PmenuSel             ctermfg=81      ctermbg=Black   cterm=None
hi PmenuSbar            ctermfg=24      ctermbg=24      cterm=None
hi PmenuThumb           ctermfg=Black   ctermbg=33      cterm=None
hi SpellBad             ctermfg=White   ctermbg=Red     cterm=none
"tabline
hi TabLine              ctermfg=244     ctermbg=234     cterm=None
hi TabLineSel           ctermfg=81      ctermbg=234     cterm=None
hi TabLineFill          ctermfg=238     ctermbg=234     cterm=None
"quickfix errors
hi QfError              ctermfg=Red     ctermbg=None    cterm=None
hi QfSeparator          ctermfg=208     ctermbg=None    cterm=None
hi QfFilename           ctermfg=75      ctermbg=None    cterm=None
hi QfLineNr             ctermfg=220     ctermbg=None    cterm=None
" c
hi cAssign              ctermfg=118
hi cBitOp               ctermfg=34
hi cCmpLog              ctermfg=208
hi cCmp                 ctermfg=214
hi cPtrOp               ctermfg=202
hi cPtr                 ctermfg=38
hi cBang                ctermfg=160
hi cSemiColumn          ctermfg=214
hi cTern                ctermfg=71
"cpp
hi cppType              ctermfg=85      ctermbg=None    cterm=None
hi cppStatement         ctermfg=81      ctermbg=None    cterm=None
hi cppAccess            ctermfg=160     ctermbg=None    cterm=None
hi cppStorageClass      ctermfg=Magenta ctermbg=None    cterm=None
hi cppCast              ctermfg=Darkred ctermbg=None    cterm=None
hi cppBoolean           ctermfg=208     ctermbg=None    cterm=None
hi cppStructure         ctermfg=82      ctermbg=None    cterm=None
hi cppTemplate          ctermfg=5       ctermbg=None    cterm=None
hi cppTypename          ctermfg=202     ctermbg=None    cterm=None
hi cppExceptions        ctermfg=172     ctermbg=None    cterm=None
hi cppNullPointer       ctermfg=Magenta ctermbg=None    cterm=None
"latex
hi texCmdName           ctermfg=81      ctermbg=None    cterm=None
hi texComment           ctermfg=45      ctermbg=None    cterm=None
hi texEnvBeg            ctermfg=83      ctermbg=None    cterm=None
hi texEnvEnd            ctermfg=83      ctermbg=None    cterm=None
hi texEnvName           ctermfg=75      ctermbg=None    cterm=None
hi texDelimiter         ctermfg=81      ctermbg=None    cterm=None
"Diff text
hi DiffAdd              ctermfg=82      ctermbg=22      cterm=none
hi DiffChange           ctermbg=234     cterm=none
hi DiffDelete           ctermfg=196     ctermbg=88      cterm=none
hi DiffText             ctermfg=51      ctermbg=17      cterm=none
"For syntax checking
hi CompileWarning       ctermfg=208     ctermbg=none    cterm=none
hi CompileError         ctermfg=Red     ctermbg=none    cterm=none
hi SignColumn           ctermbg=none
"Cmake syntax
hi cmakeVariableValue   ctermfg=cyan
hi cmakeString          ctermfg=208
hi cmakeArguments       ctermfg=33
hi cmakeStatement       ctermfg=81
hi cmakeOperator        ctermfg=244
hi cmakeSystemVariable  ctermfg=83
"Jedi colors
hi JediFat              ctermfg=41      cterm=none
hi JediFunction         ctermfg=202     ctermbg=233
" tagbar colors
hi TagbarKind           ctermfg=red
hi TagbarScope          ctermfg=green
hi TagbarSignature      ctermfg=208
hi TagbarHighlight      ctermfg=41
" tags
hi Tag                  ctermfg=197
hi Title                ctermfg=203
" Arm assembly
hi armAsmOpcode         ctermfg=81
hi armAsmDirective      ctermfg=160
hi armAsmLabel          ctermfg=41
" nerdtree colors
hi NERDTreeHelp         ctermfg=239
hi NERDTreeCWD          ctermfg=red
hi NERDTreeClosable     ctermfg=160
hi NERDTreeOpenable     ctermfg=77
hi NERDTreeExecFile     ctermfg=darkred
hi NERDTreeFile         ctermfg=244
hi NERDTreeRO           ctermfg=red
hi NERDTreeDir          ctermfg=166
" Man pages
hi manOptions           ctermfg=45
hi manTitle             ctermfg=160
hi manReference         ctermfg=196
set background=dark
"end

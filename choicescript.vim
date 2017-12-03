" Vim syntax file
" Language:     ChoiceScript
" Maintainer:   Tracy Canfield
" Adds additional ChoiceScript reserved words to the syntax
" file created by Ben Hamill

if exists("b:current_syntax")
    finish
endif

unlet! b:current_syntax

syn match choicescriptComments '\*comment .*$'

syn match choicescriptOption '#'

syn match choicescriptChoice '\*choice'
syn match choicescriptChoice '\*fake_choice'
syn match choicescriptChoice '\*disable_reuse'
syn match choicescriptChoice '\*allow_reuse'
syn match choicescriptChoice '\*hide_reuse'
syn match choicescriptChoice '\*selectable_if'

syn match choicescriptFlowControl '\*if'
syn match choicescriptFlowControl '\*else'
syn match choicescriptFlowControl '\*elseif'

syn match choicescriptCommands '\*set'
syn match choicescriptCommands '\*temp'
syn match choicescriptCommands '\*rand'
syn match choicescriptCommands '\*page_break'
syn match choicescriptCommands '\*line_break'
syn match choicescriptCommands '\*stat_chart'
syn match choicescriptCommands '\*finish'
syn match choicescriptCommands '\*ending'
syn match choicescriptCommands '\*achieve'
syn match choicescriptCommands '\*achievement'
syn match choicescriptCommands '\*check_achievements'
syn match choicescriptCommands '\*image'
syn match choicescriptCommands '\*input_text'
syn match choicescriptCommands '\*input_number'

syn match choicescriptSetup '\*title'
syn match choicescriptSetup '\*author'
syn match choicescriptSetup '\*create'
syn match choicescriptSetup '\*scene_list'

"smPlugin.js and smPlugimMenuAddon.js support
syn match choicescriptSetup '\*sm_init'
syn match choicescriptSetup '\*sm_menuaddon'
syn match choicescriptSetup '\*sm_menuaddon'
syn match choicescriptSetup '\*sm_save'
syn match choicescriptSetup '\*sm_load'
syn match choicescriptSetup '\*sm_delete'

syn match choicescriptLabels '\*goto'
syn match choicescriptLabels '\*goto_scene'
syn match choicescriptLabels '\*goto_random_scene'
syn match choicescriptLabels '\*label'
syn match choicescriptLabels '\*gosub'
syn match choicescriptLabels '\*gosub_scene'
syn match choicescriptLabels '\*return'
syn match choicescriptLabels '\*gotoref'
syn match choicescriptLabels '\*setref'

syn match choicescriptError '\*bug'

syn keyword choicescriptBoolean true
syn keyword choicescriptBoolean false

syn match choicescriptPipe '|'

syn region choicescriptInternalInterpolation start="\$!\{,2}{" skip="\\}" end="}" transparent contains=choicescriptConditionalInterpolation
syn region choicescriptInterpolation start="\$!\{,2}{" skip="\\}" end="}"
syn region choicescriptConditionalInterpolation start="@{" skip="\\}" end="}" contains=choicescriptInterpolation,choicescriptPipe

syn region choicescriptBold matchgroup=choicescriptOption start="\[b\]" end="\[/b\]" contains=choicescriptBoldItalic,choicescriptInterpolation
syn region choicescriptItalic matchgroup=choicescriptOption start="\[i\]" end="\[/i\]" contains=choicescriptItalicBold,choicescriptInterpolation
syn region choicescriptItalicBold matchgroup=choicescriptOption start="\[b\]" end="\[/b\]" contains=choicescriptInterpolation contained
syn region choicescriptBoldItalic matchgroup=choicescriptOption start="\[i\]" end="\[/i\]" contains=choicescriptInterpolation contained

highlight Exception ctermfg=red guifg=red
highlight choicescriptConditionalInterpolation ctermfg=darkgreen guifg=darkgreen cterm=bold gui=bold
highlight choicescriptPipe ctermfg=blue guifg=blue cterm=bold gui=bold
highlight choicescriptConditional ctermfg=blue guifg=blue cterm=bold gui=bold

hi def link choicescriptComments        Comment
hi def link choicescriptCommands        Identifier
hi def link choicescriptLabels          Constant
hi def link choicescriptOption          String
hi def link choicescriptChoice          Conditional
hi def link choicescriptFlowControl     Conditional
hi def link choicescriptError           Exception
hi def link choicescriptInterpolation   Statement
hi def link choicescriptSetup           PreProc
hi def link choicescriptBoolean         Boolean

hi link choicescriptBoldItalic choicescriptItalicBold

hi def choicescriptItalic               term=italic cterm=italic gui=italic
hi def choicescriptBold                 term=bold cterm=bold gui=bold
hi def choicescriptItalicBold           term=italic,bold cterm=italic,bold gui=italic,bold

let b:current_syntax = "choicescript"

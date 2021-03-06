scripte utf-8
let b:keymap_name = expand('<sfile>:t:r')

let a  = '`1234567890-= ~!@#$%^&*()_+'
let a .= 'qwertyuiop[]  QWERTYUIOP{} '
let a .= 'asdfghjkl;''\ ASDFGHJKL:"| '
let a .= 'zxcvbnm,./    ZXCVBNM<>?   '

" This is based on http://microapl.com/images/aplx_keyboard.jpg
"
" This might not be entirely correct.  The tutorial I will go through is going
" to be fun.
let b  = '⋄¨¯<≤=≥>≠∨∧×÷ ⍞⌶⍫⍒⍋⌽⍉⊖⍟⍱⍲!⌹'
let b .= '?⍵∊⍴~↑↓⍳○*←→  ?⍥⍷⍴⍬⍐⍗⍸⌷⍣⍇⍈ '
let b .= '⍺⌈⌊_∇∆∘''⎕⍎⍕⊢ ⍺⌈⌊_∇⍙⍤⌷⎕≡≢⊣ '
let b .= '⊂⊃∩∪⊥⊤|⍝⍀⌿    ⊂⊃∩∪⊥⊤|⍪⍤⍠   '
" I am not sure if ⍤ belons on <Esc>>

" Original dyalog keymap
"let b  = '⋄¨¯<≤=≥>≠∨∧×÷ ⋄⌶⍫⍒⍋⌽⍉⊖⍟⍱⍲!⌹'
"let b .= '?⍵∊⍴~↑↓⍳○*←→  ?⍵⍷⍴⍨↑↓⍸⍥⍣⍞⍬ '
"let b .= '⍺⌈⌊∥∇∆∘''⎕⍎⍕⊢ ⍺⌈⌊⊚∇∆⍤⌸⌷≡≢⊣ '
"let b .= '⊂⊃∩∪⊥⊤|⍝⍀⌿    ⊂⊃∩∪⊥⊤|⍪⍙⍠   '
" Original APL keymap
"let b  = '`¨¯<≤=≥>≠∨∧÷× ⍨∞⍁⍂⍠≈⌸⍯⍣⍱⍲≢≡'
"let b .= 'q⍵∊⍴~↑↓⍳○⍟←→  ⌹⍹⍷⍤T⌶⊖⍸⍬⌽⊣⊢ '
"let b .= '⍺⌈⌊⍫∇∆∘k⎕⋄''⍀ ⍶SDF⍒⍋⍝K⍞:"⍉ '
"let b .= '⊂⊃∩∪⊥⊤∣⍪.⌿    ⊆⊇⋔⍦⍎⍕⌷«»↗   '

let [A, B] = map([a, b], "split(v:val,'\\zs *')")

" Probably should go somewhere else.  Meh.
"
" Setting this to <Esc> makes it so 2+ Esc presses are needed to exit insert
" mode.  Or use <C-c>.  Apparently <Esc><Space> works, too.
if !exists("g:AplPrefix")
        let g:AplPrefix = '`'
endif

for i in range(len(A)) | exe escape('ln<buffer>'.g:AplPrefix.A[i].' '.B[i], '|') | endfor
unl a b A B i

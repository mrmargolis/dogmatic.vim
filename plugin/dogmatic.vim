"Dogmatic.vim disables your arrow keys and lets you know how many times you
"have tried to use them.
let s:count = 0
function! dogmatic#TrackArrowPress()
  let s:count += 1
  echomsg "Dogmatic.vim: You have tried to use the arrow keys " . s:count . " time(s)"
endfunction

noremap <right> <Esc>:call dogmatic#TrackArrowPress()<cr>
noremap <left> <Esc>:call dogmatic#TrackArrowPress()<cr>
noremap <up> <Esc>:call dogmatic#TrackArrowPress()<cr>
noremap <down> <Esc>:call dogmatic#TrackArrowPress()<cr>

inoremap <right> <C-O>:call dogmatic#TrackArrowPress()<cr>
inoremap <left> <C-O>:call dogmatic#TrackArrowPress()<cr>
inoremap <up> <C-O>:call dogmatic#TrackArrowPress()<cr>
inoremap <down> <C-O>:call dogmatic#TrackArrowPress()<cr>

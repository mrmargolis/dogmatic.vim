"Dogmatic.vim disables your arrow keys and lets you know how many times you
"have tried to use them.
let s:count = 0
function! dogmatic#TrackArrowPress()
  let s:count += 1
  echo "Dogmatic.vim: You have tried to use the arrow keys " . s:count . " time(s)"
endfunction

noremap <right> <Esc>:call dogmatic#TrackArrowPress()<cr>
noremap <left> <Esc>:call dogmatic#TrackArrowPress()<cr>
noremap <up> <Esc>:call dogmatic#TrackArrowPress()<cr>
noremap <down> <Esc>:call dogmatic#TrackArrowPress()<cr>

inoremap <right> <Esc>:call dogmatic#TrackArrowPress()<cr>
inoremap <left> <Esc>:call dogmatic#TrackArrowPress()<cr>
inoremap <up> <Esc>:call dogmatic#TrackArrowPress()<cr>
inoremap <down> <Esc>:call dogmatic#TrackArrowPress()<cr>

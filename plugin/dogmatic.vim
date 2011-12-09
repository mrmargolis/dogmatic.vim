"Dogmatic.vim disables your arrow keys and lets you know how many times you
"have tried to use them.
" Author:   Matt Margolis  @mrmargolis
let s:presses = { 'left': 0, 'right': 0, 'up': 0, 'down': 0 }
let s:last_arrow_press_time = 0

"Override with a number of seconds if you want a timeout between
"tracked arrow presses
let g:dogmatic_timeout = 0

function! dogmatic#TrackArrowPress(key)
  if s:TimeSinceLastTrack() >= g:dogmatic_timeout
    let s:presses[a:key] += 1
    let s:last_arrow_press_time = localtime()
    echomsg "Dogmatic.vim: You have tried to use the " . a:key . " arrow key " . s:presses[a:key] . " time(s) all keys: " . s:TotalArrowPresses() . " time(s)"
  endif
endfunction

function! s:TimeSinceLastTrack()
  return (localtime() - s:last_arrow_press_time)
endfunction

function! s:TotalArrowPresses()
  let total = 0
  for key in keys(s:presses)
    let total = total + s:presses[key]
  endfor
  return total
endfunction

noremap <silent> <right> <Esc>:call dogmatic#TrackArrowPress('right')<cr>
noremap <silent> <left> <Esc>:call dogmatic#TrackArrowPress('left')<cr>
noremap <silent> <up> <Esc>:call dogmatic#TrackArrowPress('up')<cr>
noremap <silent> <down> <Esc>:call dogmatic#TrackArrowPress('down')<cr>

inoremap <silent> <right> <C-O>:call dogmatic#TrackArrowPress('right')<cr>
inoremap <silent> <left> <C-O>:call dogmatic#TrackArrowPress('left')<cr>
inoremap <silent> <up> <C-O>:call dogmatic#TrackArrowPress('up')<cr>
inoremap <silent> <down> <C-O>:call dogmatic#TrackArrowPress('down')<cr>

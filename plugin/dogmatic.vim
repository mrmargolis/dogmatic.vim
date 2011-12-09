"Dogmatic.vim disables your arrow keys and lets you know how many times you
"have tried to use them.
" Author:   Matt Margolis  @mrmargolis
" reltime support contributed by jdevera

let s:presses = { 'left': 0, 'right': 0, 'up': 0, 'down': 0 }
let s:last_arrow_press_time = has('reltime') ? [0,0] : 0

"Override with a number of milliseconds if you want a timeout between
"tracked arrow presses.
"Note that if vim is not compiled with +reltime support, there is a 1 second
"resolution in the time difference calculation.
if !exists('g:dogmatic_timeout')
    let g:dogmatic_timeout = 0
endif

function! dogmatic#TrackArrowPress(key)
  if s:TimeSinceLastTrack() >= g:dogmatic_timeout
    let s:presses[a:key] += 1
    echomsg "Dogmatic.vim: You have tried to use the " . a:key . " arrow key " . s:presses[a:key] . " time(s) all keys: " . s:TotalArrowPresses() . " time(s)"
  endif
  let s:last_arrow_press_time = has('reltime') ? reltime() : localtime()
endfunction

function! s:TimeSinceLastTrack()
  if g:dogmatic_timeout == 0 " Don't spend any time here if no timeout is specified
    return 0
  endif
  if has('reltime')
    let [sec, usec] = map(split(reltimestr(reltime(s:last_arrow_press_time)), '\.'), 'str2nr(v:val)')
    return sec*1000 + usec/1000
  else
    return (localtime() - s:last_arrow_press_time) * 1000
  endif
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

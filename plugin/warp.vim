scriptencoding utf-8

if exists('g:warp_loaded')
    finish
endif
let g:warp_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:warp_map_to') ||
\  type(g:warp_map_to) !=3  ||
\  len(g:warp_map_to) !=10
    unlet! g:warp_map_to

    " mapping from the key you type to the number inputted actually
    " g:warp_map_to[3] = 'd' means that if you type 'd', 3 is inputted
    "
    "                     0    1    2    3    4    5    6    7    8    9
    let g:warp_map_to = [';', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l']
endif

function! s:conv(c)

    for i in range(0,9)
        if g:warp_map_to[i] ==# a:c
            return i
        endif
    endfor

    return -1
endfunction

function! s:jump()
    let tens = s:conv(nr2char(getchar()))
    let digits = s:conv(nr2char(getchar()))

    if tens == -1 || digits == -1
        return
    endif

    let lower2digits = tens * 10 + digits
    silent execute getpos('.')[1][:-len(lower2digits)-1].lower2digits

endfunction

nnoremap <silent><Plug>(warp_lower2digits_trigger) :<C-u>call <SID>jump()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

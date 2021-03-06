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
    " NOTE: This variable may be changed in the future. Because this setting
    "       can map a number to only one key.
    "
    "                     0    1    2    3    4    5    6    7    8    9
    let g:warp_map_to = [';', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l']
endif

let g:warp_show_input = get(g:, 'warp_show_input', 1)

function! s:conv(c)
    for i in range(0,9)
        if g:warp_map_to[i] ==# a:c
            return i
        endif
    endfor

    return -1
endfunction

function! s:input_char()
    let in = nr2char(getchar())
    return in =~# '\d' ? in : s:conv(in)
endfunction

function! s:jump(num_of_digits)
    let digits = []
    for _ in range(1,a:num_of_digits)
        let d = s:input_char()
        if d == -1 | return | endif
        if g:warp_show_input | echon d | endif
        call add(digits, d)
    endfor

    let lower_digits = join(digits,'')
    silent execute line('.')[:-a:num_of_digits-1].lower_digits
endfunction

nnoremap <silent><Plug>(warp_lower1digit_trigger)  :<C-u>call <SID>jump(1)<CR>
nnoremap <silent><Plug>(warp_lower2digits_trigger) :<C-u>call <SID>jump(2)<CR>
nnoremap <silent><Plug>(warp_lower3digits_trigger) :<C-u>call <SID>jump(3)<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

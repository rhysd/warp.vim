scriptencoding utf-8

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

function! warp#jump_with_digits(num_of_digits)
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


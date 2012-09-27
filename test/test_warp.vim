
function! Input_text()
    edit ./test_text.txt
    normal! gg
endfunction

function! Check_line(inputs,before,after)
    execute a:before
    normal 'm'
    call feedkeys(a:inputs[0])
    call feedkeys(a:inputs[1])

    return a:after == line('.') % 100
endfunction

" random number between 0 and n-1
function! Random(n)
    let r = system('echo $RANDOM')
    return r % a:n
endfunction

function! Random_two_digits()
    return [Random(10), Random(10)]
endfunction

function! Error_echomsg(mes)
    echohl ErrorMsg
    execute 'echomsg'.a:mes
    echohl None
endfunction

" setup
execute 'set rtp+='.expand('%:p:h:h')
runtime! plugin/warp.vim
nmap m <Plug>(warp_lower2digits)

call Input_text()

let s:max_line = line('$')
for _ in range(1,100)

    let start = Random(s:max_line) + 1
    let goto = Random_two_digits()
    let end = goto[0] * 10 + goto[1]
    let mapping = map(goto, 'g:warp_map_to[v:val]')
    let input = mapping[0].mapping[1]

    echo "testing ".start." to ".end." with '".input."'"
    if Check_line(mapping, start, end)
        echomsg 'clear!  '.start.' to '.end
    else
        call Error_echomsg(' "failed! '.start.' to '.end.'"')
    endif
    echo
endfor

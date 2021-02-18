"                        _
"   ___ _ __  _ ____   _(_)_ __ ___
"  / __| '_ \| '_ \ \ / / | '_ ` _ \
" | (__| |_) | |_) \ V /| | | | | | |
"  \___| .__/| .__(_)_/ |_|_| |_| |_|
"      |_|   |_|
"
" C++ abbreviations/mappings made by Anass IRIZI
" Email: irizi.anass.00@gmail.com

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                      Path                        """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal path=**,.,/usr/include/**2,,
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Related                      """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $RTP/mysnippets/c.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                  Abbreviations                   """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbreviate <buffer> cout cout <<
abbreviate <buffer> cin cin >>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Snippets                     """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <buffer> <leader>sr for ( : <++>)<CR><++><esc>k^f(a
inoremap <buffer> <leader>sR for ( : <++>)<CR>{<CR><++><CR>}<CR><++><esc>4k^f(a
inoremap <silent> <buffer> <leader>sn <esc>Inamespace <esc>o{<CR>}<esc>O
inoremap <silent> <buffer> <leader>sc <esc>Iclass <esc>lywo{<CR>:<CR><++><CR>public:<CR><C-r>0();<esc>yyp^f(a<++><esc>pI~<esc>o<++><CR>};<esc>7kI
inoremap <silent> <buffer> <leader>sC <esc>Iclass <esc>lywA : <CR>{<CR><++>:<CR><++><CR>public:<CR><C-r>0();<esc>yyp^f(a<++><esc>pI~<esc>o<++><CR>};<esc>9kA
inoremap <buffer> <leader>st try<CR>{<CR>}<CR>catch (<++>)<CR>{<CR><++><CR>}<esc>4kO

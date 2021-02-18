"             _
"   _____   _(_)_ __ ___
"  / __\ \ / / | '_ ` _ \
" | (__ \ V /| | | | | | |
"  \___(_)_/ |_|_| |_| |_|
"
" C abbreviations/mappings made by Anass IRIZI
" Email: irizi.anass.00@gmail.com

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                  Abbreviations                   """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev <buffer> #i #include
iabbrev <buffer> #d #define
iabbrev <buffer> td typedef
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Convenience                    """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <buffer> <leader>; <esc>mmA;<esc>`m
nnoremap <buffer> <leader>; mmA;<esc>`m
inoremap <buffer> <leader>n \n
inoremap <buffer> <leader>b <esc>o{<CR>}<esc>O
vnoremap <buffer> <leader>b <esc>'<O{<esc>'>o}<esc>V%='<
nnoremap <buffer> <leader>b o{<CR>}<esc>O
nnoremap <buffer> <silent> <leader>_ mm:s/\ /_/g<CR>`m
inoremap <buffer> <silent> <leader>_ <esc>mm:s/\ /_/g<CR>`ma
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Snippets                     """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <buffer> <leader><leader> <esc>/<++><CR>"_c4l
inoremap <silent> <buffer> <leader>sh <esc>gUiWI#ifndef <esc>A_H_<esc>yyp^cW#define<esc>Go#endif <Tab>// <C-r>% included<esc>O
inoremap <silent> <buffer> <leader>ss <esc>Itypedef struct <esc>o{<CR>} <++>;<CR><++><esc>kO
inoremap <buffer> <leader>sm int main(void)<CR>{<CR><CR><CR>return 0;<CR>}<esc>3ki<tab>
inoremap <buffer> <leader>sM int main(int argc, char ** argv)<CR>{<CR><CR><CR>return 0;<CR>}<esc>3ki<tab>
inoremap <buffer> <leader>sf for (; <++>; <++>)<CR><++><esc>k^f(a
inoremap <buffer> <leader>sF for (; <++>; <++>)<CR>{<CR><++><CR>}<CR><++><esc>4k^f(a
inoremap <buffer> <leader>sw while ()<CR><++><esc>k^f(a
inoremap <buffer> <leader>sW while ()<CR>{<CR><++><CR>}<CR><++><esc>4k^f(a
inoremap <buffer> <leader>sd do {<CR>} while (<++>);<CR><++><esc>kO
inoremap <buffer> <leader>si if ()<CR><++><esc>k^f(a
inoremap <buffer> <leader>sI if ()<CR>{<CR><++><CR>}<CR><++><esc>4k^f(a
inoremap <buffer> <leader>se else<CR>
inoremap <buffer> <leader>sE else<CR>{<CR>}<CR><++><esc>kO

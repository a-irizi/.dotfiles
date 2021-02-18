"            _       _
"  ___  __ _| |_   _(_)_ __ ___
" / __|/ _` | \ \ / / | '_ ` _ \
" \__ \ (_| | |\ V /| | | | | | |
" |___/\__, |_(_)_/ |_|_| |_| |_|
"         |_|
"
" sql abbreviations/mappings made by Anass IRIZI
" Email: irizi.anass.00@gmail.com

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                  Abbreviations                   """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev <buffer> j; INNER JOIN
iabbrev <buffer> l; LEFT OUTER JOIN
iabbrev <buffer> r; RIGHT OUTER JOIN
iabbrev <buffer> f; FULL OUTER JOIN
iabbrev <buffer> w; WHERE
iabbrev <buffer> o; ORDER BY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Convenience                    """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <buffer> <leader>d <esc>mm?SELECT<CR>A DISTINCT<esc>`ma
inoremap <buffer> <leader>D <esc>mm/SELECT<CR>A DISTINCT<esc>`ma
nnoremap <buffer> <leader>d mm?SELECT<CR>A DISTINCT<esc>`m
nnoremap <buffer> <leader>D mm/SELECT<CR>A DISTINCT<esc>`m
nnoremap <buffer> <leader>) mmO(<esc>jo)<esc>k>>`m
inoremap <buffer> <leader>) <esc>mmO(<esc>jo)<esc>k>>`ma
vnoremap <buffer> <leader>) "adO()<esc>i<CR><esc>P>i(
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Snippets                     """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <buffer> <leader><leader> <esc>/<++><CR>"_c4l
inoremap <buffer> <leader>o <esc>"adiwAON<esc>mm?\<AS\><CR>nwyiw'mA <C-R>".<C-R>a = <esc>nwyiw'mA<C-R>".<C-R>a<CR>
inoremap <buffer> <leader>O ON<esc>mm?\<AS\><CR>nwyiw'mA <C-R>". = <esc>nwyiw'mA<C-R>".<++><esc>^f.a
nnoremap <buffer> <leader>c A AS<space>
inoremap <buffer> <leader>c <space>AS<space>
nnoremap <buffer> <leader>C ea AS<space>
inoremap <buffer> <leader>ss SELECT<CR>FROM<CR>    <++><esc>?SELECT<CR>o<space><space><space><space>
inoremap <buffer> <leader>su SELECT<CR>FROM<CR><tab><++><CR><esc>iUNION<esc>kV2ky3jpo<tab><++><esc>2jo<esc>i;<esc>7kO<tab>
inoremap <buffer> <leader>sU SELECT<CR>FROM<CR><tab><++><CR><esc>iUNION ALL<esc>kV2ky3jpo<tab><++><esc>2jo<esc>i;<esc>7kO<tab>

"              _      _
"   __ _ _   _(_) ___| | __     ___  ___ ___  _ __   ___
"  / _` | | | | |/ __| |/ /____/ __|/ __/ _ \| '_ \ / _ \
" | (_| | |_| | | (__|   <_____\__ \ (_| (_) | |_) |  __/
"  \__, |\__,_|_|\___|_|\_\    |___/\___\___/| .__/ \___|
"     |_|                                    |_|
"
" quick-scope configuration made by Anass IRIZI
" Email: irizi.anass.00@gmail.com

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
let g:qs_lazy_highlight = 1

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

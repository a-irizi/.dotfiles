"     _    _          _     _
"    / \  (_)_ __ ___| |   (_)_ __   ___
"   / _ \ | | '__/ _ \ |   | | '_ \ / _ \
"  / ___ \| | | |  __/ |___| | | | |  __/
" /_/   \_\_|_|  \___|_____|_|_| |_|\___|
"
" aireline/powerline config made by derek taylor

" Powerline
set rtp+=/usr/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='dracula'

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

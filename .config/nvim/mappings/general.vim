"                                  _       _
"   __ _  ___ _ __   ___ _ __ __ _| |_   _(_)_ __ ___
"  / _` |/ _ \ '_ \ / _ \ '__/ _` | \ \ / / | '_ ` _ \
" | (_| |  __/ | | |  __/ | | (_| | |\ V /| | | | | | |
"  \__, |\___|_| |_|\___|_|  \__,_|_(_)_/ |_|_| |_| |_|
"  |___/
"
" nvim/vim mappings made by Anass IRIZI
" Email: irizi.anass.00@gmail.com

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Windows                      """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                       Tabs                       """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>t :$tabnew<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                      Splits                      """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                      Folds                       """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>z zf%
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Auto Center                    """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap n nzz
nnoremap N Nzz
nnoremap ] ]]zz
nnoremap [ [[zz
nnoremap ) )zz
nnoremap ( (zz
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                      Saving                      """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>a
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                  Spell Checking                  """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <leader>p :set spell!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                Search and Replace                """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>r mm""yiw:%s/\<"\>//g<left><left>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""           Cleaning Trailing Whitespace           """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>w mm:%s/\s*$//<CR>`m
inoremap <silent> <leader>w <esc>mm:%s/\s*$//<CR>`ma
vnoremap <silent> <leader>w <esc>mmgv:s/\s*$//<CR>`m
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                    Escape Key                    """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> <C-g> <esc>
nnoremap <silent> <C-g> <esc>
vnoremap <silent> <C-g> <esc>
cnoremap <silent> <C-g> <esc>
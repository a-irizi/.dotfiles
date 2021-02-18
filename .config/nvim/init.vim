"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
" nvim config made by Anass IRIZI
" Email: irizi.anass.00@gmail.com

let mapleader=','
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
" Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
" Plug 'SirVer/ultisnips'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'lambdalisue/fern.vim'
Plug 'easymotion/vim-easymotion'
" Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kovetskiy/sxhkd-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
" Initialize plugin system
call plug#end()

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                      General                     """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path=**,.,/usr/include/,,
filetype plugin indent on
syntax on
set splitright
set foldmethod=manual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Auto Complete                  """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete+=kspell completeopt=menuone,longest
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                    Undo/Swap                     """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile undodir=$RTP/undo//
set directory=$RTP/swp//
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Formating                    """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab tabstop=4 autoindent shiftwidth=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Look and Feel                  """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu relativenumber
set cursorline
set list listchars=trail:-,tab:<->
set incsearch nohlsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Color Scheme                   """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
if (has('termguicolors'))
  set termguicolors
endif

colorscheme dracula

" let g:material_theme_style = 'ocean-community'
" let g:material_terminal_italics = 1
" colorscheme material
set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Mappings                     """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $RTP/mappings/general.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Abbreviations                  """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $RTP/abbreviations/abbreviate.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                   Autocommands                   """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup anass
    au!
    au FileType c   source $RTP/mysnippets/c.vim
    au FileType cpp source $RTP/mysnippets/cpp.vim
    au FileType sql source $RTP/mysnippets/sql.vim
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""                     Functions                     """""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source $RTP/functions/functions.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""             Plugins Configs/Mappings             """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $RTP/plugins/coc_config.vim
source $RTP/plugins/fzf.vim
source $RTP/plugins/NERDTree.vim
source $RTP/plugins/vim_aireline.vim
source $RTP/plugins/cpp-enhanced.vim
source $RTP/plugins/undotree.vim
source $RTP/plugins/vim-floaterm.vim

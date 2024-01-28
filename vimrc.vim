" ====================
" Configurações Gerais
" ====================
set expandtab
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set autoindent

set nocompatible
filetype off
filetype plugin indent on

set termguicolors
set cursorline
set background=dark

set number relativenumber
set cursorline
set hlsearch

" ====================
" Plugins with VimPlug
" ====================
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-fugitive'
Plug 'elkowar/yuck.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'
Plug 'tribela/vim-transparent'
"Plug 'Mofiqul/adwaita.nvim'
"Plug 'cseelus/vim-colors-lucid'
"Plug 'effkay/argonaut.vim'
"Plug 'pineapplegiant/spaceduck'
"Plug 'thedenisnikulin/vim-cyberpunk'

"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
call plug#end()

" ===========================
" Colorscheme Configs
" ===========================
" ADWAITA
"let g:adwaita_darker = v:true " for darker version
"let g:adwaita_disable_cursorline = v:true " to disable cursorline
"let g:adwaita_transparent = v:true " makes the background transparent
" CYBERPUNK
let g:cyberpunk_cursorline = 'black'
colorscheme gruvbox

let g:airline_theme='gruvbox'


" ===============
" Transparent Vim
" ===============
" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

" Pmenu
let g:transparent_groups += ['Pmenu']

" coc.nvim
let g:transparent_groups += ['NormalFloat', 'CocFloating']


" =======================
" Configurações do VimTEX
" =======================
source ~/.config/nvim/vimtex_config.vim

" ======================
" Configurações NvimTree
" ======================

" Keybindings
nnoremap <C-t> :NvimTreeToggle<CR>

" ====================
" Configurações cocvim
" ====================

" Enter Selects the completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" Tab and Shift-Tab to navigate throught sugestions
inoremap <expr> <tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <s-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" ==========================
" Configurações do Ultisnips
" ==========================
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"


" =========
" FUNCTIONS
" =========

function TextModeOn()
    setlocal spell spelllang=pt_br
    set textwidth=67
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction

function TextModeOff()
    setlocal nospell 
    set textwidth=0
endfunction


" ========
" COMMANDS
" ========

command Texton call TextModeOn()
command Textoff call TextModeOff()


" ========
" MAPPINGS
" ========
noremap <leader>y "+y
noremap <leader>p "+p

map <C-s> :w<CR>

" Makefile setup mappings
map <F6> :w<CR>:!clear<CR>:!make build<CR>
map <F5> :!make run<CR>

" Cmake Mappings
"map <F6> :w<CR>:!clear<CR>:!cmake --build build<CR>
"map <F5> :w<CR>:!clear<CR>

map <F12> :vsp ~/.config/nvim/vimrc.vim<CR>
map <F1> :vsp makefile<CR>

map <C-BS> vbd
imap <C-BS> <ESC>vbda

" Insert Mode Movements
imap <c-h> <ESC>i
imap <c-j> <ESC>ja
imap <c-k> <ESC>lki
imap <c-l> <ESC>la

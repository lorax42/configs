" I partially used https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/ as a reference
" THIS AND THAT ---------------------------------------------------------- {{{
set number relativenumber
set autoindent

" no compatibility with vi
set nocompatible

" filetype detection
filetype on
" add and load plugins for filetype detection
filetype plugin on
" load an indent for detected filetype
filetype indent on

" syntax highlighting
syntax on

" cursor line horizontal
set cursorline
hi CursorLine cterm=NONE ctermbg=237
"hi CursorLine cterm=NONE
hi CursorLineNr cterm=bold ctermfg=11 ctermbg=237
"hi CursorLineNr cterm=bold ctermfg=11
hi LineNr cterm=NONE ctermfg=245
" cursor line vertical
"set cursorcolumn
" set cursor to block in all modes
"set guicursor=n-v-c-i:block
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

" indent width X Spaces
set shiftwidth=4
" tab width X columns
set tabstop=4
" space instead of tab
set expandtab
" tab insert comination of tab and space?
set softtabstop=0
" insert to go to next indent
"set smarttab

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" set search highlight colour
hi Search cterm=NONE ctermbg=237
" Set the commands to save in history default number is 20.
set history=1000
" Automatically save before commands like :next and :make
set autowrite
" Hide buffers when they are abandoned
set hidden
" Enable mouse usage (all modes)
set mouse=a

" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xls

" make vim copy to system clipboard for external use
set clipboard+=unnamedplus

" airline theme
"let g:airline_theme='minimalist'
"let g:airline_left_sep='>'
"let g:airline_right_sep='<'
"let g:airline_powerline_fonts=1
"let g:airline=0

" }}}


" PLUGINS ---------------------------------------------------------------- {{{
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" Plugin code goes here.
call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'Freedzone/kerbovim'
    Plug 'morhetz/gruvbox'
    Plug 'arrufat/vala.vim'
    Plug 'tpope/vim-surround'
    "Plug 'numToStr/Comment.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'c0r73x/vimdir.vim'
    "Plug 'nvim-tree/nvim-tree.lua'
    Plug 'Mofiqul/dracula.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'

    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1

    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"lua require('Comment').setup()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O<TAB>
inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O<TAB>
inoremap {;<CR> {<CR>};<ESC>O

nnoremap :W :w
nnoremap :Q :q
nnoremap :Wq :wq
nnoremap :WQ :wq

nnoremap <C-F> <CMD>NERDTree<CR>

" move line/selection up/down with Alt+k/j (NOT WORKING!)
nnoremap <A-j> ddp==
nnoremap <A-DOWN> ddp==
nnoremap <A-k> ddkP==
nnoremap <A-UP> ddkP==

vnoremap <A-Up>   :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

inoremap <A-j> <ESC>ddp==gi
inoremap <A-DOWN> <ESC>ddp==gi
inoremap <A-k> <ESC>ddkP==gi
inoremap <A-UP> <ESC>ddkP==gi

"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <ESC>:m .+1<CR>==gi
"inoremap <A-k> <ESC>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <ALT+j> :m+<CR>
nnoremap <ALT+k> :m-2<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ [%M]\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

"hi StatusLine cterm=NONE ctermbg=grey ctermfg=black
hi StatusLine cterm=bold ctermbg=white ctermfg=black
" }}}
set background=dark
"colorscheme gruvbox
colorscheme catppuccin-mocha

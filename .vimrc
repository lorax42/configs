" I partially used https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/ as a reference
syntax on
set number relativenumber
set autoindent
"let g:clang_library_path='/usr/lib/llvm-14/lib/libclang-14.so.1'

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
hi CursorLine cterm=NONE ctermbg=242
hi CursorLineNr cterm=bold ctermfg=11 ctermbg=242
" cursor line vertical
" set cursorcolumn

" shift width X Spaces
set shiftwidth=4
" tab width X columns
set tabstop=4
" space instead of tab
set expandtab

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
" Set the commands to save in history default number is 20.
set history=1000
" Automatically save before commands like :next and :make
set autowrite
" Hide buffers when they are abandoned
set hidden
" Enable mouse usage (all modes)
set mouse=a
set background=dark

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

" PLUGINS ---------------------------------------------------------------- {{{
"$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Plugin code goes here.
call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    "Plug 'KSP-KOS/EditorTools'
    "Plug 'baberthal/kOS.vim'

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O<TAB>
inoremap {;<CR> {<CR>};<ESC>O<TAB>

nnoremap :W :w
nnoremap :Q :q
nnoremap Wq :wq
nnoremap :WQ :wq

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

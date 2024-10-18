                               " Basic Settings
set nocompatible               " Disable compatibility with vi which can cause unexpected issues.
set encoding=utf-8             " Set file encoding to UTF-8.
set ruler                      " Show the cursor position all the time.
set noerrorbells               " Disable error bells.
set visualbell                 " Enable visual bell instead of beeping.
set backspace=indent,eol,start " Make backspace behave more intuitively.

" Filetype and Syntax Settings
filetype on               " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on        " Enable plugins and load plugin for the detected file type.
filetype indent on        " Load an indent file for the detected file type.
syntax on                 " Turn syntax highlighting on.

" Display Settings
set number                " Add numbers to each line on the left-hand side.
set relativenumber        " Turn relative number on.
set nowrap                " Do not wrap lines. Allow long lines to extend as far as the line goes.
set showcmd               " Show partial command you type in the last line of the screen.
set showmode              " Show the mode you are on the last line.
set showmatch             " Show matching words during a search.

" Search Settings
set incsearch             " While searching though a file incrementally highlight matching characters as you type.
set ignorecase            " Ignore capital letters during search.
set smartcase             " Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters.
set hlsearch              " Use highlighting when doing a search.

" Wildmenu Settings
set wildmenu              " Enable auto completion menu after pressing TAB.
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.

" Buffer and Performance Settings
set hidden                " Allow switching buffers without saving the current buffer.
set ttyfast               " Optimize rendering speed for fast terminal output.
set lazyredraw            " Redraw only when necessary to improve performance.

" Indentation Settings
set smartindent           " Enable smart indentation.
set expandtab             " Use spaces instead of tabs.
set formatoptions=tcqrn1  " Set format options for text formatting.

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'  
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'  
Plug 'junegunn/vim-easy-align'

call plug#end()

" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
let mapleader=' '

" FZF 
nnoremap <C-F>      :Files<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Colors<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fm :Commands<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

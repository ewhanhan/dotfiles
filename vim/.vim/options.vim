" Basic Settings
set nocompatible               " Disable compatibility with vi which can cause unexpected issues.
set encoding=utf-8             " Set file encoding to UTF-8.
set ruler                      " Show the cursor position all the time.
set noerrorbells               " Disable error bells.
set visualbell                 " Enable visual bell instead of beeping.
set backspace=indent,eol,start " Make backspace behave more intuitively.
set clipboard=unnamed

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
set shiftwidth=4
set tabstop=4

" FZF homebrew
set rtp+=/opt/homebrew/opt/fzf

" Set up grepprg to use ripgrep if available
set grepprg=rg\ --vimgrep\ --smart-case\ --follow


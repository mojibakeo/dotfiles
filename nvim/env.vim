let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

if &compatible
  set nocompatible
endif

set hidden
set number
set clipboard=unnamedplus
set clipboard+=unnamed
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set mouse=a

set guifont=Cica:h16
set printfont=Cica:h12
set noerrorbells

set list
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround

set smarttab
set showcmd
set showmatch
set hlsearch
set laststatus=2
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

set lazyredraw
set autoindent
set smartindent

set noswapfile

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

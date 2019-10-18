call plug#begin('~/.vim/plugged')

  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  let g:coc_global_extensions = [
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-css', 
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-yank',
    \ 'coc-prettier',
    \ 'coc-snippets',
    \ 'coc-lists',
    \ 'coc-git',
    \ 'coc-vetur',
    \ 'coc-solargraph'
    \]
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'ianks/vim-tsx'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'tomasr/molokai'
  Plug 'ryanoasis/vim-devicons'
  Plug 'itchyny/lightline.vim'
  Plug 'majutsushi/tagbar'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/git-messenger.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'posva/vim-vue'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'javascript.jsx', 'typescript.tsx', 'css', 'less', 'scss', 'vue', 'yaml', 'html'] }

call plug#end()




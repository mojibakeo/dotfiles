nnoremap <Space>c :<C-u>setlocal cursorline!<CR>
"let g:qb_hotkey = "<Space><Space>"
"nnoremap <Space><Space> :Denite buffer<CR>
nnoremap <Space><Space> :CocList buffers<CR>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <Silent> jj <ESC>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
tnoremap <silent> <ESC> <C-\><C-n>
map <Space>n :noh<CR>
map <Space>h <C-w>h
map <Space>j <C-w>j
map <Space>k <C-w>k
map <Space>l <C-w>l
map <Space>a :CocList grep 

nnoremap vs :vs<CR>
nnoremap sp :sp<CR>

nmap <C-j> :<C-u>bnext<CR>
nmap <C-k> :<C-u>bprev<CR>
nmap <silent> gs :Gstatus<CR>
nmap <silent> gb :Gblame<CR>
"nmap <silent> GG :CocCommand git.chunkInfo<CR>
nmap <silent> gm :GitMessenger<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> qf <Plug>(coc-fix-current)
nmap <C-o> :CocList files<CR>

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<C-p>'


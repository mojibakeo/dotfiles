let s:cache_home = expand('~/.cache/nvim')
let s:plug_dir = s:cache_home . '/plugs'
let s:vim_plug_dir = s:cache_home . '/vim-plug'
if has('vim_starting')
  if !isdirectory(s:vim_plug_dir)
    echo "Install vim-plug ..."
    execute '!git clone --depth 1 https://github.com/junegunn/vim-plug.git ' . s:vim_plug_dir . '/autoload'
  endif
  execute 'set runtimepath^=' . fnamemodify(s:vim_plug_dir, ':p')
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : { 'on': [], 'for': [] }
endfunction
function! MakeVimproc(info) abort "{{{2
  if a:info.status == 'updated' && g:is_windows && !has('kaoriya')
    let g:vimproc#download_windows_dll = 1
  endif
  if !g:is_windows
    !make
  endif
endfunction


runtime! plug.vim
runtime! env.vim
runtime! keymap.vim
runtime! plugins/*.vim
runtime! languages/*.vim
runtime! color.vim

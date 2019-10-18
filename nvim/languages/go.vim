au BufWritePre *.go GoImports
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4
au FileType go compiler go

let g:go_gocode_unimported_packages=1
let g:go_highlight_types = 1


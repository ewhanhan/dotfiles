" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
let mapleader=' '

" FZF 
nnoremap <C-F>      :Files<CR>
nnoremap <Leader><Leader> :Files<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Colors<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fm :Commands<CR>
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>fe :NERDTreeToggle<CR>
nnoremap <leader>fF :NERDTreeFind<CR>
nnoremap <leader>fn :NERDTreeFocus<CR>

nnoremap <leader>qq :qa<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>W :wa<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map 'jk' to 'Esc' in insert mode
inoremap jk <Esc>

" Replace f with sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" CamelCase
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


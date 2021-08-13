"Buffers
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

"Window switching
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
tnoremap <leader>h <C-\><C-n> :wincmd h<CR>
tnoremap <leader>j <C-\><C-n> :wincmd j<CR>
tnoremap <leader>k <C-\><C-n> :wincmd k<CR>
tnoremap <leader>l <C-\><C-n> :wincmd l<CR>

"Exit terminal mode
tnoremap <leader>q <C-\><C-n>

"Open terminal
nnoremap <leader>t :belowright 25sp term://zsh<CR>

"Resizing Window
nnoremap <Leader>] :vertical resize +5<CR>
nnoremap <Leader>[ :vertical resize -5<CR>
nnoremap <leader>} :resize +5<CR>
nnoremap <leader>{ :resize -5<CR>
nnoremap <leader>r :resize 30<CR>

"Splitting windows
noremap <Leader>- :<C-u>split<CR>
noremap <Leader>\ :<C-u>vsplit<CR>

" insert new line in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

"sudo save
command! -nargs=0 Sw w !sudo tee % > /dev/null

nnoremap <leader>/ /\<\><left><left>
nnoremap <leader>? /\<\><left><left>

"Find and replace word under cursor
noremap <F4> *:%s///gc \| noh<left><left><left><left><left><left><left><left><left>

"Find and replace selected text
vnoremap <F3> "py:%s/<C-r>p//gc \| noh<left><left><left><left><left><left><left><left><left>

"Toggle set list on/off
noremap <F5> :set list!<CR>

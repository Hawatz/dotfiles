nmap <F3> :NERDTreeToggle<CR>
vnoremap <F4> "jy :Rg <C-R>j<CR>
nmap <C-p> :FZF <CR>
nmap <C-h> :History <CR>
nmap <C-n> :noh <CR>
nmap <C-s> :w <CR>
nmap <Leader>gb :Git blame <CR>
nmap <Leader>q :q <CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <silent> gd <Plug>(coc-definition)

let g:codeium_no_map_tab = v:true
imap <script><silent><nowait><expr> <M-/> codeium#Accept() . "\<Esc>"
imap <M-.>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <M-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
:command! CopyBuffer let @+ = expand('%')

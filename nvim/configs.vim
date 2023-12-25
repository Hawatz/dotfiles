filetype plugin indent on
filetype on
filetype indent on

set number
set tabstop=2
set shiftwidth=2
set expandtab

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme base16-gruvbox-dark-hard

let g:airline_powerline_fonts = 1

set hidden
let g:mix_format_on_save = 1
let g:AutoPairsShortcutFastWrap = '<C-e>'

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = ['coc-solargraph', 'coc-elixir', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-prettier']

autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

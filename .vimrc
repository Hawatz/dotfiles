set mouse=a
set clipboard+=unnamedplus
set nocompatible
"filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set tags=./tags;
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': './install --bin' }
Plugin 'tpope/vim-eunuch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'mhinz/vim-mix-format'
Plugin 'vim-airline/vim-airline'
Plugin 'elixir-editors/vim-elixir'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'github/copilot.vim'
Plugin 'sainnhe/gruvbox-material'


call vundle#end()
filetype plugin indent on

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

syntax on

set background=dark
"let g:gruvbox_contrast_dark = 'hard'
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox_material'

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'original'

colorscheme gruvbox-material

set hidden
let g:mix_format_on_save = 1
let g:AutoPairsShortcutFastWrap = '<C-e>'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nmap <F3> :NERDTreeToggle<CR>
vnoremap <F4> "jy :Rg <C-R>j<CR>
nmap <C-p> :FZF <CR>
nmap <C-h> :History <CR>
nmap <C-n> :noh <CR>
nmap <C-s> :w <CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
let g:coc_global_extensions = ['coc-solargraph', 'coc-elixir', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-prettier']

autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

imap <M-.> <Plug>(copilot-next)
imap <M-,> <Plug>(copilot-previous)
imap <silent><script><expr> <M-/> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
:command! CopyBuffer let @+ = expand('%')

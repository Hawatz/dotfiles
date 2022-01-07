set mouse=a
set clipboard+=unnamedplus
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set tags=./tags;
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'mhinz/vim-mix-format'
Plugin 'vim-airline/vim-airline'
Plugin 'elixir-editors/vim-elixir'
Plugin 'junegunn/fzf', { 'do': './install --bin' }

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

let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

let g:airline_powerline_fonts = 1

let g:airline_theme='gruvbox'

set hidden

let g:mix_format_on_save = 1
nmap <F3> :NERDTreeToggle<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)

let g:coc_global_extensions = ['coc-solargraph', 'coc-elixir']

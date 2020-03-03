set clipboard+=unnamedplus
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'shougo/deoplete.nvim'
Plugin 'joshdick/onedark.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'mhinz/vim-mix-format'
Plugin 'vim-airline/vim-airline'
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'autozimu/LanguageClient-neovim'
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

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

let g:LanguageClient_autoStart = 1

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:deoplete#enable_at_startup = 1
let g:alchemist#elixir_erlang_src = $HOME . '/.asdf/installs/elixir/'
let g:mix_format_on_save = 1
nmap <F3> :NERDTreeToggle<CR>

command! -range -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

vnoremap <F4> "jy :Rg <C-R>j<CR>
nmap <C-p> :FZF <CR>
nmap <C-h> :History <CR>
nmap <C-n> :noh <CR>

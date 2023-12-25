set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': './install --bin' }
Plugin 'tpope/vim-eunuch'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'jiangmiao/auto-pairs'
Plugin 'mhinz/vim-mix-format'
Plugin 'elixir-editors/vim-elixir'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'Exafunction/codeium.vim'
Plugin 'RRethy/nvim-base16'
Plugin 'ellisonleao/gruvbox.nvim'
Plugin 'navarasu/onedark.nvim'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'RRethy/nvim-treesitter-endwise'

call vundle#end()

" Vim {{{
  " General settings {{{
    set nocompatible
    set encoding=utf-8
    set history=1000
  " }}}
  " Mapleader {{{
    let mapleader = ','
    let maplocalleader = '	'
  " }}}
  " Files {{{
    set hidden
    set autowrite
    set autoread
    set directory=/tmp//
    set swapfile
    set undodir=~/.vim/undo//
    set noundofile
    set backupdir=~/.vim/backup//
    set nobackup
    set nowritebackup
  " }}}
  " Searching {{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
  " }}}
  " Text Formatting {{{
    set wrap

    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set shiftround
    set expandtab
    set smarttab

    set backspace=2

    set autoindent
    set smartindent

    set virtualedit=block
  " }}}
  " Matching {{{
    set showmatch
    set matchtime=2
  " }}}
  " Folding {{{
    set foldenable
    set foldlevelstart=99
  " }}}
  " User interface {{{
    set title

    if has('gui_running')
      set background=light
    else
      set background=dark
    endif

    if &t_Co > 2 || has('gui_running')
      syntax on
    endif

    if has('gui_running') && has('mouse')
      set mouse=a
      set mousehide
    endif

    set nonumber
    set ruler
    set showcmd
    set laststatus=2
    set shortmess=atI

    set splitbelow
    set splitright

    set wildmenu
    set wildmode=longest,list,full
    set novisualbell
    set noerrorbells
    set visualbell t_vb=
  " }}}
" }}}

" Shell {{{
  if &shell =~ '/bin/fish$'
    set shell=/bin/bash
  endif
" }}}

" Vundle Install {{{
  if !isdirectory(expand('$HOME/.vim/bundle/Vundle.vim/.git', 1))
    silent ! git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    if v:shell_error
      finish
    else
      silent ! vim +PluginInstall +qall
    endif
  endif
" }}}

" Vundle {{{
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  " Colorschemes {{{
    Plugin 'chriskempson/base16-vim'
    Plugin 'larssmit/vim-getafe'
    Plugin 'ciaranm/inkpot'
    Plugin 'twerth/ir_black'
    Plugin 'nelstrom/vim-mac-classic-theme'
    Plugin 'tomasr/molokai'
    let g:molokai_original = 0
    let g:rehash256 = 1

    Plugin 'altercation/vim-colors-solarized'
    let g:solarized_termcolors = &t_Co

    Plugin 'jnurmine/Zenburn'
  " }}}
  " Syntax {{{
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'ap/vim-css-color'
    Plugin 'Soares/fish.vim'
    Plugin 'tpope/vim-git'
    Plugin 'tpope/vim-haml'
    Plugin 'wlangstroth/vim-haskell'
    Plugin 'digitaltoad/vim-jade'
    Plugin 'pangloss/vim-javascript'
    Plugin 'leshill/vim-json'
    Plugin 'groenewege/vim-less'
    Plugin 'tpope/vim-liquid'
    Plugin 'tpope/vim-markdown'
    Plugin 'mmalecki/vim-node.js'
    Plugin 'tpope/vim-rails'
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'wavded/vim-stylus'
    Plugin 'timcharper/textile.vim'
  " }}}
  " Editing {{{
    Plugin 'tpope/vim-abolish'
    Plugin 'kien/ctrlp.vim'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'kana/vim-fakeclip'
    nmap <Leader> "+
    vmap <Leader> "+

    Plugin 'vim-scripts/lastpos.vim'
    Plugin 'tpope/vim-repeat'
    Plugin 'sjl/gundo.vim'
    Plugin 'vim-scripts/ZoomWin'
  " }}}
  " Programming {{{
    Plugin 'tpope/vim-commentary'
    Plugin 'Raimondi/delimitMate'
    Plugin 'mattn/emmet-vim'
    Plugin 'tpope/vim-endwise'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    let g:gitgutter_enabled = 0
    let g:gitgutter_on_bufenter = 0

    Plugin 'gregsexton/gitv'
    Plugin 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_guide_size = 1

    Plugin 'michaeljsmith/vim-indent-object'
    runtime macros/matchit.vim
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'chrisbra/NrrwRgn'
    Plugin 'tpope/vim-scriptease'
    Plugin 'AndrewRadev/splitjoin.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/syntastic'
    Plugin 'godlygeek/tabular'
    Plugin 'bronson/vim-trailing-whitespace'
    Plugin 'tpope/vim-unimpaired'
  " }}}
  " User interface {{{
    Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
  " }}}
  call vundle#end()
  filetype plugin indent on
" }}}

" Colorscheme {{{
  if &background == 'light'
    silent! colorscheme mac_classic
  else
    silent! colorscheme molokai
  endif
" }}}

" Key Mapping {{{
  cmap w!! w !sudo tee >/dev/null %
" }}}

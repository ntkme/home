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
    set backupdir=~/.vim/backup//
    set nobackup
    set nowritebackup

    if has('persistent_undo')
      set undodir=~/.vim/undo//
      set noundofile
    endif
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

" Plug Install {{{
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent ! curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 2>&1
    if v:shell_error
      finish
    else
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
  endif
" }}}

" Plug {{{
  call plug#begin('~/.vim/plugged')
  " Colorschemes {{{
    Plug 'chriskempson/base16-vim', { 'on': [] }
    Plug 'larssmit/vim-getafe', { 'on': [] }
    Plug 'ciaranm/inkpot', { 'on': [] }
    Plug 'twerth/ir_black', { 'on': [] }
    Plug 'nelstrom/vim-mac-classic-theme'
    Plug 'tomasr/molokai'
    let g:molokai_original = 0
    let g:rehash256 = 1

    Plug 'altercation/vim-colors-solarized', { 'on': [] }
    let g:solarized_termcolors = &t_Co

    Plug 'jnurmine/Zenburn', { 'on': [] }
  " }}}
  " Syntax {{{
    Plug 'kchmck/vim-coffee-script'
    Plug 'JulesWang/css.vim'
    Plug 'ap/vim-css-color'
    Plug 'Soares/fish.vim'
    Plug 'tpope/vim-git'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'groenewege/vim-less'
    Plug 'tpope/vim-liquid'
    Plug 'tpope/vim-markdown'
    Plug 'vim-ruby/vim-ruby'
    Plug 'wavded/vim-stylus'
    Plug 'timcharper/textile.vim'
    Plug 'posva/vim-vue'
  " }}}
  " Editing {{{
    Plug 'tpope/vim-abolish'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'kana/vim-fakeclip'
    nmap <Leader> "+
    vmap <Leader> "+

    Plug 'vim-scripts/lastpos.vim'
    Plug 'tpope/vim-repeat'
    Plug 'sjl/gundo.vim'
    Plug 'vim-scripts/ZoomWin'
  " }}}
  " Programming {{{
    Plug 'Chiel92/vim-autoformat'
    Plug 'tpope/vim-commentary'
    Plug 'Raimondi/delimitMate'
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_enabled = 0
    let g:gitgutter_on_bufenter = 0

    Plug 'gregsexton/gitv'
    Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_guide_size = 1

    Plug 'michaeljsmith/vim-indent-object'
    runtime macros/matchit.vim
    Plug 'terryma/vim-multiple-cursors'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'moll/vim-node', { 'for': 'javascript' }
    Plug 'chrisbra/NrrwRgn'
    Plug 'tpope/vim-rails', { 'for': 'ruby' }
    Plug 'tpope/vim-scriptease'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
    Plug 'scrooloose/syntastic'
    Plug 'godlygeek/tabular'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'tpope/vim-unimpaired'
  " }}}
  " User interface {{{
    Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim/' }
  " }}}
  " Writing {{{
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
  " }}}
  call plug#end()
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

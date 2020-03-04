" Vim {{{
  " General settings {{{
    set nocompatible
    set encoding=utf-8
    set history=1000
    set tabpagemax=50
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

    if !empty(&viminfo)
      set viminfo^=!
    endif
  " }}}
  " Searching {{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
  " }}}
  " Text Editing {{{
    set nomodeline

    set autoindent
    set smartindent

    set backspace=2

    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set shiftround
    set expandtab
    set smarttab

    if v:version > 704 || v:version == 704 && has('patch785')
      set nofixendofline
    endif

    set complete-=i

    set nrformats-=octal

    set wrap

    set virtualedit=block

    if v:version > 703 || v:version == 703 && has('patch541')
      set formatoptions+=j
    endif

    set sessionoptions-=options
  " }}}
  " Matching {{{
    set showmatch
    set matchtime=2
  " }}}
  " Folding {{{
    set foldenable
    set foldlevelstart=99
  " }}}
  " Tags {{{
    if has('path_extra')
      setglobal tags-=./tags tags-=./tags; tags^=./tags;
    endif
  " }}}
  " User interface {{{
    if has('title')
      set title
      set titleold=
    endif

    if has('macunix') && system('defaults read -g AppleInterfaceStyle') !=# "Dark\n"
      set background=light
    else
      set background=dark
    endif

    if &t_Co > 2 || has('gui_running') && !exists('g:syntax_on')
      syntax enable
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

    set scrolloff=1
    set sidescroll=1
    set sidescrolloff=5
    set display=lastline

    set ttimeout
    set ttimeoutlen=100

    set listchars=eol:¬,tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  " }}}
" }}}

" Shell {{{
  if &shell =~ '/fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
    set shell=/bin/bash
  endif
" }}}

" Misc {{{
  if has('python3') && !has('patch-8.1.201')
    " https://github.com/vim/vim/issues/3117
    silent! python3 0
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
    Plug 'arzg/vim-colors-xcode'
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
    Plug 'dag/vim-fish'
    Plug 'tpope/vim-git'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'groenewege/vim-less'
    Plug 'tpope/vim-liquid'
    Plug 'tpope/vim-markdown'
    Plug 'unblevable/quick-scope'
    Plug 'vim-ruby/vim-ruby'
    Plug 'wavded/vim-stylus'
    Plug 'timcharper/textile.vim'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'posva/vim-vue'
    autocmd FileType vue syntax sync fromstart
  " }}}
  " Editing {{{
    Plug 'tpope/vim-abolish'
    Plug 'sjl/gundo.vim'
    Plug 'kana/vim-fakeclip'
    Plug 'farmergreg/vim-lastplace'
    Plug 'chrisbra/NrrwRgn'
    Plug 'tpope/vim-repeat'
    Plug 't9md/vim-textmanip'
    xmap <Space>d <Plug>(textmanip-duplicate-down)
    nmap <Space>d <Plug>(textmanip-duplicate-down)
    xmap <Space>D <Plug>(textmanip-duplicate-up)
    nmap <Space>D <Plug>(textmanip-duplicate-up)
    xmap <C-j> <Plug>(textmanip-move-down)
    xmap <C-k> <Plug>(textmanip-move-up)
    xmap <C-h> <Plug>(textmanip-move-left)
    xmap <C-l> <Plug>(textmanip-move-right)
    nmap <F10> <Plug>(textmanip-toggle-mode)
    xmap <F10> <Plug>(textmanip-toggle-mode)
  " }}}
  " Completion {{{
    Plug 'neoclide/coc.nvim', {
      \ 'tag': '*', 'branch': 'release',
      \ 'do': ':CocInstall -sync coc-lists coc-css coc-emmet coc-html coc-tsserver coc-java'
      \ }
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " }}}
  " Programming {{{
    Plug 'w0rp/ale'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Chiel92/vim-autoformat'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'gregsexton/gitv'
    Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_guide_size = 1

    Plug 'michaeljsmith/vim-indent-object'
    runtime macros/matchit.vim
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-scriptease'
    Plug 'mhinz/vim-signify'
    let g:signify_disable_by_default = 1

    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'tpope/vim-surround'
    Plug 'tomtom/tcomment_vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'tpope/vim-unimpaired'
  " }}}
  " Search & Replace {{{
    if v:version < 800 || v:version == 800 && !has('patch1238')
      Plug 'haya14busa/incsearch.vim'
      map / <Plug>(incsearch-forward)
      map ? <Plug>(incsearch-backward)
    else
      Plug 'haya14busa/incsearch.vim', { 'on': []  }
    endif

    Plug 'osyo-manga/vim-anzu'

    Plug 'xtal8/traces.vim'
  " }}}
  " User interface {{{
    Plug 't9md/vim-choosewin'
    nmap - <Plug>(choosewin)
    let g:choosewin_overlay_enable = 1

    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    noremap <C-P> :FZF<CR>

    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-scripts/ZoomWin'
  " }}}
  " Writing {{{
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
  " }}}
  call plug#end()
" }}}

" Colorscheme {{{
  if &background == 'light'
    silent! colorscheme xcodelight
  else
    silent! colorscheme molokai
  endif
" }}}

" Key Mapping {{{
  cnoremap w!! w !sudo tee >/dev/null %

  inoremap <C-U> <C-G>u<C-U>

  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
  endif
" }}}

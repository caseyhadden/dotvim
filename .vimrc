runtime! autoload/pathogen.vim
if exists("g:loaded_pathogen")
  call pathogen#runtime_append_all_bundles()
endif

" Variables {
  let mapleader = ',' " <Leader> character, easier than '\'
" }

" Basics {
  set nocompatible " remove vi-compatibility mode
  set background=dark " plan to use a dark background
  syntax on " syntax highlighting on
" }

" General {
  filetype plugin indent on " load filetype plugins/indent settings
  set autochdir " always switch to current file directory
  set backspace=indent,eol,start " more flexible backspace
  set backupdir=/tmp/vimfiles/backup " backfiles go here
  set backup " make backup files
  set directory=/tmp/vimfiles/tmp " swp files go here
  set hidden " let us move between buffers without saves
  set visualbell " don't make noise
  set noerrorbells " don't make noise
" }

" Vim UI {
  au GUIEnter * simalt ~x " maximize window
" set columns=99999 lines=99999 " size of vim window
  set cursorline " highlight current line
" set guioptions=eg " turn off scroll bars, etc
  set hlsearch " highlight search term
  set incsearch " highlight as you type
  set laststatus=2 " always show status line
  set list " show tabs
  set listchars=tab:>-,trail:- " tabs and trailing
  set number " show line numbers
  set numberwidth=4 " good up to 9999
  set ruler " always show current positions at the bottom
  set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
  set scrolloff=10 " keep 10 lines top and bottom for context
  set showcmd " show command prefixes as typed
  set showmatch " flash matching brackets as they are types
  set showmode " show --INSERT-- etc
  set wildmenu " wildmenu
  set wildmode=longest,list " tab completion like bash
" }

" Mappings {
  " rot13 - just for fun
  map <F12> ggVGg?

  " space / shift-space scroll in normal mode
  noremap <S-space> <C-b>
  noremap <space> <C-f>

  " make arrow keys useful {
    map <down> <ESC>:bn<RETURN>
    map <left> <ESC>:NERDTreeToggle<RETURN>
    map <right> <ESC>:Tlist<RETURN>
    map <up> <ESC>:bp<RETURN>
  " }

  " deal with buffers {
    map <LEADER>bw :bwipe!<RETURN>
    map <TAB> :bn!<RETURN>
    map <S-TAB> :bp!<RETURN>
  " }

  " deal with splits {
    map <C-h> :wincmd h<CR>
    map <C-j> :wincmd j<CR>
    map <C-k> :wincmd k<CR>
    map <C-l> :wincmd l<CR>
  " {

  " vimrc editing {
    nmap <LEADER>s :source $MYVIMRC<CR>
    nmap <LEADER>v :edit $MYVIMRC<CR>
  " }

  " Make ',e' give a prompt for opening in the same dir
  if has("unix")
    map <LEADER>e :e <C-R>=expand("%:p:h") . "/" <RETURN>
  else
    map <LEADER>e :e <C-R>=expand("%:p:h") . "\\" <RETURN>
  endif
" }

" Text formatting / layout {
  set expandtab " no real tabs
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
  set ignorecase " case ignored by default
  set infercase " case infered by default
  set nowrap " do not wrap lines
  set shiftround " when at 3 and hit > ... go to 4, not 5
  set smartcase " if there are caps, go case sensitive
  set shiftwidth=4 " auto-indent amount with <<, >>, cindent, etc
  set softtabstop=4 " when hitting tab or backspace how many spaces?
  set tabstop=4 " real tabs should be 8
" }


" autocommands {
  " kill trailing whitespace on save
  au BufWritePre * :%s/\s\+$//e
  " Vim {
    au BufRead *.vim set softtabstop=2
    au BufRead *.vim set shiftwidth=2
    au BufRead *vimrc set softtabstop=2
    au BufRead *vimrc set shiftwidth=2
  " }

  " Ruby {
    au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
    au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
  " }

" }

" set the color scheme
colorscheme railscasts2


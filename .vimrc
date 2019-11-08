set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " allows nerdcommenter to work correctly
syntax on
set clipboard=unnamed         " configure terminal vim to use mac clipboard
let mapleader="\<space>"      " remap leader to <space> bar
set backspace=2               " make backspace work like most other apps
set laststatus=2              " always display the status line
set showcmd                   " Show us the command we're typing
set hlsearch                  " highlight search items
set updatetime=100
set number

if has("gui_running")
  set macligatures
  set guifont=Fira\ Code:h20
  set guioptions=
else
  set guifont=Fira\ Code
endif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Blunt hammer to ignore things from searches
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat

" augroup numbertoggle
  " autocmd!
  " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" Remap ctrl + s to :w + enter
noremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

" remap stupid command misspellings
nmap :Q :q
nmap :W :w

" redefine the normal window spliting directions
set splitbelow
set splitright

" Make buffer switching easier
nnoremap <leader><Right> :bnext<CR>
nnoremap <leader><Left> :bprev<CR>

" set nice line breaks
set breakindent
set showbreak=\ \ \~~
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" use [Ctrl]+T plus a directional arrow to go to the tab you want: up to go to the first tab, down to the last, and left or right to go to the previous or next tab.
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Indent guide configuration
let g:indentLine_char='|'

" Enable mouse in Iterm
set mouse=a
set ttymouse=xterm2

" Ruby autocomplete
autocmd FileType ruby,eruby,haml,slim let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby,haml,slim let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby,haml,slim let g:rubycomplete_rails = 1

" Make Vim detect slim files
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Change cursor shape in insert mode
if $TERM ==# 'screen-256color'
  set notermguicolors
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  " set termguicolors
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'                  " Ack
Plugin 'scrooloose/nerdtree'              " nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'      " nerdtree-git-plugin
Plugin 'scrooloose/nerdcommenter'         " nerdcommenter
Plugin 'airblade/vim-gitgutter'           " gitgutter
Plugin 'yggdroot/indentline'              " indentline
Plugin 'tpope/vim-endwise'                " endwise
Plugin 'terryma/vim-multiple-cursors'     " multiple-cursors
Plugin 'tpope/vim-surround'               " surround
Plugin 'slim-template/vim-slim.git'       " slim template highlighting
Plugin 'tpope/vim-fugitive'               " fugitive
Plugin 'ctrlpvim/ctrlp.vim'               " ctrlp
Plugin 'ervandew/supertab'                " supertab
Plugin 'itchyny/lightline.vim'            " lightline
Plugin 'thoughtbot/vim-rspec'             " vim-rspec

" Themes
Plugin 'drewtempelmeyer/palenight.vim'    " palenight theme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ

"vim-plug :PlugInstall
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'                 " fzf
Plug 'moll/vim-bbye'                    " bbye
Plug 'ntpeters/vim-better-whitespace'   " better-whitespace
Plug 'hail2u/vim-css3-syntax'           " css3 syntax
Plug 'jeetsukumaran/vim-buffergator'    " buffergator
Plug 'raimondi/delimitmate'             " delimitmate (automatic bracket closing)
Plug 'ekalinin/Dockerfile.vim'          " highlighting for dockerfiles
Plug 'mattn/emmet-vim'                  " emmet
Plug 'pangloss/vim-javascript'          " javascript
Plug 'mxw/vim-jsx'                      " jsx
Plug 'neomake/neomake'                  " neomake
Plug 'tpope/vim-rails'                  " rails
Plug 'tpope/vim-repeat'                 " vim repeat
Plug 'vim-ruby/vim-ruby'                " ruby
Plug 'tpope/vim-sensible'               " sensible vim defaults
Plug 'ervandew/supertab'                " supertab
Plug 'slim-template/vim-slim'           " slim template highlighting

" Themes
Plug 'nightsense/office'                " Office theme
Plug 'felipesousa/rupza'                " Rupza theme
Plug 'chriskempson/vim-tomorrow-theme'  " Tomorrow themes
Plug 'altercation/vim-colors-solarized' " colors-solarized theme
Plug 'nightsense/vimspectr'             " Theme with many hues
Plug 'junegunn/seoul256.vim'            " seoul theme
" Plug 'chriskempson/base16-vim'          " Base16 themes
" Plug 'nightsense/carbonized'            " carbonized theme
" Plug 'nightsense/vim-crunchbang'        " crunchbang theme

" Tmux
Plug 'sjl/vitality.vim'                 " vitality, make vim and tmux play nice together
Plug 'tmux-plugins/vim-tmux'            " vim tmux
Plug 'benmills/vimux'                   " vimux, send commands to tmux pane

" Plug 'mileszs/ack.vim'                  " Ack
" Plug 'ctrlpvim/ctrlp.vim'               " ctrlp
" Plug 'gregsexton/matchtag'              " matchtag, for html tag
" Plug 'flazz/vim-colorschemes'           " colorschemes
" Plug 'vim-scripts/CSApprox'             " make gui colorshemes work in terminal
" Plug 'mustache/vim-mustache-handlebars' " hbs
" Plug 'joshdick/onedark.vim'             " onedark
" Plug 'godlygeek/tabular'                " tabular
" Plug 'tpope/vim-unimpaired'             " unimpaired
" Plug 'sjl/gundo.vim'                    " gundo

call plug#end()

" fzf Config
" This is the default extra key bindings
"take over ctrlp
nnoremap <C-p> :Files<Cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Conditional'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case'.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Change leader key for emmet
let g:user_emmet_leader_key='<C-e>'

" CUSTOM KEY MAPPINGS
" Hitting ESC is hard
inoremap jk <Esc>
vnoremap jk <Esc>
inoremap JK <Esc>
vnoremap JK <Esc>
" LEADER KEY MAPPINGS
" Make buffer switching easier
nmap <leader>L :bnext<CR>
nmap <leader>H :bprev<CR>
" Jump to first and last character of line, respectively
nnoremap <leader>h ^
vnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>l $h
" Jump to beginning of line
nmap <leader>hh 0
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Write file
nmap <leader>w :w<cr>
" Quit Vim
nmap <leader>q :q<cr>
" Quit Vim (without saving)
nmap <leader>Q :q!<cr>
" Quit current buffer
nmap <leader>b :bd<cr>
" Switch (split) buffer
nnoremap <leader>s <C-W><C-W>

" Config NERDTree
map <C-a> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.DS_Store', '*.swp', '*.swo']
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " auto kill nerdtree if it is the only buffer

" Config NERDCommenter
let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --vimgrep'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ackhighlight = 1
let g:ack_autofold_results = 1
let g:ackpreview = 1

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>'

" multicursor config
let g:multi_cursor_start_key='g<C-o>'
let g:multi_cursor_next_key='<C-o>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Theme config
set background=dark
colorscheme palenight
if (has("termguicolors"))
  set termguicolors
endif

" Lightline config
let g:lightline = { 'colorscheme': 'palenight' }

" Syntax Settings
syntax enable
if !has('gui_running')
  set t_Co=256
endif

" For when slim highlighting doesn't work
autocmd BufNewFile,BufRead *.slim set ft=slim

" visual selection fix in tmux
if $TERM ==# 'screen-256color'
  set t_ut=
  set term=screen-256color
endif

filetype plugin indent on    " required
" Autocomplete
set omnifunc=syntaxcomplete#Complete

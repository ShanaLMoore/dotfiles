set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-rails'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"NERDTree
"silent! nmap <C-p> :NERDTreeToggle<CR>
"silent! map <C-f> :NERDTreeFind<CR>
"let g:NERDTreeMapActivateNode="<C-f>"
"let g:NERDTreeMapPreview="<F4>"
let NERDTreeShowHidden=1


"fuzzyfinder
map ; :Files<CR>

"lightline
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

"gitgutter
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

"  =========================== Pathogen ========================  "
execute pathogen#infect()

" ==================== Color customization ====================  "
syntax on
filetype plugin indent on
syntax enable
set background=dark
colorscheme hybrid
"colorscheme xcode
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=256

highlight Search ctermfg=255 ctermbg=166

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.cap set filetype=ruby

"  =======================Custom Settings ======================  "
let mapleader = ","
set clipboard=unnamed
if (match(system("uname"), "Linux") != -1)
  set clipboard=unnamedplus
endif
set undodir=~/.vim/.undo//
set directory=~/.vim/swp//
set conceallevel=0
set number
set mouse=a
set laststatus=2
set hlsearch
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set wildmenu
set wildmode=full
set noswapfile
set ttimeoutlen=10

"  ------ Folding ------ "
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=5    " start with fold level of 1
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

function! PasteModeToggle()
  if(&paste == 0)
    set paste
  else
    set nopaste
  endif
endfunc
map <leader>pm :call PasteModeToggle()<cr>

"  ===================== Custom Bindings =======================  "
map <c-l> :tabn<cr>
map <c-h> :tabp<cr>
map <c-n> :tabnew<cr>
map <c-t> :NERDTreeToggle<cr>
map <c-n> :tabnew<cr>
map <c-q> :tabclose<cr>
map <c-w>r :so ~/.vimrc<cr>
map <c-w>_ :sp<cr>
map <c-w>\ :vs<cr>
map <c-w>N <plug>NERDTreeTabsToggle<cr>

" =========================== Silver Searcher =============================== "
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_caching = 0
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
  let g:ackprg = 'ag --nogroup --nocolor --column'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ======================== Syntastic ============================ "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_quiet_messages = {'regex': 'eslintignore|unused'}

" ======================== FZF ============================ "
set rtp+=~/.fzf
nmap <Leader>; :Buffers<CR>
nmap <c-p> :FZF<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" ======================== AIRLINE ============================ "
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_theme='dark'
"\'z'       : '#(uname)',
let g:tmuxline_preset = {
  \'a'       : '#S',
  \'win'     : '#I #W',
  \'cwin'    : '#I #W',
  \'x'       : '#(~/dotfiles/scripts/spotify.sh)',
  \'z'       : ['%a %D %l:%M %p'],
  \'options' : { 'status-justify' : 'left' }}


source ~/.vim/plugins.vim
Plugin 'wakatime/vim-wakatime'



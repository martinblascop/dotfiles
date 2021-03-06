syntax on
filetype on
colorscheme cassie
source ~/.vim/scripts/functions.vim
source ~/.vim/scripts/matchit.vim
source ~/.vim/scripts/syntax_attr.vim
source ~/.vim/scripts/os_type.vim

call plug#begin()

Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'hashivim/vim-terraform'
Plug 'janko/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/indentpython.vim'
Plug 'wincent/command-t'
Plug 'ycm-core/YouCompleteMe'
" Plug 'craigemery/vim-autotag'

call plug#end()

" Settings
set t_Co=256
set t_ut=
set history=1000
set number
set relativenumber
set ttyfast
set hidden
set cursorline
set wrap
set linebreak
set wildmenu
set wildcharm=<Tab>
set ignorecase
set backspace=indent,eol,start
set tags=./tags,./.tags,tags,.tags,
set list
set listchars=tab:▸\ ,eol:¬
set ff=unix
set mouse=a
set hlsearch
set noswapfile
set undofile
set undodir=~/.vim/undovim
set modifiable
set autoread
set splitright
set incsearch
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set iskeyword+=-

" Change leader key
let mapleader = "\<Space>"

" Mappings
inoremap <C-C> <Esc>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <expr> <C-J> wildmenumode() ? "\<Down>" : "\<C-J>"
vnoremap <C-C> "+y :exec "echo 'copied to clipboard'"<CR>h
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap <leader>gg :Gbrowse<CR>
nnoremap Q <Nop>
nnoremap Y y$
nnoremap gm :call cursor(0, virtcol('$')/2)<CR>
nnoremap <silent> <C-z> :call CursorShape("beam")<CR>:suspend<bar>:call CursorShape("block")<CR>
nnoremap <F4> :buffers<CR>:edit<Space>#
nnoremap <Tab> :call BSkipQuickFix("bn")<CR>
nnoremap <S-Tab> :call BSkipQuickFix("bp")<CR>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-Up> :resize -5<CR>
nnoremap <C-Down> :resize +5<CR>
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <silent> <C-N> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'
nnoremap <Esc>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>q :cq<CR>
nnoremap <leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>r :Rg <C-R>0<CR>
nnoremap <leader>k :Rg <cword><CR>
nnoremap <leader>f :Rg<space>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>, :NERDTreeFind<CR>
nnoremap <leader>. @:
nnoremap <leader>; _vg_
nnoremap <leader>o :only<CR>
nnoremap <leader>p "ppp
nnoremap <leader>w :w<CR>
nnoremap <leader>x :xa<CR>
nnoremap <leader>m :source $MYVIMRC<CR>
nnoremap <leader><bar> :vsp #<CR>
nnoremap <leader><F4> :buffers<CR>:buffer<Space>
nnoremap <leader>l q:
nnoremap <leader>- :sp <CR>
nnoremap <leader>\ :vsp <CR>
nnoremap <leader>[ <C-W>t<C-W>H
nnoremap <leader>] <C-W>t<C-W>K
nnoremap <leader>ge :vsp<CR>:Gedit master:%
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gg :Gbrowse<CR>
nnoremap <leader>gc :Git checkout<Space>
nnoremap <leader>d :bd<CR>
nnoremap <leader>i :YcmCompleter GoToDeclaration<CR>
nnoremap <localleader>e :edit ~/.vimrc<CR>
nnoremap <localleader>h :call SyntaxAttr()<CR>
nnoremap <localleader>- :call ToggleDashKeyword()<CR>
nnoremap <localleader>c :let @+=@0 <CR>:exec "echo 'copied to clipboard'"<CR>
nnoremap <localleader>s :%s/\s\+$//e<CR>
nnoremap <localleader>l :set list!<CR>
nnoremap <localleader>t :vertical terminal<CR>
nnoremap <localleader>n :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
nnoremap <localleader>fn :let @f = expand("%:t:r")<CR>
nnoremap <localleader>fe :let @f = expand("%:t")<CR>
nnoremap <localleader>fp :let @f = expand("%:p")<CR>
nnoremap <C-P> :CommandTBuffer<CR>
" nnoremap <Leader>f :FZF<CR>

" Alias
:command! -bang W :execute ':silent w !sudo tee % > /dev/null' | :edit!
:command! -bar -bang Q quit<bang>
:command! -bar -bang Qa quita<bang>
:command! -nargs=1 V :execute ':vertical sb' <args>

let @p = ' '
let NERDTreeQuitOnOpen = 1
let g:airline#extensions#tabline#enabled = 1
" let g:ycm_use_clangd = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:user_emmet_leader_key='<Esc>e'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

autocmd FocusGained,BufEnter * :silent! !
autocmd FileType help wincmd L
autocmd FileType yaml,json,markdown,terraform,html,css,dosini setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.conf set filetype=sh
autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
autocmd BufNewFile,BufRead * if &filetype == '' | set tabstop=4 softtabstop=4 shiftwidth=4 | endif
autocmd OptionSet diff call diff#setup()

if &diff
	autocmd VimEnter * bufdo if &diff | call diff#setup() | endif
endif

call SourceIfExists('~/.vimrc.local')

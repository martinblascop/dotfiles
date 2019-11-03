syntax on
filetype on
colorscheme papaya
source ~/.vim/scripts/matchit.vim
source ~/.vim/scripts/vimdiff.vim



call plug#begin()

Plug 'https://github.com/mattn/emmet-vim' "Autocomplete HTML
Plug 'https://github.com/vim-airline/vim-airline' "Status line
Plug 'https://github.com/tpope/vim-commentary' "Commentaries
Plug 'https://github.com/tpope/vim-surround' " Surround plugin
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " On-demand loading
Plug 'https://github.com/jremmen/vim-ripgrep'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'craigemery/vim-autotag'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/wincent/command-t'
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fuzzy finder

call plug#end()

"Setting variables
set t_Co=256
set history=1000
set number
set relativenumber
set hidden
set cursorline
set wrap
set linebreak
set wildmenu
set ignorecase
set backspace=indent,eol,start
set tags=./tags,./.tags,tags,.tags,
set listchars=tab:▸\ ,eol:¬
set list
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

"Change leader key
let mapleader = "\<Space>"

"Mappings
inoremap jk <Esc>
nnoremap Y y$
nnoremap gm :call cursor(0, virtcol('$')/2)<CR>
inoremap <C-K> <Up>
inoremap <C-J> <Down>
inoremap <C-L> <Right>
inoremap <C-D> <Del>
nnoremap <F4> :buffers<CR>:edit<Space>#
cnoremap <C-a> <Home>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'
nnoremap <Esc>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :xa<CR>
nnoremap <Leader><bar> :vsp #<CR>
nnoremap <Leader><F4> :buffers<CR>:buffer<Space>
nnoremap <Leader>l <C-^>
nnoremap <Leader>- :sp <CR>
nnoremap <Leader>\ :vsp <CR>
nnoremap <Leader>[ <C-W>t<C-W>H
nnoremap <Leader>] <C-W>t<C-W>K
nnoremap <Leader>go :Goyo<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Git checkout master<CR>
nnoremap <leader>g- :Git checkout -<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>q <C-W>q
" nnoremap <Leader>f :FZF<CR>
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <LocalLeader>s :%s/\s\+$//e<CR>
nnoremap <LocalLeader>l :set list!<CR>
nnoremap <LocalLeader>f :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
nnoremap <LocalLeader>t :vertical terminal<CR>
nnoremap <C-P> :CommandTBuffer<CR>

"Alias
:command! -bang W :execute ':silent w !sudo tee % > /dev/null' | :edit!
:command! -bar -bang Q quit<bang>
:command! -bar -bang Qa quita<bang>
:command! -nargs=1 V :execute ':vertical sb' <args>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:user_emmet_leader_key=';e'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

autocmd VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
autocmd VimLeave,InsertEnter * silent execute '!echo -ne "\e[5 q"' | redraw!
autocmd CursorHold,CursorHoldI * checktime
autocmd FocusGained,BufEnter * :silent! !
autocmd FileType help wincmd L
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd BufWinEnter *.* normal zR
autocmd BufNewFile,BufRead log-*.php set filetype=txt
autocmd BufNewFile,BufRead *.conf set filetype=sh
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4

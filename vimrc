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
Plug 'bogado/file-line'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'hashivim/vim-terraform'
Plug 'inkarkat/vim-visualrepeat'
Plug 'janko/vim-test'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set iskeyword+=-

" Change leader key
let mapleader = "\<Space>"

" Mappings
inoremap <C-C> <Esc>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-V> <ESC>"+p
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <expr> <C-J> wildmenumode() ? "\<Down>" : "\<C-J>"
vnoremap $ $h
vnoremap <C-C> "+y :exec "echo 'copied to clipboard'"<CR>h
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap <leader>gg :GBrowse<CR>
vnoremap <leader>s :sort<CR>
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
nnoremap <leader>, :NERDTreeFind<CR>
nnoremap <leader>- :sp <CR>
nnoremap <leader>. @:
nnoremap <leader>; _vg_
nnoremap <leader>[ <C-W>t<C-W>H
nnoremap <leader>\ :vsp <CR>
nnoremap <leader>] <C-W>t<C-W>K
nnoremap <leader>b i<CR><ESC>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>f :Rg<space>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Git checkout<Space>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ge :vsp<CR>:Gedit master:%
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gl :vertical Git log<CR>
nnoremap <leader>gg :Gbrowse<CR>
nnoremap <leader>gs :vertical Git<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>k :execute 'Rg ' ..  expand("<cword>")<CR>
nnoremap <leader>l :argadd `git_diff_filenames_current_feature_branch`<CR>:bd<CR>
nnoremap <localleader>n :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
nnoremap <leader>m :source $MYVIMRC<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>p "ppp
nnoremap <leader>r :Rg <C-R>0<CR>
nnoremap <leader>t :call fzf#run(fzf#wrap({'source': fzf_source, 'sink': 'edit', 'options': fzf_options}))<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :xa<CR>
nnoremap <localleader>- :call ToggleDashKeyword()<CR>
nnoremap <localleader>e :edit ~/.vimrc<CR>
nnoremap <localleader>fe :let @f = expand("%:t")<CR>
nnoremap <localleader>fn :let @f = expand("%:t:r")<CR>
nnoremap <localleader>fp :let @f = expand("%:p")<CR>
nnoremap <localleader>h :call SyntaxAttr()<CR>
nnoremap <localleader>l :set list!<CR>
nnoremap <localleader>n :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
nnoremap <localleader>s :%s/\s\+$//e<CR>
nnoremap <localleader>t :vertical terminal<CR>
nmap <leader>i <Plug>(coc-definition)

" Alias
:command! -bang W :execute ':silent w !sudo tee % > /dev/null' | :edit!
:command! -bar -bang Q quit<bang>
:command! -bar -bang Qa quita<bang>
:command! -nargs=1 V :execute ':vertical sb' <args>

let @p = ' '
let fzf_options='--preview "bat --style=numbers --color=always --line-range :500 {}"'
let fzf_source='fd --strip-cwd-prefix --hidden --follow --exclude ".git" --type f'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let NERDTreeQuitOnOpen = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:user_emmet_leader_key='<Esc>e'

augroup sampleconfig
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter * if FileInRepository() | cd %:h | cd `git rev-parse --show-toplevel` | endif
  autocmd BufNewFile,BufRead */*kube/config set filetype=yaml
  autocmd BufNewFile,BufRead */*gitconfig* set filetype=dosini
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
  autocmd FileType help wincmd L
  autocmd FocusGained,BufEnter * :silent! !
  autocmd OptionSet diff call diff#setup()
  autocmd BufWritePre * :silent !mkdir -p %:p:h
augroup end

if &diff
  autocmd VimEnter * bufdo if &diff | call diff#setup() | endif
endif

call SourceIfExists('~/.vimrc.local')

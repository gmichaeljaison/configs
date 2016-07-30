" plugins used
" 1. gundo - http://sjl.bitbucket.org/gundo.vim/
" Color schemes
" 1. monokai - https://github.com/sickill/vim-monokai

" Enable pathogen to load all plugins
execute pathogen#infect()
execute pathogen#helptags()

" Enable NERDTree by default
" autocmd vimenter * NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype indent on
syntax enable           " enable syntax processing
colorscheme monokai


" -- Misc --
set autoread		" auto read when a file is changed from the outside
set lazyredraw		" Don't redraw while executing macros (good performance config)

" -- Spaces & Tabs --
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " amount of intentation for one level
set autoindent      " automatic intendation based on previous line


" -- UI Config --
set number              " show line numbers
set showcmd             " show command in bottom bar
" set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set showmatch           " highlight matching [{()}]
set ruler
set cmdheight=2		" Height of the command bar
" set foldcolumn=1	" Add a bit extra margin to the left
set background=dark
set mouse=a         " Enable mouse clicking and scrolling
set splitright
set splitbelow


" -- Searching --
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader>h :nohlsearch<CR>


" -- Folding --
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level


" -- Movement -- 
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" Remap VIM 0 to first non-blank character
map 0 ^

" highlight last inserted text
nnoremap gV `[v`]

" Next tab
nnoremap <Leader>t gt
" Previous tab
nnoremap <Leader>r gT
" Go to tab number
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt


" ',e' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>e :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


" -- Leader key mappings --

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :wa!<cr>
" :W sudo saves the file. (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" save session
nnoremap <leader>s :mksession!<CR>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Edit and Source vimrc
nnoremap <leader>ve :tabe $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" make <enter> insert newline in normal mode
nnoremap <cr> i<cr><Esc>

" NODETree toggle
nnoremap <leader>n :NERDTreeToggle<CR>

" c-style code commenting
nnoremap <leader>/ I// <Esc>j
nnoremap <leader>\ ^xxxj


" .vimrc File

"Forget compatibility with Vi. Who cares.
set nocompatible
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

set ruler

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

if has("gui_running")
    " See ~/.gvimrc
    " http://blog.toddwerth.com/entries/show/8
    colorscheme desertExMine
    colorscheme vilight
    colorscheme solarized
    colorscheme molokai    " use this color scheme
    set guifont=Inconsolata\ 13  " use this font 
"    set lines=50       " height = 50 lines
"    set columns=100        " width = 100 columns
    set background=dark   " adapt colors for background
"    set selectmode=mouse,key,cmd
"    set keymodel=
else
    " colorscheme molokai    " use this color scheme
    set background=dark        " adapt colors for background
    colorscheme molokai
endif

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
"set relativenumber"

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=1


"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

"Disable last search term
nmap <silent> <C-n> :noh<CR>

" case insensitive search
set ignorecase
set smartcase

"Hide MacVim toolbar by default
set go-=T

set wrap
" set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=100      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
" Note, perl automatically sets foldmethod in the syntax file
"autocmd Syntax c,cpp,vim,xml,html,xhtml,php setlocal foldmethod=syntax
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,php normal zR

"Split windows below the current window.
set splitbelow    

"Shortcut to fold tags with leader (usually \) + ft
" nnoremap <leader>ft Vatzf

nmap <space> :

"Want a different map leader than \
let mapleader = ","

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

" Save files when focus is lost, except RO and untitled buffers
:au FocusLost silent! :wa

"Load the current buffer in Firefox - Mac specific.
abbrev ff :! firefox %:p<cr>

"Map last command line command to ,. 
nmap <leader>. @:

"Map a change directory to the desktop - Mac specific
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>

"Map go to the directory of the current file
nmap <leader>cdh :lcd %:p:h<cr>

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

"Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>
map <leader>C  <c-_>b


"Automatically change current directory to that of the file in the buffer
"autocmd BufEnter * cd %:p:h
nmap <leader>gh :lcd %:p:h<cr>

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


"Align with tabular.vim
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif



"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Train yourself to use hjkl
" Disable arrow keys *shock* *horror*!
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

" Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>

" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp


" Backups
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/ " swap files
set backup " enable backup

"Copy/Paste ctr-c ctr-v, pretty cool.
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"Activa snippets de PHP en archivos HTML y viceversa

" au BufRead *.html set ft=html.php
" au BufNewFile *.html set ft=html.php
" 
" au BufRead *.php set ft=php.html
" au BufNewFile *.php set ft=php.html

"nmap <S-F5> :w <cr> :!extranetupload.sh %:p <cr>
"nmap <S-F5> :w <cr> :!intranetupload.sh %:p <cr>

filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP

" basic syntax checker for php
nmap <leader>s :!php -l %<CR>

let g:omni_sql_no_default_maps = 1

" PHP Generated Code Highlights (HTML & SQL) 
let php_sql_query=1
let php_htmlInStrings=1

" Javascript indenter
let g:SimpleJsIndenter_BriefMode = 1

" Auto compile less files (compressed)
au BufNewFile,BufRead *.less set filetype=less
if executable('lessc')
    autocmd FileWritePost,BufWritePost *.less :silent !lessc %:p %:p:r.css :grep 
endif

inoremap <leader>d <ESC>:call PhpDocSingle()<CR>i
nnoremap <leader>d :call PhpDocSingle()<CR>
vnoremap <leader>d :call PhpDocRange()<CR> 


" Ctrl-P options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Gist options
let g:gist_clip_command = 'xclip -selection clipboard'

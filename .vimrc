call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set showmatch
set ruler
set number
set hlsearch

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Default indentation
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

" Leader
let mapleader = ","

" Make Y not dumb
nnoremap Y y$

" Searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
map <leader><space> :noh<cr>

set shell=/bin/bash

"SECTION: NERDTree Customization
" \d will hide/show
" \b will enter :NERDTreeFromBookmark and then
" you can autocomplete the name of a bookmark
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>b :NERDTreeFromBookmark
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']

set t_Co=256

" Colorscheme
colorscheme kod
if has("gui_running")
    colorscheme kod
    set go-=T
    set guifont=Menlo:h15
    set linespace=1
    " set relativenumber
    set undofile
    set undoreload=10000
    set colorcolumn=85
endif

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" move by screen line and use ; for : too
nnoremap j gj
nnoremap k gk
nnoremap ; :

" Javascript
au BufNewFile,BufRead *.bones set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *._ set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.js set makeprg=fixjsstyle\ % | set shiftwidth=4 | set tabstop=4
au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G

autocmd BufRead,BufNewFile *.mss set syntax=carto
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd BufRead,BufNewFile *.css set tabstop=2 | set shiftwidth=2
autocmd BufRead,BufNewFile *.html set tabstop=2 | set shiftwidth=2

autocmd BufRead,BufNewFile *.hbs set tabstop=2 | set shiftwidth=2
" Use the arrows to something usefull
map <right> :tabnext<cr>
map <left> :tabp<cr>

augroup hbs
  autocmd BufRead *.hbs set filetype=html
augroup END

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

" gist-vim
" mac
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" custom shortcuts
map <F2> :set nowrap! <CR>
map <leader>t :TlistToggle <CR>
map <leader>a :Ack 

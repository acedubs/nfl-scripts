
call pathogen#runtime_append_all_bundles()

filetype on       " Automatically detect file types.
filetype indent on
filetype plugin on
set nocompatible  " We don't want vi compatibility
set hidden        " Current buffer can be put to the background without writing to disk


" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Tab settings
set sts=2
set shiftwidth=2
set autoindent
set smarttab
set expandtab
set backspace=start,indent

autocmd FileType make	set noexpandtab
autocmd FileType python	set noexpandtab

au BufRead,BufNewFile *.js set ft=javascript.jquery

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Display options
syntax on
set ruler
set lines=24 columns=136      " Size of window


" Backups & Files
set backup    " Enable creation of backup file
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

" Search Options
set hlsearch
set ignorecase
set smartcase

" Keep a longer history
set history=1000

" Keyboard Shortcuts
"
" Swap ' and a is more useful 
nnoremap ' `
nnoremap ` '
" map leader to ,
let mapleader = ","

" make file completion similar to shell
set wildmode=list:longest

" Tell vim to use ack instead of grep
set grepprg=ack
set grepformat=%f:%l:%m

" Pathogen options
map <leader>h :call pathogen#helptags()<CR>

" FuzzyFinder TextMate options
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
map <leader>ft :FuzzyFinderTextMate<CR>
map <leader>fb :FuzzyFinderBuffer<CR>

" TagList options
map <leader>tt :TlistToggle<CR>
map <leader>tc :!ctags -R .*<CR>

" NERDTree options
map <leader>nt :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>nf :NERDTreeFind<cr>
map <leader>nm :NERDTreeMirror<cr>
let g:NERDTreeHijackNetrw = 0     " We need Netrw in case we happen to be using the vcscommand plugin

" Rails.vim options
let g:rails_default_file='config/database.yml'

" Ruby autocomplete options
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" enable extended % matching
runtime macros/matchit.vim



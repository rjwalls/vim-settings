" Use the following to disable certain plugins
let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'ropevim')
" call add(g:pathogen_disabled, 'snipmate0')
" Disable the old version of minibufexplorer as I want
" to try a new and improved version. from github.com/fholgado
call add(g:pathogen_disabled, 'minibufexpl')

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set number
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\]\ (%p%%)

" This will make windows resize when another window is opened or closed
" Words great with minibufexplorer
set equalalways

" Make backspace work properly
set backspace=indent,eol,start

colorscheme solarized

filetype on
filetype plugin on
filetype plugin indent on

" Python options
au FileType py set autoindent
au FileType py set smartindent

" TeX Options
au FileType plaintex set textwidth=80 "Set vi to hard wrap text
au FileType plaintex set spell "Turn on spell checking

" Markdown Options
au FileType markdown set textwidth=80 "Set vi to hard wrap text
au FileType markdown set spell "Turn on spell checking

" Makefile Options
au FileType make set noexpandtab

" Change the paragraph formatter to par with an 80 column line width
" This option is currently disabled because I keep getting seq faults when I
" use gqip
"set formatprg=par\ -w80


"This allows us to collapse methods.
set foldmethod=indent
set foldlevel=99

" Python code completion
au FileType py set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Remapping Rope commands
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Remap Tasklist
map <leader>td <Plug>TaskList

" Remap Taglist
map <leader>tg :TlistToggle<CR>

" Remap buff movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Configure Syntastic
map <leader>e :Errors<CR>
" Force Syntastic to use pyflakes
let g:syntastic_python_checker = 'pyflakes'
" Add a flag to the status line. (Not sure if this works)
set statusline+=%{SyntasticStatuslineFlag()}
" Check for errors when a file is opened (as well as saved)
let g:syntastic_check_on_open=1


let g:pep8_map='<leader>8'

"Add a new token that can be recognized by the Tasklist plugin
let g:tlTokenList = ["FIXME", "TODO", "XXX", "reminder"]

"Setting these options is supposed to give nice rope code assist,
"but I have yet to get it to work.
"let g:ropevim_vim_completion=1
"let g:ropevim_extended_complete=1
"
"


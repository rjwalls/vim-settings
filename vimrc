" Use the following to disable certain plugins
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'ropevim')
" call add(g:pathogen_disabled, 'snipmate0')

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set number
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\]\ (%p%%)

colorscheme solarized

filetype on
filetype plugin on
filetype plugin indent on

" Python options
au FileType py set autoindent
au FileType py set smartindent

" TeX Options
au FileType tex set textwidth=80 "Set vi to hard wrap text
au FileType tex set spell "Turn on spell checking

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


" Configure Syntastic
map <leader>e :Errors<CR>
" Force Syntastic to use pyflakes
let g:syntastic_python_checker = 'pyflakes'
" Add a flag to the status line. (Not sure if this works)
set statusline+=%{SyntasticStatuslineFlag()}
" Check for errors when a file is opened (as well as saved)
let g:syntastic_check_on_open=1


let g:pep8_map='<leader>8'

"Setting these options is supposed to give nice rope code assist,
"but I have yet to get it to work.
"let g:ropevim_vim_completion=1
"let g:ropevim_extended_complete=1

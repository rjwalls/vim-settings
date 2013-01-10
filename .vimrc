let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'snipmate0')

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set number
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\]\ (%p%%)


filetype on
filetype plugin on
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent

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


" Configure Solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme solarized

let g:pep8_map='<leader>8'

let g:ropevim_vim_completion=1
let g:ropevim_extended_complete=1

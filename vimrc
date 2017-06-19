" I pulled many of these settings from places around the web including:
" https://github.com/mbrochh/vim-as-a-python-ide/
" http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
" https://danielmiessler.com/study/vim/#gs.JUquA0M

" Automatically reload vimrc if changed
" Doesn't seem to be working...
" autocmd! bufwritepost .vimrc source %

" Who needs escape anyway?
inoremap jj <ESC>
inoremap jk <ESC>

noremap ; :
nnoremap : ;

let mapleader = "\<Space>"

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Shows a vertical line in the 80 column
set colorcolumn=80
highlight ColorColumn ctermbg=233

syntax on
set number
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" May Replace with powerline
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\]\ (%p%%)

" Temporarily disabled until I get python-mode working
" This will make windows resize when another window is opened or closed
" Works great with minibufexplorer
" set equalalways

" Make backspace work properly
set backspace=indent,eol,start

" Search options
" Highlight all
" Incremental searching
" When both ignorecase and smartcase are set then search with capital
" letters will be case sensitive while searches without capital letters
" won't be.
set hlsearch
set incsearch
set ignorecase
set smartcase

filetype on
filetype plugin on
filetype plugin indent on

" Remap split movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Python options
au FileType py set autoindent
au FileType py set smartindent

" TeX Options
au FileType plaintex set textwidth=79 "Set vi to hard wrap text
au FileType plaintex set spell "Turn on spell checking
au FileType tex set textwidth=79 "Set vi to hard wrap text
au FileType tex set spell "Turn on spell checking

" Markdown Options
au BufNewFile,BufRead *.md set filetype=markdown
au FileType markdown set textwidth=79 "Set vi to hard wrap text
au FileType markdown set spell "Turn on spell checking

" Makefile Options
au FileType make set noexpandtab

" Change the paragraph formatter to par with an 80 column line width
" This option is currently disabled because I keep getting seq faults when I
" use gqip
" set formatprg=par\ -w80


"This allows us to collapse methods.
set foldmethod=indent
set foldlevel=99

" Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"set completeopt=longest,menuone
set completeopt=menu,menuone,longest,preview

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>

" Python code completion
" This line no longer needed due to python-mode
" au FileType py set omnifunc=pythoncomplete#Complete

" ==================================================
" Plugin Config!
" ==================================================

" Powerline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Use the following to disable certain plugins
let g:pathogen_disabled = []
" These are disable because python-mode supersedes them
call add(g:pathogen_disabled, 'ropevim')
call add(g:pathogen_disabled, 'rope-vim')
call add(g:pathogen_disabled, 'pep8')
call add(g:pathogen_disabled, 'pydoc')
" call add(g:pathogen_disabled, 'python-mode')
call add(g:pathogen_disabled, 'powerline')
" Disable the old version of minibufexplorer as I want
" to try a new and improved version. from github.com/fholgado
call add(g:pathogen_disabled, 'minibufexpl')

"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()


" Make the editor pretty
" colorscheme solarized

" python-mode
" I like jedi-vim, so we need to disable the duplicate features
let g:pymode_doc = 0
let g:pymode_run = 1
let g:pymode_lint = 1
let g:pymode_rope = 0
let g:pymode_folding = 1
let g:pymode_motion = 0
let g:pymode_breakpoint = 0
let g:pymode_syntax_all = 0

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" Enable pymode indentation
let g:pymode_indent = 1

" Snipmate 
let g:snips_author = "rjwalls"

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Remap Tasklist
map <leader>td <Plug>TaskList
"Add a new token that can be recognized by the Tasklist plugin
let g:tlTokenList = ["FIXME", "TODO", "XXX", "reminder"]

" Remap Taglist
map <leader>tg :TlistToggle<CR>

" Configure Syntastic
map <leader>e :Errors<CR>

" Force Syntastic to use pyflakes
let g:syntastic_python_checkers = ['pyflakes']

set statusline+=%{SyntasticStatuslineFlag()}
" Check for errors when a file is opened (as well as saved)
let g:syntastic_check_on_open=1

execute pathogen#infect()

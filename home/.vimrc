call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set background=dark
colo solarized
set expandtab
set softtabstop=4
set shiftwidth=4
set number
set autoindent
set incsearch
set ignorecase
set smartcase
set hlsearch

let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,d3'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


nmap \l :setlocal number!<CR>
nmap \q :set nohlsearch<CR>
nmap \h :set hlsearch<CR>
nmap \v :Voom python<CR>
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

execute pathogen#infect()
execute pathogen#helptags()

"Basics {{{
filetype plugin on 
filetype indent on
syntax on
set background=dark
set t_Co=256
colorscheme rakr
set number
set autoindent
set ruler
set visualbell
set showmode
set showcmd
set laststatus=2
set modelines=1
"}}}

"Spacing & Tabs {{{
set expandtab
set softtabstop=4
set shiftwidth=4
set incsearch
set hlsearch
set ignorecase
set smartcase
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"}}}

"Variables {{{
let mapleader = ","
let g:jedi#auto_initialization = 0
let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,d3'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sh_shellcheck_args = "-e SC2012 -e 1090 -e 1091"
let g:syntastic_javascript_checkers=['eslint']
"}}}


"Custom shortcuts {{{
nmap <leader>l :setlocal number!<CR>
nmap <leader>h :set hlsearch<CR>
nmap <leader>n :noh<CR>
nmap <leader>r :set relativenumber!<CR>
map <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}

"Custom functions {{{

" Append this to your vimrc file
"""""""""""""""""""""""""""""""""
" auto-update the timestamp right before saving a file
" The Timestamp format is : Sat 07 Dec 2013 12:51:00 AM CST
" Within the 20 first lines, the matched lines are :
" Last [Cc]hange(d)
" Changed
" Last [Mm]odified
" Modified
" Last [Uu]pdate(d)

autocmd! BufWritePre * :call s:timestamp()
" to update timestamp when saving if its in the first 20 lines of a file
function! s:timestamp()
    let pat = '\(\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\).*'
    let rep = '\1' . strftime("%a %d %b %Y %I:%M:%S %p %Z")
    call s:subst(1, 20, pat, rep)
endfunction
" subst taken from timestamp.vim
" {{{ subst( start, end, pat, rep): substitute on range start - end.
function! s:subst(start, end, pat, rep)
    let lineno = a:start
    while lineno <= a:end
        let curline = getline(lineno)
        if match(curline, a:pat) != -1
            let newline = substitute( curline, a:pat, a:rep, '' )
            if( newline != curline )
                " Only substitute if we made a change
                "silent! undojoin
                keepjumps call setline(lineno, newline)
            endif
        endif
        let lineno = lineno + 1
    endwhile
endfunction
" }}}

"vim:foldermethod=marker:folderlevel=0

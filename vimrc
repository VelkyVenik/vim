if has('win32')
    " I have problems with my company Windows notebook with the home folder, it's
    " on network so Vim is very very very slow then :(
    let $HOME = $USERPROFILE

    set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
else
    set shell=/bin/bash
endif

"NeoBundle Scripts-----------------------------

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'powerline/fonts'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'szw/vim-ctrlspace'
NeoBundle 'trusktr/seti.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'sjl/gundo.vim/'
NeoBundle 'junegunn/goyo.vim'

NeoBundle 'fatih/vim-go'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'klen/python-mode.git'
NeoBundle 'dag/vim-fish'
NeoBundle 'VelkyVenik/vim-avr'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'rust-lang/rust.vim'

" I do not have working DLL for Windows
if !has('win32')
    NeoBundle 'Shougo/vimshell'
    NeoBundle 'Shougo/vimproc.vim', {
                \ 'build' : {
                \     'windows' : 'tools\\update-dll-mingw',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'linux' : 'make',
                \     'unix' : 'gmake',
                \    },
                \ }
endif

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


syntax on               " switch syntax highlighting on
set mouse=a             " enable mouse
let mapleader = ","     " change map leader

set tabstop=4           " a tab is four spaces
set shiftwidth=4        " number of spaces to use for autoindenting
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab           " replace tab with spaces
set softtabstop=4       " how many spaces for tab

set nowrap              " don't wrap lines
set nofoldenable        " do not fold blocks
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set number              " always show line numbers


set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to
"  shiftwidth, not tabstop
set hlsearch            " highlight search terms
set incsearch           " show search matches as you type
set showmatch           " set show matching parenthesis
nnoremap <leader><space> :noh<cr>
" hide search highlighting
set gdefault            " applies substitutions globally on lines - :%s/foo/bar/g


set history=1000        " remember more commands and search history
set undolevels=1000     " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title               " change the terminal's title
set visualbell          " don't beep
set noerrorbells        " don't beep
set hidden              " unsaved buffers can be hidden
set noshowmode          " don't show mode, we have AirLine

set nobackup            " no backup files
set noswapfile          " no swap files

set laststatus=2        " show statusline with AirLine


if has("gui_running")
    set lines=70 columns=150        " window size

    "set guifont=Menlo\ Regular:h14  " default font
    set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h14
    set guioptions-=T               "remove toolbar
    set guioptions-=r               "remove right-hand scroll bar
    set guioptions-=L               "remove left-hand scroll bar
    set guioptions-=m               "remove menu bar

    set background=dark             " colors
    "colorscheme desert
    "colorscheme base16-bespin
    colorscheme seti
endif

" Shortcuts ---------------------------------

set pastetoggle=<F2>    " enable/disable formating for copy&pase

" changing windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <leader>gs :Gstatus<cr>
noremap <leader>gp :Gpush<cr>

noremap <leader>sh :VimShell<cr>

noremap <leader><Left> :bp<CR>
noremap <leader><Right> :bn<CR>

let g:gitgutter_map_keys = 0    " Disable GitGutter shortcuts"


" NeoComplete -------------------------------
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" NerdTree ------------------------------
noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=1
" a single click will open any node
let NERDTreeMouseMode=3
let NERDTreeMinimalUI=1

" Syntastic -----------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ignore empty tags
let g:syntastic_html_tidy_ignore_errors = [ 'trimming empty', '> proprietary attribute "' ]
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'

" Get all error from Syntastic for go files
autocmd FileType go let g:syntastic_aggregate_errors = 1
autocmd FileType go let g:syntastic_go_checkers = ["go", "govet", "golint"]

" AirLine -------------------------------
if has('gui_running') && has('mac')
    " use Powerline fonts - must be installed from font bundle
    let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'

" Vim-Go
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)

au FileType go nmap <Leader>gds <Plug>(go-def-split)
au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gdt <Plug>(go-def-tab)

"au FileType go nmap <Leader>gs <Plug>(go-implements)

" Syntax highlighting, does it work? :)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_fail_silently = 1          " Use syntastic instead
let g:go_auto_type_info = 1             " Show function/variable type automaticaly

let g:go_snippet_engine = "neosnippet"

set completeopt-=preview

" Python-Mode
let g:pymode_rope_goto_definition_bind = '<leader>pg'

" VIM-AUTOFORMAT ------------------------
noremap <Leader>af :Autoformat<CR>
" Do not touch JSX - Pass E4X xml literals through untouched
let g:formatdef_jsbeautify_javascript = '"js-beautify -X -f - -".(&expandtab ? "s ".shiftwidth() : "t").(&textwidth ? " -w ".&textwidth : "")'


" CtrlSpace
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
nnoremap <silent><C-p> :CtrlSpace O<CR>

" NeoSnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neosnippet#snippets_directory="~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets"
let g:neosnippet#snippets_directory .= "," . globpath(&rtp, "gosnippets/snippets")
let g:neosnippet#enable_snipmate_compatibility=1

" GUndo
noremap <Leader>u :GundoToggle<CR>

" Goyo
nnoremap <silent> <leader>z :Goyo<CR>

let g:goyo_width = '80%'
let g:goyo_height ='80%'

function! s:goyo_enter()
    if has('gui_running')
        set fullscreen
        "set background=light
        set linespace=7
    elseif exists('$TMUX')
        silent !tmux set status off
    endif
endfunction

function! s:goyo_leave()
    if has('gui_running')
        set nofullscreen
        "set background=dark
        set linespace=0
    elseif exists('$TMUX')
        silent !tmux set status on
    endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


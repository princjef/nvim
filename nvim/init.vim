" plugins
call plug#begin('~/.config/nvim/packages')

" syntax
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/jspc.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'elzr/vim-json', { 'on_ft': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'on_ft': ['css', 'scss'] }
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown', { 'on_ft': 'markdown' }
Plug 'tyru/markdown-codehl-onthefly.vim'
Plug 'leafgarland/typescript-vim'
Plug 'itmammoth/doorboy.vim'
Plug 'valloric/MatchTagAlways', { 'on_ft': 'html' }
Plug 'tomtom/tcomment_vim'				" Comment with gc
Plug 'mattn/emmet-vim'
Plug 'sbdchd/neoformat'					" Autoformat with :Neoformat
Plug 'ternjs/tern_for_vim', { 'build': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'on_ft': 'javascript' }
Plug 'maksimr/vim-jsbeautify'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'				" Linter
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" git
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

" file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'				" Git diffing for file tree
Plug 'ryanoasis/vim-devicons'					" Icons for file tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'	" Coloring for file tree icons

" generic config
Plug 'editorconfig/editorconfig-vim'	" Generic editor config
Plug 'tpope/vim-repeat'					" Gives other plugins repeat capabilities
Plug 'tpope/vim-surround'				" Manage delimiters (cs to replace)
Plug 'tpope/vim-sleuth'                 " Automatically detect indentation
Plug 'vim-airline/vim-airline'			" Bottom status/tabline (colors on insert line and such)
Plug 'vim-airline/vim-airline-themes'	" Themes for vim-airline

" deoplete (asynchronous autocomplete) and friends
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/deol.nvim'						" Neovim shell?
Plug 'Shougo/denite.nvim'					" United search interface with :Denite?
Plug 'Shougo/neomru.vim'					" MRU for unite/denite
Plug 'Shougo/context_filetype.vim'				" Context filetype library for Vim script
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } 	" Like denite for file/rec but floating window and better
Plug 'Shougo/neco-vim', {'on_ft': 'vim'}			" Deoplete for vim files
Plug 'Shougo/neoinclude.vim'					" Includes for deoplete?
Plug 'zchee/deoplete-jedi', {'on_ft': 'python'}		        " Deoplete for python (uses the jedi tool for python)
Plug 'zchee/deoplete-zsh'					" Deoplete for zsh
Plug 'Valodim/vim-zsh-completion'				" More zsh completion
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}  	" Typescript deoplete integration
Plug 'Shougo/neosnippet.vim'					" Snippet support (integrates with deoplete)
Plug 'Shougo/neosnippet-snippets'				" Collection of snippets for certain languages integrated with above
Plug 'honza/vim-snippets'					" More snippets for various languages
Plug 'Shougo/echodoc.vim'					" Shows documentation for function signatures while typing
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}		" Deoplete for Go

Plug 'mhinz/vim-sayonara'				" Makes closing a tab act like normal programs
Plug 'terryma/vim-multiple-cursors'		" Like SublimeText multiple cursors
Plug 'tyru/open-browser.vim'			" Open link in a web browser from vim
Plug 'junegunn/vim-easy-align'			" Align around certain characters (like these comments)
Plug 'MartinLafreniere/vim-PairTools'	" Does things like autoclosing and autoa tabbing

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder

call plug#end()

" colors
set termguicolors
colorscheme molokai
let &colorcolumn=join(range(80,999),",")

" settings
set number relativenumber
set clipboard+=unnamedplus
syntax enable
set tabstop=4 shiftwidth=0 expandtab    " add exapndtab to replace tab with spaces

set ttimeout ttimeoutlen=2              " Attempt to fix occasional hanging: https://github.com/neovim/neovim/issues/2454
set noshowmode							" Hide default text indicating mode and status (so that airline can show it)
filetype on
set laststatus=2						" Always show a status line uder the window
set wrap linebreak nolist				" Wraps on a reasonable character (think word boundary)
let mapleader=","

" mouse in tmux
set mouse=a

" undo
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" remember cursor between vim sessions
autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal! g'\"" |
				\ endif

" center buffer around curosr when opening files
autocmd BufRead * normal zz				
set updatetime=1000						" Amount of inactive time (ms) to wait between saves
set complete=.,w,b,u,t,k
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
set inccommand=nosplit					" Show what substitute will do while typing it
set shortmess=atI						" Status text formatting options

" Default behavior when opening a new terminal?
" (honestly not sure what this does)
tmap <esc> <c-\><c-n><esc><cr>

" Remap comments
vnoremap <c-/> :TComment<cr>

" Remap quit
nnoremap q :Sayonara<cr>

" No need to use shift when doing : commands
nnoremap ; :

" Mappings for 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Ale Configuration
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" Golang

" indentation
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" let g:go_auto_sameids = 1

au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
au BufRead,BufNewFile *.gotxt set filetype=gotexttmpl

" autoimport
let g:go_fmt_command = "goimports"

" show types
let g:go_auto_type_info = 1

" keybindings
au FileType go nnoremap gd <Plug>(go-def)

" go-deoplete
let g:deoplete#sources#go#gocode_binary = "~/go/bin/gocode"

" Javascript/Typescript

" heavenshell/vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1

" elzr/vim-json
let g:vim_json_syntax_conceal = 0	" turn off quote concealing

" ternjs/tern_for_vim
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:nvim_typescript#max_completion_detail = 100
map <silent> <leader>D :TSDoc<cr>
au FileType ts nnoremap gd :TSDef<cr>

" Git
vnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gb :Gblame<cr>

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
nnoremap <c-\> :NERDTreeToggle<cr>

" autocmd VimEnter * NERDTreeToggle

" Code formatting
noremap ƒ :Neoformat<cr>

set splitbelow " make horizontal splits show up below
set splitright " make vertical splits show up to the right

" Deoplete
let g:deoplete#enable_at_startup=1
let g:echodoc_enable_at_startup=1
set completeopt+=noinsert " fix selection of the option
autocmd CompleteDone * pclose
" Use tab to select the option we want
inoremap <silent><expr><tab> pumvisible() ? "\<return>" : "\<tab>"

" Use ctrl+space to manually show the completion window
inoremap <expr><c-Space> deoplete#manual_complete()

call deoplete#custom#source('buffer', 'mark', 'buffer')
call deoplete#custom#source('ternjs', 'mark', '')
call deoplete#custom#source('typescript', 'mark', '')
call deoplete#custom#source('omni', 'mark', 'omni')
call deoplete#custom#source('file', 'mark', 'file')

function! Preview_func()
	if &pvw
		setlocal nonumber norelativenumber
	endif
endfunction
autocmd WinEnter * call Preview_func()
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])

" Denite configuration (unified finder for neovim)
autocmd FileType unite call s:uniteinit()
function! s:uniteinit()
	set nonumber
	set norelativenumber
endfunction

" File finder with Ctrl-P
noremap <silent> <c-p> :Denite file/rec<cr>
" noremap <silent> <c-p> :Clap files<cr>
noremap <silent> <c-h> :Denite buffer<cr>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')

	nnoremap <silent><buffer><expr> <Tab>    denite#do_map('choose_action')
	nnoremap <silent><buffer><expr> <ESC>   denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select')
	nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter call s:denite_filter_settings()
function s:denite_filter_settings() abort
	setl nonumber
	call deoplete#custom#buffer_option('auto_complete', v:false)
	" nunmap <CR>
	inoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
	" inoremap <silent><buffer> <ESC> <Plug>(denite_filter_quit)
	" imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	inoremap <silent><buffer> <CR>  <ESC><C-w>p:call denite#call_map('do_action')<CR>
	" inoremap <silent><buffer> <CR>  <Esc><C-w>p<CR>

	" inoremap <silent><buffer> <Space> <Esc><C-w>p:call denite#call_map()('toggle_select', [])<CR><C-w>pA
	inoremap <silent><buffer> <Tab>   <Esc><C-w>p:call denite#call_map('choose_action')<CR>
	inoremap <silent><buffer> <Space> <Esc><C-w>p:call denite#call_map('toggle_select')<CR><C-w>pA
	inoremap <silent><buffer> <C-j>   <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
	inoremap <silent><buffer> <C-k>   <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')

" Git menu for Denite
let s:menus = {}
let s:menus.git = {
	\ 'description' : 'Fugitive interface',
	\}
let s:menus.git.command_candidates = [
	\[' git status', 'Gstatus'],
	\[' git blame', 'Gblame'],
	\[' git diff', 'Gvdiff'],
	\[' git commit', 'Gcommit'],
	\[' git stage/add', 'Gwrite'],
	\[' git checkout', 'Gread'],
	\[' git rm', 'Gremove'],
	\[' git cd', 'Gcd'],
	\[' git push', 'exe "Git! push " input("remote/branch: ")'],
	\[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
	\[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
	\[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
	\[' git fetch', 'Gfetch'],
	\[' git merge', 'Gmerge'],
	\[' git browse', 'Gbrowse'],
	\[' git head', 'Gedit HEAD^'],
	\[' git parent', 'edit %:h'],
	\[' git log commit buffers', 'Glog --'],
	\[' git log current file', 'Glog -- %'],
	\[' git log last n commits', 'exe "Glog -" input("num: ")'],
	\[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
	\[' git log until date', 'exe "Glog --until=" input("day: ")'],
	\[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
	\[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
	\[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
	\[' git mv', 'exe "Gmove " input("destination: ")'],
	\[' git grep',  'exe "Ggrep " input("string: ")'],
	\[' git prompt', 'exe "Git! " input("command: ")'],
	\] " Append ' --' after log to get commit info commit buffers

call denite#custom#var('menu', 'menus', s:menus)
call denite#custom#source('file/rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '*~', '*.o', '*.exe', '*.bak',
            \ '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
            \ '.hg/', '.git/', '.bzr/', '.svn/',
            \ 'node_modules/', 'bower_components/', 'tmp/', 'log/', 'vendor/ruby',
            \ '.idea/', 'dist/', 'temp/', 'coverage/', '.nyc_output/',
            \ 'tags', 'tags-*'])

" vim-airline configuration
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline_skip_empty_sections=1
set hidden " allow buffers to be hidden without closing
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'

tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 ',
	\ '10': '10 '
	\}

" Navigate between vim buffers and tmux panels
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

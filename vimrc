let mapleader = " "

" Clear autocmds
autocmd!

" Use Vim settings, rather than Vi settings
" This must be first because it changes other options as a side effect
set nocompatible

" Don't show mode
set noshowmode

" Enable file type detection and load plugin indent files
filetype plugin on
filetype plugin indent on

" Load plugins with Pathogen
"runtime core/pathogen/autoload/pathogen.vim
"execute pathogen#infect('colors/{}', 'langs/{}', 'tools/{}')
execute pathogen#infect()

" enable per-project .vimrc files
set exrc
" Only execute safe per-project vimrc commands
set secure

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Bundle 'dockyard/vim-easydir'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'SirVer/ultisnips'
Bundle 'int3/vim-extradite'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'rorymckinley/vim-rubyhash'
Bundle 'scrooloose/nerdtree'
Bundle 'skalnik/vim-vroom'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-speeddating'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'marcweber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'wellle/targets.vim'
Bundle 'vim-scripts/SyntaxAttr.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'slim-template/vim-slim'

" Don't map rubyhash keys
let g:rubyhash_map_keys = 0
" ruby path if you are using RVM
let g:ruby_path = system('rvm current')
" Disable mappings from vim-ruby-refactoring
let g:ruby_refactoring_map_keys=0
" Intent private methods
let g:ruby_indent_access_modifier_style = 'outdent'


" UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Rtags
let g:rails_ctags_arguments = ['--languages=-javascript']

" Regenerate ctags
map <Leader>ct :!ctags --extra=+f --exclude=.git --exclude=log --exclude=doc -R * `rvm gemdir`/gems/*<CR><CR>

" Toggle NERDTree
let g:NERDTreeIgnore = ['images$[[dir]]', 'bin$[[dir]]', 'script$[[dir]]', 'logs\?$[[dir]]', 'tmp$[[dir]]', 'doc$[[dir]]', 'coverage$[[dir]]', 'sublime-project$[[file]]']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>N :NERDTreeFind<cr>
if isdirectory(argv(0))
  bd
  autocmd vimenter * exe "cd" argv(0)
  autocmd VimEnter * NERDTree
endif

" Load vimrc from current directory and disable unsafe commands in them
set exrc
set secure

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Clear PAGER if Vim's Man function is needed
let $PAGER=''

" Get rid of ex-mode
nnoremap Q <nop>

" Directory list style
let g:netrw_liststyle=0

" Invisible characters
"set listchars=tab:▸\ ,nbsp:_
"set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=128

" Settings for the gui version
set guifont=Monaco:h13

" ERB tags for surround
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" Don't show invisible characters (default)
set nolist

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j     
endif

" Don't reset cursor to start of line when moving around
set nostartofline

"" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255

set runtimepath+=~/.vim.local

set background=light
colorscheme Tomorrow

autocmd ColorScheme * highlight Normal ctermbg=White
autocmd ColorScheme * highlight LineNr ctermbg=255
autocmd ColorScheme * highlight CursorLineNr ctermbg=255

"" Always show the file name
set modeline
set hlsearch                    " highlight the search
set ls=2
"set cursorline                  " highlight current line
set ttyfast                     " improves redrawing for newer computers
set ttyscroll=3
set lazyredraw                  " to avoid scrolling problems
set wildmenu                    " show completion on the modeline
set linespace=0
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
set wrap                        " wrap long lines
set linebreak                   " break lines at word end
set nobackup                    " no backup files
set nowritebackup               " only in case you don't want a backup file while editing
set noswapfile                  " no swap files
set backupdir=~/tmp
set hidden

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

" Auto-reload buffers when files are changed on disk
set autoread

" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=1
set nofoldenable                " disable folding

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

set number                      " line numbers
set vb                          " disable alert sound
syntax enable
syntax sync minlines=256
set showcmd                     " display incomplete commands
set history=100                 " a ton of history

" Default shell and shell syntax and source ~/.bash_profile
set shell=/bin/bash\ --login
let g:is_bash=1

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=5                 " keep a 5 line padding when moving the cursor

set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth
"set switchbuf=useopen,usetab   " move focus to where the buffer is

set tagbsearch                  " use binary searching for tags

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
" You can shorten command-line text and other info tokens with, e.g.:
set shortmess=atI

" remove search highlighting
nmap <leader>h :noh<cr>

" Set <c-n> and <c-p> to act like Up/Down so will filter command history
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" <c-a> jumps to beginning of line to match <c-e>
cnoremap <c-a> <home>

" C-c send enter in insert mode
imap <C-c> <Esc>

cnoreabbrev W w
cnoreabbrev Q q

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" =============================================================================
" Filetypes and Custom Autocmds
" =============================================================================

augroup vimrcEx
  " Clear all autocmds for the current group
  autocmd!

  " Jump to last cursor position unless it's invalid or in an event handler or
  " a git commit
  au BufReadPost *
    \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Some file types use real tabs
  au FileType {make,gitconfig} set noexpandtab sw=4

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript

  " Make Python follow PEP8
  au FileType python set sts=4 ts=4 sw=4 tw=79

  " Make sure all markdown files have the correct filetype
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

  " MultiMarkdown requires 4-space tabs
  au FileType markdown set sts=4 ts=4 sw=4

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there
  au! CmdwinEnter * :unmap <cr>
  au! CmdwinLeave * :call MapCR()
augroup END

""
"" Status Line
""

if has("statusline") && !&cp
  set statusline=
endif

" Show options
set wildmode=longest,list

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore custom folders
set wildignore+=*/resources/*

" Ignore node modules
set wildignore+=node_modules/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" CtrlP
hi def link CtrlPMatch CursorLine
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }

" Will allow you to use :w!! to write to a file using sudo if you
" forgot to sudo vim file (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Visually select the text that was last edited/pasted
nmap gV `[v`]

nmap Y y$

" close the buffer but not it's window
nnoremap <C-c> :bp\|bd #<cr>

" Switch to alternate file
noremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

map <leader>a :Ack! 

" Move between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <Leader>, 2<C-w><
nnoremap <Leader>. 2<C-w>>
nnoremap <Leader>- 2<C-w>-
nnoremap <Leader>= 2<C-w>+

nnoremap <leader><leader> :b#<cr>

map <C-b> :CtrlPBuffer<cr>
nmap <leader>V :e ~/.vimrc<cr>
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

nnoremap <leader>F :e <C-R>=expand('%:h').'/'<CR>

" Use a nicer error sign
let g:syntastic_error_symbol = '→'
let g:syntastic_warning_symbol = '→'

" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
" highlight! link DiffText MatchParen

" clear those nasty fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" set haml filetype on weird extensions
autocmd BufRead,BufNewFile *.hamljs set filetype=haml

" quickfix window height is automatically adjusted to fit its contents
au FileType qf call AdjustWindowHeight(3, 15)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
 
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

highlight DiffAdd cterm=none ctermfg=fg ctermbg=157 gui=none guifg=bg guibg=#87d700
highlight DiffDelete cterm=none ctermfg=fg ctermbg=167 gui=none guifg=fg guibg=#d70000
highlight DiffChange cterm=none ctermfg=fg ctermbg=217 gui=none guifg=fg guibg=#878700
highlight DiffText cterm=bold ctermfg=010 ctermbg=217 gui=none guifg=#00f00 guibg=#87d700

nnoremap <f2> :diffget //2<CR>
nnoremap <f3> :diffget //3<CR>
nnoremap <f4> :diffupdate<CR>

" look for the tags file in every gem
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      \ pathogen#split(&tags) +
      \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

" Auto save contents of a buffer when you lose focus
autocmd BufLeave,FocusLost * silent! update

" The custom :Qargs command sets the arglist to contain each of the files
" referenced by the quickfix list.
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

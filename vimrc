let mapleader = " "

" Clear autocmds
autocmd!

" Use Vim settings, rather than Vi settings
" This must be first because it changes other options as a side effect
set nocompatible


" Enable file type detection and load plugin indent files
filetype plugin on
filetype plugin indent on

" Load plugins with Pathogen
"runtime core/pathogen/autoload/pathogen.vim
"execute pathogen#infect('colors/{}', 'langs/{}', 'tools/{}')
execute pathogen#infect()

" Load vimrc from current directory and disable unsafe commands in them
set exrc
set secure

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Clear PAGER if Vim's Man function is needed
let $PAGER=''

" Invisible characters
"set listchars=tab:▸\ ,nbsp:_
"set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" ERB tags for surround
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" Don't show invisible characters (default)
set nolist

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

"" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255

set runtimepath+=~/.vim.local

set background=dark
colorscheme lucius
if has('gui_running')
  set macmeta
  set guioptions=aAce
  set guifont=Monaco:h13
end

"" Always show the file name
set modeline
set ls=2
set nocursorline                " do not highlight current line
set ttyfast                     " improves redrawing for newer computers
set wildmenu                    " show completion on the modeline
set linespace=0
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
set wrap                        " wrap long lines
set nobackup                    " no backup files
set nowritebackup               " only in case you don't want a backup file while editing
set noswapfile                  " no swap files
set backupdir=~/tmp

" Lines with equal indent form a fold.
set foldmethod=indent
set nofoldenable    " disable folding

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

set number                      " line numbers
set vb                          " disable alert sound
syntax enable
syntax sync minlines=256
set showcmd                     " display incomplete commands
set history=1000                " a ton of history

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=5                 " keep a 5 line padding when moving the cursor

set autoindent                  " indent on enter
set shiftround                  " indent to the closest shiftwidth
set switchbuf=useopen,usetab    " move focus to where the buffer is

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
" You can shorten command-line text and other info tokens with, e.g.:
set shortmess=atI

" setting up NERDTree

"" close vim if NERDTree is the last window opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
nmap <C-f> :NERDTreeFind<cr>
nmap <C-n> :NERDTreeToggle<cr>


" C-c send enter in insert mode
imap <C-c> <CR><Esc>O

" without these two lines, vim scrolling is really slow
set nocursorcolumn
set nocursorline

cnoreabbrev W w
cnoreabbrev Q q

set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.DS_Store,.svn,*.png,*.jpg,*.gif,*.log,coverage/*,TAGS,tmtags,*.tmproj,*.pid
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$\|coverage$\|doc$\|tmp$\|public/assets$\|vendor$\|Android$',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|\.dll$'
  \ }

" Will allow you to use :w!! to write to a file using sudo if you
" forgot to sudo vim file (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Visually select the text that was last edited/pasted
nmap gV `[v`]

nmap Y y$

" close the buffer but not it's window
nnoremap <C-c> :bp\|bd #<cr>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

map <leader>a :Ack! 

" buffer navigation
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>p :tabprevious<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>c :tabclose<cr>

" Move between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap kj <Esc>

nnoremap <leader>, :b#<cr>

map <C-b> :CtrlPBuffer<cr>
nnoremap <leader><leader> :noh<cr>
nmap <leader>V :e ~/.vimrc<cr>

" open diffs in a new tab
nmap __ :tabedit %<CR>:Gdiff<CR>

nnoremap <leader>f :e <C-R>=expand('%:h').'/'<CR>

" Use a nicer error sign
let g:syntastic_error_symbol = '→'
let g:syntastic_warning_symbol = '→'

" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
highlight! link DiffText MatchParen

" clear those nasty fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" set haml filetype on weird extensions
autocmd BufRead,BufNewFile *.hamljs set filetype=haml

" quickfix window height is automatically adjusted to fit its contents
au FileType qf call AdjustWindowHeight(3, 15)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
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

" Run tests using vimux
let g:vroom_use_vimux = 1
let g:vroom_map_keys = 0
nmap <leader>r :VroomRunNearestTest<cr>
nmap <leader>R :VroomRunTestFile<cr>


" Filter the quickfix window by pattern
" http://dhruvasagar.com/2013/12/17/vim-filter-quickfix-list
" :QFilter pattern  - filters the list to keep results matching the pattern
" :QFilter! pattern - will remove results that match the pattern
function! s:FilterQuickfixList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file QFilter call s:FilterQuickfixList(<bang>0, <q-args>)

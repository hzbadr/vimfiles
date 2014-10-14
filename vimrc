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

" Show me whitespace
" au FileType * if &filetype =~ /scss\|css\|ruby/ | setlocal list | endif

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so $MYVIMRC

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'dockyard/vim-easydir'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'SirVer/ultisnips'
Plugin 'int3/vim-extradite'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'rorymckinley/vim-rubyhash'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'wellle/targets.vim'
Plugin 'vim-scripts/SyntaxAttr.vim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'slim-template/vim-slim'
Plugin 'ngmy/vim-rubocop'
Plugin 'nanotech/jellybeans.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'jgdavey/vim-blockle.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tommcdo/vim-exchange'
Plugin 'AndrewRadev/switch.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/vim-easy-align'
Plugin 'rking/ag.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'zefei/vim-wintabs'
Plugin 'tpope/vim-abolish'
Plugin 'gregsexton/gitv'
Plugin 'gabrielelana/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()

" CtrlP Delete
call ctrlp_bdelete#init()

" Run rspec with line number
" maps <leader>r to a rspec running command
:nn <expr> <Leader>C ":nn <lt>Leader>cu :!cucumber <lt>C-R>=expand('%')<lt>CR>:".input("Line number: ", line('.'))."<lt>CR>"

" RSpec.vim mappings
let g:rspec_command = "!rspec {spec}"
"let g:rspec_command = "!spring rspec {spec}"
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

nnoremap <Leader>W :redraw!<CR>

" Rubocop
let g:vimrubocop_config = '~/.rubocop.yml'
let g:vimrubocop_keymap = 0

" Syntastic
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" Use a nicer error sign
let g:syntastic_error_symbol = '→'
let g:syntastic_warning_symbol = '•'
let g:syntastic_style_error_symbol = '›'
let g:syntastic_style_warning_symbol = '›'
let g:syntastic_mode_map = { "mode": "passive",
      \ "active_filetypes": [],
      \ "passive_filetypes": [] }

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
nnoremap <Leader>ct :!ctags --extra=+f --exclude=.git --exclude=log --exclude=doc -R * `rvm gemdir`/gems/*<CR><CR>
nnoremap <Leader>cc :SyntasticCheck<cr>

" Toggle NERDTree
let g:NERDTreeIgnore = ['images$[[dir]]', 'bin$[[dir]]', 'script$[[dir]]', 'logs\?$[[dir]]', 'tmp$[[dir]]', 'doc$[[dir]]', 'coverage$[[dir]]', 'sublime-project$[[file]]']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>N :NERDTreeFind<cr>
if isdirectory(argv(0))
  bd
  autocmd vimenter * exe "cd" argv(0)
  autocmd VimEnter * NERDTree
endif

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <leader>R :call RenameFile()<cr>

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
"" Add the '-' as a keyword in erb files
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-

set runtimepath+=~/.vim.local

set background=dark
colorscheme jellybeans

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

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
set foldnestmax=10
set nofoldenable                " disable folding
set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
set number                    " line numbers
set vb                          " disable alert sound
syntax enable
syntax sync fromstart
set showcmd                     " display incomplete commands
set history=100                 " a ton of history
"set colorcolumn=80              " show a column at 80 characters

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
set scrolloff=0                 " keep a 5 line padding when moving the cursor

set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth
"set switchbuf=useopen,usetab   " move focus to where the buffer is

set tagbsearch                  " use binary searching for tags

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
" You can shorten command-line text and other info tokens with, e.g.:
set shortmess=atI

" remove search highlighting
nnoremap <leader>h :noh<cr>

" Set <c-n> and <c-p> to act like Up/Down so will filter command history
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" <c-a> jumps to beginning of line to match <c-e>
cnoremap <c-a> <home>

" C-c send enter in insert mode
inoremap <C-c> <Esc>

cnoreabbrev W w
cnoreabbrev Q q

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%')<cr>

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
augroup END

""
"" Status Line
""

if has("statusline") && !&cp
  " Default status line
  set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  " set statusline=%<\ %n:%f\ %m%r%y%{SyntasticStatuslineFlag()}%=line:\ %l\ of\ %L,\ col:\ %c%V,\ 
  " format markers:
  "   %< truncation point
  "   %n buffer number
  "   %f relative path to file
  "   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
  "   %r readonly flag [RO]
  "   %y filetype [ruby]
  "   %= split point for left and right justification
  "   %-35. width specification
  "   %l current line number
  "   %L number of lines in buffer
  "   %c current column number
  "   %V current virtual column number (-n), if different from %c
  "   %P percentage through buffer
  "   %) end of width specification
endif

" Show options
set wildmode=longest,list

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore images and log files
set wildignore+=*.gif,*.jpg,*.png,*.log

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
cnoremap w!! %!sudo tee > /dev/null %

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" close the buffer but not it's window
nnoremap <C-c> :bp\|bd #<cr>

" Switch to alternate file
noremap <Tab> :WintabsNext<CR>
noremap <S-Tab> :WintabsPrevious<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>a :Ag! 

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>, 2<C-w><
nnoremap <Leader>. 2<C-w>>
nnoremap <Leader>- 2<C-w>-
nnoremap <Leader>= 2<C-w>+

nnoremap <leader><leader> :b#<cr>
nnoremap <leader>V :tabnew $MYVIMRC<cr>

nnoremap <C-b> :CtrlPBuffer<cr>
nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> 9gt
nnoremap <D-0> :tablast<CR>

nnoremap <leader>F :e <C-R>=expand('%:h').'/'<CR>

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

" highlight DiffAdd cterm=none ctermfg=157 ctermbg=bg gui=none guifg=bg guibg=#87d700
" highlight DiffDelete cterm=none ctermfg=167 ctermbg=bg gui=none guifg=fg guibg=#d70000
" highlight DiffChange cterm=none ctermfg=217 ctermbg=bg gui=none guifg=fg guibg=#878700
" highlight DiffText cterm=bold ctermfg=010 ctermbg=bg gui=none guifg=#00f00 guibg=#87d700

highlight SignColumn term=standout ctermfg=242 ctermbg=bg guifg=#777777 guibg=bg

nnoremap <f2> :diffget //2<CR>
nnoremap <f3> :diffget //3<CR>
nnoremap <f4> :diffupdate<CR>
nnoremap <leader>r :redraw!<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>w :%s/^\s\+$//g<CR>

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

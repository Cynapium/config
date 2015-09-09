""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Parameters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to auto read when a file is changed from the outside
set autoread

" Enables syntax highlighting
syntax on

" Define the colorscheme
colorscheme peachpuff

" Enhance command line completion & force behaviour
set wildmenu
set wildmode=list:longest:full


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set minimal amount of lines under and above the cursor
set so=7

" Show line number
set number

" Show matching brackets when text indicator is over them
set showmatch

" Make backspace behave as expected
set backspace=eol,indent,start

" Always show status line
set laststatus=2

" Wrap on column 80
set textwidth=79

" Color the column after textwidth
if version >= 703
  set colorcolumn=+1
endif

" Enable the use of the mouse
if has('mouse')
  set mouse=a
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces, tabs and indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" Insert spaces instead of tabs
set expandtab

" The number of spaces inserted/removed when using < or >
set shiftwidth=4

" The number of spaces inserted when you press tab
set softtabstop=4

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" This one is complicated. See :help cinoptions-values for details
set cinoptions=(0,u0,U0,t0,g0,N-s

" Display whitespace characters
set list
set listchars=tab:>─,trail:\ ,nbsp:¤
set fillchars=vert:│
highlight ExtraWhitespac ctermbg=darkgreen
match ExtraWhitespac /\s\+$/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Window split (horizontal / vertical
nnoremap <Space>h :vsplit<CR>
nnoremap <Space>v :split<CR>

" Move from split to split
nnoremap <Space><Space> <C-w>w

" Firefox-like mapping for tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :q<CR>

" Move between tabs
nnoremap <M-Left> gT
nnoremap <M-Right> gt

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Write as root, when you forgot to sudo vim
cnoreabbrev w!! w !sudo tee % >/dev/null


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set location of the viminfo file
set viminfo='20,\"50,<100,n~/.vimtmp/viminfo

" Restore cursor from previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif

"Basic settings

syntax enable

filetype plugin on
filetype indent on


" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
set undolevels=1000

set autoread
set hidden
set encoding=utf-8
set ttyfast
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set fileencoding=utf-8
set iskeyword+=-
set mouse=a
set splitbelow
set splitright
set conceallevel=0
set nobackup
set nowritebackup
set noswapfile
set timeoutlen=500
set formatoptions-=cro
set clipboard=unnamedplus
set wildmenu
set history=1000
set ignorecase
set smartcase
set incsearch
set nohlsearch
set lazyredraw
set magic
set showmatch
set title
set mat=2
set foldcolumn=1
set showcmd
set noshowmode
set foldmethod=manual

" Text, tab and indent related
set smarttab
set expandtab
set smartindent
set autoindent
set nowrap
set tabstop=4
set shiftwidth=4
set lbr
set tw=500


" no annoying sound on errors

set noerrorbells
set visualbell
set t_vb=
set tm=500


" Interface
set so=5
set ruler
set cmdheight=2
set background=dark
set relativenumber
set t_Co=256
set number
set background=dark

" tabline
set showtabline=2
set tabline="%1T"

" Always show the status line
set laststatus=2

" Format the status line


set statusline=
set statusline+=%4*
set statusline+=\\|
set statusline+=%n
set statusline+=\\|
set statusline+=%3*
set statusline+=\\|
set statusline+=%{toupper(g:currentmode[mode()])}
set statusline+=\\|
set statusline+=%1*
set statusline+=\ %{b:gitbranch}
set statusline+=%7*
set statusline+=\ >>
set statusline+=%2*
set statusline+=\ %F\ %{ReadOnly()}
set statusline+=%1*
set statusline+=%m\ %w
set statusline+=%#warningmsg#
set statusline+=%=
set statusline+=%6*
set statusline+=%y
set statusline+=%9*
set statusline+=\\|
set statusline+=Line:
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=\ %P
set statusline+=\\|
set statusline+=%8*\ %-3(%{FileSize()}%)


set wildmode=longest,list,full
set wildoptions=pum
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev w1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev q1 q!
cnoreabbrev Qa! qa!
cnoreabbrev Qall! qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev wq1 wq!
cnoreabbrev Wq1 wq!
cnoreabbrev wQ1 wq!
cnoreabbrev WQ1 wq!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall

" Highlighing colors
hi User8 ctermbg=black ctermfg=magenta guibg=black guifg=magenta
hi User6 ctermbg=black ctermfg=darkblue guibg=magenta guifg=darkblue
hi User7 ctermbg=black ctermfg=blue guibg=black guifg=blue
hi User2 ctermbg=black ctermfg=red guibg=black guifg=red
hi User1 ctermbg=black ctermfg=yellow guibg=black guifg=yellow
hi User3 ctermbg=yellow ctermfg=red guibg=yellow guifg=red
hi User4 ctermbg=black ctermfg=white guibg=black guifg=white
hi User9 ctermbg=black ctermfg=green guibg=black guifg=green


" Functions for Statusline

let g:currentmode={
      \ 'n'  : 'N',
      \ 'no' : 'N·Operator Pending',
      \ 'v'  : 'V',
      \ 'V'  : 'V·Line',
      \ '' : 'V·Block',
      \ 's'  : 'Select',
      \ 'S'  : 'S·Line',
      \ '' : 'S·Block',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'Rv' : 'V·Replace',
      \ 'c'  : 'Command',
      \ 'cv' : 'Vim Ex',
      \ 'ce' : 'Ex',
      \ 'r'  : 'Prompt',
      \ 'rm' : 'More',
      \ 'r?' : 'Confirm',
      \ '!'  : 'Shell',
      \ 't'  : 'Terminal'
      \}


augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END


"Key Mappings

"leader key
let g:mapleader = "\<Space>"

" Remap VIM 0 to first non-blank character
map 0 ^

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-q> :wq!<CR>
" Select all
nnoremap <C-a> ggVG
" Undo
inoremap <C-z> <C-O>u

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>

" go to the beginning and end in insert mode
inoremap <A-b> <ESC>^i
inoremap <A-e> <End>

" navigate within insert mode
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" new file
nnoremap <leader>of <cmd>enew<cr>

" Insert empty line in insert mode
inoremap <A-o> <C-O>o
inoremap <A-O> <C-O>O

" Paste without yanking
vnoremap p "_dp

" Copy and Paste
nnoremap ]p o<esc>p
nnoremap [P o<esc>P
inoremap <C-v> <esc>po

" Move a line of text using ALT+[jk]
nnoremap <A-j> <cmd>m .+1<cr>==
nnoremap <A-k> <cmd>m .-2<cr>==
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv
inoremap <A-j> <esc><cmd>m .+1<cr>==gi
inoremap <A-k> <esc><cmd>m .-2<cr>==gi

" Search word under cursor
nnoremap gw *N

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move windows with shift-arrows
nnoremap <S-Left> <C-w><S-h>
nnoremap <S-Right> <C-w><S-j>
nnoremap <S-Up> <C-w><S-k>
nnoremap <S-Down> <C-w><S-l>

"Close the current buffer
nnoremap <leader>bd :bdelete<cr>

" Switch to other buffer
nnoremap <leader>bb :e #<cr>

" Switch buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprevious<cr>
nnoremap <Tab> :bprevious<cr>
nnoremap <A-Tab> :bnext<cr>


" Use ctrl + arrows to resize windows
nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>    :resize +2<CR>
nnoremap <C-Left>    :vertical resize -2<CR>
nnoremap <C-Right>    :vertical resize +2<CR>

" useful mappings for managing tabs
map <leader><tab><tab> :tabnew<cr>
map <leader><tab>f :tabfirst<cr>
map <leader><tab>c :tabclose<cr>
map <leader><tab>m :tabmove<cr>
map <leader><tab>p :tabprevious<cr>
map <leader><tab>n :tabnext<cr>

" Open a new tab with the current buffer path
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

"Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Nitpicky stuff
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z"
nnoremap g, g,zvzz
nnoremap g; g;zvzz

" Scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" add undo break-points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u
inoremap ? ?<c-g>u

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" For moving quickly up and down,
" Goes to the first line above/below that isn't whitespace
" Thanks to: http://vi.stackexchange.com/a/213
nnoremap <silent> gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap <silent> gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

" Helpful delete/change into blackhole buffer
nmap <leader>d "_d
nmap <leader>c "_c
nmap <leader>d "_d
nmap <leader>c "_c

nmap H _
nmap L $


" Auto Commands


au! BufWritePost $MYVIMRC source %
au Focusgained,BufEnter * checktime
au BufEnter * set fo-=c fo-=r fo-=o

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif

" Wayland Support for copy paste
autocmd TextYankPost * if (v:event.operator == 'y' || v:event.operator == 'd') | silent! execute 'call system("wl-copy", @")' | endif
nnoremap p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p




" Functions

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction



function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction


try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


" Trimming and highlight search
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd FileType * autocmd BufWritePre <buffer> call TrimWhitespace()
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
endfunction



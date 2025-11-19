"Basic settings

"leader key
let g:mapleader = " "

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

" go to the beginning and end in insert mode
inoremap <A-h> <HOME>
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
nnoremap <A-v> m`o<esc>p``
vnoremap <A-p> m`O<esc>p``
nnoremap ]p o<esc>p
nnoremap [P o<esc>P
inoremap <C-v> <esc>"+p<esc>a

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

" Helpful delete/change into blackhole buffer
nmap d "_d
nmap dd "_dd
nmap c "_c
nmap cc "_cc
nmap x "_x
nmap X "_X
nmap p "_p
nmap P "_P

nmap H _
nmap L $


exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki<CR>
nunmap s
vunmap s
map s" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map s` :surround_backticks<CR>
map sb :surround_brackets<CR>
map s( :surround_brackets<CR>
map s) :surround_brackets<CR>
map s[ :surround_square_brackets<CR>
map s] :surround_square_brackets<CR>
map s{ :surround_curly_brackets<CR>
map s} :surround_curly_brackets<CR>

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>

exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>

exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>

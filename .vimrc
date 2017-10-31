set nocompatible

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2
exec "set list listchars=tab:\uBB\\ ,trail:\uB7,extends:>,precedes:<,nbsp:+"
set colorcolumn=81
set hlsearch
set hidden
set title
set matchpairs=(:),{:},[:],<:>
filetype plugin indent on

" treat h++ and cuh files as c++
autocmd BufRead,BufNewFile *.h++ set filetype=cpp
autocmd BufRead,BufNewFile *.cuh set filetype=cuda
let g:formatters_cpp = ['clangformat']
let g:formatters_cuda = ['clangformat']

" save/load location and folds in ~/.vim/view/
augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
augroup END

" for YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '/home/anton/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1

" for vim-dispatch
set makeprg=make\ -C\ ../build

" for vim-commentary
set commentstring=//\ %s

" for cscope.vim
let g:cscope_silent = 1

let g:netrw_list_hide= '.*\.swp$'

" map %% to current file directory
cabbr <expr> %% expand('%:p:h')

colorscheme default
colorscheme antonColors

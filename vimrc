" Set color scheme
" Colors get reset when setting this so we do it first
colo desert

execute pathogen#infect()

" Set Indentation
filetype plugin indent on
" Show existing tab with 4 spaces width
" When indenting with '>', use 4 spaces width
" On pressing tab, insert 4 spaces
set tabstop=4 shiftwidth=4 expandtab
" File specific indentation
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType xml set tabstop=2|set shiftwidth=2|set expandtab

" Create custom commands
command! -nargs=0 XmlPretty %!xmllint --format %
command! -nargs=0 JsonPretty %!python -m json.tool
command! -nargs=0 Hex %!xxd
command! -nargs=0 HexSave %!xxd -r

" Set 80+ characters column line
set colorcolumn=81
hi ColorColumn ctermfg=red ctermbg=darkgrey

" Turn on line numbers
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Turn on auto-reload of .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Shift tab mapped to inverse tab for command and insert modes
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Map split pane navigation commands
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Syntastic error iteration shortcuts
nnoremap <F2> :lnext<CR>
nnoremap <F3> :lprevious<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 0
let g:syntastic_loc_list_height = 4

" Ignore certain messages
let g:syntastic_quiet_messages = {
    \ "regex": ["No such file or directory", "#pragma message"] }

" C configurations
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_check_header = 1
let g:syntastic_c_include_dirs = [
    \ 'include',
    \ 'includes',
    \ 'header',
    \ 'headers',
    \ 'include/feeds',
    \ '../../../include',
    \ '../../../../include',
    \ '../../../include/feeds',
    \ '../../../include/text',
    \ '../../../libs/feedsmisc/include',
    \ '../../../libs/ctoolbox/include',
    \ '../../../libs/twist/include',
    \ '../../../libs/cmicrobase/include',
    \ '../../../libs/fframe/include',
    \ '.']

" Set folding to close all folds on opening .c files
autocmd FileType c set foldmethod=syntax
autocmd FileType c set foldnestmax=1
"autocmd FileType c set foldclose=all

" Python configurations
let g:syntastic_python_checkers = ['pylint']

" Javascript/JSX configurations
let g:syntastic_javascript_checkers = ['eslint']


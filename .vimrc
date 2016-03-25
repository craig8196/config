execute pathogen#infect()

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Turn on line numbers
set number

" Set red column line
set colorcolumn=81
hi ColorColumn ctermbg=red guibg=red

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
    \ '../include',
    \ '../../include',
    \ '../../../include',
    \ '../../../include/feeds']

" Python configurations
let g:syntastic_python_checkers = ['pylint']

" Javascript/JSX configurations
let g:syntastic_javascript_checkers = ['eslint']


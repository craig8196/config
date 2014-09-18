" Makes the tab key insert four spaces.
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Makes shift+tab remove an indent.
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

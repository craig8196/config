"""""""""""""""""""""""""""""""
" Craig's Vimrc Configuration "
"""""""""""""""""""""""""""""""

""" START default recommended settings
set nocompatible
syntax on
set nowrap
set encoding=utf8
""" END default recommended settings


""" START General Remaps
let mapleader=","
""" END General Remaps


""" START Vundle Configuration

" Disable file type for vundle
filetype off

" Set runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Utility
" <leader>b to list buffers, <enter> to select, gb and gB to flip through
" the list.
Plugin 'jeetsukumaran/vim-buffergator'
" Open a directory or press <C-n>
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'godlygeek/tabular'
Plugin 'BufOnly.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'danro/rename.vim'
Plugin 'majutsushi/tagbar'
" I don't think supertab is useful or being used at all.
" Plugin 'ervandew/supertab'
" <leader>ww on windows you want to swap.
Plugin 'wesQ3/vim-windowswap'

" Generic Programming Support
Plugin 'neomake/neomake'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tomtom/tcomment_vim'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
" Don't use vim-autoclose with youcompleteme, causes issue with exiting from
" insert to normal mode, and can be a bit annoying for some things
" Plugin 'townk/vim-autoclose'
" See documentation here: https://vimawesome.com/plugin/surround-vim
Plugin 'tpope/vim-surround'
" Completion and suggestions
Plugin 'valloric/youcompleteme'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Git
Plugin 'tpope/vim-fugitive'

" Writing
Plugin 'reedes/vim-pencil'
" Plugin 'dpelle/vim-LanguageTool'
Plugin 'rhysd/vim-grammarous'

" Markdown
Plugin 'plasticboy/vim-markdown'

" CSS
Plugin 'ap/vim-css-color'


" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()
filetype plugin indent on

""" END Vundle Configuration

""" START Nerdtree Configuration
" Open nerdtree on trying to open directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Shortcut for Nerdtree
map <C-n> :NERDTreeToggle<CR>
" Allow closing vim if nerdtree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Customize arrows if desired
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" Symbols for git status
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ "Ignored"   : "☒",
"    \ "Unknown"   : "?"
"    \ }
""" END Nerdtree Configuration

""" START youcompleteme Configuration
let g:ycm_min_num_of_chars_for_completion=4
""" END youcompleteme Configuration

" Turn on line numbers, relative line numbers, and ruler
" set ruler
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set norelativenumber | endif
augroup END

" Show existing tab with 4 spaces width
" When indenting with '>', use 4 spaces width
" On pressing tab, insert 4 spaces
set tabstop=4 shiftwidth=4 smarttab expandtab

" File specific indentation
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set
autocmd FileType json set tabstop=2|set shiftwidth=2|set
autocmd FileType xml set tabstop=2|set shiftwidth=2|set

" Always display status line
set laststatus=1

" Enable Elite mode
let g:elite_mode=1

" Highlight cursor line
set cursorline

" Set color scheme
" Colors get reset when setting this so we do it first
set t_Co=256
set background=dark

if (has("termguicolors"))
    set termguicolors
endif

let base16colorspace=256
" colorscheme spacegray

" Set 80+ characters column line
set colorcolumn=81
hi ColorColumn ctermfg=red ctermbg=darkgrey

" Create custom commands
" JSON and XML pretty print
" Hex and save as hex
command! -nargs=0 XmlPretty %!xmllint --format %
command! -nargs=0 JsonPretty %!python -m json.tool
command! -nargs=0 Hex %!xxd
command! -nargs=0 HexSave %!xxd -r

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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

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

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

nnoremap <space> za


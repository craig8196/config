""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Craig's Vim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" To get started run the following:
" :VundleInstall
"

" TODO Plugins to review and maybe add:
" Nerdcommenter
" vim gitgutter

" Post plugin installation steps:
" TODO document here

" DO NOT install these plugins (causes conflicts):
" No reason previously documented...
"  Plugin 'ervandew/supertab'
" Conflicts with my inoremap <S-Tab> mapping
"  Plugin 'valloric/youcompleteme'
" Don't use vim-autoclose with youcompleteme, causes issue with exiting from
" insert to normal mode, and can be a bit annoying for some things
"  Plugin 'townk/vim-autoclose'
" Deactivated ultisnips because it interferes with shift tab in visual mode
"  Plugin 'SirVer/ultisnips'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Default Recommended Settings
set nocompatible
syntax on
"set nowrap
set encoding=utf8

""" General Remaps
let mapleader=","

""" Autoreload Settings
augroup myvimrc
    au!
    au BufWritePost .vimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

""" Force Quit
nnoremap <F4> :q!<CR>

""" HEX Settings
" Hex and save as hex
command! -nargs=0 Hex %!xxd
command! -nargs=0 HexSave %!xxd -r

""" Allow space bar to open all folds?
" I don't remember what this is for... why noremap space to za?
" Toggles fold though...
nnoremap <space> za

""" Split Line
" From: github.com/drzel/vim-split-line
" Code was short enough that I didn't want to have to install it...
" Also, I may want/need to tweak it to my liking.
function! SplitLine() abort
  let l:cnum = col('.')
  let l:lnum = line('.')

  if l:cnum == 1
    call append(l:lnum - 1, '')
  else
    let l:line = getline('.')

    let l:first_line = l:line[0:(l:cnum - 2)]
    let l:first_line = RStrip(l:first_line)
    let l:second_line = l:line[(l:cnum - 1):-1]

    call setline(l:lnum, l:first_line)
    call append(l:lnum, l:second_line)

    call cursor(l:lnum + 1, 1)
    normal! ==
  endif
endfunction

function! RStrip(str) abort
  return substitute(a:str, '\s\+$', '', '')
endfunction

command! SplitLine call SplitLine()

nnoremap S :SplitLine<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle Configurations

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
" Will place git characters next to changed/tracked files
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Run :BufOnly to close all buffers but the current one
Plugin 'BufOnly.vim'
" Fuzzy file finder, use <c-p> to invoke
Plugin 'ctrlpvim/ctrlp.vim'
" Rename a file, use :rename[!] {newname}
Plugin 'danro/rename.vim'
" Open sidebar to browse ctags of current file
" nmap <F8> :TagbarToggle<CR>
Plugin 'majutsushi/tagbar'
" I don't think supertab is useful or being used at all.
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
" See documentation here: https://vimawesome.com/plugin/surround-vim
" Simple change surround in normal mode: cs<from><to>
Plugin 'tpope/vim-surround'
" Completion and suggestions
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
else
    " I love this plugin but is often too slow to use effectively.
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
    let g:deoplete#enable_at_startup = 0
endif
Plugin 'honza/vim-snippets'

" Git
Plugin 'tpope/vim-fugitive'

" Writing
" :GrammarousCheck
Plugin 'rhysd/vim-grammarous'

" Markdown
Plugin 'plasticboy/vim-markdown'

" CSS
Plugin 'ap/vim-css-color'

" JSX
" Plugin 'mxw/vim-jsx'

" Typescript
" Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'

" Vue.js
Plugin 'posva/vim-vue'

" YAML
Plugin 'stephpy/vim-yaml'

" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()
filetype plugin indent on

""" END Vundle Configuration

""" START Split Pane Navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
""" END Split Pane Navigation
 
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Tagbar Configuration
nnoremap <F8> :TagbarToggle<CR>

""" youcompleteme Configuration
let g:ycm_min_num_of_chars_for_completion=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic Look-and-Feel Settings
" Turn on line numbers, relative line numbers, and ruler
set ruler
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set norelativenumber | endif
augroup END

" Show existing tab with 4 spaces width
" When indenting with '>', use 4 spaces width
" On pressing tab, insert 4 spaces
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent

" Always display status line
set laststatus=1

" Enable Elite mode
let g:elite_mode=1

" Highlight cursor line
set cursorline

" Highlight search terms
set hlsearch

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
hi ColorColumn ctermfg=Red ctermbg=DarkGrey

" Set Folded Background so the gray isn't too bright
hi Folded guibg=DarkSlateGray
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Deoplete tab configuration
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" : 
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Tab and Shift Tab Mappings
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntastic and AutoCompletion Settings
" Syntastic error iteration shortcuts
nnoremap <F1> :SyntasticToggleMode<CR>
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
    \ '.']

" Python configurations
let g:syntastic_python_checkers = ['pylint']

" Javascript/JSX configurations
let g:syntastic_javascript_checkers = ['eslint']

" Typescript
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Programming Language Specific Settings

""" C Settings
" Set folding
autocmd FileType c set foldmethod=syntax
autocmd FileType c set foldnestmax=2
autocmd FileType c
    \ set tabstop=4|set shiftwidth=4|set autoindent|set smartindent

""" Haskell Settings
autocmd FileType hs
    \ set tabstop=2|set shiftwidth=2|set autoindent|set smartindent

""" HTML/XML/SVG Settings
autocmd FileType html set tabstop=2|set shiftwidth=2
autocmd FileType svg set tabstop=2|set shiftwidth=2
autocmd FileType xml set tabstop=2|set shiftwidth=2

""" JavaScript Settings
autocmd FileType javascript
    \ set tabstop=2|set shiftwidth=2|set autoindent|set smartindent

""" JSON Settings
autocmd FileType json set tabstop=2|set shiftwidth=2
autocmd FileType json command! -nargs=0 JsonPretty %!python3 -m json.tool

""" Markdown Settings
let g:vim_markdown_folding_level = 1
autocmd FileType markdown set conceallevel=2
autocmd FileType md
    \ set tabstop=2|set shiftwidth=2|set autoindent|set smartindent
" Open markdown files with Chrome.
autocmd BufEnter *.md exe
    \ 'noremap <F5> : !/usr/bin/google-chrome "%:p">/dev/null 2>&1 & <CR><CR>'

""" Typescript Settings
autocmd FileType typescript
    \ set tabstop=2|set shiftwidth=2|set autoindent|set smartindent
autocmd FileType typescript let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

""" Vue.js Settings
autocmd FileType vue set tabstop=2|set shiftwidth=2
autocmd FileType vue syntax sync fromstart

""" XML Settings
autocmd FileType xml let g:xml_syntax_folding=1
autocmd FileType xml set tabstop=2|set shiftwidth=2|setlocal foldmethod=syntax
autocmd FileType xml command! -nargs=0 XmlPretty %!xmllint --format %

""" yaml Settings
autocmd FileType yaml
    \ set tabstop=2|set shiftwidth=2|set autoindent|set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

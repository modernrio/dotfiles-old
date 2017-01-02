" 
"  ~/.vimrc
" 

" Use Vim settings, rather than Vi settings
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'triglav/vim-visual-increment'
Plugin 'vim-scripts/a.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/syntastic'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" Filetype detection (required for vundle)
filetype plugin indent on

" Set leader key
let mapleader=","

" Respect modelines
set modeline

" Set font for gvim
if has('gui_running')
	set guifont=Inconsolata Regular:h13
endif

" Powerline
let $PYTHONPATH='/usr/lib/python3.6/site-packages/'
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Folding options
set foldmethod=indent
set nofoldenable

" Automatically read changed files again
set autoread

" Remove delay after pressing <Esc> in insert mode
set noesckeys

" Highlight search results
set hls is

" Set tex flavor to latex
let g:tex_flavor = 'latex'

" Set nrformats to alpha for visual-increment-plugin
set nrformats=alpha,octal,hex

" Do not create a .viminfo
set viminfo=

" Set hybrid number mode (Relative line numbers + Aboslute number line on
" current line)
set relativenumber
set number

" Autoindent on
set autoindent

" Access colors present in 256 colorspace
let base16colorspace=256

" Colorscheme
syntax on
" set background=dark
colorscheme base16-chalk

" Tab regulations
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Limit text width to 72 characters when writing mail
au BufRead /tmp/mutt-* set tw=72

" Limit text width to 80 characters when editing LaTeX
au BufRead *.tex set tw=80

" Limit text width to 100 characters when editing C++ files
au BufRead *.cpp set tw=100
au BufRead *.h set tw=100

" YCM settings
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_show_diagnostics_ui = 0

let g:ycm_python_binary_path='python3'
let g:ycm_autoclose_preview_window_after_insertion = 1

" Vimwiki settings
let g:vimwiki_list = [
	\ {
	\  'path': '~/vimwiki/',
	\  'path_html': '~/vimwiki_html/',
	\ },
	\ ]

let g:tagbar_type_vimwiki = {
	\   'ctagstype':'vimwiki'
	\ , 'kinds':['h:header']
	\ , 'sro':'&&&'
	\ , 'kind2scope':{'h':'header'}
	\ , 'sort':0
	\ , 'ctagsbin':'~/.vim/bundle/vimwiki/vimwiki-utils/vwtags.py'
	\ , 'ctagsargs': 'default'
	\ }

" Tagbar mappings
nmap <leader>t :TagbarToggle<CR>

" Show changes made to the file
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" NERDTree mappings
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Commentmapping for tcomment plugin
map <leader>c <C-_><C-_>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" [Syntastic] Python checker options
let g:syntastic_python_checkers = ['pylint']

" [Syntastic] C++ checker options
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_check_header = 1

" [Syntastic] VHDL checker options
let g:syntastic_vhdl_ghdl_args = "--workdir=work"

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|vdb|aux)$',
  \ }

let g:ctrlp_show_hidden = 1

" Remap default controls for following tags
nnoremap t <C-]>

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" <Ctrl-s> saves the file
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Remap arrow keys to do nothing
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

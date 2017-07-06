" 
"  ~/.vimrc
" 

" Use Vim settings, rather than Vi settings
set nocompatible

" Source .vimrc file if present in present working directory
set exrc

" Restrict usage of some commands in non-default .vimrc files
set secure

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Plug
call plug#begin()

" Dependencies
" (vim-snipmate)
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim' 

" Plugins
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'triglav/vim-visual-increment'
Plug 'vim-scripts/a.vim'
Plug 'vimwiki/vimwiki'
Plug 'neomake/neomake'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --all' }

call plug#end()

" Filetype detection
filetype plugin indent on

" Set leader key
let mapleader=","

" Respect modelines
set modeline

" Set font for gvim
if has('gui_running')
	set guifont="Inconsolata Regular":h13
endif

" Folding options
set foldmethod=indent
set nofoldenable

" Automatically read changed files again
set autoread

" Remove delay after pressing <Esc> in insert mode
if !has('nvim')
	set noesckeys
endif

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Run neomake on every write
autocmd! BufWritePost * Neomake

" Recognise .md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" vimwiki settings
let g:vimwiki_list = [
	\ {
	\  'path': '~/wiki/',
	\  'path_html': '~/wiki/html/',
	\  'syntax': 'markdown',
	\  'ext': '.md',
	\ },
	\ ]

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Show changes made to the file
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" Commentmapping for tcomment plugin
map <leader>c <C-_><C-_>

" YCM settings
let g:ycm_show_diagnostics_ui = 0
let g:ycm_python_binary_path='python3'
let g:ycm_autoclose_preview_window_after_insertion = 1

" neomake settings
let g:neomake_cpp_enabled_makers=['gcc'] " gcc will be translated to g++ by neomake

" pandoc , markdown
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
" Define functions for compiling (pc) and displaying (pp)
function! CompileMD2PDF()
	:execute 'silent !pandoc --from markdown_github -o /tmp/vim-pandoc-out.pdf %'
endfunction

function! DisplayMD2PDF()
	:execute 'silent !zathura /tmp/vim-pandoc-out.pdf &'
endfunction

nmap <Leader>pc :call CompileMD2PDF()<CR>
nmap <Leader>pp :call DisplayMD2PDF()<CR>
" Automatically compile markdown files on write
autocmd BufWritePost *.md :call CompileMD2PDF()

" CtrlP
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

set nocompatible              " be iMproved, required
set encoding=utf-8
filetype plugin indent on                  " required
syntax on

" Init Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" VimWiki

" Set VimWiki to Markdown
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki/', 
            \ 'auto_diary_index': 1,
            \ 'auto_generate_links': 1,
            \ 'syntax': 'markdown',
            \ 'ext': '.md'}]

" Auto generate vim-wiki indices
autocmd FileType vimwiki if expand('%:t') == 'index.md' | execute 'VimwikiGenerateLinks' | endif

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'tyru/open-browser.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'weirongxu/plantuml-previewer.vim'
Plugin 'jclsn/glow.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chazmcgarvey/vim-mermaid'
Plugin 'mcchrish/nnn.vim'
Plugin 'lervag/vimtex'
Plugin 'ionide/Ionide-vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'p0209p/naysayer.vim'
Plugin 'dylon/vim-antlr'
Plugin 'mbbill/undotree'
"Plugin 'puremourning/vimspector'
Plugin 'ap/vim-css-color'

" Vimspector keybindings 
nmap <F5>  <cmd>call vimspector#Launch()<cr>            " Start / continue
nmap <F8>  <cmd>call vimspector#Reset()<cr>             " Stop / reset
nmap <F9>  <cmd>call vimspector#ToggleBreakpoint()<cr>  " Toggle line bp
nmap <F10> <cmd>call vimspector#StepOver()<cr>          " Step over
nmap <F11> <cmd>call vimspector#StepInto()<cr>          " Step in
nmap <F12> <cmd>call vimspector#StepOut()<cr>           " Step out

" Vundle End
call vundle#end()
filetype plugin indent on

filetype plugin indent on
"
set tabstop=4
set shiftwidth=4
set expandtab
set timeout timeoutlen=3000 ttimeoutlen=100

let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

set number


colorscheme naysayer

" Allow odt editing in vim
autocmd BufReadPost *.odt :%!odt2txt %

" Glsl syntax highlighting for vert and frag files
autocmd! BufNewFile,BufRead *.vert,*.frag set ft=glsl

" Syntax highlighting for antlr
au BufRead,BufNewFile *.g4 set filetype=antlr4

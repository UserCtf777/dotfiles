:set relativenumber
:set autoindent
:set tabstop=8
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set nowrap
:set number
:set incsearch
:set autoread
"set autocmd

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
"Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
"Plug 'nvim-telescope/telescope.nvim' " telecope like fuzzy file finder
Plug 'nvim-telescope/telescope-fzf-native.nvim',{ 'do': 'make' } " telecope like fuzzy file finder
"
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

" for markdown editor
Plug 'davidgranstrom/nvim-markdown-preview' " review in the broswer in real time
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " same as above with more glyphs features
" Plugins for bash script
Plug 'vim-scripts/bats.vim'
Plug 'vim-scripts/bash-support.vim'
Plug 'auxiliary/vim-layout'

set encoding=UTF-8

call plug#end()

" key maps edits
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" setting split veiw
:set splitbelow
:set splitright

" User key maps
imap jj <esc>

" kemaps for compiling and running the code
" for CPP
nnoremap cpp :!c++ % -o %:r && %:r:<CR>
" ----
"for C 
nnoremap c :!gcc % -o %:r && %:r:<CR>
" ----
"for Python
nnoremap py :python %<CR>
" ----
" for jaca
nnoremap ,j :!javac % && java %:r<CR>

" for markdownpreview example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle





"""" Filetype-Specific Configuration 
" Markdown and Journal 
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2



" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>

" keymaps for the nerdTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

":colorscheme dracula 
":colorscheme sonokai 
":colorscheme happy_hacking.vim 
":colorscheme snow.vim 

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
":CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
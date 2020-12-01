" vim: set foldmethod=marker foldlevel=0 nomodeline:
" vim-plug {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'broadinstitute/vim-wdl'
Plug 'chrisbra/csv.vim'
Plug 'easymotion/vim-easymotion'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'lfv89/vim-interestingwords'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()
" }}}
"
" Vimjas/vim-python-pep8-indent
" broadinstitute/vim-wdl
" chrisbra/csv.vim
" easymotion/vim-easymotion
" iamcco/markdown-preview.nvim {{{
nmap <Leader>mp <Plug>MarkdownPreviewToggle
" }}}
" lfv89/vim-interestingwords {{{
nnoremap <silent> <Leader>C :call UncolorAllWords()<CR>
nnoremap <silent> <Leader>c :call InterestingWords('n')<CR>
vnoremap <silent> <Leader>c :call InterestingWords('v')<CR>
" }}}
" neoclide/coc.nvim {{{
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent> <expr> <C-Space> coc#refresh()
nnoremap <silent> <nowait> <Space>a :<C-u>CocList diagnostics<CR>
nnoremap <silent> <nowait> <Space>c :<C-u>CocList commands<CR>
nnoremap <silent> <nowait> <Space>e :<C-u>CocList extensions<CR>
nnoremap <silent> <nowait> <Space>o :<C-u>CocList outline<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
set cmdheight=2
set hidden
set nowritebackup
set shortmess+=c
set updatetime=300
" }}}
" sonph/onehalf {{{
let theme = system('defaults read -g AppleInterfaceStyle 2> /dev/null')
if theme == "Dark\n" | colorscheme onehalfdark | else | colorscheme onehalflight | endif
" }}}
" thaerkh/vim-indentguides {{{
let g:indentguides_ignorelist = ['markdown', 'text']
" }}}
" tpope/vim-commentary
" tpope/vim-surround
" vim-airline/vim-airline
"
"
" coc-calc
" coc-clangd
" coc-git
" coc-highlight
" coc-json
" coc-pairs
" coc-python
" coc-r-lsp
" coc-sh
" coc-snippets
" coc-vimlsp
" coc-yank {{{
nnoremap <silent> <Space>y :<C-u>CocList -A --normal yank<CR>
" }}}


" folding
" indent {{{
set copyindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
" }}}
" key mappings {{{
map Y y$
nmap j gj
nmap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>l :set list!<CR> :set list?<CR>
nnoremap <Leader>x :set expandtab!<CR> :set expandtab?<CR>
nnoremap <Space> za
vmap j gj
vmap k gk
" }}}
" misc {{{
set confirm
set nostartofline
set noswapfile
set report=0
set scrolloff=7
set sidescrolloff=7
" }}}
" searching {{{
set ignorecase
set smartcase
" }}}
" ui {{{
highlight Comment gui=italic
set colorcolumn=80
set cursorline
set linebreak
set nomodeline
set number
set relativenumber
set termguicolors
" }}}


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . "" . expand('<cword>')
  endif
endfunction

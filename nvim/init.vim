" +------------------------------------------------------------------------------------------------+
" | Settings                                                                                       |
" +------------------------------------------------------------------------------------------------+
set termguicolors

set encoding=utf8
set updatetime=1000
set exrc " allow per-project configuration

set relativenumber
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set hlsearch
nnoremap <C-n> :nohl<cr>
syntax on
set mouse=a
set nowrap

set autoindent
set tabstop=3
set shiftwidth=3

" Show whitespace characters
set listchars=eol:¬,tab:>·,trail:~,space:·
" set list

set wildignore=*.o,*~,*.pyc,*/node_modules/*,*/.git/*,*.DS_Store,*.min.*,*.swp,*/bin/*,*/obj/*

set splitright
set splitbelow

" Navigate Splits with ctrl-[hjkl]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Arrow Keys Resize Splits
let g:elite_mode=1

if get(g:, 'elite_mode')
    nnoremap <S-Up>    :resize +1<CR>
    nnoremap <S-Down>  :resize -1<CR>
    nnoremap <S-Left>  :vertical resize -1<CR>
    nnoremap <S-Right> :vertical resize +1<CR>
endif

set path+=**

" +------------------------------------------------------------------------------------------------+
" | Initialize Plugins                                                                             |
" +------------------------------------------------------------------------------------------------+
call plug#begin()

Plug 'tpope/vim-surround'

Plug 'preservim/nerdtree'
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
let g:NERDTreeIgnore = ['^bin$', '^obj$']
nmap <leader>nt :NERDTreeToggle<CR>

" Quit if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tpope/vim-sleuth'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

set secure " disable unsafe commands from project specific .vimrc files (unless owned by me)


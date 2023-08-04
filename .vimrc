Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sheerun/vim-polyglot'

call plug#end()


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

set background=dark
colorscheme gruvbox

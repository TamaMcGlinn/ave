" Programming languages
Plug 'TamaMcGlinn/Ada-Bundle'

" Debugging
Plug 'puremourning/vimspector', {
      \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
      \ }

" Undo tree navigation
Plug 'simnalamburt/vim-mundo'

" LSP
Plug 'TamaMcGlinn/nvim-lsp-gpr-selector'
Plug 'TamaMcGlinn/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'

" Code completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" (Un)commenting with gcip / gcc / gc5j
Plug 'tomtom/tcomment_vim'

" Autoformatting
Plug 'Chiel92/vim-autoformat'

" Snippets http://vimcasts.org/episodes/meet-ultisnips/
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Colorscheme
Plug 'morhetz/gruvbox'

" Nicer status line
Plug 'vim-airline/vim-airline'

" Directory viewer
Plug 'justinmk/vim-dirvish'

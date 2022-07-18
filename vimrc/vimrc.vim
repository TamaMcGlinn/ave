source /vimrc/plug_framework.vim " includes plugins.vim

set termguicolors
silent! colorscheme gruvbox
set background=dark

source /vimrc/tabsettings.vim

lua require('custom_lspconfig')

augroup autoformat
  autocmd!
  autocmd BufWrite *.ad[sb] :Autoformat
augroup END

" Show line numbers
set number

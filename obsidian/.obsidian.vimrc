" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
" I like using H and L for beginning/end of line
nmap H ^
nmap L $
" Quickly remove search highlights
nmap <F9> :nohl<CR>

" Yank to system clipboard
set clipboard=unnamed

" Toggle folds
exmap foldtoggle obcommand editor:toggle-fold
nmap za :foldtoggle<CR>

exmap foldless obcommand editor:fold-less
nmap zo :foldless<CR>

exmap foldmore obcommand editor:fold-more
nmap zc :foldmore<CR>

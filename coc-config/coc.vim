" <TAB>누르면 자동완성 팝업 나오도록 함
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" check_back_space 함수정의
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <leader>e 누르면 explorer키고 끄도록 함
nnoremap <silent> <leader>e :CocCommand explorer --toggle --sources=file+<CR>

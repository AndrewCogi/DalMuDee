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
nmap <silent> <leader>e :CocCommand explorer --toggle --sources=file+<CR>
" <leader>E 누르면 ~/에서 키고 끄도록 함
nmap <silent> <leader>E :CocCommand explorer ~ --toggle --sources=file+<CR>

" 오류찾아 이동
" nmap <silent> <Leader>dn <Plug>(coc-diagnostic-next-error)
" nmap <silent> <Leader>dp <Plug>(coc-diagnostic-prev-error)

" better 오류(경고도 포함!!)찾아 이동
try
    nmap <silent> ]c :call CocAction('diagnosticNext')<cr>
    nmap <silent> [c :call CocAction('diagnosticPrevious')<cr>
endtry

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" quickfix list 보여주고 적용가능
nmap <leader>ac  <Plug>(coc-codeaction)
" quickfix command
nmap <leader>qf  <Plug>(coc-fix-current)

" :CocList sources 에서 자동완성에 안나타나게 할것들 뺄수있다!!

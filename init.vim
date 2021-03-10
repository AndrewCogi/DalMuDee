" ================================기본세팅 관리================================
set iskeyword+=-			" 단어로 인정할 문자들 지정(+=-)
syntax on				" 구문강조 하이라이팅 킴
" =============================================================================

" ================================플러그인 관리================================
" vim-plug 자동 설치
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" neovim 시작 시 안깔려있는 플러그인 있으면 설치되도록 하기
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
" =============================================================================

" ================================플러그인 종류================================
call plug#begin('~/.config/nvim/autoload/plugged')

    " 주석처리 플러그인
    " <space>/ 로 주석처리 가능
    Plug 'tpope/vim-commentary'

call plug#end()
" =============================================================================

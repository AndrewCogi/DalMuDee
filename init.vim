" =======================플러그인 관리=======================
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
" ===========================================================

" =======================플러그인 종류=======================
call plug#begin('~/.config/nvim/autoload/plugged')



call plug#end()
" ===========================================================

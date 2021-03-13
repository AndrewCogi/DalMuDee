" ==============================[기본세팅 관리]================================
syntax on																" 구문강조 하이라이팅 킴
set nowrap															" 자동 줄바꿈 안되도록 함
set splitbelow													" 가로로 창 분할 시, 새 창은 아래에 생기도록
set splitright													" 세로로 창 분할 시, 새 창은 오른쪽에 생기도록
set mouse=a															" 마우스 사용가능
set encoding=utf-8											" 인코딩 한글깨짐 방지
set fileencoding=utf-8									" 파일 인코딩 한글깨짐 방지
set cmdheight=2													" --INSERT--나오는 부분 높이 2로 설정
set ruler																" 우측 하단에 커서위치 표시
set number															" 라인번호 표시
set pumheight=10												" 팝업리스트 10개까지 보이도록 함
set autoindent													" 자동 들여쓰기 활성화
set smartindent													" 조금 더 똑똑한 들여쓰기 활성화
set shiftwidth=2												" 자동 들여쓰기 2칸
set smarttab														" 조금 더 똑똑한 탭 활성화
set tabstop=2														" 탭 한번 = 띄어쓰기 2번 설정
set laststatus=2                        " 상태바 표시(항상 표시)
set showmatch														" 괄호쌍 보이기
set cursorline													" 커서있는곳 라인으로 표시해줌
set t_Co=256														" 256색 적용
set noshowmode													" --INSERT-- 안보이게 하기
set nobackup														" 백업파일 안생기도록 함
set nowritebackup												" 백업파일 안생기게 함
set shortmess+=c												" 사용자가 정의한 메세지 숨기기
set updatetime=300											" completion 속도 증가
set timeoutlen=1000											" 타임아웃시간 1초로 지정
set clipboard=unnamedplus								" 복사 붙여넣기 어디든 되도록 함
set autochdir														" 현재 디렉토리를 자동으로 working dir로 설정
set incsearch														" 한글자 입력할때마다 매칭되는부분 알려주도록 함
set hlsearch														" 검색결과에 하이라이트 표시
set showtabline=2												" 무조건적으로 퍼버(열려있는 친구들) 보이도록 하기
" =============================================================================

" ===============================[매핑세팅 관리]===============================
" 리더키 <space>로 설정
let mapleader = " "
" <space>가 매핑으로 사용되는지 체크
nnoremap <space> <Nop>

" normal모드에서 <TAB>누르면 다음버퍼로
nnoremap <silent> <TAB> :bnext<CR>
" normal모드에서 <Shift-TAB>누르면 이전버퍼로
nnoremap <silent> <S-TAB> :bprevious<CR>

" visual모드에서
" shift + k = 그 줄 올리기
" shift + j = 그 줄 내리기
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" <C-s>: :w로 동작하도록
nnoremap <silent> <C-s> :w<CR>
" <C-q>: :wq로 동작하도록
nnoremap <silent> <C-q> :wq<CR>
" <C-c>: <ESC>로 동작하도록
nnoremap <silent> <C-c> <ESC>

" 터미널 분할 창 이동
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" normal모드에서 창 크기 조절
nnoremap <silent> <C-Up>		:resize -2<CR>
nnoremap <silent> <C-Down>	:resize +2<CR>
nnoremap <silent> <C-Left>	:vertical resize -2<CR>
nnoremap <silent> <C-Right>	:vertical resize +2<CR>

" insert모드에서 자동완성 팝업 움직이기
" <TAB> = 다음
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <c-k> = 이전
inoremap <expr> <c-k> ("\<C-p>")

" >>랑 <<후에도 visual block 유지되도록
vnoremap > >gv
vnoremap < <gv
" =============================================================================

" ===============================[플러그인 관리]===============================
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

" ===============================[플러그인 종류]===============================
call plug#begin('~/.config/nvim/autoload/plugged')

  " 주석처리 플러그인
  " <space>/ 로 주석처리 가능
  Plug 'tpope/vim-commentary'
	" 주석처리 시 파일따라 주석문자 알아서 판단
	Plug 'suy/vim-context-commentstring'

	" 테마 플러그인
	Plug 'rafi/awesome-vim-colorschemes'
	" airline테마 플러그인
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" 

call plug#end()
" =============================================================================

" ===========================[(Plug)vim-commentary]============================
" <space>/ : 자동 주석처리
function! Comment()
	if(mode() == "n")
		execute "Commentary"
	else
		execute "'<,'>Commentary"
	endif
endfunction
" gv 붙이면 행동 후에도 전에 선택했던 블럭 다시 선택해줌
nnoremap <silent> <space>/ :call Comment()<CR>
vnoremap <silent> <space>/ :call Comment()<CR> gv
" =============================================================================

" ======================[(Plug)awesome-vim-colorschemes]=======================
" https://github.com/rafi/awesome-vim-colorschemes 에서 골라 사용하면 됨
" colorscheme alduin									" Dark rustic colors
" colorscheme iceberg									" Dark blue color scheme
" colorscheme onedark									" Inspired by Atom's One Dark syntax theme
" colorscheme gruvbox									" Retro groove color scheme
" colorscheme hybrid									" A dark color scheme for vim/gvim
colorscheme lucius									" Lucius color scheme
" colorscheme minimalist							" Darker version of material theme inspired by Sublime Text
" colorscheme molokai									" Molokai color scheme
" colorscheme nord										" An arctic, north-bluish clean and elegant theme
" colorscheme purify									" Clean & vibrant color schemes for Vim, Terminals...
" colorscheme seoul256								" Low-contrast color scheme based on Seoul Colors
" colorscheme sierra									" Dark vintage colors
" colorscheme sonokai									" Vivid and high contrast based on Monokai Pro
" colorscheme tender									" 24bit colorscheme for Vim
" =============================================================================

" ====================[(Plug)vim-airline & airline-themes]=====================
" 탭라인(버퍼)테마구분 활성화
let g:airline#extensions#tabline#enabled = 1

" | 모양으로 airline 설정
let g:airline_powerline_fonts = 0			" 구분자 활성화(0=|)
let g:airline_left_sep = ''						" 왼쪽 구분자(빈칸은 기본값)
let g:airline_right_sep = ''					" 오른쪽 구분자(빈칸은 기본값)
let g:airline_right_alt_sep = ''			" 중간 구분자(빈칸은 기본값)

" 버퍼 보이는 형식 지정(이름과 확장자만 보이도록 했음)
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" airline 레이아웃설정
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'waring', 'error']]

" 레이아웃 section별 설정
let g:airline_section_a = "JNvim2.0"
let g:airline_section_b = '%t'
let g:airline_section_c = '%{getcwd()}'
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1

" tabline버퍼에 close버튼 없애기
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

" ???
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#coc#enabled = 1

" =============================================================================

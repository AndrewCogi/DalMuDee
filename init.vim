" ==============================[기본세팅 관리]================================

syntax on                     		        " 구문강조 하이라이팅 킴
set nowrap			                   		" 자동 줄바꿈 안되도록 함
set splitbelow			               		" 가로로 창 분할 시, 새 창은 아래에 생기도록
set splitright			    	          	" 세로로 창 분할 시, 새 창은 오른쪽에 생기도록
set mouse=a			                  		" 마우스 사용가능
set encoding=UTF-8			            	" 인코딩 한글깨짐 방지
set fileencoding=UTF-8			        	" 파일 인코딩 한글깨짐 방지
set cmdheight=2			              		" --INSERT--나오는 부분 높이 2로 설정
set ruler			                   		" 우측 하단에 커서위치 표시
set number 									" 라인번호 표시
set relativenumber				           	" 거리에 따른 라인번호 표시
set pumheight=10		               		" 팝업리스트 10개까지 보이도록 함
set autoindent				              	" 자동 들여쓰기 활성화
set smartindent		              			" 조금 더 똑똑한 들여쓰기 활성화
set shiftwidth=4		              		" 자동 들여쓰기 4칸
set smarttab				               	" 조금 더 똑똑한 탭 활성화
set tabstop=4			                	" 탭 한번 = 띄어쓰기 4번 설정
set laststatus=2		              		" 상태바 표시(항상 표시)
set showmatch				               	" 괄호쌍 보이기
set t_Co=256			                	" 256색 적용
set noshowmode		              			" --INSERT-- 안보이게 하기
set nobackup			                	" 백업파일 안생기도록 함
set nowritebackup			              	" 백업파일 안생기게 함
set shortmess+=c			              	" 사용자가 정의한 메세지 숨기기
set updatetime=300		            		" completion 속도 증가
set timeoutlen=1000			            	" 타임아웃시간 1초로 지정
set clipboard=unnamedplus			        " 복사 붙여넣기 어디든 되도록 함
set autochdir			                	" 현재 디렉토리를 자동으로 working dir로 설정
set incsearch			                	" 한글자 입력할때마다 매칭되는부분 알려주도록 함
set hlsearch		                		" 검색결과에 하이라이트 표시
set showtabline=2	              			" 무조건적으로 퍼버(열려있는 친구들) 보이도록 하기
set signcolumn=yes:1           				" 왼쪽 숫자 padding 거리
set hidden                       		    " 버퍼저장안하고도 다른버퍼 이동가능
set termguicolors             		        " colorscheme 색상 그대로 적용되도록 함

" =============================================================================


" ===============================[매핑세팅 관리]===============================

" 리더키 <space>로 설정
let mapleader = " "
" <space>가 매핑으로 사용되는지 체크
nnoremap <space> <Nop>

" normal모드에서 <TAB>누르면 다음버퍼로
nmap <silent> <TAB> :bnext<CR>

" visual모드에서
" shift + k = 그 줄 올리기
" shift + j = 그 줄 내리기
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> J :move '>+1<CR>gv-gv

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
nnoremap <silent> <C-Up>	:resize -2<CR>
nnoremap <silent> <C-Down>	:resize +2<CR>
nnoremap <silent> <C-Left>	:vertical resize -2<CR>
nnoremap <silent> <C-Right>	:vertical resize +2<CR>

" insert모드에서 자동완성 팝업 움직이기
" <TAB> = 다음
" <c-k> = 이전
inoremap <expr> <c-k> ("\<C-p>")

" >>랑 <<후에도 visual block 유지되도록
vnoremap > >gv
vnoremap < <gv

" <leader>. : init.vim 키기
nnoremap <silent> <leader>. :e $MYVIMRC<CR>
" <leader>n : highlight 지우기
nnoremap <silent> <leader>n :let @/ = ""<CR>
" terminal 실행
" TODO: gdb / pdb 사용을 위함
nmap <silent><leader>t. :sp<CR>:terminal<CR>i

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

" airline에 시계 추가하는 플러그인
Plug 'enricobacis/vim-airline-clock'

" 날짜 빠르게 바꿔주는 플러그인
" ex: 2021-08-09 에 커서를 대고 <C-a>, <C-x> 로 날짜 증감가능
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'

" f,F,t,T 사용 시 이동단어 하이라이트해줌
Plug 'unblevable/quick-scope'

" 간단한 커맨드 사용으로 단어이동하는 플러그인
Plug 'easymotion/vim-easymotion'

" 여러가지 기호로 단어 감싸는 커맨드 플러그인
Plug 'tpope/vim-surround'

" 터미널을 nvim theme과 같이 사용하게 해주는 플러그인
Plug 'edkolev/promptline.vim'

" root에서 nvim켜도 여기설정 따라가게 해주는 플러그인
Plug 'airblade/vim-rooter'

" syntax support 플러그인(cpp,python,java)
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-python/python-syntax'
Plug 'uiiaoo/java-syntax.vim'

" vim 아이콘 플러그인
" 나중에 데스크탑에서 해보기로
" Plug 'ryanoasis/vim-devicons'
" Plug 'bryanmylee/vim-colorscheme-icons'

" 괄호쌍 자동매칭해주는 플러그인
Plug 'jiangmiao/auto-pairs'

" HTML등 <??></??>자동적으로 닫아주는 플러그인
Plug 'alvan/vim-closetag'

" Intelliscence
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" buffer 관리하는 플러그인
Plug 'romgrk/barbar.nvim'

" Floating Window 지원해주는 플러그인
Plug 'kevinhwang91/rnvimr'

" fzf 플러그인
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" :Rg +fzf 해주는 플러그인
Plug 'wookayin/fzf-ripgrep.vim'

" terminal in neovim 플러그인
Plug 'voldikss/vim-floaterm'

" 함수 및 변수 리스트 보여주는 플러그인   
Plug 'liuchengxu/vista.vim'

" 내가 고쳤던 과거기록 보여주는 플러그인
Plug 'mbbill/undotree'

" smooth move
Plug 'psliwka/vim-smoothie'

" Git 플러그인 세트
" git diff 보여주는 플러그인(어디가 바뀌었는지 라인별로 보여준다)
Plug 'airblade/vim-gitgutter'
" git wrapper 플러그인(nvim에서 git add, commit, push 등 가능하게 함)
Plug 'tpope/vim-fugitive'
" 누가 언제 commit한 내용인지 보여주는 플러그인
Plug 'rhysd/git-messenger.vim'
" git commit 디테일 모두 보여주는 플러그인
Plug 'int3/vim-extradite'

" 창 위치 <leader>ww로 변경해주는 플러그인
Plug 'wesQ3/vim-windowswap'

" 시작화면 플러그인
Plug 'mhinz/vim-startify'

" 컴파일, 실행 툴
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" 화면 확장 플러그인
Plug 'szw/vim-maximizer'

" 추후에 도전해볼 가치 있는 플러그인들
" Plug 'honza/vim-snippets' -> 쉬운 자동완성
" Plug 'mattn/emmet-vim' -> 빠른 html, css코딩
" Plug 'iamcco/markdown-preview.nvim' -> 실시간 html코딩

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
nnoremap <silent> <leader>/ :call Comment()<CR>
vnoremap <silent> <leader>/ :call Comment()<CR>

" =============================================================================


" ====================[(Plug)vim-airline & airline-themes]=====================

" 탭라인(버퍼)테마구분 활성화
let g:airline#extensions#tabline#enabled = 1

" airline 설정
let g:airline_powerline_fonts = 0		  	" 구분자 활성화(0=|, 1=>)
" let g:airline_left_sep = ''						" 왼쪽 구분자(빈칸은 기본값=0)
" let g:airline_right_sep = ''					" 오른쪽 구분자(빈칸은 기본값=0)
" let g:airline_right_alt_sep = ''			" 중간 구분자(빈칸은 기본값=0)

" 버퍼 보이는 형식 지정(이름과 확장자만 보이도록 했음)
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" airline 레이아웃설정
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['y', 'z']]

" 레이아웃 section별 설정
let g:airline_section_a = "JNvim2.0"
let g:airline_section_b = '%t'
let g:airline_section_c = '%{getcwd()}'
let g:webdevicons_enable_airline_tabline = 1

" tabline버퍼에 close버튼 없애기
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

" extension options
" let g:airline_extensions = ['branch', 'hunks', 'coc']
" let g:airline#extensions#tabline#buffers_label = ''
" let g:airline#extensions#tabline#tabs_label = ''
" let g:airline#extensions#coc#enabled = 1

" =============================================================================


" ========================[(Plug)vim-airline-clock]==========================

" airline 시계 format
let g:airline#extensions#clock#format = '%H:%M:%S'
" updatetime
let g:airline#extensions#clock#updatetime = 1000

" =============================================================================


" ============================[(Plug)quick-scope]==============================

" 하이라이팅 활성화 키 설정
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" 하이라이팅 색 및 언더바 설정
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#eF5F70' gui=underline ctermfg=81 cterm=underline
" 표시갯수 최대치
let g:qs_max_chars=150

" =============================================================================


" ============================[(Plug)easy motion]==============================

" 기본 키바인딩 -> 필요한것만 세팅
nmap <leader>s <Plug>(easymotion-overwin-f2)
nmap <leader>jj <Plug>(easymotion-j)
vmap <leader>jj <Plug>(easymotion-j)
nmap <leader>kk <Plug>(easymotion-k)
vmap <leader>kk <Plug>(easymotion-k)
" map <leader> <Plug>(easymotion-prefix)

" [ 이정도만 숙지하자 ]

" j: 아랫줄 위치 선택하여 이동
" k: 윗줄 위치 선택하여 이동
" s: 추가단어 하나더 입력 후 그 단어 찾아 이동

" =============================================================================


" ==============================[(Plug)surround]===============================

" ref) https://github.com/tpope/vim-surround/blob/master/doc/surround.txt

" [ 이정도만 숙지하자 ]

" ys: ( you surround )
" yss?: ?로 그 줄을 감싼다. ( <로 시작해서 html처럼 감싸기 가능! )
" ysiw?: ?로 그 단어를 감싼다.

" ds: ( delete surround )
" ds?: ?로 감싸져있던거 지운다.
" dst: <p>같은 html문을 지울 수 있다.

" cs: ( change surround )
"
" cs?!: ?를 !로 바꾼다.
" cst?: html문을 ?로 바꾼다.

" visual모드로 블록잡고 S눌러서 그만큼만 커버쳐줌
xmap S VSurround

" =============================================================================


" ============================[(Plug)promptline]===============================

" 프롬프트 테마 airline 테마랑 같도록 함.
let g:promptline_theme = 'airline'

" section별 보여줄 것들 설정
" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
			\'a' : [ promptline#slices#user() ],
			\'b' : [  promptline#slices#python_virtualenv() ],
			\'c' : [ promptline#slices#cwd() ],
			\'y' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
			\'warn' : [ promptline#slices#last_exit_code() ]}

" TODO .promptline.sh 생성 및 적용하기
" ref) https://github.com/edkolev/promptline.vim
" :w
" :source %
" :PromptlineSnapshot! ~/.promptline.sh
" :q
" .bashrc 들어가서 'source ~/.promptline.sh'추가
" sudo reboot now

" =============================================================================


" =============================[(Plug)vim-rooter]==============================

" vim-rooter가 project directory echo하는거 끄기(조용히 바뀜)
let g:rooter_silent_chdir = 1
" rooter위치로 삼을 위치에 있는 파일
let g:rooter_patterns = ['.git', 'gradlew']

" =============================================================================


" =====================[(Plug)vim-cpp-enhanced-highlight]======================

" highlight settings (default: disable)
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1

" =============================================================================


" ============================[(Plug)python-syntax]============================

" enable all highlights
let python_highlight_all = 1

" =============================================================================


" ===========================[(Plug)java-syntax.vim]============================

" disable variable,delimiter highlights
highlight link javaIdentifier NONE
highlight link javaDelimiter NONE

" =============================================================================


" ============================[(Plug)vim-closetag]=============================

" <foo| 에서 >누르면 <foo></foo>가 된다
" 한번 더 >누르면 <foo><enter+indent></foo>가 된다
" close tags 플러그인 적용시킬 파일타입 설정
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'

" =============================================================================


" ========================[(Plug)coc & coc-extension]==========================

" coc configuration 적용
source $HOME/.config/nvim/coc-config/coc.vim
" 자동 설치될 coc-extensions 리스트 (설치되어있지 않다면 자동 설치되도록 함)
source $HOME/.config/nvim/coc-config/coc-extensions.vim

" =============================================================================


" ======================[(Plug)awesome-vim-colorschemes]=======================

" https://github.com/rafi/awesome-vim-colorschemes 에서 골라 사용하면 됨
" colorscheme alduin                    " Dark rustic colors
" colorscheme iceberg                   " Dark blue color scheme
colorscheme onedark                   " Inspired by Atom's One Dark syntax theme
" colorscheme gruvbox                   " Retro groove color scheme
" colorscheme hybrid                    " A dark color scheme for vim/gvim
" colorscheme lucius                    " Lucius color scheme
" colorscheme minimalist                " Darker version of material theme inspired by Sublime Text
" colorscheme molokai                   " Molokai color scheme
" colorscheme nord                      " An arctic, north-bluish clean and elegant theme
" colorscheme seoul256                  " Low-contrast color scheme based on Seoul Colors
" colorscheme sierra                    " Dark vintage colors
" colorscheme tender                    " 24bit colorscheme for Vim
" colorscheme sonokai                   " Vivid and high contrast based on Monokai Pro

" =============================================================================


" ===============================[(Plug)barbar]================================

let bufferline = {}

" Show a shadow over the editor in buffer-pick mode
let bufferline.shadow = v:true

" Show animation over the editor opened/closed
let bufferline.animation = v:true

" Enable/disable icons
let bufferline.icons = v:false

" Enables/disable clickable tabs
let bufferline.clickable = v:true

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters = 
			\ 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'

let bg_current = get(nvim_get_hl_by_name('Normal',     1), 'background', '#000000')
let bg_visible = get(nvim_get_hl_by_name('TabLineSel', 1), 'background', '#000000')
let bg_inactive = get(nvim_get_hl_by_name('TabLine',   1), 'background', '#000000')

" For the current active buffer
hi default link BufferCurrent      Normal
" For the current active buffer when modified
hi default link BufferCurrentMod   Normal
" For the current active buffer icon
hi default link BufferCurrentSign  Normal
" For the current active buffer target when buffer-picking
exe 'hi default BufferCurrentTarget   guifg=red gui=bold guibg=' . bg_current

" For buffers visible but not the current one
hi default link BufferVisible      TabLineSel
hi default link BufferVisibleMod   TabLineSel
hi default link BufferVisibleSign  TabLineSel
exe 'hi default BufferVisibleTarget   guifg=red gui=bold guibg=' . bg_visible

" For buffers invisible buffers
hi default link BufferInactive     TabLine
hi default link BufferInactiveMod  TabLine
hi default link BufferInactiveSign TabLine
exe 'hi default BufferInactiveTarget   guifg=red gui=bold guibg=' . bg_inactive

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = '⤬'
let bufferline.icon_close_tab_modified = '◎'

" For the shadow in buffer-picking mode
hi default BufferShadow guifg=#000000 guibg=#000000

nnoremap <silent> <leader>b> :BufferMoveNext<CR>
nnoremap <silent> <leader>b< :BufferMovePrevious<CR>

nnoremap <silent> <leader>b1 :BufferGoto 1<CR>
nnoremap <silent> <leader>b2 :BufferGoto 2<CR>
nnoremap <silent> <leader>b3 :BufferGoto 3<CR>
nnoremap <silent> <leader>b4 :BufferGoto 4<CR>
nnoremap <silent> <leader>b5 :BufferGoto 5<CR>
nnoremap <silent> <leader>b6 :BufferGoto 6<CR>
nnoremap <silent> <leader>b7 :BufferGoto 7<CR>
nnoremap <silent> <leader>b8 :BufferGoto 8<CR>
nnoremap <silent> <leader>b9 :BufferGoto 9<CR>

nnoremap <silent> <leader>bd :BufferDelete<CR>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bb :Buffers<CR>

" =============================================================================


" ==============================[(Plug)rnvimr]=================================

" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
let g:rnvimr_draw_border = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 1

" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'
" \ --cmd="set draw_borders separators"'

let g:rnvimr_layout = { 'relative': 'editor',
			\ 'width': float2nr(round(0.6 * &columns)),
			\ 'height': float2nr(round(0.6 * &lines)),
			\ 'col': float2nr(round(0.2 * &columns)),
			\ 'row': float2nr(round(0.2 * &lines)),
			\ 'style': 'minimal' }

let g:rnvimr_presets = [
			\ {'width': 0.800, 'height': 0.800}]

nmap <silent> <leader>r :RnvimrToggle<CR>

" =============================================================================


" ================================[(Plug)fzf]==================================

" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
			\           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
			\   <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --line-number '.shellescape(<q-args>), 0,
			\   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

map <silent> <leader>p :Files <CR>
map <silent> <leader>P :Files ~<CR>
nnoremap <silent> <leader>rg :RgFzf<CR>

" =============================================================================


" ===========================[(Plug)vim-floaterm]==============================

" float terminal 실행 및 숨김 (종료는 <C-d>)
let g:floaterm_keymap_toggle = '<leader>to'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" =============================================================================


" ==============================[(Plug)vista]==================================

let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 0

" Vista 혼자 열려있다면 자동 닫기
autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif

nnoremap <silent> <leader>vio :Vista<CR>
nnoremap <silent> <leader>vix :Vista!<CR>
nnoremap <silent> <leader>vf :Vista finder<CR>

" 변수에 대보고 p누르면 팝업으로 미리보기

" =============================================================================


" ===========================[(Plug)undotree]==================================

nnoremap <silent> <leader>u :UndotreeToggle<CR>

" =============================================================================


" ===========================[(Plug)gitgutter]=================================

let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_removed            = 'x'
let g:gitgutter_sign_removed_first_line = 'x'
let g:gitgutter_sign_modified_removed   = '▎'
let g:gitgutter_preview_win_floating = 1

let g:gitgutter_enabled = 1

highlight GitGutterAdd    guifg=#587C0C ctermfg=2
highlight GitGutterChange guifg=#0C7D9D ctermfg=3
highlight GitGutterDelete guifg=#94151B ctermfg=1

" 달라진 부분 찾아가는 키세팅
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

" 달라진 부분 add 시킨다
nmap ghs <Plug>(GitGutterStageHunk)
" 달라진 부분 원래대로 돌려놓는다
nmap ghu <Plug>(GitGutterUndoHunk)
" 어떻게 달라졌는지 preview한다
nmap ghp <Plug>(GitGutterPreviewHunk)

" =============================================================================


" =========================[(Plug)git-fugitive]================================

" git status,add,commit,push commands
nmap ght :Git status<CR>
nmap gha :Git add %<CR>
nmap ghc :Git commit -m 
nmap ghP :Git push<CR>

" =============================================================================


" ============================[(Plug)git-messenger]============================

" 매핑 보이는 용도로 적어둔것
nmap <silent> <leader>gm : commit 팝업 열고 닫는다. 

" =============================================================================


" ============================[(Plug)vim-extradite]============================

nmap <silent> <leader>gv :Extradite!<CR>

" =============================================================================


" ===========================[(Plug)vim-windowswap]============================

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" =============================================================================


" =============================[(Plug)vim-startify]============================

let g:startify_custom_header = [
			\'    ____              ___                      ____                           ',
			\'   /\  _`\           /\_ \    /`\_/`\         /\  _`\                         ',
			\'   \ \ \/\ \     __  \//\ \  /\      \  __  __\ \ \/\ \     __     __         ',
			\'    \ \ \ \ \  /`__`\  \ \ \ \ \ \__\ \/\ \/\ \\ \ \ \ \  /`__`\ /`__`\       ',
			\'     \ \ \_\ \/\ \L\.\_ \_\ \_\ \ \_/\ \ \ \_\ \\ \ \_\ \/\  __//\  __/       ',
			\'      \ \____/\ \__/.\_\/\____\\ \_\\ \_\ \____/ \ \____/\ \____\ \____\      ',
			\'       \/___/  \/__/\/_/\/____/ \/_/ \/_/\/___/   \/___/  \/____/\/____/      ',
			\]

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
			\ { 'type': 'files',     'header': ['   Files']                        },
			\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
			\ ]

let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 0

let g:startify_bookmarks = [
			\ { 'i': '~/.config/nvim/init.vim' },
			\ { 'r': '~/.config/nvim/README.md' },
			\ { 'b': '~/.bashrc' },
			\ { 'c': '~/.config/nvim/coc-config/coc.vim' },
			\ ]
" Goto main buffer
nmap <silent> <leader>bh :Startify<CR>

" =============================================================================


" ==============================[(Plug)Asynctasks]=============================

let g:asyncrun_open = 10
let g:asynctasks_term_pos = 'bottom'
" let g:asynctasks_term_pos = 'top'
" let g:asynctasks_term_pos = 'tab'
" let g:asynctasks_term_pos = 'external'
let g:asynctasks_extra_config = ['~/.config/nvim/tasks.ini']
" let current_tasks = asynctasks#list("")

" 단축키지정
nmap <silent> <leader>ko :copen<CR>
nmap <silent> <leader>kx :cclose<CR>
nmap <silent> <leader>kc :w<CR>:AsyncTask file-compile<CR>
nmap <silent> <leader>kr :AsyncTask file-run<CR>
nmap <silent> <leader>kb :w<CR>:AsyncTask project-build<CR>
nmap <silent> <leader>kR :w<CR>:AsyncTask project-run<CR>
nmap <silent> <leader>kn :cnext<CR>
nmap <silent> <leader>kp :cprevious<CR>

" Available Variables
" $(VIM_FILEPATH)    # File name of current buffer with full path.
" $(VIM_FILENAME)    # File name of current buffer without path.
" $(VIM_FILEDIR)     # Full path of current buffer without the file name.
" $(VIM_FILEEXT)     # File extension of current buffer.
" $(VIM_FILETYPE)    # File type (value of &ft in vim)
" $(VIM_FILENOEXT)   # File name of current buffer without path and extension.
" $(VIM_PATHNOEXT)   # Current file name with full path but without extension.
" $(VIM_CWD)         # Current directory (which :pwd returns).
" $(VIM_RELDIR)      # File path relativize to current directory.
" $(VIM_RELNAME)     # File name relativize to current directory.
" $(VIM_ROOT)        # Project root directory.
" $(VIM_CWORD)       # Word under cursor.
" $(VIM_CFILE)       # File name under cursor.
" $(VIM_CLINE)       # Cursor line number in current buffer
" $(VIM_GUI)         # has('gui_runnin')?
" $(VIM_VERSION)     # Value of v:version.
" $(VIM_COLUMNS)     # Current screen width.
" $(VIM_LINES)       # Current screen height.
" $(VIM_SVRNAME)     # Value of v:servername.
" $(VIM_PRONAME)     # Name of current project root directory
" $(VIM_DIRNAME)     # Name of current directory
" $(VIM_INIFILE)     # Full path name of current ini (.tasks) file.
" $(VIM_INIHOME)     # Where the ini file locates.

" =============================================================================


" =============================[(Plug)coc-snippets]============================

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" <c-j>누르면 다음 고칠 곳으로 이동
" let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" <c-k>누르면 이전 고칠 곳으로 이동
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" insert mode에서 <c-j>누르면 snippets가능한 아이들 보여주고, 그 단어랑 
" 똑같이 입력한 다음 <c-j>누르면 expanding되도록 함
imap <C-j> <Plug>(coc-snippets-expand-jump)

" =============================================================================


" ============================[(Plug)vim-maximizer]============================

nmap <silent><leader>m :MaximizerToggle<CR>

" =============================================================================


" =============================[(Plug)python-syntax]===========================

let g:python_highlight_all = 1

" =============================================================================

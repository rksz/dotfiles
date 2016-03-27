call plug#begin('~/.cache/vim-plug')
Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'flazz/vim-colorschemes'
Plug 'itchyny/landscape.vim'
Plug 'gcmt/wildfire.vim'
Plug 'h1mesuke/vim-alignta', { 'on': 'Alignta' }
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-replace', { 'on': '<Plug>(operator-replace)' }
Plug 'kana/vim-operator-user'
" Plug 'kana/vim-textobj-user'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'scrooloose/nerdcommenter', { 'for': [ 'vim', 'go', 'php'] }
Plug 't9md/vim-quickhl', { 'on': '<Plug>(quickhl-manual-this)' }
" Plug 'thinca/vim-quickrun'
" Plug 'thinca/vim-ref'
" Plug 'tpope/vim-fugitive', { 'on': ['Gdiff', 'Glog' ] }
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'ujihisa/unite-colorscheme'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTree' ]}
Plug 'scrooloose/syntastic', { 'for': [ 'go', 'php'] }
call plug#end()

" nvim configure https://github.com/neovim/neovim/issues/2048
nmap <BS> <C-W>h
" autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
"========================================
" BASE
"========================================
let mapleader = ","                 " キーマップリーダー
set scrolloff=5                     " スクロール時の余白確保
set textwidth=0                     " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                        " バックアップ取らない
set autoread                        " 他で書き換えられたら自動で読み直す
set noswapfile                      " スワップファイル作らない
" set nowrap
set hidden                          " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start      " バックスペースでなんでも消せるように
set formatoptions=lmoq              " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                        " ビープをならさない
set browsedir=buffer                " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]       " カーソルを行頭、行末で止まらないようにする
set showcmd                         " コマンドをステータス行に表示
set showmode                        " 現在のモードを表示
set viminfo='50,<1000,s100,\"50     " viminfoファイルの設定
set modelines=0                     " モードラインは無効
set nrformats=alpha                 " 数値を全て10進数としてインクリメントする
set clipboard+=unnamed              " OSのクリップボードを使用する
set clipboard=unnamed               "ヤンクした文字は、システムのクリップボードに入れる"
set shortmess+=I

command! Ev edit $MYVIMRC           " Ev/Rvでvimrcの編集と反映
command! Rv source $MYVIMRC         " Ev/Rvでvimrcの編集と反映
set helpfile=$VIMRUNTIME/doc/help.txt " Japanese help files
filetype plugin on                  " ファイルタイプ判定をon
let OSTYPE=system('uname')          " OSTypeの判定
command! -nargs=0 CdCurrent %:p:h    " カレントディレクトリに移動コマンド
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

nnoremap <silent> <Space>cd :CD<CR> " Change current directory.
nnoremap <silent> <Space>e :e!<CR>  " Reload file buffer
nnoremap <silent> <Space>r :Rd<CR>  " Remove dust

let $TODAY=strftime('%Y%m%d')
set undodir=/tmp


"========================================
" COLOR
"========================================
" colorscheme jellybeans
" colorscheme monokai
" colorscheme burnttoast256
colorscheme landscape
" colorscheme iceberg
let edark_current_line=1
let edark_ime_cursor=1
let edark_insert_status_line=1
syntax enable
highlight PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

"========================================
" COMPLETION
"========================================
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加
cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down> <C-n>

"========================================
" Skeleton
"========================================
autocmd BufNewFile *.sh  0r ~/.config/nvim/skeleton/skeleton.sh
autocmd BufNewFile *.pl  0r ~/.config/nvim/skeleton/skeleton.perl
autocmd BufNewFile *.php 0r ~/.config/nvim/skeleton/skeleton.php


"========================================
" SEARCH
"========================================
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
nmap <ESC><ESC> :nohlsearch<CR><ESC>
nnoremap <C-j> :nohlsearch<CR><ESC>

"========================================
" TAGS
"========================================
if has("autochdir")
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

set notagbsearch
nnoremap t  <Nop>
nnoremap T  <C-]>
nnoremap tt  :<C-u>pop<CR>
nnoremap tj  :<C-u>tag<CR>
nnoremap tl  :<C-u>tags<CR>

"========================================
" VIEW
"========================================
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set display=uhex      " 印字不可能文字を16進数で表示
set foldmethod=marker " folding
set lazyredraw        " コマンド実行中は再描画しない
set ttyfast           " 高速ターミナル接続を行う
set cursorline        " カーソル行をハイライト
set colorcolumn=80
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set laststatus=2      " 常にステータスラインを表示
set ruler             " カーソルが何行目の何列目に置かれているかを表示する
set statusline=%F%m%r%h%w

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"========================================
" EDIT
"========================================
set expandtab              " Tabキーを空白に変換
set noimdisable            " insertモードを抜けるとIMEオフ
set iminsert=0 imsearch=0
set noimcmdline
au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4 nolist

" escape mapping
inoremap jj <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
nnoremap <Space>S :%s!
nnoremap <Space>s /
nnoremap f /

nnoremap Y y$
" nnoremap V v$h
command! Pt :set paste!

function! s:remove_dust()
    let cursor = getpos(".")
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction
command! Rd :call s:remove_dust()

inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d (%a)')
inoremap <expr> ,dt strftime('%H:%M:%S')

autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

nnoremap <Space>w :w<CR>

inoreabbrev dk ========================================
inoreabbrev dj ------------------------------

" buffer control
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
" nnoremap <C-d> :bd<CR>

" window
nnoremap <C-w><C-w> :wincmd =<CR>  " automatic window resize

" file path yank
nnoremap yr :let @*=expand("%")<CR>
nnoremap yp :let @*=expand("%:p")<CR>
nnoremap M :! open %:p -a Atom<CR>

nnoremap <Space>t :tabnew<CR>
nnoremap <Space>q :q!<CR>
nnoremap ` :qa!<CR>
nnoremap <Space>n gt
nnoremap <Space>p gT

"========================================
" INDENT
"========================================
set autoindent
set smartindent
set cindent
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  filetype plugin on "ファイルタイプの検索を有効にする
  filetype indent on "そのファイルタイプにあわせたインデントを利用する
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType go         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif


"========================================
" Move
"========================================
set virtualedit+=block " 矩形選択で自由に移動する
nnoremap <Space>h ^
nnoremap <Space>l $
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif " 前回終了したカーソル行に移動
nnoremap ( %
nnoremap ) %
vnoremap v $h
" nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" enabled cursor key
nnoremap OA gi<Up>
nnoremap OB gi<Down>
nnoremap OC gi<Right>
nnoremap OD gi<Left>


"========================================
" Encodings
"========================================
set ffs=unix,dos,mac
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
autocmd FileType js    :set fileencoding=utf-8
autocmd FileType css   :set fileencoding=utf-8
autocmd FileType html  :set fileencoding=utf-8
autocmd FileType xml   :set fileencoding=utf-8
autocmd FileType java  :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown


"========================================
" Vim-Plugins
"========================================
let g:deoplete#enable_at_startup = 1

" Enable omni completion.
autocmd FileType c             setlocal omnifunc=ccomplete#Complete
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php           setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

"------------------------------
" NERD_commenter.vim
"------------------------------
let NERDSpaceDelims = 1
let NERDShutUp=1
map <Leader>x ,c<space>

"------------------------------
" Fugitive.vim
"------------------------------
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>

"------------------------------
" unite.vim
"------------------------------
nnoremap    [unite]   <Nop>
nmap     <Space>f [unite]
" nmap     f [unite]
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 200
let g:unite_split_rule = "belowright"
let g:neomru#file_mru_limit = 2000

nnoremap [unite]U                 :<C-u>Unite -no-split<Space>
" nnoremap <silent> [unite]a        :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" nnoremap <silent> [unite]f        :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]f        :<C-u>Unite file_rec<CR>
nnoremap <silent> [unite]b        :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]u        :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> [unite]h        :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c        :<C-u>Unite colorscheme<CR>
nnoremap <silent> [unite]d        :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]o        :<C-u>Unite -vertical -no-quit -winwidth=40 outline<CR>
nnoremap <silent> m               :<C-u>Unite file_mru<CR>
nnoremap <silent> <C-o>           :<C-u>Unite file_mru<CR>
nnoremap <silent> <C-i>           :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]a        :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> ,a              :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ca             :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

nnoremap <silent> <Leader>g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <Leader>s  :<C-u>Unite line<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap     <buffer> <ESC>          <Plug>(unite_exit)
  nmap     <buffer> <C-j>          <Plug>(unite_exit)
  imap     <buffer> jj             <Plug>(unite_insert_leave)
  nnoremap <silent> <buffer>       <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap     <buffer> <C-w>          <Plug>(unite_delete_backward_path)
  " nnoremap <silent> <buffer><expr> <C-l> unite#do_action('split')
  " inoremap <silent> <buffer><expr> <C-l> unite#do_action('split')
  " nnoremap <silent> <buffer><expr> <C-v> unite#do_action('vsplit')
  " inoremap <silent> <buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent> <buffer><expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer><expr> <C-l> unite#do_action('vsplit')
endfunction

" "------------------------------
" " quickrun.vim
" "------------------------------
" let g:quickrun_config = {}
"
" "------------------------------
" " Pydiction
" "------------------------------
" let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
" let g:quickrun_config.markdown = {
"       \ 'outputter' : 'null',
"       \ 'command'   : 'open',
"       \ 'cmdopt'    : '-a',
"       \ 'args'      : 'Marked\ 2',
"       \ 'exec'      : '%c %o %a %s',
"       \ }
" let g:quickrun_config.mkd = {
"       \ 'outputter' : 'null',
"       \ 'command'   : 'open',
"       \ 'cmdopt'    : '-a',
"       \ 'args'      : 'Marked\ 2',
"       \ 'exec'      : '%c %o %a %s',
"       \ }

"------------------------------
" Syntastic
"------------------------------
let g:syntastic_enable_signs = 1        " エラー行をsignで表示する
let g:syntastic_enable_highlighting = 1 " 可能ならhighligt表示する
let g:syntastic_auto_jump = 2
let g:syntastic_php_checkers = ['php']

"------------------------------
" NERD-Tree.vim
"------------------------------
nnoremap <silent> <Leader>N :CD<CR>:NERDTree<CR>
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
" let g:NERDTreeWinPos = "right"
" let NERDTreeShowBookmarks=1
" let NERDTreeShowHidden=1

"------------------------------
" easyalign
"------------------------------
vmap E <Plug>(EasyAlign)
vmap <Space> <Plug>(EasyAlign)

"------------------------------
" operator replace
"------------------------------
map R <Plug>(operator-replace)

"------------------------------
" quickhl
"------------------------------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"------------------------------
" wildfire
"------------------------------
let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'it', 'ii', 'ip', 'i>']

"------------------------------
" alignta
"------------------------------
vmap a :Alignta

"------------------------------
" Go
"------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

set t_Co=256
:let g:html_indent_inctags = "html,body,head,tbody"

map <leader>h :set ft=html<CR>
map <leader>p :set ft=php<CR>

"------------------------------
" Nerdtree
"------------------------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <Space>' ciW'<c-r>"'<esc>
vmap <space>' c'<c-r>"'<esc>

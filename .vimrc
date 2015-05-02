"========================================
" NeoBundle
"========================================
if !1 | finish | endif
if has('vim_starting')
 if &compatible
   set nocompatible
 endif
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Edit ------------------------------
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-niceblock'
NeoBundle 'gcmt/wildfire.vim'
" NeoBundle 'ervandew/supertab'
" Support ---------------------------
NeoBundle     't9md/vim-quickhl'
NeoBundle     'Shougo/neocomplete'
" NeoBundle     'cecutil'
" NeoBundle     'jceb/vim-hier'
" NeoBundle     'rhysd/clever-f.vim'
NeoBundle     'thinca/vim-quickrun'
NeoBundle     'thinca/vim-ref'
NeoBundle     'Shougo/unite.vim' , { 'autoload' : { 'commands' : [ 'Unite' ] } }
NeoBundle     'Shougo/neomru.vim'
NeoBundle     'Shougo/vimproc', { 'build' : { 'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak', }, }
" NeoBundleLazy 'tpope/vim-fugitive' , { 'autoload' : { 'commands' : [ "Gdiff" ] } }
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'scrooloose/syntastic' , { 'autoload' : { 'filename_patterns' : [ '.*\.php' ] } }
NeoBundleLazy 'scrooloose/nerdtree' , { 'autoload' : { 'commands' : [ "NERDTree", "NERDTreeToggle" ] } }
NeoBundle                   'taglist.vim' " shows tag & method list
" NeoBundle 'banyan/recognize_charcode.vim'
" NeoBundle     'tyru/open-browser.vim'
" ColorScheme ----------------------
" NeoBundle       'nanotech/jellybeans.vim'
" NeoBundle              'djjcast/mirodark'
" NeoBundle               'w0ng/vim-hybrid'
"NeoBundle               'molokai'
"NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'vim-scripts/twilight'
"NeoBundle 'jonathanfilip/vim-lucius'
"NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'vim-scripts/Wombat'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'vim-scripts/rdark'
"NeoBundle 'chriskempson/vim-tomorrow-theme'
" NeoBundle 'sjl/badwolf'
NeoBundle 'pasela/edark.vim'
NeoBundle 'fatih/vim-go'


"========================================
" BASE
"========================================
let mapleader = ","                 " キーマップリーダー
set scrolloff=5                     " スクロール時の余白確保
set textwidth=0                     " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                        " バックアップ取らない
set autoread                        " 他で書き換えられたら自動で読み直す
set noswapfile                      " スワップファイル作らない
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

" Change current directory.
nnoremap <silent> <Space>cd :CD<CR>

" Reload file buffer
nnoremap <silent> <Space>e :e!<CR>

" Remove dust
nnoremap <silent> <Space>r :Rd<CR>

let $TODAY=strftime('%Y%m%d')
set undodir=/tmp


"========================================
" VIEW
"========================================
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
" set list              " 不可視文字表示
set display=uhex      " 印字不可能文字を16進数で表示
set foldmethod=marker " folding
set lazyredraw        " コマンド実行中は再描画しない
set ttyfast           " 高速ターミナル接続を行う
set cursorline        " カーソル行をハイライト
set colorcolumn=80
" set cursorcolumn
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set laststatus=2      " 常にステータスラインを表示
set ruler             " カーソルが何行目の何列目に置かれているかを表示する
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w
" %{fugitive#statusline()}

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"========================================
" COLOR
"========================================
" colorscheme jellybeans
" colorscheme mirodark
" colorscheme hybrid
" colorscheme badwolf
colorscheme edark
" colorscheme Tomorrow-Night

let edark_current_line=1
let edark_ime_cursor=1
let edark_insert_status_line=1



" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c


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
autocmd BufNewFile *.sh  0r ~/.vim/skeleton/skeleton.sh
autocmd BufNewFile *.pl  0r ~/.vim/skeleton/skeleton.perl
autocmd BufNewFile *.php 0r ~/.vim/skeleton/skeleton.php


"========================================
" SEARCH
"========================================
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
nmap <ESC><ESC> :nohlsearch<CR><ESC>


"========================================
" TAGS
"========================================
if has("autochdir")
  " 編集しているファイルのディレクトリに自動で移動
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
" EDIT
"========================================
set expandtab              " Tabキーを空白に変換
set noimdisable            " insertモードを抜けるとIMEオフ
set iminsert=0 imsearch=0
set noimcmdline

" escape mapping
inoremap jj <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
nnoremap <Space>S :%s!
nnoremap <Space>s /
nnoremap s /

nnoremap Y y$

" :Ptでインデントモード切替
command! Pt :set paste!

" 保存時に行末の空白を除去する
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

" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" Save
nnoremap <Space>w :w<CR>

" 区切り文字
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
nnoremap M :! open %:p -a MacVim<CR>

nnoremap <Space>t :tabnew<CR>
nnoremap <Space>q :q!<CR>
nnoremap <Space>n gt
nnoremap <Space>p gT


"========================================
" INDENT
"========================================
set autoindent   " 自動でインデント
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める
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

"<space>系の移動
nnoremap <Space>h ^
nnoremap <Space>l $

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" delete window
" nnoremap <C-d> <C-w>q

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
" NeoBundle Plugins
"========================================

"------------------------------
" neocomplete.vim
"------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'php' : '~/.vim/dict/php.dict',
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType c             setlocal omnifunc=ccomplete#Complete
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php           setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" FileType毎のOmni補完を設定

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
" nmap     <Space>f [unite]
nmap     f [unite]
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 200
let g:unite_split_rule = "belowright"
let g:neomru#file_mru_limit = 2000

nnoremap [unite]U                 :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]a        :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" nnoremap <silent> [unite]f        :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]f        :<C-u>Unite file_rec<CR>
nnoremap <silent> [unite]b        :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]u        :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> [unite]h        :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]d        :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]o        :<C-u>Unite -vertical -no-quit -winwidth=40 outline<CR>
nnoremap <silent> m               :<C-u>Unite file_mru<CR>

nnoremap <silent> <Leader>g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <Leader>s  :<C-u>Unite line<CR>

" unite grep に ag(The Silver Searcher) を使う
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
  nnoremap <silent> <buffer><expr> <C-l> unite#do_action('split')
  inoremap <silent> <buffer><expr> <C-l> unite#do_action('split')
  nnoremap <silent> <buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

"------------------------------
" vim-ref
"------------------------------
" let g:ref_phpmanual_path = $HOME . '/dotfiles/ref/php-chunked-xhtml'
" let g:ref_refe_path = $HOME . '/dotfiles/ref/ruby-refm-1.9.3-dynamic-20120829'
" nnoremap <silent> [unite]p  :<C-u>Unite -no-split ref/phpmanual<CR>

"------------------------------
" quickrun.vim
"------------------------------
let g:quickrun_config = {}

"------------------------------
" Pydiction
"------------------------------
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked\ 2',
      \ 'exec'      : '%c %o %a %s',
      \ }
let g:quickrun_config.mkd = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked\ 2',
      \ 'exec'      : '%c %o %a %s',
      \ }

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



" let NERDTreeShowBookmarks=1
" let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"

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
" Open browser
"------------------------------
" let g:netrw_nogx = 1 " disable netrw's gx mapping.
" nmap <Leader>f <Plug>(openbrowser-smart-search)
" vmap <Leader>f <Plug>(openbrowser-smart-search)

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

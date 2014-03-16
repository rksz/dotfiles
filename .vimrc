
"============================================================
" NEOBUNDLE
"============================================================
set nocompatible
filetype off

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

"------------------------------------------------------------
" Edit
"------------------------------------------------------------
NeoBundle      'scrooloose/nerdcommenter' " comment2
NeoBundle       'junegunn/vim-easy-align' " align1
NeoBundle            'tpope/vim-surround' " text surround
NeoBundle        'kana/vim-operator-user'
NeoBundle         'kana/vim-textobj-user'
NeoBundle     'kana/vim-operator-replace'
NeoBundle            'kana/vim-niceblock'
NeoBundle       'kana/vim-textobj-indent'
NeoBundle             'gcmt/wildfire.vim'
NeoBundle    'PDV--phpDocumentor-for-Vim'

"------------------------------------------------------------
" Completion
"------------------------------------------------------------
NeoBundle          'Shougo/neocomplcache' " auto complete


"------------------------------------------------------------
" Searching/Moving
"------------------------------------------------------------
NeoBundle                     'smartword' " enables cursor-movement more intelligent
NeoBundle            'rhysd/clever-f.vim' " improve f jump
NeoBundle         'tyru/open-browser.vim'


"------------------------------------------------------------
" Programming
"------------------------------------------------------------
NeoBundle           'thinca/vim-quickrun'
NeoBundle                'thinca/vim-ref'
NeoBundle                     'Pydiction' " auto complete for python
NeoBundle                   'taglist.vim' " shows tag & method list
NeoBundle             'wesleyche/SrcExpl'
NeoBundle              't9md/vim-quickhl'

"------------------------------------------------------------
" Syntax
"------------------------------------------------------------

" NeoBundle             'JavaScript-syntax' " JavaScript
" NeoBundle        'hail2u/vim-css3-syntax' " css3
" NeoBundle                     'html5.vim' " html5
" NeoBundle                        'jQuery' " jQuery
NeoBundle                 'jceb/vim-hier'
" NeoBundle                     'nginx.vim' " nginx conf
" NeoBundle                       'php.vim' " PHP
" NeoBundle       'plasticboy/vim-markdown' " markdown
" NeoBundle       'tpope/vim-markdown' " markdown
" NeoBundle                    'python.vim' " Python
NeoBundle          'scrooloose/syntastic' " syntax checking plugins exist for eruby, haml, html, javascript, php, python, ruby and sass.


"------------------------------------------------------------
" Explorer
"------------------------------------------------------------
NeoBundle           'scrooloose/nerdtree' " tree explorer
NeoBundle             'tpope/vim-vinegar' " drives tree explorer


"------------------------------------------------------------
" Utility
"------------------------------------------------------------
NeoBundle        'Lokaltog/vim-powerline' " updates status line
NeoBundle                       'cecutil' " util
NeoBundle            'tpope/vim-fugitive' " controls git from vim
NeoBundle 'banyan/recognize_charcode.vim'


"------------------------------------------------------------
" ColorScheme
"------------------------------------------------------------
NeoBundle                        'inkpot'
NeoBundle       'nanotech/jellybeans.vim'
NeoBundle                'tomasr/molokai'
NeoBundle               'w0ng/vim-hybrid'

"------------------------------------------------------------
" Unite
"------------------------------------------------------------
NeoBundle              'Shougo/unite.vim'
NeoBundle             'Shougo/neomru.vim'
NeoBundle        'h1mesuke/unite-outline'


"------------------------------------------------------------
" Vimproc
"------------------------------------------------------------
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }


filetype plugin indent on     " Required!
if neobundle#exists_not_installed_bundles()
 echomsg 'Not installed bundles : ' .
       \ string(neobundle#get_not_installed_bundle_names())
 echomsg 'Please execute ":NeoBundleInstall" command.'
endif


"============================================================
" BASE
"============================================================
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


"============================================================
" VIEW
"============================================================
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set display=uhex      " 印字不可能文字を16進数で表示
set foldmethod=marker " folding
set lazyredraw        " コマンド実行中は再描画しない
set ttyfast           " 高速ターミナル接続を行う
set cursorline        " カーソル行をハイライト
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set laststatus=2      " 常にステータスラインを表示
set ruler             " カーソルが何行目の何列目に置かれているかを表示する

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/


"============================================================
" COLOR
"============================================================
colorscheme jellybeans
"colorscheme hybrid

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


"============================================================
" COMPLETION
"============================================================
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加

cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down> <C-n>

"------------------------------------------------------------
" neocomplecache.vim
"------------------------------------------------------------

" AutoComplPopを無効にする
let g:acp_enableAtStartup = 0
" NeoComplCacheを有効にする
let g:neocomplcache_enable_at_startup = 1
" 補完が自動で開始される文字数
let g:neocomplcache_auto_completion_start_length = 3
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" -入力による候補番号の表示
let g:neocomplcache_enable_quick_match = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplcache_enable_auto_select = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scala' : $HOME.'/.vim/bundle/vim-scala/dict/scala.dict',
    \ 'java' : $HOME.'/.vim/dict/java.dict',
    \ 'c' : $HOME.'/.vim/dict/c.dict',
    \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'scheme' : $HOME.'/.vim/dict/scheme.dict',
    \ 'vm' : $HOME.'/.vim/dict/vim.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


"------------------------------------------------------------
" Snippets
"------------------------------------------------------------
let g:neosnippet#snippets_directory= $HOME.'/.vim/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-s> neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" C-nでneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()

" buffer開いたらneoconでcache
autocmd BufReadPost,BufEnter,BufWritePost :NeoComplCacheCachingBuffer <buffer>

" FileType毎のOmni補完を設定
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c          setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"インクルードパスの指定
let g:neocomplcache_include_paths = {
  \ 'cpp'  : '.,/opt/local/include/gcc46/c++,/opt/local/include,/usr/include',
  \ 'c'    : '.,/usr/include',
  \ 'ruby' : '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
  \ }
"インクルード文のパターンを指定
let g:neocomplcache_include_patterns = {
  \ 'cpp' : '^\s*#\s*include',
  \ 'ruby' : '^\s*require',
  \ 'perl' : '^\s*use',
  \ }
"インクルード先のファイル名の解析パターン
let g:neocomplcache_include_exprs = {
  \ 'ruby' : substitute(v:fname,'::','/','g')
  \ }
" ファイルを探す際に、この値を末尾に追加したファイルも探す。
let g:neocomplcache_include_suffixes = {
  \ 'ruby' : '.rb',
  \ 'haskell' : '.hs'
  \ }

"------------------------------------------------------------
" Skeleton
"------------------------------------------------------------
autocmd BufNewFile *.sh  0r ~/.vim/skeleton/skeleton.sh
autocmd BufNewFile *.pl  0r ~/.vim/skeleton/skeleton.perl
autocmd BufNewFile *.php 0r ~/.vim/skeleton/skeleton.php


"============================================================
" SEARCH
"============================================================
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

" Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>


"============================================================
" TAGS
"============================================================
if has("autochdir")
  " 編集しているファイルのディレクトリに自動で移動
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

set notagbsearch

"tags-and-searchesを使い易くする
nnoremap t  <Nop>
"「飛ぶ」
nnoremap tt  <C-]>
"「進む」
nnoremap tj  ;<C-u>tag<CR>
"「戻る」
nnoremap tk  ;<C-u>pop<CR>
"履歴一覧
nnoremap tl  ;<C-u>tags<CR>


"============================================================
" EDIT
"============================================================
set expandtab              " Tabキーを空白に変換
set noimdisable            " insertモードを抜けるとIMEオフ
set iminsert=0 imsearch=0
set noimcmdline

" escape mapping
inoremap jj <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
nnoremap <Space>s :%s!

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
" autocmd BufWritePre * call <SID>remove_dust()
" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" <leader>j でJSONをformat
map <Leader>j !python -m json.tool<CR>

" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" 何もせず終了
nnoremap <Space>q :qa<CR>

" Save
nnoremap <Space>w :w<CR>

" 区切り文字
inoreabbrev dl ************************************************************
inoreabbrev dk ============================================================
inoreabbrev dj ------------------------------------------------------------


nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-d> :bd<CR>


"============================================================
" INDENT
"============================================================
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


"============================================================
" MOVE
"============================================================
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

" format
inoremap <C-l> <ESC>zza

" enabled cursor key
nnoremap OA gi<Up>
nnoremap OB gi<Down>
nnoremap OC gi<Right>
nnoremap OD gi<Left>

" open active directory path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


"============================================================
" ENCODING
"============================================================
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング

" エンコーディングをUTF8に指定
autocmd FileType js    :set fileencoding=utf-8
autocmd FileType css   :set fileencoding=utf-8
autocmd FileType html  :set fileencoding=utf-8
autocmd FileType xml   :set fileencoding=utf-8
autocmd FileType java  :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" autocmd FileType markdown hi! def link markdownItalic LineNr


"============================================================
" NEOBUNDLE PLUGINS
"============================================================

"------------------------------------------------------------
" vim-markdown
"------------------------------------------------------------
let g:vim_markdown_folding_disabled=1

"------------------------------------------------------------
" NERD_commenter.vim
"------------------------------------------------------------
let NERDSpaceDelims = 1
let NERDShutUp=1
map <Leader>x ,c<space>

"------------------------------------------------------------
" Fugitive.vim
"------------------------------------------------------------
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>

"------------------------------------------------------------
" taglist.Vim
"------------------------------------------------------------
set tags=tags
set tags+=~/.tags

if OSTYPE == "Darwin\n"
  let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' " ctagsのパス
elseif OSTYPE == "Linux\n"
  let Tlist_Ctags_Cmd = '/usr/bin/ctags' " ctagsのパス
endif

let Tlist_Show_One_File      = 1   " 現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWindow    = 1   " taglistのウィンドーが最後のウィンドーならばVimを閉じる
let Tlist_Use_Right_Window   = 1   " 右側でtaglistのウィンドーを表示
let Tlist_Enable_Fold_Column = 1   " 折りたたみ
let Tlist_Auto_Update        = 1
let Tlist_WinWidth           = 30
nmap <F7> :Tlist<CR>

"------------------------------------------------------------
" Srcexp
"------------------------------------------------------------
let g:SrcExpl_UpdateTags    = 1         " tagsをsrcexpl起動時に自動で作成（更新）
let g:SrcExpl_RefreshTime   = 0         " 自動表示するまでの時間(0:off)
let g:SrcExpl_WinHeight     = 15         " プレビューウインドウの高さ
let g:SrcExpl_RefreshMapKey = "<Space>" " 手動表示のMAP
let g:SrcExpl_GoBackMapKey  = "<C-b>"   " 戻る機能のMAP

" // The switch of the Source Explorer
nmap <F8> :SrcExplToggle<CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"

" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"

"------------------------------------------------------------
" sumartword.vim
"------------------------------------------------------------
noremap ,w  w
noremap ,b  b
noremap ,e  e
noremap ,ge  ge

map W  <Plug>(smartword-w)
map B  <Plug>(smartword-b)
map E  <Plug>(smartword-e)
map ge  <Plug>(smartword-ge)


"------------------------------------------------------------
" unite.vim
"------------------------------------------------------------
nnoremap    [unite]   <Nop>
nmap     <Space>f [unite]
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 200
let g:unite_split_rule = "rightbelow"
let g:unite_winwidth = 40

nnoremap [unite]U  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]a :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit outline<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC>      <Plug>(unite_exit)
  nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')

  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
endfunction


" unite-plugins
cnoremap UH Unite help<Enter>
cnoremap UO Unite outline<Enter>



"------------------------------------------------------------
" vim-ref
"------------------------------------------------------------
let g:ref_phpmanual_path = $HOME . '/dotfiles/ref/php-chunked-xhtml'
let g:ref_refe_path = $HOME . '/dotfiles/ref/ruby-refm-1.9.3-dynamic-20120829'

nnoremap <silent> [unite]p  :<C-u>Unite -no-split ref/phpmanual<CR>
nnoremap <silent> [unite]R  :<C-u>Unite -no-split ref/refe<CR>


"------------------------------------------------------------
" quickrun.vim
"------------------------------------------------------------
let g:quickrun_config = {}

"------------------------------------------------------------
" Pydiction
"------------------------------------------------------------
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }
let g:quickrun_config.mkd = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }

"------------------------------------------------------------
" Syntastic
"------------------------------------------------------------
let g:syntastic_enable_signs = 1        " エラー行をsignで表示する
let g:syntastic_enable_highlighting = 1 " 可能ならhighligt表示する


"------------------------------------------------------------
" NERD-Tree.vim
"------------------------------------------------------------
nnoremap <silent> <Leader>N :NERDTree<CR>
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


let g:Powerline_symbols='fancy'
let g:Powerline_mode_n = 'NORMAL'
call Pl#Hi#Allocate({
  \ 'black'          : 16,
  \ 'white'          : 231,
  \
  \ 'darkestgreen'   : 22,
  \ 'darkgreen'      : 28,
  \
  \ 'darkestcyan'    : 21,
  \ 'mediumcyan'     : 117,
  \
  \ 'darkestblue'    : 24,
  \ 'darkblue'       : 31,
  \
  \ 'darkestred'     : 52,
  \ 'darkred'        : 88,
  \ 'mediumred'      : 124,
  \ 'brightred'      : 160,
  \ 'brightestred'   : 196,
  \
  \ 'darkestyellow'  : 59,
  \ 'darkyellow'     : 100,
  \ 'darkestpurple'  : 57,
  \ 'mediumpurple'   : 98,
  \ 'brightpurple'   : 189,
  \
  \ 'brightorange'   : 208,
  \ 'brightestorange': 214,
  \
  \ 'gray0'          : 233,
  \ 'gray1'          : 235,
  \ 'gray2'          : 236,
  \ 'gray3'          : 239,
  \ 'gray4'          : 240,
  \ 'gray5'          : 241,
  \ 'gray6'          : 244,
  \ 'gray7'          : 245,
  \ 'gray8'          : 247,
  \ 'gray9'          : 250,
  \ 'gray10'         : 252,
  \ })
" 'n': normal mode
" 'i': insert mode
" 'v': visual mode
" 'r': replace mode
" 'N': not active
let g:Powerline#Colorschemes#my#colorscheme = Pl#Colorscheme#Init([
  \ Pl#Hi#Segments(['SPLIT'], {
    \ 'n': ['white', 'gray2'],
    \ 'N': ['gray0', 'gray0'],
    \ }),
  \
  \ Pl#Hi#Segments(['mode_indicator'], {
    \ 'i': ['darkestgreen', 'white', ['bold']],
    \ 'n': ['darkestcyan', 'white', ['bold']],
    \ 'v': ['darkestpurple', 'white', ['bold']],
    \ 'r': ['mediumred', 'white', ['bold']],
    \ 's': ['white', 'gray5', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['fileinfo', 'filename'], {
    \ 'i': ['white', 'darkestgreen', ['bold']],
    \ 'n': ['white', 'darkestcyan', ['bold']],
    \ 'v': ['white', 'darkestpurple', ['bold']],
    \ 'r': ['white', 'mediumred', ['bold']],
    \ 'N': ['gray0', 'gray2', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['branch', 'scrollpercent', 'raw', 'filesize'], {
    \ 'n': ['gray2', 'gray7'],
    \ 'N': ['gray0', 'gray2'],
    \ }),
  \
  \ Pl#Hi#Segments(['fileinfo.filepath', 'status'], {
    \ 'n': ['gray10'],
    \ 'N': ['gray5'],
    \ }),
  \
  \ Pl#Hi#Segments(['static_str'], {
    \ 'n': ['white', 'gray4'],
    \ 'N': ['gray1', 'gray1'],
    \ }),
  \
  \ Pl#Hi#Segments(['fileinfo.flags'], {
    \ 'n': ['white'],
    \ 'N': ['gray4'],
    \ }),
  \
  \ Pl#Hi#Segments(['currenttag', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'charcode', 'currhigroup'], {
    \ 'n': ['gray9', 'gray4'],
    \ }),
  \
  \ Pl#Hi#Segments(['lineinfo'], {
    \ 'n': ['gray2', 'gray10'],
    \ 'N': ['gray2', 'gray4'],
    \ }),
  \
  \ Pl#Hi#Segments(['errors'], {
    \ 'n': ['white', 'gray2'],
    \ }),
  \
  \ Pl#Hi#Segments(['lineinfo.line.tot'], {
    \ 'n': ['gray2'],
    \ 'N': ['gray2'],
    \ }),
  \
  \ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
    \ 'n': ['white', 'brightred', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['gundo:static_str.name'], {
    \ 'n': ['white', 'mediumred', ['bold']],
    \ 'N': ['brightred', 'darkestred', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['gundo:static_str.buffer'], {
    \ 'n': ['white', 'darkred'],
    \ 'N': ['brightred', 'darkestred'],
    \ }),
  \
  \ Pl#Hi#Segments(['gundo:SPLIT'], {
    \ 'n': ['white', 'gray2'],
    \ 'N': ['white', 'gray0'],
    \ }),
  \ ])
let g:Powerline_colorscheme='my'


"------------------------------------------------------------
" open-blowser.vim
"------------------------------------------------------------
nmap <Leader>fu <Plug>(openbrowser-open)
vmap <Leader>fu <Plug>(openbrowser-open)

"------------------------------------------------------------
" easyalign
"------------------------------------------------------------
vmap E <Plug>(EasyAlign)

"------------------------------------------------------------
" operator replace
"------------------------------------------------------------
map R <Plug>(operator-replace)

"------------------------------------------------------------
" StatusLine
"------------------------------------------------------------
let g:Powerline_symbols = 'fancy' " vim-powerlineでフォントにパッチを当てないなら以下をコメントアウト

"------------------------------------------------------------
" quickhl
"------------------------------------------------------------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"------------------------------------------------------------
" wildfire
"------------------------------------------------------------
let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'it', 'ii', 'ip', 'i>']

"------------------------------------------------------------
" php-doc
"------------------------------------------------------------
inoremap <C-d> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-d> :call PhpDocSingle()<CR>
vnoremap <C-d> :call PhpDocRange()<CR>


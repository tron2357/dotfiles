"" .vimrc

" howto install NeoBundle
"
" 
" Run below script:
" 
"   curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
" 
" or
" 
" Setup NeoBundle:
" 
"   mkdir -p ~/.vim/bundle
"   git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" 

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:

" 整形
NeoBundle 'junegunn/vim-easy-align'
"NeoBundle 'tsaleh/vim-align'

" undo redo
NeoBundle 'sjl/gundo.vim'

" 高速なack-grep
NeoBundle 'mileszs/ack.vim'

" ファイルリネーム
NeoBundle 'vim-scripts/renamer.vim'

" フォルダツリー
NeoBundle 'scrooloose/nerdtree'

" 機能が多い割に希望する動作をしないため使用しない
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'tpope/vim-endwise'

" \rで実行
NeoBundle 'thinca/vim-quickrun'

" アスキーアート作成
NeoBundle 'vim-scripts/DrawIt'


" 保存時の構文チェッカ
" javascriptなら npm で jshint 入れておけばOK
NeoBundle 'scrooloose/syntastic'

" javascript
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jQuery'
NeoBundle 'jelera/vim-javascript-syntax'

" golang
NeoBundle 'fatih/vim-go'
NeoBundle 'dgryski/vim-godef'

" markdown
NeoBundle 'tyru/open-browser.vim'

" tagbar
NeoBundle 'majutsushi/tagbar'

" unite
NeoBundle 'Shougo/unite.vim'

" memolist
NeoBundle 'glidenote/memolist.vim'

" json
NeoBundle 'elzr/vim-json'

" rubyでend補完
" gvimだと機能する
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'

" sudoするとuniteが毎回エラー表示する分の対策
NeoBundle 'vim-scripts/sudo.vim'

" インデント(gvimだと動くが、indentLineと同じで行間が抜けている)
"NeoBundle 'nathanaelkane/vim-indent-guides'
" インデント(concealを使ったものでvimでも動く)
"NeoBundle 'Yggdroot/indentLine'

" バイナリエディタ
NeoBundle 'Shougo/vinarise.vim'

" rails
NeoBundle 'tpope/vim-rails'

" color
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'tomasr/molokai'

" coffee script
NeoBundle 'kchmck/vim-coffee-script'

" TODO test-kitchenで使えるように修正する
NeoBundle 't9md/vim-chef'

" TODO linuxで保存時にエラーが出るから確認する
" -> vimをコンパイルし直すとエラーが出なくなった。
" -> aptitude build-dep vim と lua 有効にしたため？
" use async generate ctags
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'rev' : 'development',
      \ 'depends': ['Shougo/vimproc', 'Shougo/unite.vim'],
      \ 'autoload' : {
      \   'commands' : ['Tags', 'TagsUpdate', 'TagsSet', 'TagsBundle', 'TagsCleanCache'],
      \   'unite_sources' : ['tags']
      \ }}


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"----------------------------------
" 基本設定
"


" vim拡張モード
set nocompatible

" バックスペースで文字削除
set bs=2

" 検索などの履歴
set viminfo+=n~/.viminfo

" カーソル位置をバーに表示
set ruler

" nobackup
set nobackup

" zsh風のファイル名補完しない
set nowildmenu

" bash風なtabで補完候補を表示する
set wildmode=longest,list

" undo redo の回数
set undolevels=1000

" 全ファイルの自動改行禁止
set textwidth=0

" <C-a> で8進数として扱わない
set nrformats-=octal

" beep と画面フラッシュを消す(linux only)
set novisualbell

" 色付き表示
syntax on

" 行番号表示
set number

" tabは2スペース
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set expandtab

" ビジュアルモードかどうか見せる
set showmode

" 自動字下げ
set cindent

" 括弧対応を強調
set showmatch

" 右下あたりに状態表示( 100G 等が出る )
set showcmd

" 括弧のパターン(追加すると % で対応に飛べる)
"set matchpairs=<:>,(:),{:},[:]
set matchpairs=(:),{:},[:]

" アルファベットの切れ目で改行しないとか
" その他 :h 'formatoptions' 参照
" コメントをエンターとOのとき続けてコメント行にする
set formatoptions=ro

" 保存ヒストリ数
set history=500


" :set list 時の表示文字
set listchars=eol:$,tab:>_

set nolist
set paste

"----------------------------------
" 検索関連
"
" 検索結果をハイライト表示
set hlsearch

" 検索文字に順次ヒット
set incsearch

" 大文字小文字の区別なし
set noignorecase

" 下までいったら循環して上に戻ってこない
set nowrapscan

" 検索結果を常に画面中央に表示
map n nzz
map N Nzz
map * *zz
map # #zz
map g* g*zz
map g# g#zz

"----------------------------------
" 文字コード関連
" ファイル名や状態を常時表示
set laststatus=2
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileencoding=utf-8

"ステータスラインにファイルタイプ・文字コード・改行文字を表示
" Powerlineで代用するため不要になった
set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P


"---------------------------------
" マクロ関連
"
" 折り返し行も見た目一行移動
nnoremap j gj
nnoremap k gk

" 一つ前のバッファを開く
nnoremap <C-j> <C-^>

" ビジュアルモードからの検索と置換
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap /s "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" key map
map <Up> Hk
map <Down> Lj
map <Left> ^
map <Right> $

" 間違って押しやすいから
map <C-@> <ESC>


" 短縮入力のような
ab #- ####----------------------------------------------------------------------------



" 行、列のハイライト表示
"set cursorline
"set cursorcolumn

" フリーカーソル {block, insert, all, onemore}
set virtualedit=all



" 画面点滅を消す
set novisualbell

" vimで設定しておくと表示がおかしくなるため、linesなどは使用しないようにする
" ウインドウサイズ lines:縦 columns:横
"set lines=40
"set columns=100

" ウインドウ表示位置
winpos 10 0

" フォント設定
set guifont=Ricty\ 10


" language messages en_US.UTF-8
"set background=light

if has("win32")
	" フォント設定
	set guifont=VL_ゴシック:h10:cSHIFTJIS
	set linespace=0
	" beep と画面フラッシュを消す(windows only)
	set vb t_vb=
	" 日本語IMEoff
	set imi=0 ims=0
	
	set lines=40
	set columns=120
endif

" 保存しなくてもファイルを切り替えることができ
" undo, redo の情報も保持させる
set hidden


" カーソルを点滅しないようにする
set guicursor=a:blinkon0 


" 色テーマ設定
"colorscheme default
"colorscheme desert
"colorscheme darkblue
"colorscheme delek
"colorscheme morning 
"colorscheme torte
"colorscheme evening
colorscheme ron
"colorscheme molokai

" デフォルトは guioptions=agimrLtT
set guioptions=agimtT
" ツールバーを消して起動
set guioptions-=T

" メニューバーを消して起動
set guioptions-=m



" ------------------------------------------------------------------------------
" 配色のカスタマイズ
" ------------------------------------------------------------------------------

"" gnome-terminalの色設定で変えたほうが良い
"" 赤地に白文字 
"highlight search cterm=bold ctermfg=7 ctermbg=1 guifg=White guibg=Red
"" 白地に赤文字
"highlight todo cterm=bold ctermfg=1 ctermbg=8 guifg=Red guibg=White




""""----------------------------------------------------------------------------
""" 覚え書き
""

" そのファイル内のみに有効な設定
" Javaファイルの場合( ts sts sw fdm 設定。 marker で {{{ }}} で折り畳み )
" // vim:set tabstop=4:softtabstop=0:shiftwidth=4:foldmethod=marker


" 一行に延々と書かれたHTMLファイルを見やすく改行( \n はごみが出力されるだけ)
"  Carriage Return = \r, Line Feed = \n
" :%s/\(<\/[^>]\+>\)/\1\r/g

" 000..100 まで出力
" :r! awk 'BEGIN{ for(i=0; i<=100; i++) printf("\%03d\n", i); }'

" 空行削除(awk: NF １行のフィールド個数. NR 現在の行数. FS 区切り文字)
" :%!awk 'NF > 0'
" :%!sed -e '/^$/d'
" :%g/^$/d
" どれでもよい

" \U 次の文字から \E までを大文字にするメタキャラクタ
" 全てを大文字に置換( tr 'a-z' 'A-Z' のようなことをする )
" :%s/\([a-z]\)/\U\1\E/g

" \L 次の文字から \E までを小文字にするメタキャラクタ
" 全てを小文字に置換( tr 'A-Z' 'a-z' のようなことをする )
" :%s/\([A-Z]\)/\L\1\E/g

" man の nmap をテキストにする
" man nmap | col -bfx > nmap.man

" HTML メールの本文を削除する
" :% !sed -e '/<\(html\|HTML\)>/,/<\/\(html\|HTML\)>/d'

" ヘルプ画面でのリンクの移動
" <C-]> 移動し <C-t> で戻る

" <TAB> を <SPACE> にする
" :set expandtab とした後 :retab
" スペースからタブへは戻せないみたい

" 検索方法
" /target\C -> target
" /target\c -> [tT][aA][rR][gG][eE][tT]

" 単語の切れ目で検索できる
" /target\> -> aaa target bbb
"			-> aaa targetbbb はヒットしない
" /\<target -> aaa target bbb
"			-> aaatarget bbb はヒットしない

" オプションがどのファイルで設定されたかを表示
" :verbose set tw 

" インデントをスペースに置き換えたい
" :set expandtab
" とし、
" :retab
" で置き換えが可能。スペースからタブへはできないみたい

" Windowsで再帰grep
" :grep /S search_key target_file_or_directory
"
" Linuxで再帰grep
" :grep -r search_key target_file_or_directory
"
" vim7内蔵のgrep
" :vimgrep search_key file
" 
" grepの結果確認
" :copen

"Visual Studio で作成したファイルを開くと、ファイルの最初に ? が見えることがある。
"これは、 :e ++enc=ucs-bom として開くとよい。
"文字コードは、 UTF-8 で、 Byte Order Mark が付いているファイルという意味。



" vimでrubyを便利に使う方法
"
" %で対応括弧へ飛ぶ方法。<C-X><C-O>で補完もできる
" 1. gem install vim-ruby でvim-rubyインストール
" 2. matchitをインストール http://www.vim.org/scripts/script.php?script_id=39
"
" rubyの構文チェックする方法
" 1. $VIM/vimfiles/ftplugin に ruby.vim を作る。
" 2. ruby.vim に、compiler ruby と書く。
" map <F9> :make -c %<CR> としてから、<F9>押すと構文チェックができる。
" エラーがあると、:cw でエラーが見え、該当個所へ飛べるようになる。
" :cc [n]でn番目のエラー行にジャンプ
" :cnで次のエラー行にジャンプ
" :cNで前のエラー行にジャンプ
" 
"




" pydictionの設定 omnifuncで保管機能が使えるようになる。
" vimが+pythonでコンパイルされている必要有り。
" 設定すると、*での単語指定がおかしくなるから使用しないことにする。
"filetype plugin on
"if has("win32")
"	let g:pydiction_location = 'D:/app/vim72-kaoriya-w32j/vimfiles/ftplugin/pydiction/complete-dict'
"endif
"
"let g:pydiction_menu_height = 20
"
"if has("autocmd")
"	autocmd FileType python set complete+=k/D:/app/Vim/pydiction/pydiction iskeyword+=.,(
"
"endif "has"



" ------------------------------------------------------------------------------
" 拡張子ごとの個別設定
" ------------------------------------------------------------------------------

augroup MyGroup
	autocmd!

	" ruby settings
	autocmd MyGroup BufNewFile,BufRead *.rb  set filetype=ruby  et sw=2 ts=2 sts=2 nocindent autoindent
	autocmd MyGroup BufNewFile,BufRead *.erb set filetype=eruby et sw=2 ts=2 sts=2 nocindent autoindent

	" python settings
	autocmd MyGroup BufNewFile,BufRead *.py set filetype=python sw=4 ts=4 sts=4 nocindent autoindent

	" java(android) settings
	autocmd MyGroup BufNewFile,BufRead *.aidl set filetype=java

	" javascript settings
	autocmd MyGroup BufNewFile,BufRead *.js set filetype=javascript sw=2 ts=2 sts=2 et ai cin
	autocmd MyGroup BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

	" gitit wiki(markdown)
	autocmd MyGroup BufNewFile,BufRead *.page set filetype=markdown
	autocmd MyGroup BufNewFile,BufRead *.md set filetype=markdown

	" rest
	autocmd MyGroup BufNewFile,BufRead *.rst set  filetype=rest expandtab sw=2 ts=2 sts=2
	autocmd MyGroup BufNewFile,BufRead *.rest set filetype=rest expandtab sw=2 ts=2 sts=2
	autocmd MyGroup BufNewFile,BufRead *.page set filetype=rest expandtab sw=2 ts=2 sts=2 

	" yml(dotcloud)
	autocmd MyGroup BufNewFile,BufRead *.yml set filetype=yaml expandtab sw=2 ts=2 sts=2 

	" ios(objective-c)
	autocmd MyGroup BufNewFile,BufRead *.m set filetype=objc sw=4 ts=4 sts=4 cindent autoindent
	autocmd MyGroup BufNewFile,BufRead *.h set filetype=objc sw=4 ts=4 sts=4 cindent autoindent

  " golang
	autocmd MyGroup BufNewFile,BufRead *.go set filetype=go sw=2 ts=2 sts=2 cindent autoindent smartindent noet

	" bats
	autocmd MyGroup BufNewFile,BufRead *.bats set filetype=sh sw=2 ts=2 sts=2 et nocindent autoindent

augroup END


"" eclipseのxmlなどが赤くなりすぎて見づらいため使用しない
"" スペースなどだけで終わる行をハイライト表示
"augroup HighlightTrailingSpaces
"  autocmd!
"  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
"  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
"augroup END

" ------------------------------------------------------------------------------
" 新しくファイルを作ったときのテンプレ
" ------------------------------------------------------------------------------

"augroup MyTemplate
"	autocmd!
"	autocmd BufNewFile *.py 0r $HOME/.vim/skel/python
"
"
"augroup END


" ------------------------------------------------------------------------------
" 保存時にシンタックスなどのチェック
" ------------------------------------------------------------------------------

" warn多いから面倒で使わなくなった
"augroup MyCheck
"	autocmd!
"	autocmd BufWrite *.py w !pep8 %
"augroup END



" ------------------------------------------------------------------------------
" 半角スペースが入ったファイル名もgfで開けるようにする
" ------------------------------------------------------------------------------
"set isfname+=32

" ------------------------------------------------------------------------------
" *.swpの出力先
"
" 同名のファイルを編集中でも、*.swp *.swo など別のスワップファイルとして保持される
" ------------------------------------------------------------------------------
set directory=~/.vim

" ------------------------------------------------------------------------------
" Gundo用のツリー展開
" ------------------------------------------------------------------------------
nnoremap <F5> :GundoToggle<CR>

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------
nnoremap <F6> :NERDTreeToggle<CR>


" 表示しないもの
let g:NERDTreeIgnore = ['\.swp$', 
  \ '\~$',
  \ '\.pyc$',
  \ '\.pyo$',
  \ '\.class$',
  \ '\.sqlite$',
  \ '__pycache__',
  \ '\.svn$',
  \ '\.git$'
  \ ]

" 0は半角文字(1は全角文字(三角など)は階層がわかりづらい)
let g:NERDTreeDirArrows = 0

" 隠しファイルも表示する
let g:NERDTreeShowHidden = 1

" 今開いているファイルをツリーから探す <- 希望する動作ではないため使用しない
"nnoremap <F2> :NERDTreeFind<CR>

" ------------------------------------------------------------------------------
" VimFiler
" ------------------------------------------------------------------------------
"nnoremap <F6> :VimFilerExplorer<CR>
" vimfiler
"let vimfiler_tree_opened_icon='>>'

" ------------------------------------------------------------------------------
" Tagbar
" ------------------------------------------------------------------------------
let g:tagbar_left = 1
nnoremap <F7> :TagbarToggle<CR>

" ------------------------------------------------------------------------------
" neocomplcache
" ------------------------------------------------------------------------------
" 勝手にnoautoindentされるため使わなくなった

"let g:neocomplcache_enable_at_startup = 1


" ------------------------------------------------------------------------------
" showmarks7(マークの可視化)
" ------------------------------------------------------------------------------
let g:showmarks_include='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
nnoremap <F8> :ShowMarksToggle<CR>


" ------------------------------------------------------------------------------
" 使い方メモ
" ------------------------------------------------------------------------------

" drawitの操作
" \di 線の開始
" \ds 線の停止

" quickrunの実行
" \r


" コピーに付いて
" viの削除したりコピーした文字をコマンド行で使用する
" /<C-r>"
" これはインサートモード時の入力でも使えるため
" <C-r>+ でクリップボードを貼りつけ
" <C-r>" で直近のレジスタ貼りつけとなる。


" zen-coding
" gvimだと <C-y>, で展開する(vimは動作しなかった)
let g:user_zen_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\  },
\}


" Powerline
" http://d.hatena.ne.jp/shim0mura/20120423/1335197161
"
" 1. フォントの生成
" 2. t_Co=256などを.vimrcに追記する
"
" フォントの生成手順(転載)
" $ sudo apt-get install fontforge
" $ mv Ricty-Regular.ttf ./bundle/vim-powerline/fontpatcher
" $ mv Ricty-Bold.ttf ./bundle/vim-powerline/fontpatcher
" $ cd ./bundle/vim-powerline/fontpatcher
" $ fontforge -lang=py -script fontpatcher Ricty-Regular.ttf
" $ fontforge -lang=py -script fontpatcher Ricty-Bold.ttf
" $ mv Ricty-Regular-Powerline.ttf ~/.fonts
" $ mv Ricty-Bold-Powerline.ttf ~/.fonts
" このときフォントキャッシュの更新などは不要だった
"
" 装飾付きになるが見づらいので使わない
"let g:Powerline_symbols = 'fancy'
" カラフルになる
"set t_Co=256


" ノーマルモード時に自動で日本語をオフに切り替える
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control#TOC-SCIM
" im_cuntrol.vimを取得して、読み込ませれば動作することを確認した
" ibus+python(ubuntu11.04)
" 「日本語入力固定モード(常に日本語状態でインサートモードに入る)」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1



" 逆順(行)にする(tacと同じ)
" :g/^/m0

" 行を重複させる
" :g/^/t.


" vimのエスケープをしないで正規表現で検索する
" /\v から始めるとOK
" ex) /\v[0-9]+ のようにする


" eregex settings
" https://github.com/othree/eregex.vim
"Default disable, put this line in vimrc:
let g:eregex_default_enable = 0
"Custom search delimeter:
let g:eregex_forward_delim = '/'
let g:eregex_backward_delim = '?'


" javascript simple-javascript-indenter の設定
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1



"markdown
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = { 'outputter':'browser', 'command':'markdown' }



" vimdiff
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

" syntastic 構文チェックするかどうかの指定
let g:syntastic_mode_map = {'mode':'active',
  \ 'active_filetypes':['python', 'ruby'],
  \ 'passive_filetypes':['sh']}


" =============================================================================
" use ruby
" 
" if,def,etc..-end を % でジャンプする
if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif


" ~/.ctagsにctagsの設定ファイルを設置します。現在無い人は、このディレクトリ内の.ctagsをコピーしてください。
" 適切なlanguageは`ctags --list-maps=all`で見つけてください。人によりますので。
let g:alpaca_update_tags_config = {
      \ '_' : '-R --sort=yes --languages=-js,html,css',
      \ 'ruby': '--languages=+Ruby',
      \ }

augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost * TagsUpdate ruby
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
  endif
augroup END

nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'

" memolist
map ,n  :MemoNew<CR>
map ,l  :MemoList<CR>
map ,g  :MemoGrep<CR>

let g:memolist_path = "~/Dropbox/memo"
"let g:memolist_memo_suffix = "txt"
"let g:memolist_memo_date = "%Y-%m-%d %H:%M"
"let g:memolist_memo_date = "epoch"
"let g:memolist_memo_date = "%D %T"
"let g:memolist_prompt_tags = 1
"let g:memolist_prompt_categories = 1
"let g:memolist_qfixgrep = 1
"let g:memolist_vimfiler = 1
"let g:memolist_template_dir_path = "path/to/dir"

" 複数のタグがあるとき確認できるようにする
nnoremap <C-]> g<C-]>



" ESCのとき早く抜ける
set timeout
set timeoutlen=1000
set ttimeoutlen=70


" vim7.4からundoを保存する.un~ファイルが出来るためまとめる
set undodir=~/.vim

" jsonでconcealが有効だと"を消したりして使いづらいため無効にする
let g:vim_json_syntax_conceal = 0

" 
call smartinput_endwise#define_default_rules()

" *検索で移動しない
nnoremap * *N
nnoremap # #N


" ビジュアルモードの選択部分のみ置換する
" 通常の s ではなく :s とする
" 1. 選択する
" 2. '<,'>:s/\%Vaaa/bbb/g


" 画面分割時に間違って:onlyしてしまうのを抑制
map <C-w>o <ESC>

set conceallevel=0


" brew でインストールした macvim が spotlight に表示されるように変更する
" 1. brew install macvim
" 2. Finderで /usr/local/Cellar/macvim/7.3.64 から MacVim.app をアプリケーションへ移動する
" 3. ln -s /Applications/MacVim.app /usr/local/Cellar/macvim/7.3.64/


" golang
" 1. install go commands
"    go get github.com/nsf/gocode
"    go get github.com/golang/lint
"    go get github.com/jstemmer/gotags
" 2. add .zshrc
"   [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
"   export PATH="$GOPATH/bin:$PATH"
set rtp+=$GOROOT/misc/vim
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" golangで<C-]>のタグジャンプ用tags作成
" 1. go get github.com/jstemmer/gotags
" 2. gotags -R > tags

 
" golangでgd(vim-godef)でジャンプ(ウインドウ分割)(この紹介記事が多い)
" 1. go get -v code.google.com/p/rog-go/exp/cmd/godef
" 2. go install -v code.google.com/p/rog-go/exp/cmd/godef

" godoc
" go get code.google.com/p/go.tools/cmd/godoc
" 
" godocでローカルにドキュメント($GOPATH以下)を立てる
" godoc -http=:8888

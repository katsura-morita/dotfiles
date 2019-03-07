"----------------------------------------
" Vundle
"----------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<c-t>'

Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
nmap <silent><C-n> :NERDTreeToggle<CR>

Plugin 'davidhalter/jedi-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'taglist.vim'
Plugin 'elzr/vim-json'
Plugin 'airblade/vim-gitgutter' " http://vimawesome.com/plugin/vim-gutter
Plugin 'wincent/command-t'      " fast buffer browser
" インデントに色を付けて見やすくする
Plugin 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" コード補完
Plugin 'marcus/rsense'
" ドキュメント参照
" Plugin 'thinca/vim-rf'
" Plugin 'yuku-t/vim-rf-ri'
" メソッド定義元へジャンプ
Plugin 'szw/vim-tags'
" 自動で閉じる
Plugin 'tpope/vim-endwise'
" 一括コメントアウト
Plugin 'tpope/vim-commentary'
" ログファイルを色づけしてくれる
Plugin 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
Plugin 'bronson/vim-trailing-whitespace'
"---------------------------------------------------------
" ステータスラインの装飾 
"---------------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" 括弧の差し替え、追加、削除
Plugin 'tpope/vim-surround'
" 分割リサイズ
Plugin 'simeji/winresizer'
" リサイズ単位を1文字ずつに変更
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
" チートシート コマンドは:Cheat
Plugin 'reireias/vim-cheatsheet'
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
" quickrun
Plugin 'thinca/vim-quickrun'

"---------------------------------------------------------
" シンタックスチェック
"---------------------------------------------------------
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop']
"---------------------------------------------------------
" 括弧の自動入力
"---------------------------------------------------------
Plugin 'Townk/vim-autoclose'
autocmd FileType ruby setlocal commentstring=#\ %s
Plugin 'alvan/vim-closetag'
let g:closetag_filenames = '*.html, *.erb, *.ctp, *.vue'
"---------------------------------------------------------
" シンタックスハイライト
"---------------------------------------------------------
Plugin 'slim-template/vim-slim'
Plugin 'othree/yajs.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'posva/vim-vue'
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
highlight Search term=bold,reverse ctermfg=15 ctermbg=233 gui=bold,reverse

" Helpの日本語化
Plugin 'vim-jp/vimdoc-ja'

if has('lua') " lua 
  Plugin 'Shougo/neocomplete.vim'     " コード自動補完
  Plugin 'Shougo/neosnippet'          " スニペットの自動補完
  Plugin 'Shougo/neosnippet-snippets' " スニペット集
  Plugin 'Shougo/vimproc'
  Plugin 'Shougo/neocomplcache'
  Plugin 'Shougo/neocomplcache-rsense'

  let g:neocomplete#enable_at_startup               = 1
  let g:neocomplete#auto_completion_start_length    = 3
  let g:neocomplete#enable_ignore_case              = 1
  let g:neocomplete#enable_smart_case               = 1
  let g:neocomplete#enable_camel_case               = 1
  let g:neocomplete#use_vimproc                     = 1
  let g:neocomplete#sources#buffer#cache_limit_size = 1000000
  let g:neocomplete#sources#tags#cache_limit_size   = 30000000
  let g:neocomplete#enable_fuzzy_completion         = 1
  let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

  let g:acp_enableAtStartup = 0
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1

  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:rsenseHome = expand("~/.vim/bundle/rsense")
  let g:rsenseUseOmniFunc = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
endif
"----------------------------------------
" gxでweb検索
"----------------------------------------
Plugin 'tyru/open-browser.vim'
" open-browser {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
" }}}
"----------------------------------------
" memolist
"----------------------------------------
Plugin 'glidenote/memolist.vim'
let g:memolist_path = expand('~/GoogleDrive/memo/')
let g:memolist_gfixgrep = 1
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
"let g:memolist_unite = 1
"let g:memolist_unite_option = "-vertical -start-insert"
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>

call vundle#end()
filetype plugin indent on

"----------------------------------------
" カスタム設定の開始
"----------------------------------------

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
hi Comment ctermfg=3
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
"----------------------------------------------------------
" 配色設定
"----------------------------------------------------------
set t_Co=256
highlight StatusLine   cterm=NONE ctermfg=white ctermbg=233
highlight StatusLineNC cterm=NONE ctermfg=white ctermbg=233
highlight VertSplit    cterm=NONE ctermfg=233   ctermbg=233
highlight Pmenu     ctermbg=4
highlight PmenuSel  ctermbg=1
highlight PmenuSbar ctermbg=4
syntax on

" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

colorscheme darkblue

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
" ---------------------------------------------------------
" クリップボードからペースト時の自動インデントを無効
"---------------------------------------------------------

if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"---------------------------------------------------------
" その他 キーバインド
"---------------------------------------------------------
nnoremap <C-C> :w<CR>:SyntasticCheck<CR>
inoremap <silent> jj <ESC>:w<CR>:noh<CR>
inoremap <silent> <C-j> <ESC><ESC>
inoremap <silent> <C-l> <CR>
inoremap <silent> <C-;> <CR>
nnoremap ; :
nnoremap ' :
nnoremap <silent> Z :w<CR>
nnoremap <silent> <Esc><Esc> :noh<CR>
nnoremap <Down> gj
nnoremap <Up>   gk

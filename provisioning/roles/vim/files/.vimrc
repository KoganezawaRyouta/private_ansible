" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
  call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

" color schema
  NeoBundle 'chriskempson/vim-tomorrow-theme'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'croaker/mustang-vim'
  NeoBundle 'jeffreyiacono/vim-colors-wombat'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'vim-scripts/Lucius'
  NeoBundle 'vim-scripts/Zenburn'
  NeoBundle 'mrkn/mrkn256.vim'
  NeoBundle 'jpo/vim-railscasts-theme'
  NeoBundle 'therubymug/vim-pyte'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle "ctrlpvim/ctrlp.vim"
  NeoBundle 'nixprime/cpsm', {
  \ 'build': {
  \   'others': 'sh install.sh'
  \}}
  let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
  nnoremap <silent> <C-o> :let g:cpsm_match_empty_query = 0<CR>:CtrlPMRU<CR>
  nnoremap <silent> <C-p> :let g:cpsm_match_empty_query = 1<CR>:CtrlP<CR>

" カラースキーム一覧表示に Unite.vim を使う
" vim コマンドラインモードで :Unite colorscheme -auto-preview を実行してカラースキームが一覧表示される
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'ujihisa/unite-colorscheme'

  NeoBundle 'fatih/vim-go'

" syntastic_mode_map は 'active' もしくは 'passive' を指定します。
" 'active' だとバッファを保存するたびにsyntasticが走り、 'passive' の場合は :SyntasticCheck 実行時に走ります。
  NeoBundle 'scrooloose/syntastic'
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
  let g:syntastic_ruby_checkers = ['rubocop']

  " Git関連(git grepとか)
  NeoBundle 'tpope/vim-fugitive'

  " コメントON/OFFを手軽に実行
  NeoBundle 'tomtom/tcomment_vim'

  " 行末の半角スペースを可視化
  " :FixWhitespaceというコマンドを実行すると行末スペース削除
  NeoBundle 'bronson/vim-trailing-whitespace'

  " インデントの表示を可視化
  NeoBundle 'Yggdroot/indentLine'
  let g:indentLine_enabled = 1
  let g:indentLine_char = '»'

  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'jistr/vim-nerdtree-tabs'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'
  " 隠しファイルをデフォルトで表示させる
  let NERDTreeShowHidden = 1
  nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
  " 次のタブへ
  nnoremap <silent><C-m> gt<CR>
  " 前のタブへ
  nnoremap <silent><C-n> gT<CR>
  " VimからThe Silver Searcherを使えるようにする
  NeoBundle 'rking/ag.vim'

  " Atomのcmd + d的なことができるやつ ctrl+n で複数行選択
  NeoBundle 'terryma/vim-multiple-cursors'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

" dein
" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/')
" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に git clone
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

"dein plugin settings
if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)
endif

" ここからインストールするプラグイン
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplcache.vim')

" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

set ruler
set number
"括弧の対応をハイライト
set showmatch
"ターミナルのタイトル
set title
"文脈によって解釈が異なる全角文字の幅を、2に固定する
set ambiwidth=double
"タブ幅をスペース
set tabstop=2
"tabを半角スペースで挿入する
set expandtab
"vimが自動で生成する（読み込み時など）tab幅をスペース4つ文にする
set shiftwidth=2

"改行時などに、自動でインデントを設定してくれる
set smartindent
" O で改行
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"空白文字の可視化
set list
set listchars=tab:»-,trail:»,eol:↲,extends:»,precedes:«,nbsp:%
"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=Yellow gui=reverse guifg=Yellow
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"0で始まる数値を、8進数として扱わないようにする
set nrformats-=octal
"ファイルの保存をしていなくても、べつのファイルを開けるようにする
set hidden
set history=50
"文字のないところにカーソル移動できるようにする
set virtualedit=block
"カーソルの回り込みができるようになる
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu

"ターミナル接続を高速にする
set ttyfast

"ターミナルで256色表示を使う
set t_Co=256
syntax on

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" カーソルラインを表示する
set cursorline
highlight CursorLine ctermbg=Yellow
highlight CursorLine ctermfg=Yellow
set cursorcolumn
highlight CursorColumn ctermbg=Blue
highlight CursorColumn ctermfg=Green
set background=dark
if ($ft=='ruby')
  colorscheme Tomorrow-Night
else
  colorscheme hybrid
endif

set mouse=a

set ttymouse=xterm2

" ファイル名表示
set statusline+=%<%F

" ハイライト検索
set hlsearch

" 検索した際に最後の語句の次に最初の語句にループしないようにする
set nowrapscan

" F3でハイライトを消す
nnoremap <F3> :noh<CR>

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" クリップボートの共有
set clipboard+=unnamed

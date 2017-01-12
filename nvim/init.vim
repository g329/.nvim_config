
" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリを指定
let s:dein_dir = expand('~/.nvim_cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.nvim_config/toml/.dein.toml'
  let s:lazy_toml = '~/.nvim_config/toml/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update() や call dein#clear_state() を呼ぶ
" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばない

" vimprocを最初にインストール
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif

" その他
if dein#check_install()
  call dein#install()
endif

" The prefix key.
nnoremap    [denite]   <Nop>
nmap    <Space>f [denite]

nnoremap <silent> [denite]r:<C-u>Denite -auto_preview<CR>
nnoremap <silent> [denite]b :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
"}}}

" 見た目に関わる設定 
"colorscheme lucario
syntax on
colorscheme monokai
set t_Co=256
highlight Normal ctermbg=none
set termguicolors
syntax enable
filetype plugin on
filetype indent on
set nohlsearch
set number
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示

" 開始時にNERDTreeを開く
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" F5でmakeやスクリプト実行
noremap <F5> <ESC>:call RUN()<ENTER>
function! RUN()
  :w
  let ext = expand("%:e")
  if ext == "py"
    !python %
  else
    !make %:r
  endif
endfunction

" 移動関連
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

noremap <c-h> 0
noremap <c-l> $
nnoremap <c-/>/ *

" インサートモード
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <silent> <C-f> <S-Right>
inoremap <silent> <C-b> <S-Left>
inoremap <silent> <c-d> <c-g>u<Del>
inoremap <silent> <c-g> <c-g>u<BS>

" キー無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

"快適化のための設定
set lazyredraw
nnoremap ; :

"encoding setting
scriptencoding utf-8
set encoding=utf-8

"{{{ }}}で折りたたみ
set foldmethod=marker
nnoremap ,z zMzv

"タブやインデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する


"コマンドエイリアス
noremap <C-a> :NERDTreeToggle<CR>

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"ファイル関係
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" タブ関係
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
"map <silent> [Tag]n :tabnext<CR>
map <silent> L :tabnext<CR>
" tn 次のタブ
"map <silent> [Tag]p :tabprevious<CR>
map <silent> H :tabprevious<CR>
" tp 前のタブ



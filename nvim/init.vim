
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
" }}}

" color setting
colorscheme monokai 
set termguicolors
syntax enable

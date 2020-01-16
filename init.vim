" vim-plug
"
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-textobj-user'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'lambdalisue/gina.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'neomake/neomake'
Plug 'vimlab/neojs'
Plug 'chrisbra/NrrwRgn'
Plug 'w0rp/ale'
Plug 'wokalski/autocomplete-flow'
Plug 'mattn/emmet-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'posva/vim-vue'
Plug 'will133/vim-dirdiff'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
""" develop environment
Plug 'mklabs/split-term.vim'
Plug 'itchyny/lightline.vim'
Plug 'w0ng/vim-hybrid'
""" original
"Plug 'alaPing/vim-pair-file-open' , { 'branch': 'develop' }
Plug 'alaPing/vim-pair-file-open'
""" js
Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'kern/vim-es7'
"Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'xmledit'
"Plug 'othree/html5.vim'
"Plug 'othree/yajs.vim'
"Plug 'othree/es.next.syntax.vim'
"Plug 'moll/vim-node'
"Plug 'neovim/node-host', { 'do': 'npm install' }
"Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
"Plug 'januswel/prettier.vim'
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'othree/es.next.syntax.vim'
"Plug 'dart-lang/dart-vim-plugin'
call plug#end()

" 構文毎に文字色を変化させる
syntax on
" ファイル形式を検出する
filetype on
" ファイル形式別インデント、プラグインを有効化する
filetype indent plugin on
" beep音をベルマークに変換する
set visualbell
" 常にステータスラインを表示する
set laststatus=2
" カーソルの現在位置（行、列）を表示する
set ruler
" 現在のモード（INSERT, REPLACEなど）を左下に表示する
set showmode
" 入力途中のコマンドを右下に表示する
set showcmd
" 検索してヒットした箇所をハイライト表示する
set hlsearch

set expandtab
set tabstop=2
set shiftwidth=2

" 新しい行を作成したとき、前の行のインデントに合わせる
set autoindent
" 表示するときに変換する文字コード
set encoding=utf-8
" 読み込む文字コードの順序
set fileencodings=iso2022-jp-3,utf-8,euc-jisx0213,cp932
" 全角文字でvimがデザイン崩れを起こさないようにする設定
set ambiwidth=double
" タブ補完
set wildmode=longest,list,full
set wildmenu
" splitで新しいウィンドウを開くとき、下や右に開くようにする
set splitbelow
set splitright

"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" バックスペースの挙動を制御する（一般的な挙動）
set backspace=indent,eol,start
" 不可視文字の可視化
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:%

autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

"set t_Co=256
"set t_Sf=[3%dm
"set t_Sb=[4%dm
"hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" カラースキーマの指定
set background=dark
colorscheme hybrid

" mapleaderの変更と割当
let mapleader = "\<Space>"
"noremap <Leader>r   :e!<CR>
"noremap <Leader>c   :vnew\|0read!<Space>
"noremap <Leader>w   :set wrap!<CR>
"noremap <Leader>n   :echo @%<CR>

" set pastetoggle=<Leader>p

" lightline
"let g:lightline = {
"  \ 'colorscheme':  'Tomorrow_Night_Bright',
"  \ 'separator':    {'left': '\ue0b0', 'right': '\ue0b2'},
"  \ 'subseparator': {'left': '\ue0b1', 'right': '\ue0b3'}
"  \}
let g:lightline = {
  \ 'colorscheme':  'Tomorrow_Night_Bright',
  \}

" emmet
let g:user_emmet_leader_key='<C-f>'

" split-term
let g:disable_key_mappings = 'yes'
tnoremap <silent> <C-s> <C-\><C-n>
noremap <Leader>s     :Term<Space>
noremap <Leader><S-s> :VTerm<Space>

" fzf.vim
let g:fzf_action = {
  \ 'ctrl-f': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': '-tabnew' }
noremap <Leader>fb       :Buffers<CR>
noremap <Leader>ff       :GFiles<CR>
noremap <Leader>fg       :Files<CR>
noremap <Leader>fl       :Lines<CR>
noremap <Leader>fh       :History<CR>
noremap <Leader>fk       :History:<CR>
noremap <Leader>f/       :History/<CR>
noremap <Leader>fm       :Marks<CR>
noremap <Leader>fw       :Windows<CR>
noremap <Leader>f<Space> :Rg<Space>

command! -bang -nargs=* -complete=file Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading '.shellescape(<q-args>).' apps lib data/static/css data/static/js', 0,
  \   fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:wrap'))

"" fugitive
"noremap <Leader>gs       :Gstatus<CR>
"noremap <Leader>gd       :Gdiff<CR>
" gina
noremap <Leader>gs       :Gina status<CR>
noremap <Leader>gd       :Gina diff<CR>

" Session
silent !mkdir ~/.vim_session > /dev/null 2>&1
autocmd VimLeave * mksession! ~/.vim_session/_Autosave
noremap <F5> :mksession! ~/.vim_session/_Tmp<CR>
noremap <F6> :mksession! ~/.vim_session/
noremap <F7> :source ~/.vim_session/_Tmp<CR>
noremap <F8> :source ~/.vim_session/

" Server
if empty(glob('/tmp/nvim.sock'))
  call serverstart('/tmp/nvim.sock')
endif

" ALE
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \}
let g:ale_completion_enabled = 0

" tigris
let g:tigris#enabled = 1
let g:tigris#debug = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" neosnippet
let g:neosnippet#enable_completed_snippet = 1

" vim-js-pretty
let g:vim_jsx_pretty_colorful_config = 1

" vim-pair-file-open
let g:vim_pair_file_open#pair = {
  \ '*Screen.js': '*ScreenContainer.js',
  \ '*ScreenContainer.js': '*Screen.js',
  \ '*Redux.js': '../Sagas/*Sagas.js',
  \ '*Sagas.js': '../Redux/*Redux.js',
  \ }

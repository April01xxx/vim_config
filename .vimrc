"Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statement
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
" configure bundles
filetype off  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe
Plugin 'file:///Users/laner/.vim/bundle/YouCompleteMe'
" configure YouCompleteMe
" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
" close the completion menu
" let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

" c project配置文件路径
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/c/.ycm_extra_conf.py'

" All of your plugins must be added before the following line
call vundle#end()   " required
filetype plugin indent on " required

set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"set how many lines of history vim has to remeber
set history=1000

"enable filetype plugin
filetype plugin on
filetype indent on

" set to auto reload when a file is changed outside
set autoread

" always show current positon
set ruler

" highlight search
set hlsearch

" make search act like search in modern browser
set incsearch

" set maginc on
set magic

" syntax highlight
syntax enable

" remove toolbar
set guioptions-=T

"colorscheme peaksea

" encode
set encoding=utf8

" turn off backup
set nobackup
set nowb
set noswapfile

" tab and indent
set expandtab
set cindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
" case不缩进
set cino=:0

set ai " autoindent
set si " smartindent
set wrap " wrapline

"文件类型为python时设置缩进为4个空格
"BufNewFile表示新建文件,BufRead表示打开文件
autocmd BufNewFile,BufRead *.py set shiftwidth=4 tabstop=4 softtabstop=4

" linenumber
set nu

"winmanager,mac os下<d-t>是新建一个Tab式样终端
"<d-w>关闭终端,<d-s-[>切换,其中d表示command
let g:persistentBehaviour=0
let g:winManagerWindowLayout='TagList|FileExplorer'
let g:winManagerWidth=30
map <c-w><c-t> :WMToggle<cr>

"colorcolumn
set cc=81

"解决中文乱码
set fileencodings=utf-8,cp936

"默认文件格式
set fileformats=unix

"Tlist
let Tlist_Show_One_File=1 "只显示一个文件的taglist

"设置tags递归查找
set autochdir
set tags=tags;

"保存时去除行尾空格,采用silent在找不到时忽略错误提示
autocmd BufWrite * silent! execute ":%s/\\s\\+$//g"

"colorscheme
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1

" colorscheme
set background=dark

"hilight cursorline and lineNr
set cursorline

"powerline设置
" rtp(runtimepath)
"set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256
"set guifont=Monaco\ for\ Powerline:h12

"airline设置 ~/.vim/doc
"set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"set guifont=Monaco\ for\ Powerline:h12

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
"map leader
let mapleader=","
"换行
inoremap <c-j> <ESC>o
"行尾
inoremap <c-l> <ESC>A


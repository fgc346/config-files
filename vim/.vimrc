
" =============================================================================
"  ______        __  __        __      _______ __  __ 
" |  ____|      |  \/  |       \ \    / /_   _|  \/  |
" | |__   _ __  | \  / | __ _   \ \  / /  | | | \  / |
" |  __| | '__| | |\/| |/ _` |   \ \/ /   | | | |\/| |
" | |____| |    | |  | | (_| |    \  /   _| |_| |  | |
" |______|_|    |_|  |_|\__,_|     \/   |_____|_|  |_|
"                                                     
"                                                     
" =============================================================================
"
" Author: Er Ma <fhxwqg@gmail.com>
" Source: 
" Version: 0.0.1
" Created: 2023-12-9
" 
" Sections:
"   - Common Settings
"   - Extend Settings
"   - Language Supports
"   - Plugins
"   - Key Mapping
"   - Plugin Settings
"   - Load Customize Settings
"
" =============================================================================


" -----------------------------------------------------------------------------
" COMMON SETTINGS
" -----------------------------------------------------------------------------

" 定义快捷键的前缀，即<Leader>
let mapleader=";"


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible    "设置非兼容模式 
filetype plugin indent on " 开启文件类型检测
syntax on                 " 开启语法高亮 

set nofoldenable            " 默认关闭代码折叠

set backspace=indent,eol,start  "智能回环，退格键在插入模式正常使用
set virtualedit=block,onemore   "允许光标出现在最后一个字符的后面

set number                  "显示行号
set relativenumber          "显示相对行号
set ruler                   " 显示标尺信息

" 启用空格展开，表示在插入模式下，按tab将插入空格而不是制表符
set expandtab               " Tab替换为空格
set smartindent             " 显示智能缩进

set softtabstop=2           " tab缩进单位为2
set shiftwidth=2            " 自动缩进单位2
set encoding=utf-8          " UTF-8 编码

set t_Co=256                " 开启256色（若终端支持）
" 开启True-Color,注意,不支持真彩色的终端将显示异常
if has("termguicolors")
    " fix bug for vim
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " enable true color
    set termguicolors
endif

" 设置右侧参考线，超过表示代码太长了，考虑换行
set colorcolumn=80
  
set background=dark     "设置为深色背景
set nowrap              " 禁止折行

set ignorecase          " 搜索时忽略大小写
set incsearch           " 搜索时实时高亮
set hlsearch            " 高亮所有搜索结果

" set cursorcolumn        " 高亮当前列
set cursorline          " 高亮当前行


set scrolloff=5         " 屏幕顶/底部 保持5行文本
set laststatus=2        "显示状态栏
" set noshowmode          "不显示当前状态
set showcmd             " 显示输入的命令


" vim自身命令行模式智能补全
" 当在命令行模式下输入部分命令或文件名时，vim会在命令行下方创建一个横向菜单，
" 显示可能的匹配项，可以使用tab键在这个菜单中进行选择
set wildmenu

set nobackup
set noswapfile
set autoread
set autowrite
set confirm

set history=1024

set timeoutlen=700        " Time to wait for a command


" 启用匹配括号高亮显示
set showmatch        " Show matching brackets.
" 在GUI模式下，移除工具栏(Toolbar)
set guioptions-=T

" 获取当前工作目录
let curpwd = getcwd()


" 禁止光标闪烁
" a:block表示将光标设置为块状，光标呈现为一个实心的方块
" blinkon0表示光标不闪烁    
set gcr=a:block-blinkon0

"花括号自动格式化，首行一个tab
autocmd FileType cpp,java inoremap { {<CR>}<ESC>kA<CR>

set fenc=" "
"显示匹配
set showmatch
"括号匹配
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
set selectmode=mouse,key
set selection=exclusive
set mouse=n "可视模式下使用鼠标，set mouse=a这个命令导致在vim下复制粘贴不好用
set ai "vim中复制粘贴保存格式
set smartcase "如果有大小写字母，则切换到大小写敏感查找

autocmd InsertEnter * se cul    " 用浅色高亮当前行"
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示

" set modeline
set modeline
" 开启语义分析
syntax enable
syntax on

" -------------------------------------------------
"  EXTEND SETTINGS
" -------------------------------------------------
" Close relative number in Insert mode
augroup relative_number
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup end

" -------------------------------------------------
" LANGUAGE SUPPORTS
" -------------------------------------------------

if filereadable(expand($HOME . '/.vimrc.language'))
  source $HOME/.vimrc.language
endif

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')

let g:plug_url_format='git@github.com:%s.git'

Plug 'scrooloose/nerdtree',{'on': 'NERDTreeToggle'} 
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tcomment_vim'                                  " 添加注释
Plug 'junegunn/vim-slash'                                   " 优化搜索，移动清除搜索高亮
Plug 'mhinz/vim-startify'      " 启动页图标
Plug 'morhetz/gruvbox'         " gruvbox 配色                      
Plug 'vim-airline/vim-airline' " 美化Vim状态栏
Plug 'chxuan/change-colorscheme'  " 配色切换
Plug 'dracula/vim'                " dracula 配色
Plug 'tabnine/YouCompleteMe', { 'do': './install.py' }      " 代码自动完成

" 设置语言组
" Plugins for language
" markdown,如果要支持markdown预览，vim版本有要求，vim版本大于8.1，且
" 需要支持python
if count(g:language_group, 'markdown')
  Plug 'plasticboy/vim-markdown'                                            " Markdown 代码高亮，自动格式化
  Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' } " Markdown 预览
endif

call plug#end()


" autocmd vimenter * nested colorscheme gruvbox

set bg=dark

" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
map <F12> :NextColorScheme<CR>
imap <F12> <Esc> :NextColorScheme<CR>
map <F9>  :PreviousColorScheme<CR>
imap <F9> <Esc> :PreviousColorScheme<CR>

" Markdown preview
let g:mkdp_echo_preview_url = 1
map <slient> <F5> :MarkdownPreview<CR>
map <slient> <F6> :MarkdownPreviewStop<CR>


" 定义快捷键 关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键,保存文件
nmap <Leader>w :w<CR>
" 删除光标所在单词
" close TAB
nmap tabc :tabc <CR>
" go to previous table
map gp :tabp <CR>
" 定义快捷键 跳转到光标所在关键词的定义处
" here are multiple matches, show me a list of all the matching tags 
nmap <Leader>gt g<C-]>
" 定义快捷键 跳回原关键词 与 ;gr 配合使用
nmap <Leader>gr <C-T>
" 快速移动到行首，行尾
map <Leader>1 ^
map <Leader>2 $

" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gg <C-W><C-W>

" 向左
nnoremap <leader>h <C-W><C-H>
" 向右
nnoremap <leader>l <C-W><C-L>
" 向上
nnoremap <Leader>k <C-W><C-K>
" 向下
nnoremap <Leader>j <C-W><C-J>
" 去除高亮
" 若进行过搜索操作，并且搜索匹配的部分被高亮显示，可以使用nohlsearch取消高亮
nmap <Leader>h :nohlsearch<CR>
" 打开文件
nmap <Leader>e :e<Space>
" 不关闭文件推出
nmap <Leader>z <C-Z>
" 水平分隔
nmap <Leader>s :Sex<CR>
" 竖直分隔
nmap <Leader>v :Vex<CR>
" 全局替换
nmap <Leader>r :%s/fileName-/fileName+/g
" align 表格对齐
nmap <Leader>t :Tab /
nmap<leader>tg :!ctags -R --fields=+aS --extra=+q<CR>
" map! mapmode-ic Insert/Command-line，在插入模式和命令行模式映射
" Ctrl-X，Ctrl-O，在插入模式下，用于打开Omni补全，Omni(omniscient)是一种高级的补全功能
map! <C-O> <C-X><C-O>
" 使用NERDTree插件查看工程文件。设置快捷键
" silent
" 告诉vim在执行这个映射时不要在命令行显示消息,避免在命令行看到不必要的消息输出
" 使界面更加干净
nnoremap <silent> <Leader>n  :NERDTreeToggle <CR> 


" 粘贴到系统剪切板
" "*表示系统剪切板寄存器（clipboard register）
map <Leader>y "*y

" 使用ctrlc, v就可以实现vim之间的复制粘贴
vnoremap <C-c> :w! ~/tmp/clipboard.txt <CR>
inoremap <C-v> <Esc>:r ~/tmp/clipboard.txt <CR>

"vim支持clipboard
set clipboard=unnamedplus
"支持在Visual模式下，通过ctrl-y复制到系统剪切板"
vnoremap <C-y> "+y
"支持在normal模式下，通过Ctrl-p粘贴到系统剪切板
nnoremap <C-p> "*p


" Ctrl + D 映射为 向下9行
noremap <C-d> :call cursor(line('.') + 9, col('.'))<CR>

" Ctrl + U 映射为 向上9行
noremap <C-u> :call cursor(line('.') - 9, col('.'))<CR>


" shortcut for markdown
" 创建时间快捷键for markdown
nmap tm :call SetTime() <CR>
func SetTime()
        call append(line("."), "\# ".strftime('%a %d %b %Y'))
endfunc

nmap tb :call SetTable() <CR>
func SetTable()
        call append(line("."), "\| | | ")
        call append(line(".")+1, "\|---|---|")
        call append(line(".")+2, "\| | |")
endfunc

nmap pc :call SetPic() <CR>
func SetPic()
        call append(line("."), "\<img src='' width=600 alt=''> </img></div>")
endfunc

nmap pi :call SetPic1() <CR>
func SetPic1()
        call append(line("."), "\![]()")
endfunc

nmap vi :call SetVideo() <CR>
func SetVideo()
        call append(line("."), "\<video src='1.mp4' controls='controls' width='640' height='320' autoplay='autoplay'> Your browser does not support the video tag.</video></div>")
endfunc

nmap cl :call SetCollor() <CR>
func SetCollor()
        call append(line("."), "<span  style='color: #f16707;'> </span>")
endfunc

" vim cc
nmap cc :call SetCC() <CR>
func SetCC() 
    call append(line("."), "// vim: et tw=100 ts=4 sw=4 cc=120")  
endfunc

"------------------------------------------------------------------------------
" Users Function Settings
"------------------------------------------------------------------------------
" 重新打开文档时光标回到文档关闭前的位置

if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif

let g:startify_custom_header = [
            \ '  ______        __  __        __      _______ __  __ ',
            \ ' |  ____|      |  \/  |       \ \    / /_   _|  \/  |',
            \ ' | |__   _ __  | \  / | __ _   \ \  / /  | | | \  / |',
            \ ' |  __| | |__| | |\/| |/ _` |   \ \/ /   | | | |\/|  ',
            \ ' | |____| |    | |  | | (_| |    \  /   _| |_| |  | |',
            \ ' |______|_|    |_|  |_|\__,_|     \/   |_____|_|  |_|',
            \ ' ',
            \ ' Welcome to ErMa Vim ',
            \ ' ',
            \]

"------------------------------------------------------------------------------
" PLUGIN SETTINGS

"------------------------------------------------------------------------------
" Language plugin settings
if count(g:language_group, 'markdown')
  let g:vim_markdown_new_list_item_indent = 2
endif

" ariline 这里的设置还有问题，暂时搁置
let g:airline#extensions#tabline#enabled=1
let g:airlen_powerline_fonts=1



"------------------------------------------------------------------------------
" Load Plugins Customize Settings
"------------------------------------------------------------------------------

let g:tlist_markdown_settings = 'markdown;h:Headlins'
"新建.c,.h,.sh,.Java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.Java,*.go exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."),   "\# File Name:    ".expand("%"))
        call append(line(".")+1, "\# Author:                 ")
        call append(line(".")+2, "\# mail:                   ")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/* ************************************************************************")
        call append(line("."),   "> File Name:     ".expand("%"))
        call append(line(".")+1, "> Author:                  ")
        call append(line(".")+2, "> mail:              ")
        call append(line(".")+3, "> Created Time:  ".strftime("%c"))
        call append(line(".")+4, "> Description:   ")
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc


" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 设置忽略的文件
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']

" 使用TlistToggle查看文件函数列表。设置快捷键：<F12>
nnoremap  <Leader>m  :TlistToggle <CR> 

"  YCM Setting


let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

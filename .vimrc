syntax on                      "语法支持
filetype plugin indent on

"common conf {{             通用配置
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set softtabstop=4
set cursorline              "为光标所在行加下划线
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入
set mouse=a

set ignorecase              "检索时忽略大小写
"set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
set hls                     "检索时高亮显示匹配项
"set helplang=cn             "帮助系统设置为中文
set foldmethod=syntax       "代码折叠
"}}

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>

"conf for plugins {{ 插件相关的配置
"状态栏的配置 
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}
"pathogen是Vim用来管理插件的插件
"pathogen{
execute pathogen#infect()
"}

"}}

"alias commands {{
command NTree NERDTree
"}}

"setting style {{
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"}}

"Commenting blocks of code.
autocmd FileType c,cpp,java,scala       let b:comment_leader = '// '
autocmd FileType sh,ruby,python,perl    let b:comment_leader = '# '
autocmd FileType conf,fstab             let b:comment_leader = '# '
autocmd FileType tex                    let b:comment_leader = '% '
autocmd FileType mail                   let b:comment_leader = '> '
autocmd FileType vim                    let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"vim-airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
" to show numbering:
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

"--Functions
" diff between the currently edited file and its unmodified version in the
" filesystem; to get out of diff view you can use the :diffoff
" command
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

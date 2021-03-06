" normal configuration
set number
nnoremap j gj
nnoremap k gk
nnoremap <tab> :bn<cr>
nnoremap L :bn<cr>
nnoremap H :bp<cr>
nnoremap Q :bd!<cr>
inoremap jk <esc>
inoremap JK <esc>
set background=dark
set ignorecase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
set hls
set guioptions-=r
set guioptions-=L
set nobackup
set noswapfile
set backspace=indent,eol,start

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Enhancement
Plug 'Raimondi/delimitMate'
" Plug 'yuttie/comfortable-motion.vim'

" C++
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'

Plug 'Yggdroot/LeaderF'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" configuration for yuttie/comfortablemotion
" let g:comfortable_motion_scroll_down_key = "j"
" let g:comfortable_motion_scroll_up_key = "k"

" configuration for Raimondi/delimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_expand_jump=1

" configuration for vim-airline/vim-airline
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN :{bufnr{"%"}}'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_powerline_fonts=1

" configuration for Yggdroot/indentLine
" let g:indentLine_char = ''
 let g:indentLine_leadingSpaceEnabled=1
" let g:indentLine_leadingSpaceChar='.'

" configuration for ludovicchabant/vim-gutentags
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" configuration for scrooloose/nerdtree
noremap <C-n> :NERDTreeToggle<CR>

" configuration for Yggdroot/LeaderF
noremap <C-m> :LeaderfMru<cr>
noremap <C-f> :LeaderfFunction<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" configuration for w0rp/ale
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" configuration for YCM
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }


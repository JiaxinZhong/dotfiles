set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

"--------------------------------------------------------------------------------
" Font settings
"--------------------------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
"--------------------------------------------------------------------------------
" End of Font settings
"--------------------------------------------------------------------------------
"

" Make backspace behave like every other editor.
set backspace=indent,eol,start
" The default leader is \, but a comma is much better.
let mapleader = ','
" map ; :

" modify jk for wrap situation
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')


"------------------Visuals------------------"
" Use 256 colors. This is useful for Terminal Vim.
set t_CO=256
set background=dark 
colorscheme atom-dark
" colorscheme Tomorrow-Night
"set background=dark
" Let's activate line numbers.
set number
set relativenumber
" show the current row and column
set ruler

" Disable GUI scrollbars.
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 'c'	Use console dialogs instead of popup dialogs for simple
set guioptions+=c

" Disable GUI tab
set guioptions-=e

" Set the default window size in MacVim
set lines=1000
set columns=10000
set colorcolumn=76
" Macvim-specific line-height.
set linespace=10


" We'll fake a custom left padding for each window.
hi LineNr guibg=bg
set foldcolumn=0
"hi foldcolumn guibg=bg


" Get rid of ugly split borders.
"hi vertsplit guifg=bg guibg=bg

set tabstop=4
set shiftwidth=4


" highlight current line and column
" set cursorline
" set cursorcolumn



" show incomplete commands right below
set showcmd
" show current modes
set showmode


" keep 4 lines when scrolling
set scrolloff=4

" jump to matches when entering parentheses
set showmatch
" tenths of a second to show the matching parenthesis
set matchtime=1


"------------folding-----------------------"
set foldmethod=indent
set foldlevel=99
:nmap <space> za

"------------------Search------------------"

set hlsearch
set incsearch
" ignore case when searcing
set ignorecase
" no ignorecase if Uppercase char present
set smartcase



" for plug vim-latex
" change the map <c-j> into <c-space>
" imap <C-i> <Plug>IMAP_JumpForward
" nmap <C-i> <Plug>IMAP_JumpForward
" vmap <C-i> <Plug>IMAP_JumpForward


"------------------Split management------------------"
set splitbelow
set splitright

nmap <C-j> <C-W><c-j>
nmap <C-k> <C-W><c-k>
nmap <C-h> <C-W><c-h>
nmap <C-l> <C-W><c-l>



"------------------Mappings------------------"

" Make it easy to edit the Vimrc file.
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>egv :tabedit ~/.gvimrc<cr>
nmap <leader><space> :nohlsearch<cr>

" Daily preferred editing 
" nmap <leader>. i<space><esc>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

map Y y$

nmap <leader>f :tag<space>

nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nmap <leader>d :bd<cr>

"--------------------Plugins------------------"

"/
"/ CtrlP
"/
"let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\'
let g:ctrlp_custom_window = 'min:1,max:10,results:10'

"nmap <c-r> :CtrlPBufTag<cr>
nmap <d-e> :CtrlPMRUFiles<cr>
nmap <d-p> :CtrlP<cr>



"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

" Make NERDTree easier to toggle
nmap <f2> :NERDTreeToggle<cr>
" au vimenter * NERDTree   " 开启vim的时候默认开启NERDTree
"
"
"     How can I open a NERDTree automatically when vim starts up if no files
"     were specified?
"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim when the left open window is only NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
" b:NERDTree.isTabTree()) | q | endif

"/
"/ Greplace.vim
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"------------------Auto-Commands------------------"

" Automatically source the Vimrc file on save.
augroup autosoucring
	autocmd!
	autocmd BufWritePost .vimrc source %
	autocmd BufWritePost .gvimrc source %
augroup END


"------------------specific filtype settings------------------"

"/
"/ for rst file
"/







" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located.
"
"
"----for vim-latex Plugin------
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" au FileType tex nmap <leader>ep :!open -a "skim.app" %:r.pdf<cr><cr>
au FileType tex nmap <leader>ep :!open -a "PDF Expert.app" %:r.pdf<cr><cr>
" nmap <leader>ep :!open -a "skim.app" %:r.pdf<cr><cr>
" nmap <leader>ep :!open -a "Adobe Acrobat Reader DC.app" %:r.pdf<cr><cr>
" au FileType tex nmap <leader>ep :!evince -w %:r.pdf<cr><cr>
" old no bibtex
" au FileType tex nmap <leader>ee :w<cr>:!xelatex %<cr><cr><leader>ep
" au FileType tex map <leader>ee :w<cr>:!xelatex %<cr><cr>:!bibtex %:r.aux<cr><cr>:!xelatex %<cr><cr>:!xelatex %<cr><cr><leader>ep
au FileType tex map <leader>eb :w<cr>:!xelatex %<cr><cr>:!bibtex %:r.aux<cr><cr>:!xelatex %<cr><cr>:!xelatex %<cr><cr><leader>ep
au FileType tex map <leader>ee :w<cr>:!xelatex %<cr><cr><leader>ep
" au FileType asy nmap <leader>ee :!asy %<cr>

" nmap <leader>ep :!open -a "skim.app" %:r.pdf<cr><cr>
nmap <leader>ea :w<cr>:!asy %:p<cr><cr>:!open -a "PDF Expert.app" %:r.pdf<cr><cr>
" nmap <leader>ea :w<cr>:!asy -V %<cr><cr>
nmap <leader>en :w<cr>:!asy %:p<cr><cr>:!open -a "xee³.app" %:r.png<cr><cr>
" nmap <leader>ew :w<cr>:!asy %<cr><cr>:!open -a "Preview.app" %:r.eps<cr><cr>
"----end for vim-latex Plugin------


"------for tagbar-----------
map <leader>t :TagbarToggle<CR>
let g:tagbar_auto_focus =1
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.tex,*.py call tagbar#autoopen()
"------for tagbar-----------
"
"
"
"
"********************************************************************************
" For YouCompleteMe
"********************************************************************************
let g:ycm_autoclose_preview_window_after_completion=1
" 跳转到定义处
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 默认tab、s-tab和自动补全冲突
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>'] 
let g:ycm_auto_trigger = 1


  
" *********************************************
" vim-airline
" *********************************************
" 开启powerline字体
let g:airline_powerline_fonts = 1
" 使用powerline包装过的字体
set guifont=Source\ Code\ Pro\ for\ Powerline:h12


" *********************************************
" python代码风格PEP8
" *********************************************
au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix
au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2|set softtabstop=2|set shiftwidth=2
" *********************************************
" end of python代码风格PEP8
" *********************************************
"

" ****************************************************************************************
" For NERDCommenter
" ****************************************************************************************
let g:NERDSpaceDelims=1
let g:NERDSpaceDelims=1
" ****************************************************************************************
" end of For NERDCommenter
" ****************************************************************************************
"
" ****************************************************************************************
" For easymotion
" ****************************************************************************************
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
" ****************************************************************************************
" end of For easymotion
" ****************************************************************************************
"
"
" ****************************************************************************************
" For ctags
" ****************************************************************************************
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" ****************************************************************************************
" end of For ctags
" ****************************************************************************************
"
" ****************************************************************************************
" For easytag
" ****************************************************************************************
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:easytags_file = '~/.vim/tags'
" map <leader>. :UpdateTags -R %<cr>:HighlightTags<cr>
" ****************************************************************************************
" end of For ctags
" ****************************************************************************************
"
" 解决与 YCM 插件的冲突
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"



" Open up current file in chrome
" https://www.shanestillwell.com/2013/12/05/open-current-file-in-chrome-with-vim/
nmap <silent> <F12> :exec 'silent !open -a "Google Chrome" % &'<cr>


" PDF Viwer
" xuhdev/vim-latex-live-preview
autocmd Filetype tex setl updatetime=1
" let g:livepreview_previewer = 'evince'
" nmap <F12> :LLPStartPreview<cr>


syntax enable
set background=dark
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set tabstop=4
set shiftwidth=4
set smarttab
" set expandtab
set number


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode':'passive'}
noremap <F10> :SyntasticCheck<CR> :SyntasticToggleMode<CR> :w<CR>
nnoremap <F8> :vertical resize +20<CR>
nnoremap <F9> :vertical resize -20<CR>
nnoremap <F7> :resize +5<CR>
nnoremap <F6> :resize -5<CR>
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

"---------------=== Colorschemes ===----------------------
Plugin 'glepnir/oceanic-material'

"---------=== Навигация по коду/проекту ===-------------
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser

"------------------=== Прочее ===----------------------

Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more

"--------------=== Поддержка сниппетов ===---------------
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'

  " Optional:
  Plugin 'honza/vim-snippets'
"---------------=== Поддержка языка ===-------------
" --- Python ---
Plugin 'klen/python-mode'               " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"=====================================================
" General settings for IDE mode
"=====================================================
set backspace=indent,eol,start
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
endif
set ttyfast

" включить подсветку кода
syntax on
" раскомментируйте эти строки, если хотите, чтобы NERDTree/TagBar автоматически отображались при запуске vim
" autocmd vimenter * TagbarToggle
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

tab sball
set switchbuf=useopen

" отключаем пищалку и мигание
set visualbell t_vb=
set novisualbell

set enc=utf-8	     " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch	     " инкреминтируемый поиск
set hlsearch	     " подсветка результатов поиска
set nu	             " показывать номера строк
set scrolloff=5	     " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" прячем панельки
"set guioptions-=m   " меню
set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
let g:snipMate.snippet_version = 0

" настройки Vim-Airline
" set laststatus=2
" let g:airline_theme='badwolf'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR> 	   " CTRL+Q - закрыть текущий буффер


"Цветовая схема. Подключается после плагинов.
colorscheme oceanic_material 

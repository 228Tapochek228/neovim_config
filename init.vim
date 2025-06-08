" ==============================================================================
" Плагины (используется vim-plug)
" ==============================================================================
call plug#begin('~/.config/nvim/plugged')

" Файловый менеджер и поиск
Plug 'preservim/nerdtree'             " Файловое дерево
Plug 'nvim-telescope/telescope.nvim'  " Поиск файлов и строк
Plug 'nvim-lua/plenary.nvim'          " Зависимость для Telescope
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }  " Отображение открытых буферов

" Автодополнение и редактирование
Plug 'windwp/nvim-autopairs'          " Автоматическое закрытие скобок
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Автодополнение
Plug 'tpope/vim-commentary'           " Быстрое комментирование кода
Plug 'preservim/vim-markdown'        " Поддержка Markdown

" Внешний вид и UI
Plug 'Mofiqul/vscode.nvim'           " Цветовая схема
Plug 'goolord/alpha-nvim'            " Стартовое окно

" Утилиты
Plug 'voldikss/vim-floaterm'         " Плавающий терминал

call plug#end()

" ==============================================================================
" Основные настройки Neovim
" ==============================================================================

" Настройки интерфейса
set number                " Показывать номера строк
syntax on                 " Подсветка синтаксиса
set nowrap                " Не строки
set signcolumn=yes        " Всегда показывать колонку знаков слева
set clipboard=unnamedplus " Использовать системный буфер обмена

" Настройки табуляции и отступов
set tabstop=2             " Ширина табуляции в 2 пробела
set shiftwidth=2          " Ширина сдвига в 2 пробела

" Настройки кодировки
set encoding=utf-8        " Кодировка UTF-8
set fileencoding=utf-8    " Кодировка файлов UTF-8

" Настройки производительности
set nobackup              " Не создавать резервные копии
set nowritebackup         " Не создавать backup-файлы
set updatetime=200        " Время обновления (мс)
set shortmess+=c          " Не показывать сообщения в командной строке
set hidden                " Позволять скрывать буферы без сохранения

" Настройки цветовой схемы
lua <"),
    dashboard.button("f", "▸ Find file", ":Telescope find_files"),
    dashboard.button("r", "▸ Recent files", ":Telescope oldfiles"),
}

alpha.setup(dashboard.config)
EOF

" Автоматическое закрытия Alpha
lua < 
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\" :
      \ coc#refresh()
inoremap  coc#pum#visible() ? coc#pum#prev(1) : "\"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Настройка Enter для подтверждения автодополнения
inoremap   coc#pum#visible() ? coc#pum#confirm() : "\u\\=coc#on_enter()\"

" ==============================================================================
" Горячие клавиши
" ==============================================================================

" Основные команды
nmap e :NERDTreeToggle
nmap q :q!
nmap w :w
nmap l :bn
nmap h :bp
nmap c :bd

" Настройки отображения
nmap = :set wrap
nmap - :set nowrap

" Поиск с помощью Telescope
nnoremap ff Telescope find_files
nnoremap fg Telescope live_grep

" Терминал
nnoremap t FloatermNew

" ==============================================================================
" ascrii кот, просто ascii кот
" ==============================================================================
"        (`.
"         ) )
"        ( (
"         \ \
"          \ \
"        .-'  `-.
"       /        `.
"      (      )    `-._ ,    _
"       )   ,'         (.\--'(
"       \  (         ) /      \
"        \  \_(     / (    <6 (6
"         \_)))\   (   `._  .:Y)__
"          '''  \   `-._.'`---^_)))
"                `-._ )))       ```
"                     ```

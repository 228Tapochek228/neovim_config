" ==============================================================================
" Плагины (используется vim-plug)
" ==============================================================================
call plug#begin('~/.config/nvim/plugged')

" Файловый менеджер и поиск
Plug 'preservim/nerdtree'             " Файловое дерево
Plug 'nvim-telescope/telescope.nvim'  " Поиск файлов и строк
Plug 'nvim-lua/plenary.nvim'          " Зависимость для Telescope

" Автодополнение и редактирование
Plug 'windwp/nvim-autopairs'          " Автоматическое закрытие скобок
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Автодополнение
Plug 'tpope/vim-commentary'           " Быстрое комментирование кода

" Внешний вид и UI
Plug 'dracula/vim', { 'as': 'dracula' }  " Цветовая схема
Plug 'goolord/alpha-nvim'            " Стартовое окно (только ручной запуск)

" Утилиты
Plug 'voldikss/vim-floaterm'         " Плавающий терминал
Plug 'preservim/vim-markdown'        " Поддержка Markdown

call plug#end()

" ==============================================================================
" Основные настройки Neovim
" ==============================================================================
set number              " Показывать номера строк
syntax on               " Подсветка синтаксиса
set tabstop=2           " Ширина табуляции в 2 пробела
set shiftwidth=2        " Ширина сдвига в 2 пробела
set nowrap              " Не переносить длинные строки
set encoding=utf-8      " Кодировка UTF-8
set nobackup            " Не создавать резервные копии
set nowritebackup       " Не создавать backup-файлы
set signcolumn=yes      " Всегда показывать колонку знаков
set clipboard=unnamedplus " Использовать системный буфер обмена
set fileencoding=utf-8  " Кодировка файлов UTF-8
set hidden              " Позволять скрывать буферы без сохранения
set updatetime=200      " Время обновления (мс)
set shortmess+=c        " Не показывать сообщения в командной строке

" Цветовая схема
colorscheme dracula

" ==============================================================================
" Настройки плагинов
" ==============================================================================

" Настройка alpha-nvim
lua << EOF
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Улучшенный ASCII-арт с корректным экранированием
dashboard.section.header.val = {
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠟⠃⠀⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀⠀⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠾⢛⠒⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣶⣄⡈⠓⢄⠠⡀⠀⠀⠀⣄⣷⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣷⠀⠈⠱⡄⠑⣌⠆⠀⠀⡜⢻⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠳⡆⠐⢿⣆⠈⢿⠀⠀⡇⠘⡆⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣷⡇⠀⠀⠈⢆⠈⠆⢸⠀⠀⢣⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣧⠀⠀⠈⢂⠀⡇⠀⠀⢨⠓⣄⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣦⣤⠖⡏⡸⠀⣀⡴⠋⠀⠈⠢⡀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠁⣹⣿⣿⣿⣷⣾⠽⠖⠊⢹⣀⠄⠀⠀⠀⠈⢣⡀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⣇⣰⢫⢻⢉⠉⠀⣿⡆⠀⠀⡸⡏⠀⠀⠀⠀⠀⠀⢇]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡇⡇⠈⢸⢸⢸⠀⠀⡇⡇⠀⠀⠁⠻⡄⡠⠂⠀⠀⠀⠘]],
    [[⢤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠛⠓⡇⠀⠸⡆⢸⠀⢠⣿⠀⠀⠀⠀⣰⣿⣵⡆⠀⠀⠀⠀]],
    [[⠈⢻⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⣦⣀⡇⠀⢧⡇⠀⠀⢺⡟⠀⠀⠀⢰⠉⣰⠟⠊⣠⠂⠀⡸]],
    [[⠀⠀⢻⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢧⡙⠺⠿⡇⠀⠘⠇⠀⠀⢸⣧⠀⠀⢠⠃⣾⣌⠉⠩⠭⠍⣉⡇]],
    [[⠀⠀⠀⠻⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣞⣋⠀⠈⠀⡳⣧⠀⠀⠀⠀⠀⢸⡏⠀⠀⡞⢰⠉⠉⠉⠉⠉⠓⢻⠃]],
    [[⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⢀⣀⠠⠤⣤⣤⠤⠞⠓⢠⠈⡆⠀⢣⣸⣾⠆⠀⠀⠀⠀⠀⢀⣀⡼⠁⡿⠈⣉⣉⣒⡒⠢⡼⠀]],
    [[⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣎⣽⣶⣤⡶⢋⣤⠃⣠⡦⢀⡼⢦⣾⡤⠚⣟⣁⣀⣀⣀⣀⠀⣀⣈⣀⣠⣾⣅⠀⠑⠂⠤⠌⣩⡇⠀]],
    [[⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⣺⢁⣞⣉⡴⠟⡀⠀⠀⠀⠁⠸⡅⠀⠈⢷⠈⠏⠙⠀⢹⡛⠀⢉⠀⠀⠀⣀⣀⣼⡇⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⡟⢡⠖⣡⡴⠂⣀⣀⣀⣰⣁⣀⣀⣸⠀⠀⠀⠀⠈⠁⠀⠀⠈⠀⣠⠜⠋⣠⠁⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⡟⢿⣿⣿⣷⡟⢋⣥⣖⣉⠀⠈⢁⡀⠤⠚⠿⣷⡦⢀⣠⣀⠢⣄⣀⡠⠔⠋⠁⠀⣼⠃⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡄⠈⠻⣿⣿⢿⣛⣩⠤⠒⠉⠁⠀⠀⠀⠀⠀⠉⠒⢤⡀⠉⠁⠀⠀⠀⠀⠀⢀⡿⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣤⣤⠴⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠤⠀⠀⠀⠀⠀⢩⠇⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ⠀⠀⠀⠀FUCK EVERYONE, BRO⠀  ⠀]],
    [[]],
}

dashboard.section.buttons.val = {
    dashboard.button("g", "▸ Search", ":Telescope live_grep<CR>"),
    dashboard.button("f", "▸ Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "▸ Recent files", ":Telescope oldfiles<CR>"),
}

alpha.setup(dashboard.config)
EOF

" Автокоманды для автоматического закрытия Alpha
lua <<EOF
-- Автоматически закрывает Alpha при открытии любого файла
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- Если это не Alpha и не временный буфер (Telescope, NERDTree и т.д.)
        if vim.bo.filetype ~= "alpha" then
            -- Перебираем все окна и ищем Alpha
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                
                -- Закрываем Alpha, только если есть другие НЕ-временные буферы
                if ft == "alpha" then
                    local has_real_buffers = false
                    
                    -- Проверяем, есть ли буферы с реальными файлами
                    for _, other_buf in ipairs(vim.api.nvim_list_bufs()) do
                        local other_ft = vim.api.nvim_buf_get_option(other_buf, "filetype")
                        local name = vim.api.nvim_buf_get_name(other_buf)
                        
                        -- Игнорируем временные буферы (Telescope, NERDTree, пустые и т.д.)
                        if other_ft ~= "alpha" and other_ft ~= "TelescopePrompt" and other_ft ~= "nerdtree" and name ~= "" then
                            has_real_buffers = true
                            break
                        end
                    end
                    
                    -- Если есть реальные буферы - закрываем Alpha
                    if has_real_buffers then
                        vim.api.nvim_win_close(win, true)
                    end
                end
            end
        end
    end,
    nested = true,  -- Важно для работы внутри других автокоманд
})

-- Автоматически открывает Alpha, если все буферы закрыты
vim.api.nvim_create_autocmd("User", {
    pattern = "BDeletePost*",
    callback = function()
        -- Проверяем, что остался только пустой буфер
        local all_bufs = vim.fn.getbufinfo({ buflisted = 1 })
        if #all_bufs <= 1 and vim.fn.empty(vim.fn.expand("%")) == 1 then
            vim.cmd("Alpha")
        end
    end,
})
EOF

" Настройка автозакрытия скобок
lua require('nvim-autopairs').setup{}

" Настройки плавающего терминала
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_position = 'topright'
let g:floaterm_title = ''
let g:floaterm_opacity = 0.7

" ==============================================================================
" Настройки Coc.nvim (LSP и автодополнение)
" ==============================================================================

" Настройки TAB для автодополнения
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Настройка Enter для подтверждения автодополнения
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Навигация по диагностике
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Навигация по определениям
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Показать документацию
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Действия Coc
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)

" Списки Coc
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" ==============================================================================
" Горячие клавиши
" ==============================================================================

" Основные команды
nmap <Space>e :NERDTreeToggle<CR>
nmap <Space>q :wq<CR>
nmap <Space>w :w<CR>
nmap <Space>h :bn<CR>
nmap <Space>l :bp<CR>
nmap <Space>c :bd<CR>

" Настройки отображения
nmap <Space>= :set wrap<CR>
nmap <Space>- :set nowrap<CR>

" Поиск с помощью Telescope
nnoremap <Space>ff <cmd>Telescope find_files<cr>
nnoremap <Space>fg <cmd>Telescope live_grep<cr>

" Открыть терминал
nnoremap <Space>t <cmd>FloatermNew<cr>

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

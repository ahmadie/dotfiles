require('options')
require('keymaps')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

-- disable plugin mappings
vim.g.vimwiki_key_mappings = { all_maps = 0}
vim.cmd [[
  let g:vimwiki_list = [{'path': '~/Beauty/vimwiki/', 'path_html' : '~/Beauty/vimwiki_html'}]
  let g:jukit_mappings = 0
]]
-- end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  'takac/vim-hardtime',
  { 'neoclide/coc.nvim',
    branch = 'release' },
  'Shatur/neovim-ayu',
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'},
  'vifm/vifm.vim',
  'norcalli/nvim-colorizer.lua',
  'machakann/vim-sandwich',
  'wellle/targets.vim',
  'svermeulen/vim-yoink',
  'svermeulen/vim-cutlass',
  'svermeulen/vim-subversive',
  'numToStr/Comment.nvim',
  'machakann/vim-highlightedyank',
  'ibhagwan/fzf-lua',
  'rhysd/clever-f.vim',
  'rlane/pounce.nvim',
  'tmsvg/pear-tree', 
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  { 'kana/vim-textobj-user', dependencies = {
    'kana/vim-textobj-line',
    'ColinKennedy/vim-indent-object',
    'Julian/vim-textobj-variable-segment',
    'tkhren/vim-textobj-numeral', 
    } 
  },
  { 'catppuccin/nvim', as = 'catppuccin'},
  'andymass/vim-matchup',
  'nvim-tree/nvim-web-devicons',
  { 'akinsho/bufferline.nvim', version = "*" },
  'nacro90/numb.nvim', 
  'lewis6991/gitsigns.nvim',
  'rmagatti/auto-session',
  'nvim-treesitter/nvim-treesitter-context',
  'vimwiki/vimwiki',
  'luk400/vim-jukit',
  { 'Wansmer/treesj', dependencies = 'nvim-treesitter/nvim-treesitter' },
  'rcarriga/nvim-notify',
  'stevearc/oil.nvim',
  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = 'nvim-treesitter/nvim-treesitter' },
}, {} )

require('wiki')
require('colorscheme')
require('treesitter')
require('colorizer')
require('sandwich')
require('yoink')
require('Comment').setup()
require('fzf')
require('git')
require('textobj')
require('numb').setup()
require("auto-session").setup { log_level = "error" }
require("jukit")
require("oil-setup")
require('bufferline-setup')
require('treesj').setup({ use_default_keymaps = false })

vim.g['hardtime_default_on'] = 0

vim.g['clever_f_ignore_case'] = 1
vim.g['clever_f_fix_key_direction'] = 1
vim.g["clever_f_use_migemo"] = 1

vim.g['pear_tree_smart_openers'] = 1
vim.g['pear_tree_smart_closers'] = 1
vim.g['pear_tree_smart_backspace'] = 1 

vim.api.nvim_set_keymap('n', '<leader>n', ':TabVifm:<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<cr>', "<cmd>Pounce<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>m', require('treesj').toggle)
vim.keymap.set('n', '<leader>M', function()
    require('treesj').toggle({ split = { recursive = true } })
end)

vim.cmd [[
nmap <space>x :w<CR> <Plug>JupyterExecute
nmap <space>X :w<CR> <Plug>JupyterExecuteAll
nmap <space>r <Plug>JupyterRestart

autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux set-option -w automatic-rename on")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")                                                                 
set title

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

set laststatus=0
hi User1 guifg=black
set statusline=
set statusline+=%1*%{repeat('─',winwidth('.'))}

]]

vim.cmd [[
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"                                              
function! CheckBackSpace() abort               
  let col = col('.') - 1                       
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction                                    

inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ CheckBackSpace() ? "\<Tab>" :       
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Disable automapping so we can fix Coc mapping with pear-tree.
let g:pear_tree_map_special_keys = 0
imap <BS> <Plug>(PearTreeBackspace)
imap <Esc> <Plug>(PearTreeFinishExpansion)
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<Plug>(PearTreeExpand)"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<Plug>(PearTreeExpand)\<c-r>=coc#on_enter()\<CR>"

" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gw <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

imap <C-l> <Plug>(coc-snippets-expand)

let g:coc_node_path='/home/bukhari/.nvm/versions/node/v14.14.0/bin/node'


let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-json', 'coc-tsserver', 'coc-vimlsp', 'coc-svelte', 'coc-prettier', 'coc-flutter', 'coc-go', 'coc-snippets']


nnoremap <leader><leader>pc :call CocAction('pickColor')<CR>
nnoremap <leader><leader>cp :call CocAction('colorPresentation')<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nnoremap <leader>p :CocCommand prettier.formatFile<cr>

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" nmap <silent> <C-d> <Plug>(coc-cursors-position)
" nmap <leader>d  <Plug>(coc-cursors-operator)
]]


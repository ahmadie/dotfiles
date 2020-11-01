" also learn to run nvim from docker haha : https://github.com/yuki-ycino/fzf-preview.vim/issues/161
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
" Plug 'ayu-theme/ayu-vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'
" Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'lyokha/vim-xkbswitch'

Plug 'leafOfTree/vim-svelte-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'

" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
" Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'
" Need wl-clipboard package
Plug 'christoomey/vim-system-copy'
" Plug 'michaeljsmith/vim-indent-object'
Plug 'ColinKennedy/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'                      " Add function based text objects
Plug 'kana/vim-textobj-line'
Plug 'thinca/vim-textobj-function-javascript'         " Add JS function object
" Plug 'kana/vim-textobj-indent'
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unblevable/quick-scope'
" Plug 'rhysd/clever-f.vim'
" Plug 'justinmk/vim-sneak'
Plug 'b4winckler/vim-angry'
Plug 'tommcdo/vim-exchange'
Plug 'rhysd/git-messenger.vim'
Plug 'ThePrimeagen/vim-be-good'

Plug 'nelstrom/vim-visual-star-search'
Plug 'rhysd/clever-f.vim'

Plug 'diepm/vim-rest-console'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/sideways.vim'

Plug 'mattn/emmet-vim'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'

Plug 'dosimple/workspace.vim'

call plug#end()

let mapleader =" "

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.js set filetype=typescript.tsx
augroup END

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" coc {{{
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" for auto-pairs to work
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gw <Plug>(coc-references)
nmap <silent> gl <Plug>(coc-declaration)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
  execute 'h '.expand('<cword>')
else
  call CocAction('doHover')
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

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap im <Plug>(coc-funcobj-i)
xmap am <Plug>(coc-funcobj-a)
omap im <Plug>(coc-funcobj-i)
omap am <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

imap <C-l> <Plug>(coc-snippets-expand)

let g:coc_node_path='/home/bukhari/.nvm/versions/node/v12.19.0/bin/node'


let g:coc_global_extensions = ['coc-explorer', 'coc-html', 'coc-css', 'coc-json', 'coc-tsserver', 'coc-vimlsp', 'coc-svelte']

" }}}










let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
nmap s <Nop>
xmap s <Nop>





set diffopt=filler,internal,algorithm:histogram,indent-heuristic







set autoread
au FocusGained * :checktime

set undofile




nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" Make Y yank till end of line. Super useful. This is the most important thing
" in this file
nnoremap Y y$

set shada=!,'100,<50,s10,h
let g:yoinkSavePersistently = 1
set clipboard=unnamed,unnamedplus

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

" nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
" nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" s for substitute
nmap gr <plug>(SubversiveSubstitute)
nmap grr <plug>(SubversiveSubstituteLine)
nmap gR <plug>(SubversiveSubstituteToEndOfLine)
xmap p <plug>(SubversiveSubstitute)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)

nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

let g:yoinkIncludeDeleteOperations=1
let g:subversivePromptWithActualCommand=1

" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>

" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>


nnoremap <leader>p :CocCommand prettier.formatFile<cr>


" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set encoding=UTF-8
" set guifont=InputMonoCompressed\ Nerd\ Font\ Light\ 10

" nmap <silent> <C-d> <Plug>(coc-cursors-position)
" nmap <leader>d  <Plug>(coc-cursors-operator)












let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1] [git]'
\   }
\ }



" Explorer
nnoremap <leader>n :CocCommand explorer --preset simplify --sources buffer+,file+<CR>
" nmap <space>f :CocCommand explorer --preset floating<CR>









set sessionoptions-=blank

let g:startify_change_to_dir = 0
let g:startify_session_persistence = 1
let g:startify_session_autoload    = 1

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'s': '~/.config/sway/config'},
      \ {'t': '~/.config/kitty/kitty.conf'}, {'n': '~/.config/kanshi/config'}]








set foldnestmax=2
set foldlevel=20
set noswapfile














let g:indent_object_no_default_key_mappings = '1'
" Mappings including line below.
onoremap <silent>ii :<C-u>cal HandleTextObjectMapping(1, 0, 0, [line("."), line("."), col("."), col(".")])<CR>
vnoremap <silent>ii :<C-u>cal HandleTextObjectMapping(1, 0, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv

" Mappings including line below.
onoremap <silent>ai :<C-u>cal HandleTextObjectMapping(0, 1, 0, [line("."), line("."), col("."), col(".")])<CR>
vnoremap <silent>ai :<C-u>cal HandleTextObjectMapping(0, 1, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv

onoremap <silent>aI :<C-u>cal HandleTextObjectMapping(0, 0, 0, [line("."), line("."), col("."), col(".")])<CR>
vnoremap <silent>aI :<C-u>cal HandleTextObjectMapping(0, 0, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv








let g:angry_disable_maps = 1
vmap <silent> au <Plug>AngryOuterPrefix
omap <silent> au <Plug>AngryOuterPrefix
vmap <silent> iu <Plug>AngryInnerPrefix
omap <silent> iu <Plug>AngryInnerPrefix

vmap <silent> aU <Plug>AngryOuterSuffix
omap <silent> aU <Plug>AngryOuterSuffix
vmap <silent> iU <Plug>AngryInnerSuffix
omap <silent> iU <Plug>AngryInnerSuffix













" map ]b :bn<cr>
" map [b :bp<cr>
" map [B :bfirst<cr>
" map ]B :blast<cr>

" map ]q :cn<cr>
" map [q :cp<cr>
" map [Q :cfirst<cr>
" map ]Q :clast<cr>

 
nnoremap <leader>< :SidewaysLeft<cr>
nnoremap <leader>> :SidewaysRight<cr>

nnoremap <leader>r :Switch<cr>

" nnoremap <leader>d :BD<cr>
" nnoremap <leader>b :Buffers<cr>
nnoremap <leader>/ :BLines<cr>
nnoremap <leader>i :Lines!<cr>
nnoremap <leader>e :GFiles<cr>
" nnoremap <leader>E :Files!<cr>
nnoremap <leader>f :Rj<space>
nnoremap <leader>F :Rg!<space>

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction

let g:fzf_preview_default_fzf_options = { '--preview-window': 'wrap' }

" value is not 0, then disable mru and mrw for speed up
let g:fzf_preview_disable_mru = 1

nnoremap <silent> <leader>b :<C-u>FzfPreviewAllBuffers<CR>
"
" nnoremap <silent> <leader>/ :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort  
"    \  --add-fzf-arg=--reverse --add-fzf-arg=--query="'"<CR>
"
" nnoremap <silent> <leader>i :<C-u>FzfPreviewBufferLines  --add-fzf-arg=--no-sort  
"    \  --add-fzf-arg=--reverse --add-fzf-arg=--query="'"<CR>
"
" nnoremap <silent> <leader>e  :<C-u>FzfPreviewFromResources project_mru git<CR>   
"    
nnoremap <silent> <leader>E  :<C-u>FzfPreviewFromResources project_mru directory<CR>  
"
" nnoremap          <leader>f    :<C-u>FzfPreviewProjectGrep  --add-fzf-arg=--pointer=" "
"    \ --add-fzf-arg=--color=pointer:reverse<Space>

let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never --smart-case'

" to view content of g:fzf_preview_custom_processes use:
" :let g:abc = fzf_preview#remote#process#get_default_processes('open-file', 'coc')
" :echo g:abc
" processes_name is 'open-file', 'open-buffer' and 'open-bufnr'.
let g:fzf_preview_custom_processes = {
      \  'open-file': {
      \            'alt-o': 'FzfPreviewOpenFileCtrlO',
      \            'alt-q': 'FzfPreviewOpenFileCtrlQ',
      \            'alt-t': 'FzfPreviewOpenFileCtrlT',
      \            'alt-v': 'FzfPreviewOpenFileCtrlV',
      \            'alt-x': 'FzfPreviewOpenFileCtrlX',
      \            'enter': 'FzfPreviewOpenFileEnter'
      \          },
      \  'open-bufnr': {
      \            'alt-q': 'FzfPreviewOpenBufnrCtrlQ',
      \            'alt-t': 'FzfPreviewOpenBufnrCtrlT',
      \            'alt-v': 'FzfPreviewOpenBufnrCtrlV',
      \            'alt-x': 'FzfPreviewOpenBufnrCtrlX',
      \            'enter': 'FzfPreviewOpenBufnrEnter'
      \          },
      \  'register': {
      \            'enter': 'RegisterEnter'
      \          }
      \   }

let g:fzf_preview_preview_key_bindings = 'alt-d:preview-page-down,alt-u:preview-page-up,?:toggle-preview'





nnoremap <leader>x :bp\|bd #<cr>
nnoremap <leader><leader>x :bp\|bd #!<cr>
" nnoremap ? /\<\><left><left>

" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-J> <C-W><C-J>

nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>j <C-W><C-J>

nnoremap <A-l> L 
nnoremap <A-h> H
nnoremap <A-m> M 
" use + instead of j and - instead of k for mapping bcz j & k cause cursor to
" shift problem
map <A-k> 3-
map <A-j> 3+ 
nmap <A-u> <Plug>(SmoothieUpwards)
nmap <A-d> <Plug>(SmoothieDownwards)
nmap <A-f> <Plug>(SmoothieForwards)
nmap <A-b> <Plug>(SmoothieBackwards)
nmap <A-z> zz
nmap <A-i> <C-I>
nmap <A-o> <C-O> 
nmap <A-6> <C-^> 

" adjust scroll height to 1/3 of screen
au BufEnter * execute "set scroll=" . winheight('.') / 3
au VimResized * execute "set scroll=" . winheight('.') / 3

nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $
onoremap H ^
onoremap L $

" nnoremap j jzz
" nnoremap k kzz
" nnoremap G Gzz 

nnoremap ; :
nnoremap : ;
nnoremap ` ;















set mouse=a
set number
set relativenumber
set ignorecase
set smartcase
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
set scrolloff=0











nnoremap <leader><leader>pc :call CocAction('pickColor')<CR>
nnoremap <leader><leader>cp :call CocAction('colorPresentation')<CR>












" autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
" let g:airline_section_z=''
" let g:airline_section_y=''
let g:airline_section_x=''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#term#enabled = 0
let g:airline#extensions#quickfix#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#netrw#enabled = 0
let g:airline#extensions#po#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#format = 2
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#show_tab_type = 0




let g:XkbSwitchEnabled = 1
" let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
let g:XkbSwitchNLayout = 'us'
" let g:XkbSwitchILayout = 'us'
let g:XkbSwitchIMappings = ['ar']
let g:XkbSwitchIMappingsTr = {
          \ 'ar':
          \ {'<': 'jk'.
          \       '',
          \  '>': 'تن'.
          \       ''}
          \ }

function! RestoreKeyboardLayout()
  call system("ibus engine xkb:us::eng")
  call system("xkb-switch -s 'us'")
endfunction
" set ttimeoutlen=100
augroup restorekeyboard
    autocmd!
    autocmd InsertLeave * silent call RestoreKeyboardLayout()
  augroup END









" colorscheme onedark
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
syntax enable
"
let g:solarized_italic = 1
let g:solarized_bold = 1 
let g:solarized_underline = 1
set background=dark
colorscheme solarized
" IndentLine {{
" let g:indentLine_char = '▏'
" let g:indentLine_char = '⋮'
let g:indentLine_char = '·'
let g:indentLine_char = '·'
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
" }}
" let g:indentLine_enabled = 0
" let g:indentLine_leadingSpaceEnabled = 1
autocmd Filetype json :IndentLinesDisable
highlight SignifySignAdd guifg=green guibg=NONE
highlight SignifySignDelete guifg=red guibg=NONE
highlight SignifySignChange guifg=yellow guibg=NONE
" highlight SignifyLineAdd ctermfg=green ctermbg=blue
highlight SignColumn guibg=NONE gui=NONE 
" hi! link CocPumFloatingDetail markdown
" function! CocNvimHighlight()
  " hi! link CocFloating DiffText 
  " highlight CocFloating guibg=red
  " highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
  " highlight CocWarningHighlight ctermfg=Red  guifg=#ff0000
  " highlight CocInfoHighlight ctermfg=Red  guifg=#ff0000
  " highlight CocHintHighlight ctermfg=Red  guifg=#ff0000
  " highlight CocErrorLine ctermfg=Red  guifg=#ff0000
  " highlight CocWarningLine ctermfg=Red  guifg=#ff0000
  " highlight CocInfoLine ctermfg=Red  guifg=#ff0000
  " highlight CocHintLine ctermfg=Red  guifg=#ff0000
  " highlight CocHighlightText  guibg=#111111 ctermbg=223
" endfunction

" autocmd VimEnter function CocNvimHighligt()

" highlight CocFloating guibg=red
" highlight NormalFloat guibg=red
highlight Pmenu guibg=#586e75
let g:solarized_italic = 1













" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
"
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
" let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. '}), <bang>0)

command! -bang -nargs=* Rj
  \ call fzf#vim#grep(
  \   "rg --type-add='project:*.{js,jsx,vue,ts,tsx}' -g='!renderer.dev.js' --column --line-number --no-heading --color=always --smart-case --type=project ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. '}), <bang>0)

command! -bang -nargs=* Lines
  \ call fzf#vim#lines(
  \   <q-args>, 
  \   {'options': '--layout=default '}, <bang>0)

command! -bang -nargs=* BLines
  \ call fzf#vim#buffer_lines(
  \   <q-args>, 
  \   {'options': '--layout=default '}, <bang>0)


" command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', 'cat {}']}, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': []}), <bang>0)

command! -bang -nargs=? GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': []}), <bang>0)

command! -bar -bang -nargs=? -complete=buffer Buffers
    \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({ "placeholder": "{1}", 'options': []}), <bang>0)

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'CursorLineNr' } }

















highlight QuickScopePrimary guifg='#898989' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#898989' ctermfg=81 
let g:qs_second_highlight = 0
let g:qs_ignorecase = 1


let g:clever_f_ignore_case = 1
let g:clever_f_fix_key_direction = 1








" Section: Next and previous
let s:maps = []
function! s:map(...) abort
  call add(s:maps, copy(a:000))
endfunction

function! s:maps() abort
  for [mode, head, rhs; rest] in s:maps
    let flags = get(rest, 0, '') . (rhs =~# '^<Plug>' ? '' : '<script>')
    let tail = ''
    let keys = get(g:, mode.'remap', {})
    if type(keys) != type({})
      continue
    endif
    while !empty(head)
      if has_key(keys, head)
        let head = keys[head]
        if empty(head)
          let head = '<skip>'
        endif
        break
      endif
      let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
      let head = substitute(head, '<[^<>]*>$\|.$', '', '')
    endwhile
    if head !=# '<skip>' && empty(maparg(head.tail, mode))
      exe mode.'map' flags head.tail rhs
    endif
  endfor
endfunction

function! s:MapNextFamily(map,cmd) abort
  let map = '<Plug>unimpaired'.toupper(a:map)
  let cmd = '".(v:count ? v:count : "")."'.a:cmd
  let end = '"<CR>'.(a:cmd ==# 'l' || a:cmd ==# 'c' ? 'zv' : '')
  execute 'nnoremap <silent> '.map.'Previous :<C-U>exe "'.cmd.'previous'.end
  execute 'nnoremap <silent> '.map.'Next     :<C-U>exe "'.cmd.'next'.end
  execute 'nnoremap <silent> '.map.'First    :<C-U>exe "'.cmd.'first'.end
  execute 'nnoremap <silent> '.map.'Last     :<C-U>exe "'.cmd.'last'.end
  call s:map('n', '['.        a:map , map.'Previous')
  call s:map('n', ']'.        a:map , map.'Next')
  call s:map('n', '['.toupper(a:map), map.'First')
  call s:map('n', ']'.toupper(a:map), map.'Last')
  if exists(':'.a:cmd.'nfile')
    execute 'nnoremap <silent> '.map.'PFile :<C-U>exe "'.cmd.'pfile'.end
    execute 'nnoremap <silent> '.map.'NFile :<C-U>exe "'.cmd.'nfile'.end
    call s:map('n', '[<C-'.toupper(a:map).'>', map.'PFile')
    call s:map('n', ']<C-'.toupper(a:map).'>', map.'NFile')
  elseif exists(':p'.a:cmd.'next')
    execute 'nnoremap <silent> '.map.'PPrevious :<C-U>exe "p'.cmd.'previous'.end
    execute 'nnoremap <silent> '.map.'PNext :<C-U>exe "p'.cmd.'next'.end
    call s:map('n', '[<C-'.toupper(a:map).'>', map.'PPrevious')
    call s:map('n', ']<C-'.toupper(a:map).'>', map.'PNext')
  endif
endfunction

call s:MapNextFamily('b','b')
call s:MapNextFamily('q','c')
call s:MapNextFamily('t','tab')


" Section: Line operations

function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<Plug>unimpairedBlankUp", a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<Plug>unimpairedBlankDown", a:count)
endfunction

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>call <SID>BlankDown(v:count1)<CR>

call s:map('n', '[<Space>', '<Plug>unimpairedBlankUp')
call s:map('n', ']<Space>', '<Plug>unimpairedBlankDown')

function! s:ExecMove(cmd) abort
  let old_fdm = &foldmethod
  if old_fdm !=# 'manual'
    let &foldmethod = 'manual'
  endif
  normal! m`
  silent! exe a:cmd
  norm! ``
  if old_fdm !=# 'manual'
    let &foldmethod = old_fdm
  endif
endfunction

function! s:Move(cmd, count, map) abort
  call s:ExecMove('move'.a:cmd.a:count)
  silent! call repeat#set("\<Plug>unimpairedMove".a:map, a:count)
endfunction

function! s:MoveSelectionUp(count) abort
  call s:ExecMove("'<,'>move'<--".a:count)
  silent! call repeat#set("\<Plug>unimpairedMoveSelectionUp", a:count)
endfunction

function! s:MoveSelectionDown(count) abort
  call s:ExecMove("'<,'>move'>+".a:count)
  silent! call repeat#set("\<Plug>unimpairedMoveSelectionDown", a:count)
endfunction

nnoremap <silent> <Plug>unimpairedMoveUp            :<C-U>call <SID>Move('--',v:count1,'Up')<CR>
nnoremap <silent> <Plug>unimpairedMoveDown          :<C-U>call <SID>Move('+',v:count1,'Down')<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionUp   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionDown :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>

call s:map('n', '[e', '<Plug>unimpairedMoveUp')
call s:map('n', ']e', '<Plug>unimpairedMoveDown')
call s:map('x', '[e', '<Plug>unimpairedMoveSelectionUp')
call s:map('x', ']e', '<Plug>unimpairedMoveSelectionDown')

call s:maps()
























" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

function CJKInput()
  let l:cmd = 'zenity --entry --text=CJK-Input 2>/dev/null'
  let l:output = system(l:cmd)
  let l:output = substitute(l:output, '[\r\n]*$', '', '')
  execute 'normal i' . l:output
endfunction
" nmap <silent> <leader>i :call CJKInput()<CR>












function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bdelete' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --bind ctrl-a:select-all+accept --prompt "Delete> "'
\ }))


nnoremap <leader>m mM
nnoremap <leader><leader>m 'M 
nnoremap <leader>u mU
nnoremap <leader><leader>u 'U

augroup VIMRC
    autocmd!
    autocmd BufLeave *.css,*.scss normal! mC
    autocmd BufLeave *.html       normal! mH
    autocmd BufLeave *.js,*.ts    normal! mJ
    autocmd BufLeave *.md         normal! mM
    autocmd BufLeave *.yml,*.yaml normal! mY
    autocmd BufLeave *.vim        normal! mV
    autocmd BufLeave .env*        normal! mE
augroup END


inoremap II <Esc>I
inoremap AA <Esc>A
inoremap HH <Esc>i
inoremap LL <Esc>la
:imap <A-h> <C-o>h
:imap <A-j> <C-o>j
:imap <A-k> <C-o>k
:imap <A-l> <C-o>l
:imap <A-w> <C-o>w
:imap <A-b> <C-o>b

:nnoremap <leader>ve :vsplit $MYVIMRC<cr>
  :nnoremap <leader>vs :source $MYVIMRC<cr>

:iabbrev waht what
augroup filetype_html
    autocmd!
    autocmd FileType typescript :iabbrev <buffer> arr ()=>{}<left>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END



nnoremap <silent> <leader>1 :WS 1<CR>
nnoremap <silent> <leader>2 :WS 2<CR>
nnoremap <silent> <leader>3 :WS 3<CR>
nnoremap <silent> <leader>4 :WS 4<CR>
nnoremap <silent> <leader>5 :WS 5<CR>
nnoremap <silent> <leader>6 :WS 6<CR>
nnoremap <silent> <leader>7 :WS 7<CR>
nnoremap <silent> <leader>8 :WS 8<CR>
nnoremap <silent> <leader>9 :WS 9<CR>
nnoremap <silent> <leader>0 :WS 10<CR>

nnoremap <silent> <leader><leader>1 :WSbm 1<CR>
nnoremap <silent> <leader><leader>2 :WSbm 2<CR>
nnoremap <silent> <leader><leader>3 :WSbm 3<CR>
nnoremap <silent> <leader><leader>4 :WSbm 4<CR>
nnoremap <silent> <leader><leader>5 :WSbm 5<CR>
nnoremap <silent> <leader><leader>6 :WSbm 6<CR>
nnoremap <silent> <leader><leader>7 :WSbm 7<CR>
nnoremap <silent> <leader><leader>8 :WSbm 8<CR>
nnoremap <silent> <leader><leader>9 :WSbm 9<CR>
nnoremap <silent> <leader><leader>0 :WSbm 10<CR>

nnoremap <silent> <leader>` :call WS_Backforth()<CR>

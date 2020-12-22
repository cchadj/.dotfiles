source ~/.config/vim/coc.vim

set visualbell

set number

set mouse=a

set laststatus=2

let mapleader = ","

" Insert and Normal View cursor.
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

filetype plugin on
filetype plugin indent on

" >>> PLUGINS >>>
" install vim-plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" for fast html generation
" example:
" type in code: div>.some-class*3>ul>li*4 and then <C-y>,
Plug 'mattn/emmet-vim'

" provides a lot of language packs
Plug 'sheerun/vim-polyglot'

" provites autocomplete
" Plug 'valloric/youcompleteme'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" A simple fast and powerful snippet tool. Add sniptes to 
" some keystroked and fill them.
Plug 'SirVer/ultisnips'

" Fuzzy finder, roughly type the name of
" the file you want to find in your project 
" and it will find it for you.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" change " to ' => cs"'
" change ' to <q></q> =>  cs'<q>
" remov " => ds"
" suround i(nner)w(ord) with ' => ysiw' => 'word'
" same but space  => ysiw]' ( word )
" also in visual mode you van surround
" selected sentence with <div class=some-class>
" </div> 
" by selecting the sentence and S
" example:
" a sentence
" 
" <div class=some-class>a sentence</div>
Plug 'tpope/vim-surround'

" change status line to be nicer
Plug 'itchyny/lightline.vim'

" Ctr + L to justify your .js file
Plug 'maksimr/vim-jsbeautify'

" Plug 'dense-analysis/ale'
"post install (yarn install | npm install) then load plugin only for editing
Plug 'prettier/vim-prettier', {'do': 'npm install', 'branch': 'release/0.x' }

" Color schemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" Navigate seamlessly between tmux and vim with Ctrl + hjkl
Plug 'christoomey/vim-tmux-navigator'

"
Plug 'Chiel92/vim-autoformat'

Plug 'preservim/tagbar'

call plug#end()
" <<<  PLUGINS <<<

let g:python_host_prog="/home/ithil/.config/pyenv/versions/2.7.18/bin/python2"

let g:python3_host_prog="/home/ithil/.config/pyenv/versions/3.9.1/bin/python3"

" >>>  AUTO COMPLETE >>>
set omnifunc=syntaxcomplete#Complete

" scratch documentation preview


" https://github.com/ycm-core/YouCompleteMe/issues/413
let g:ycm_semantic_triggers = {
      \   'css': [ 're!^\s{4}', 're!:\s+' ],
      \ }

" Go to next suggestion with tab or "alt+j"
let g:ycm_key_list_select_completion=["<tab>", "<M-j>"]
" Go to previous suggestion with shift tab "alt+k"
let g:ycm_key_list_previous_completion=["<S-tab>", "<M-k>"]
"end youcompleteme
" snipets
" " Trigger configuration. You need to change this to something other than
" <tab> if you use one of the following:
" " - https://github.com/Valloric/YouCompleteMe

" " - https://github.com/nvim-lua/completion-nvim
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Go to next snippet suggestion with tab
let g:UltiSnipsJumpForwardTrigger="<tab>"
" Go to previous snippet suggestion with tab
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0

let g:ycm_enable_diagnostic_signs = 1
set signcolumn=auto

autocmd vimenter * ++nested colorscheme gruvbox

inoremap <C-l> <Esc>:PrettierAsync<CR>i
nnoremap <C-l> :PrettierAsync<CR>

" FZF (fuzzy search files in project), emulate like Rider
inoremap \\ <Esc>:GFiles<CR>i
nnoremap \\ :GFiles<CR>

" clear search highlight and reset search
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" >>> tmux-vim navigator mappings >>>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
" <<< tmux-vim navigator mappings <<<

" >>> CtrlP for vim settings >>>
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" <<< CtrlP for vim settings >>>

" >>> TagBar 
nmap <F8> :TagbarToggle<CR>
" <<<

" >>> emmet settings >>>
let g:user_emmet_settings = {
  \    'javascript' : {
  \        'quote_char': ""
  \    }
  \}
" <<< emmet settings <<<

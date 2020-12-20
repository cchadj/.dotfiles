set visualbell
set number
set mouse=a

set laststatus=2

"*** PLUGINS ****
" install vim-plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
" Commands

call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'

Plug 'sheerun/vim-polyglot'

Plug 'valloric/youcompleteme'

Plug 'SirVer/ultisnips'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'honza/vim-snippets'

" Ctr + L to justify your .js file
Plug 'maksimr/vim-jsbeautify'

" Plug 'dense-analysis/ale'
"post install (yarn install | npm install) then load plugin only for editing
Plug 'prettier/vim-prettier', {'do': 'npm install', 'branch': 'release/0.x' }

" Color schemes 
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'https://github.com/felixhummel/setcolors.vim.git'

" Navigate seamlessly between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
call plug#end()
" end ****  PLUGINS ****

" identations 
augroup FileTypeSpecificAutocommands
      autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
      autocmd FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" ***  AUTO COMPLETE ****
filetype plugin on
filetype plugin indent on	
set omnifunc=syntaxcomplete#Complete


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
"
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" " Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0

let g:ycm_enable_diagnostic_signs = 1
set signcolumn=auto
highlight YcmErrorLine guibg=Red
highlight SyntasticErrorLine guibg=Blue
highlight SyntasticErrorLine guifg=White
highlight SyntasticErrorSign guifg=White
highlight YcmErrorLine guifg=White

autocmd vimenter * ++nested colorscheme gruvbox

inoremap <C-l> <Esc>:PrettierAsync<CR>i 
nnoremap <C-l> :PrettierAsync<CR> 
